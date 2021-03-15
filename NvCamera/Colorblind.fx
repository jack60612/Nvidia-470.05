uniform float g_sldProtanopia <
    ui_type = "drag";
    ui_label = "Protanopia";
    ui_label_en_US = "Protanopia";
    ui_label_cs =  "Protanopie";
    ui_label_da =  "Rødblindhed";
    ui_label_de =  "Protanopie";
    ui_label_el =  "Πρωτανοπία";
    ui_label_en_UK =  "Protanopia";
    ui_label_es_ES =  "Protanopía";
    ui_label_es_MX =  "Protanopia";
    ui_label_fi =  "Puna-vihersokeus";
    ui_label_fr =  "Protanopie";
    ui_label_hu =  "Protanópia";
    ui_label_it =  "Protanopia";
    ui_label_ja =  "第一色盲";
    ui_label_ko =  "적색약";
    ui_label_nl =  "Protanopie";
    ui_label_nb =  "Protanopi";
    ui_label_pl =  "Protanopia";
    ui_label_pt_PT =  "Protanopia";
    ui_label_pt_BR =  "Protanopia";
    ui_label_ru =  "Протанопия";
    ui_label_sk =  "Protanopia";
    ui_label_sl =  "Protanopija";
    ui_label_sv =  "Protanopi";
    ui_label_th =  "ตาบอดสีแดง";
    ui_label_tr =  "Kırmızı Körlüğü";
    ui_label_zh_CHS =  "红色盲";
    ui_label_zh_CHT =  "紅色盲";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.0;

uniform float g_sldDeuteranopia <
    ui_type = "drag";
    ui_label        = "Deuteranopia";
    ui_label_en_US  = "Deuteranopia";
    ui_label_cs =  "Deuteranopie";
    ui_label_da =  "Grøndblindhed";
    ui_label_de =  "Deuteranopie";
    ui_label_el =  "Δευτερανοπία";
    ui_label_en_UK =  "Deuteranopia";
    ui_label_es_ES =  "Deuteranopía";
    ui_label_es_MX =  "Deuteranopia";
    ui_label_fi =  "Viher-punasokeus";
    ui_label_fr =  "Deutéranopie";
    ui_label_hu =  "Deuteranópia";
    ui_label_it =  "Deuteranopia";
    ui_label_ja =  "第二色盲";
    ui_label_ko =  "녹색약";
    ui_label_nl =  "Deuteranopie";
    ui_label_nb =  "Deuteranopi";
    ui_label_pl =  "Daltonizm";
    ui_label_pt_PT =  "Deuteranopia";
    ui_label_pt_BR =  "Deuteranopia";
    ui_label_ru =  "Дейтеранопия";
    ui_label_sk =  "Deuteranopia";
    ui_label_sl =  "Devteranopija";
    ui_label_sv =  "Deuteranopi";
    ui_label_th =  "ตาบอดสีเขียว";
    ui_label_tr =  "Yeşil Körlüğü";
    ui_label_zh_CHS =  "绿色盲";
    ui_label_zh_CHT =  "綠色盲";
	ui_min = 0.0;
    ui_max = 1.0;
> = 1.0;

uniform float g_sldTritanopia <
    ui_type = "drag";
    ui_label        = "Tritanopia";
    ui_label_en_US  = "Tritanopia";
    ui_label_cs =  "Tritanopie";
    ui_label_da =  "Blåblindhed";
    ui_label_de =  "Tritanopie";
    ui_label_el =  "Τριτανοπία";
    ui_label_en_UK =  "Tritanopia";
    ui_label_es_ES =  "Tritanopía";
    ui_label_es_MX =  "Tritanopia";
    ui_label_fi =  "Tritanopia";
    ui_label_fr =  "Tritanopie";
    ui_label_hu =  "Tritanópia";
    ui_label_it =  "Tritanopia";
    ui_label_ja =  "第三色盲";
    ui_label_ko =  "청색약";
    ui_label_nl =  "Tritanopie";
    ui_label_nb =  "Tritanopi";
    ui_label_pl =  "Tritanopia";
    ui_label_pt_PT =  "Tritanopia";
    ui_label_pt_BR =  "Tritanopia";
    ui_label_ru =  "Тританопия";
    ui_label_sk =  "Tritanopia";
    ui_label_sl =  "Tritanopija";
    ui_label_sv =  "Tritanopi";
    ui_label_th =  "ตาบอดสีน้ำเงิน";
    ui_label_tr =  "Mavi Körlüğü";
    ui_label_zh_CHS =  "蓝色盲";
    ui_label_zh_CHT =  "藍色盲";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.0;

#include "NvCommon.fxh"

void PSMain(in VSOut i, out float4 color : SV_Target)
{	
	color = tex2D(NV::ColorInput, i.uv);
	float3 RGB = color.rgb;

	float3 LMS = float3(	dot(RGB,float3(17.8824,		43.5161,	4.11935)),
							dot(RGB,float3(3.45565,		27.1554,	3.86714)),
							dot(RGB,float3(0.0299566,	0.184309,	1.46709)));

	float3 LMS_daltonized = LMS;
	//Protanopia - modify L only
	LMS_daltonized.x = lerp(LMS_daltonized.x, dot(LMS,float3(0.0,	2.02344, -2.52581)), g_sldProtanopia);
	//Deuteranopia - modify M only
	LMS_daltonized.y = lerp(LMS_daltonized.y, dot(LMS,float3(0.494207, 0.0, 1.24827)), g_sldDeuteranopia);
	 //Tritanopia - modify S only
	LMS_daltonized.z = lerp(LMS_daltonized.z, dot(LMS,float3(-0.395913, 0.801109, 0.0)), g_sldTritanopia);

	float3 RGB_daltonized = float3(	dot(LMS_daltonized,float3(0.0809444479,		-0.130504409,	0.116721066)),
									dot(LMS_daltonized,float3(-0.0102485335,	0.0540193266,	-0.113614708)),
									dot(LMS_daltonized,float3(-0.000365296938,	-0.00412161469,	0.693511405)));

	float3 RGB_corrected = RGB;
	RGB_corrected.y += dot(RGB.xy - RGB_daltonized.xy, float2(0.7,1.0));
	RGB_corrected.z += dot(RGB.xz - RGB_daltonized.xz, float2(0.7,1.0));

	color = float4(RGB_corrected, 1.0);
}

technique Colorblind
{
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PSMain;
    }
}
