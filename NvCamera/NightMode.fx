uniform float g_sldBlueReduction <
    ui_type = "drag";
	ui_label        = "Intensity";
	ui_label_en_US  = "Intensity";
	ui_label_cs     = "Intenzita";
	ui_label_da     = "Intensitet";
	ui_label_de     = "Intensität";
	ui_label_el     = "Ένταση";
	ui_label_en_UK  = "Intensity";
	ui_label_es_ES  = "Intensidad";
	ui_label_es_MX  = "Intensidad";
	ui_label_fi     = "Voimakkuus";
	ui_label_fr     = "Intensité";
	ui_label_hu     = "Intenzitás";
	ui_label_it     = "Intensità";
	ui_label_ja     = "明度";
	ui_label_ko     = "강도";
	ui_label_nl     = "Intensiteit";
	ui_label_nb     = "Intensitet";
	ui_label_pl     = "Intensywność";
	ui_label_pt_PT  = "Intensidade";
	ui_label_pt_BR  = "Intensidade";
	ui_label_ru     = "Насыщенность";
	ui_label_sk     = "Intenzita";
	ui_label_sl     = "Intenzivnost";
	ui_label_sv     = "Intensitet";
	ui_label_th     = "ความเข้ม";
	ui_label_tr     = "Yoğunluk";
	ui_label_zh_CHS = "强度";
	ui_label_zh_CHT = "強度";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.3;

#include "NvCommon.fxh"

void PSMain(in VSOut i, out float4 color : SV_Target)
{	
	color = tex2D(NV::ColorInput, i.uv);
    //hand crafted reduction curves that first tint towards yellow and then towards red
	color.gb *= float2(pow((1-g_sldBlueReduction) * 0.95 + 0.05,0.4),pow(saturate((1.0-g_sldBlueReduction) * 0.95 - 0.05),0.333) * 2.05 - 0.95);
}

technique NightMode
{
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PSMain;
    }
}
