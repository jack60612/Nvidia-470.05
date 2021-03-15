uniform float g_sldSharpen <
    ui_type = "drag";
	ui_label        = "Sharpen";
	ui_label_en_US  = "Sharpen";
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

uniform float g_sldClarity <
    ui_type = "drag";
	ui_label        = "Clarity";
	ui_label_en_US  = "Clarity";
    ui_label_cs =  "Jasnost";
    ui_label_da =  "Klarhed";
    ui_label_de =  "Klarheit";
    ui_label_el =  "Διαύγεια";
    ui_label_en_UK =  "Clarity";
    ui_label_es_ES =  "Claridad";
    ui_label_es_MX =  "Claridad";
    ui_label_fi =  "Kirkkaus";
    ui_label_fr =  "Clarté";
    ui_label_hu =  "Tisztaság";
    ui_label_it =  "Chiarezza";
    ui_label_ja =  "鮮明度";
    ui_label_ko =  "선명도";
    ui_label_nl =  "Helderheid";
    ui_label_nb =  "Klarhet";
    ui_label_pl =  "Przejrzystość";
    ui_label_pt_PT =  "Claridade";
    ui_label_pt_BR =  "Clareza";
    ui_label_ru =  "Четкость";
    ui_label_sk =  "Jas";
    ui_label_sl =  "Jasnost";
    ui_label_sv =  "Klarhet";
    ui_label_th =  "ความชัดเจน";
    ui_label_tr =  "Berraklık";
    ui_label_zh_CHS =  "明亮度";
    ui_label_zh_CHT =  "清晰度";
	ui_min = -1.0;
    ui_max = 1.0;
> = 0.7;

uniform float g_sldHDR <
    ui_type = "drag";
	ui_label        = "HDR Toning";
	ui_label_en_US  = "HDR Toning";
    ui_label_cs =  "Tónování HDR";
    ui_label_da =  "HDR-toning";
    ui_label_de =  "HDR-Tönung";
    ui_label_el =  "Τόνωση HDR";
    ui_label_en_UK =  "HDR Toning";
    ui_label_es_ES =  "Tonos HDR";
    ui_label_es_MX =  "Tonalidad de HDR";
    ui_label_fi =  "HDR-sävytys";
    ui_label_fr =  "Tonalité HDR";
    ui_label_hu =  "HDR tónusozás";
    ui_label_it =  "Tonalità HDR";
    ui_label_ja =  "HDR トーニング";
    ui_label_ko =  "HDR 토닝";
    ui_label_nl =  "HDR-tonen";
    ui_label_nb =  "HDR-toning";
    ui_label_pl =  "Tonowanie HDR";
    ui_label_pt_PT =  "Tonalidade HDR";
    ui_label_pt_BR =  "Tonificação HDR";
    ui_label_ru =  "Тонирование HDR";
    ui_label_sk =  "Tónovanie HDR";
    ui_label_sl =  "HDR niansiranje";
    ui_label_sv =  "HDR-toning";
    ui_label_th =  "การปรับภาพแบบ HDR Toning";
    ui_label_tr =  "HDR Tonlaması";
    ui_label_zh_CHS =  "HDR 调色";
    ui_label_zh_CHT =  "高動態範圍色調";
	ui_min = -1.0;
    ui_max = 1.0;
> = 0.6;

uniform float g_sldBloom <
    ui_type = "drag";
	ui_label        = "Bloom";
	ui_label_en_US  = "Bloom";
    ui_label_cs =  "Přesvětlení";
    ui_label_da =  "Skær";
    ui_label_de =  "Überstrahlung";
    ui_label_el =  "Άνθισμα";
    ui_label_en_UK =  "Bloom";
    ui_label_es_ES =  "Bloom";
    ui_label_es_MX =  "Bloom";
    ui_label_fi =  "Hohde";
    ui_label_fr =  "Flou lumineux";
    ui_label_hu =  "Ellenfény";
    ui_label_it =  "Blooming";
    ui_label_ja =  "ブルーム";
    ui_label_ko =  "블룸";
    ui_label_nl =  "Bloom";
    ui_label_nb =  "Lyskontur";
    ui_label_pl =  "Rozświetlenie";
    ui_label_pt_PT =  "Auréola";
    ui_label_pt_BR =  "Bloom";
    ui_label_ru =  "Bloom";
    ui_label_sk =  "Žiara";
    ui_label_sl =  "Žarenje";
    ui_label_sv =  "Bakljus";
    ui_label_th =  "แสงบาน";
    ui_label_tr =  "Işık Patlaması";
    ui_label_zh_CHS =  "泛光";
    ui_label_zh_CHT =  "光暈";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.15;

#include "NvCommon.fxh"

texture LargeBlurTex { Width = BUFFER_WIDTH;   Height = BUFFER_HEIGHT;  Format = BUFFER_FORMAT; }; //requires recent changes to support this
sampler sLargeBlurTex { Texture = LargeBlurTex;	    };

float4 gaussian(sampler sinput, float2 uv, int nSteps, float2 axis)
{
    float norm = -1.35914091423 / (nSteps * nSteps);
    float4 accum = tex2D(sinput, uv) * 0.5;
    float2 offsetinc = axis * BUFFER_PIXEL_SIZE;

	float divisor = 0.5; //exp(0) * 0.5

    [loop]
    for(float iStep = 1; iStep <= nSteps; iStep++)
    {
        //linear sample, gathers 2 texels at once
        //only texel not being sampled that way is center, hence it needs 1/2 the weight
        float tapOffset = iStep * 2.0 - 0.5;
        float tapWeight = exp(iStep * iStep * norm);

        accum += tex2Dlod(sinput, float4(uv + offsetinc * tapOffset, 0, 0)) * tapWeight;
        accum += tex2Dlod(sinput, float4(uv - offsetinc * tapOffset, 0, 0)) * tapWeight;
        divisor += tapWeight;
    }
    accum /= 2.0 * divisor;
    return accum;
}

float4 box(sampler sinput, float2 uv)
{
    const float3 blurData[8] = 
    {
        float3( 0.5, 1.5,1.50),
        float3( 1.5,-0.5,1.50),
        float3(-0.5,-1.5,1.50),
        float3(-1.5, 0.5,1.50),
        float3( 2.5, 1.5,1.00),
        float3( 1.5,-2.5,1.00),
        float3(-2.5,-1.5,1.00),
        float3(-1.5, 2.5,1.00),            
    };

    float4 blur = 0.0;        
    for(int i=0; i<8; i++)
        blur += tex2Dlod(sinput, float4(uv + blurData[i].xy * BUFFER_PIXEL_SIZE, 0, 0)) * blurData[i].z;

    blur /= (4 * 1.5) + (4 * 1.0);
    return blur;        
}

float getluma(float3 color)
{
    return dot(color,float3(0.299,0.587,0.114));
}

void PSGaussian1(in VSOut i, out float4 color : SV_Target)
{	
	color = gaussian(NV::ColorInput, i.uv, 15, float2(1, 0));
}
void PSGaussian2AndBlend(in VSOut i, out float4 color : SV_Target)
{	
	float4 largeblur = gaussian(sLargeBlurTex, i.uv, 15, float2(0, 1));
    float4 smallblur = box(NV::ColorInput, i.uv);
    color = tex2D(NV::ColorInput, i.uv);

    float a 		= getluma(color.rgb);
	float b 		= getluma(largeblur.rgb);
	float c			= getluma(smallblur.rgb);

//HDR Toning
	float sqrta 	= sqrt(a);
	float HDRToning = sqrta * lerp(sqrta*(2*a*b-a-2*b+2.0), (2*sqrta*b-2*b+1), b > 0.5); //modified soft light v1
	color = color / (a+1e-6) * lerp(a,HDRToning,g_sldHDR);

//sharpen
    float Sharpen = getluma(color.rgb - smallblur.rgb); //need to recompute, as luma of color changed by hdr toning
    float sharplimit = lerp(0.25,0.6,g_sldSharpen);
    Sharpen = clamp(Sharpen,-sharplimit, sharplimit);
    color.rgb = color.rgb / a * lerp(a,a+Sharpen,g_sldSharpen);

//clarity
    float Clarity = (0.5 + a - b);
    Clarity = lerp(2*Clarity + a*(1-2*Clarity), 2*(1-Clarity)+(2*Clarity-1)*rsqrt(a), a > b); //modified soft light v2
    color.rgb *= lerp(1.0,Clarity,g_sldClarity);

//bloom
    color.rgb = 1-(1-color.rgb)*(1-largeblur.rgb * g_sldBloom);
    
}

technique Details
{
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PSGaussian1;
        RenderTarget = LargeBlurTex;
    }
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PSGaussian2AndBlend;
    }
}
