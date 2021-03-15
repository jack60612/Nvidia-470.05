uniform float g_sldAxis <
    ui_type = "drag";
    ui_label = "Axis";
    ui_label_en_US  = "Axis";
    ui_label_cs =  "Osa";
    ui_label_da =  "Akse";
    ui_label_de =  "Achse";
    ui_label_el =  "Άξονας";
    ui_label_en_UK =  "Axis";
    ui_label_es_ES =  "Eje";
    ui_label_es_MX =  "Eje";
    ui_label_fi =  "Akseli";
    ui_label_fr =  "Axe";
    ui_label_hu =  "Tengely";
    ui_label_it =  "Asse";
    ui_label_ja =  "軸";
    ui_label_ko =  "축";
    ui_label_nl =  "As";
    ui_label_nb =  "Akse";
    ui_label_pl =  "Oś";
    ui_label_pt_PT =  "Eixo";
    ui_label_pt_BR =  "Eixo";
    ui_label_ru =  "Ось";
    ui_label_sk =  "Os";
    ui_label_sl =  "Os";
    ui_label_sv =  "Axel";
    ui_label_th =  "แกน";
    ui_label_tr =  "Eksen";
    ui_label_zh_CHS =  "轴";
    ui_label_zh_CHT =  "軸";
	ui_min = 0.0;
    ui_max = 180.0;
    ui_step = 1.0;
> = 0.0;

uniform float g_sldBlur <
    ui_type = "drag";
    ui_label = "Blur Size";
    ui_label_en_US  = "Blur Size";
    ui_label_cs =  "Velikost rozostření";
    ui_label_da =  "Sløringsstørrelse";
    ui_label_de =  "Unschärfegröße";
    ui_label_el =  "Μέγεθος θολώματος";
    ui_label_en_UK =  "Blur Size";
    ui_label_es_ES =  "Tamaño de desenfoque";
    ui_label_es_MX =  "Tamaño de desenfoque";
    ui_label_fi =  "Sumennuksen koko";
    ui_label_fr =  "Taille du flou";
    ui_label_hu =  "Homályosság mérete";
    ui_label_it =  "Dimensioni sfocatura";
    ui_label_ja =  "ぼかしサイズ";
    ui_label_ko =  "블러 크기";
    ui_label_nl =  "Vervagingsgrootte";
    ui_label_nb =  "Uskarphetstørrelse";
    ui_label_pl =  "Rozmiar rozmycia";
    ui_label_pt_PT =  "Tamanho da desfocagem";
    ui_label_pt_BR =  "Tamanho do desfoque";
    ui_label_ru =  "Площадь размытия";
    ui_label_sk =  "Veľkosť rozostrenia";
    ui_label_sl =  "Obseg zameglitve";
    ui_label_sv =  "Storlek på oskärpa";
    ui_label_th =  "ขนาดความพร่ามัว";
    ui_label_tr =  "Bulanıklaştırma Boyutu";
    ui_label_zh_CHS =  "模糊大小";
    ui_label_zh_CHT =  "模糊尺寸";
	ui_min = 0.0;
    ui_max = 30.0;
> = 15.0;

uniform float g_sldCurve <
    ui_type = "drag";
    ui_label = "Blur Curve";
    ui_label_en_US  = "Blur Curve";
    ui_label_cs =  "Křivka rozostření";
    ui_label_da =  "Sløringskurve";
    ui_label_de =  "Unschärfekurve";
    ui_label_el =  "Καμπύλη θολώματος";
    ui_label_en_UK =  "Blur Curve";
    ui_label_es_ES =  "Curva de desenfoque";
    ui_label_es_MX =  "Curva de desenfoque";
    ui_label_fi =  "Sumennuskäyrä";
    ui_label_fr =  "Courbe de flou";
    ui_label_hu =  "Homályossági görbe";
    ui_label_it =  "Curva sfocatura";
    ui_label_ja =  "ぼかしカーブ";
    ui_label_ko =  "블러 곡선";
    ui_label_nl =  "Vervagingsboog";
    ui_label_nb =  "Uskarphetskurve";
    ui_label_pl =  "Krzywa rozmycia";
    ui_label_pt_PT =  "Curva de desfocagem";
    ui_label_pt_BR =  "Curva de desfoque";
    ui_label_ru =  "Кривая размытия";
    ui_label_sk =  "Krivka rozostrenia";
    ui_label_sl =  "Krivulja zameglitve";
    ui_label_sv =  "Kurva för oskärpa";
    ui_label_th =  "เส้นโค้งพร่ามัว";
    ui_label_tr =  "Bulanıklaştırma Eğrisi";
    ui_label_zh_CHS =  "模糊曲线";
    ui_label_zh_CHT =  "模糊曲線";
	ui_min = 0.0;
    ui_max = 10.0;
> = 2.0;

#include "NvCommon.fxh"

uniform float4 tileUV  < source = "tile_uv"; >;
uniform int captureState < source = "capture_state"; >;

float4 tilt_shift_pass(in VSOut i, in int dir)
{
    float tsAngle = radians(g_sldAxis);
    float2x2 tsMat = float2x2(cos(tsAngle),-sin(tsAngle),sin(tsAngle),cos(tsAngle));

    float2 global_uv = (captureState == CAPTURE_STATE_HIGHRES) ? lerp(tileUV.xy, tileUV.zw, i.uv) : i.uv;
    
    float2 tscoord = global_uv * 2.0 - 1.0;
    tscoord.x /= BUFFER_ASPECT_RATIO;
    tscoord = mul(tscoord, tsMat);
    tscoord.x *= BUFFER_ASPECT_RATIO;

    float intensity = pow(abs(tscoord.y), g_sldCurve);
    float2 blur_axis = float2(dir, !dir);

    //actually about half the size in pixels as we do bilinear sampling
    float2 gaussian_size_pixels = intensity * g_sldBlur; 
    //2x2 tiles -> 2x as many pixels to blur, 3x3 -> 3x as many pixels to blur etc.
    //rcp(tileUV.zw - tileUV.xy) evaluates to inverse of tile count
    //for 2x2: (0.5,0.5), for 3x3 (0.333..,0.333..) and so on.
    gaussian_size_pixels *= rcp(tileUV.zw - tileUV.xy);

    //select correct size for horizontal or vertical pass
    //technically not needed as we do NxN tiles only 
    //but this is more future proof should we use NxM tile amounts
    float gaussian_size_to_use = dot(blur_axis, gaussian_size_pixels);

    //need non-integer value so the gaussian bell size increases smoothly
    //and only adds more taps when they are needed
    float k = -2.0 * rcp(gaussian_size_to_use * gaussian_size_to_use + 1e-3);
    int steps = ceil(gaussian_size_to_use);

    float4 original = tex2D(NV::ColorInput, i.uv);
    //weight by 0.5 as each tap in the loop samples 2 texels at once bilinearly
    float4 blurred = float4(original.rgb, 1.0) * 0.5;

    for(float s = 1; s <= steps; s++)
    {
        float w = exp(s * s * k);
        float offset = 2.0 * s - 0.5; //sample at 1.5, 3.5, 5.5... to get 2 texels at once for free
        blurred += float4(tex2Dlod(NV::ColorInput, float4(i.uv + blur_axis * offset * BUFFER_PIXEL_SIZE, 0, 0)).rgb, 1) * w;
        blurred += float4(tex2Dlod(NV::ColorInput, float4(i.uv - blur_axis * offset * BUFFER_PIXEL_SIZE, 0, 0)).rgb, 1) * w;
    }
    blurred /= blurred.w;

    return lerp(original, blurred, saturate(blurred.w * 4.0));
}

void PSMain1(in VSOut i, out float4 color : SV_Target)
{	
    color = tilt_shift_pass(i, 0);
}
void PSMain2(in VSOut i, out float4 color : SV_Target)
{	
    color = tilt_shift_pass(i, 1);
}

technique TiltShift
{
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PSMain1;
    }
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PSMain2;
    }
}
