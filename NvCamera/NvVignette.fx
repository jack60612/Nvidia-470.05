uniform float g_sldVignette <
    ui_type = "drag";
	ui_label        = "Intensity";
	ui_label_en_US  = "Intensity";
    ui_label_cs =  "Intenzita";
    ui_label_da =  "Intensitet";
    ui_label_de =  "Intensität";
    ui_label_el =  "Ένταση";
    ui_label_en_UK =  "Intensity";
    ui_label_es_ES =  "Intensidad";
    ui_label_es_MX =  "Intensidad";
    ui_label_fi =  "Voimakkuus";
    ui_label_fr =  "Intensité";
    ui_label_hu =  "Intenzitás";
    ui_label_it =  "Intensità";
    ui_label_ja =  "明度";
    ui_label_ko =  "강도";
    ui_label_nl =  "Intensiteit";
    ui_label_nb =  "Intensitet";
    ui_label_pl =  "Intensywność";
    ui_label_pt_PT =  "Intensidade";
    ui_label_pt_BR =  "Intensidade";
    ui_label_ru =  "Насыщенность";
    ui_label_sk =  "Intenzita";
    ui_label_sl =  "Intenzivnost";
    ui_label_sv =  "Intensitet";
    ui_label_th =  "ความเข้ม";
    ui_label_tr =  "Yoğunluk";
    ui_label_zh_CHS =  "强度";
    ui_label_zh_CHT =  "強度";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.5;

#include "NvCommon.fxh"

uniform float4 tileUV < source = "tile_uv"; >;
uniform int captureState < source = "capture_state"; >;

//quick ad-hoc random value, does not need to be good
float rand(float2 uv)
{
    return frac(sin(dot(uv, float2(-12.9398, 73.233)) * 37.8834));
}
//rehashing to cheaply improve randomness
float randrand(float2 uv)
{
    return rand(float2(rand(float2(uv.x, -uv.y)), rand(float2(-uv.x, uv.y))));
}

void PSMain(in VSOut i, out float4 color : SV_Target)
{	
	color = tex2D(NV::ColorInput, i.uv);

    float2 global_uv = lerp(tileUV.xy, tileUV.zw, i.uv);
    float2 vign_uv = global_uv * 2.0 - 1.0;
    vign_uv.x *= BUFFER_ASPECT_RATIO;

    //scale down so corners are exactly 1 unit away
    vign_uv *= rsqrt(1.0 + BUFFER_ASPECT_RATIO * BUFFER_ASPECT_RATIO);

    float vignette = length(vign_uv);
    vignette = saturate(-1.0 + 2.0 * vignette); //rescale so darkening starts at halfway between screen center and corner
    vignette *= vignette;
    vignette *= g_sldVignette;

    //dither the output to not create banding
    //subtract dither so vignette free areas do not receive grain
    //for some reason needs higher dither amount than target bit depth suggests
    vignette -= randrand(i.uv) * 0.03; 

	if (captureState != CAPTURE_STATE_360 && captureState != CAPTURE_STATE_360STEREO) 
	{
        color.rgb *= saturate(1.0 - vignette);        
    }
}

technique Vignette
{
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PSMain;
    }
}
