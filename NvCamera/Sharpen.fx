uniform float g_sldSharpen <
    ui_type = "drag";
	ui_label        = "Intensity";
	ui_label_en_US  = "Intensity";
    ui_label_cs =  "Zostření";
    ui_label_da =  "Gør skarpere";
    ui_label_de =  "Schärfen";
    ui_label_el =  "Όξυνση";
    ui_label_en_UK =  "Sharpen";
    ui_label_es_ES =  "Enfocar";
    ui_label_es_MX =  "Nitidez";
    ui_label_fi =  "Terävöitä";
    ui_label_fr =  "Affiner";
    ui_label_hu =  "Élesítés";
    ui_label_it =  "Nitidezza";
    ui_label_ja =  "鮮鋭化";
    ui_label_ko =  "선명화";
    ui_label_nl =  "Scherpstellen";
    ui_label_nb =  "Gjør skarpere";
    ui_label_pl =  "Wyostrzenie";
    ui_label_pt_PT =  "Acentuar";
    ui_label_pt_BR =  "Nitidez";
    ui_label_ru =  "Резкость";
    ui_label_sk =  "Zaostrenie";
    ui_label_sl =  "Izostritev";
    ui_label_sv =  "Skärpt";
    ui_label_th =  "ทำให้คมชัด";
    ui_label_tr =  "Keskinleştirme";
    ui_label_zh_CHS =  "使明朗";
    ui_label_zh_CHT =  "鮮明化";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.5;

uniform float g_sldDenoise <
    ui_type = "drag";
	ui_label        = "Ignore Film Grain";
	ui_label_en_US  = "Ignore Film Grain";
    ui_label_cs =  "Ignorovat zrnitost filmu";
    ui_label_da =  "Ignorer Filmkorn";
    ui_label_de =  "Filmkörnung ignorieren";
    ui_label_el =  "Αγνόηση κόκκων φιλμ ";
    ui_label_en_UK =  "Ignore Film Grain";
    ui_label_es_ES =  "Ignorar el grano de la película";
    ui_label_es_MX =  "Ignorar el grano de la película";
    ui_label_fi =  "Ohita filmin rakeisuus";
    ui_label_fr =  "Ignorer le grain du film";
    ui_label_hu =  "Filmszemcsésség mellőzése";
    ui_label_it =  "Ignora Granularità";
    ui_label_ja =  "フィルムグレインには適用しない";
    ui_label_ko =  "흐린 노이즈 무시";
    ui_label_nl =  "Filmkorrel negeren";
    ui_label_nb =  "Ignorer bildekorning";
    ui_label_pl =  "Ignoruj ziarnistość filmu";
    ui_label_pt_PT =  "Ignorar grão do filme";
    ui_label_pt_BR =  "Ignorar grão do filme";
    ui_label_ru =  "Игнорировать зернистость";
    ui_label_sk =  "Ignorovať zrnitosť filmu";
    ui_label_sl =  "Ingoriraj zrnatost filma";
    ui_label_sv =  "Ignorera brus";
    ui_label_th =  "ไม่สนใจเกรนฟิล์ม";
    ui_label_tr =  "Film Grenini Yoksay";
    ui_label_zh_CHS =  "忽略胶片颗粒";
    ui_label_zh_CHT =  "忽略影片雜訊";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.15;

#include "NvCommon.fxh"

//we have a corresponding function in NvCommon.fxh but this shader should stay functionally same to the cubin
float GetLuma(float r, float g, float b)
{
    // Y from JPEG spec
    return 0.299f * r + 0.587f * g + 0.114f * b;
}

float GetLuma(float4 p)
{
    return GetLuma(p.x, p.y, p.z);
}

float Square(float v)
{
    return v * v;
}

// highlight fall-off start (prevents halos and noise in bright areas)
#define kHighBlock 0.65f
// offset reducing sharpening in the shadows
#define kLowBlock (1.0f / 256.0f)
#define kSharpnessMin (-1.0f / 14.0f)
#define kSharpnessMax (-1.0f / 6.5f)
#define kDenoiseMin (0.001f)
#define kDenoiseMax (-0.1f)

void PSMain(in VSOut i, out float4 color : SV_Target)
{	
	float4 x = tex2D(NV::ColorInput, i.uv);

    float4 a = tex2Doffset(NV::ColorInput, i.uv, int2(-1, 0));
    float4 b = tex2Doffset(NV::ColorInput, i.uv, int2(1, 0));
    float4 c = tex2Doffset(NV::ColorInput, i.uv, int2(0, 1));
    float4 d = tex2Doffset(NV::ColorInput, i.uv, int2(0, -1));

    float4 e = tex2Doffset(NV::ColorInput, i.uv, int2(-1, -1));
    float4 f = tex2Doffset(NV::ColorInput, i.uv, int2(1, 1));
    float4 g = tex2Doffset(NV::ColorInput, i.uv, int2(-1, 1));
    float4 h = tex2Doffset(NV::ColorInput, i.uv, int2(1, -1));

    float lx = GetLuma(x);

    float la = GetLuma(a);
    float lb = GetLuma(b);
    float lc = GetLuma(c);
    float ld = GetLuma(d);

    float le = GetLuma(e);
    float lf = GetLuma(f);
    float lg = GetLuma(g);
    float lh = GetLuma(h);

    // cross min/max
    const float ncmin = min(min(le, lf), min(lg, lh));
    const float ncmax = max(max(le, lf), max(lg, lh));

    // plus min/max
    float npmin = min(min(min(la, lb), min(lc, ld)), lx);
    float npmax = max(max(max(la, lb), max(lc, ld)), lx);

    // compute "soft" local dynamic range -- average of 3x3 and plus shape
    float lmin = 0.5f * min(ncmin, npmin) + 0.5f * npmin;
    float lmax = 0.5f * max(ncmax, npmax) + 0.5f * npmax;

    // compute local contrast enhancement kernel
    float lw = lmin / (lmax + kLowBlock);
    float hw = Square(1.0f - Square(max(lmax - kHighBlock, 0.0f) / ((1.0f - kHighBlock))));

    // noise suppression
    // Note: Ensure that the denoiseFactor is in the range of (10, 1000) on the CPU-side prior to launching this shader.
    // For example, you can do so by adding these lines
    //      const float kDenoiseMin = 0.001f;
    //      const float kDenoiseMax = 0.1f;
    //      float kernelDenoise = 1.0f / (kDenoiseMin + (kDenoiseMax - kDenoiseMin) * min(max(denoise, 0.0f), 1.0f));
    // where kernelDenoise is the value to be passed in to this shader (the amount of noise suppression is inversely proportional to this value),
    //       denoise is the value chosen by the user, in the range (0, 1)
	float kernelDenoise = 1.0f / (kDenoiseMin + (kDenoiseMax - kDenoiseMin) * min(max(g_sldDenoise, 0.0f), 1.0f));
    const float nw = Square((lmax - lmin) * kernelDenoise);

    // pick conservative boost
    const float boost = min(min(lw, hw), nw);

    // run variable-sigma 3x3 sharpening convolution
    // Note: Ensure that the sharpenFactor is in the range of (-1.0f/14.0f, -1.0f/6.5f) on the CPU-side prior to launching this shader.
    // For example, you can do so by adding these lines
    //      const float kSharpnessMin = -1.0f / 14.0f;
    //      const float kSharpnessMax = -1.0f / 6.5f;
    //      float kernelSharpness = kSharpnessMin + (kSharpnessMax - kSharpnessMin) * min(max(sharpen, 0.0f), 1.0f);
    // where kernelSharpness is the value to be passed in to this shader,
    //       sharpen is the value chosen by the user, in the range (0, 1)
    float kernelSharpness = kSharpnessMin + (kSharpnessMax - kSharpnessMin) * min(max(g_sldSharpen, 0.0f), 1.0f);
    const float k = boost * kernelSharpness;

    float accum = lx;
    accum += la * k;
    accum += lb * k;
    accum += lc * k;
    accum += ld * k;
    accum += le * (k * 0.5f);
    accum += lf * (k * 0.5f);
    accum += lg * (k * 0.5f);
    accum += lh * (k * 0.5f);

    // normalize (divide the accumulator by the sum of convolution weights)
    accum /= 1.0f + 6.0f * k;

    // accumulator is in linear light space            
    float delta = accum - GetLuma(x);
    x.x += delta;
    x.y += delta;
    x.z += delta;

    color = x;
}

technique Sharpen
{
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PSMain;
    }
}
