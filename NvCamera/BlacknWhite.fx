uniform float g_sldIntensity <
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
> = 1.0;

uniform bool g_sldEnableDepth < 
    ui_label        = "Enable Depth";
    ui_label_en_US  = "Enable Depth";
    ui_label_cs =  "Aktivovat hloubku";
    ui_label_da =  "Aktivér dybde";
    ui_label_de =  "Tiefe aktivieren";
    ui_label_el =  "Ενεργοποίηση βάθους";
    ui_label_en_UK =  "Enable Depth";
    ui_label_es_ES =  "Activar profundidad";
    ui_label_es_MX =  "Activar profundidad";
    ui_label_fi =  "Ota käyttöön syvyys";
    ui_label_fr =  "Activer la profondeur";
    ui_label_hu =  "Mélység bekapcsolása";
    ui_label_it =  "Abilita profondità";
    ui_label_ja =  "深度を有効化";
    ui_label_ko =  "깊이 활성화";
    ui_label_nl =  "Diepte inschakelen";
    ui_label_nb =  "Aktiver dybde";
    ui_label_pl =  "Włącz głębię";
    ui_label_pt_PT =  "Activar profundidade";
    ui_label_pt_BR =  "Habilitar profundidade";
    ui_label_ru =  "Включить глубину";
    ui_label_sk =  "Aktivovať hĺbku";
    ui_label_sl =  "Omogoči globino";
    ui_label_sv =  "Aktivera djup";
    ui_label_th =  "เปิดใช้ความลึก";
    ui_label_tr =  "Derinliği Etkinleştir";
    ui_label_zh_CHS =  "启用深度";
    ui_label_zh_CHT =  "啟用深度";
> = false;

uniform float g_sldDistance <
    ui_type = "drag";
	ui_label        = "Border Distance";
	ui_label_en_US  = "Border Distance";
	ui_label_cs     = "Vzdálenost ohraničení";
	ui_label_da     = "Grænsesafstand";
	ui_label_de     = "Randabstand";
	ui_label_el     = "Απόσταση περιθωρίου";
	ui_label_en_UK  = "Border Distance";
	ui_label_es_ES  = "Distancia de borde";
	ui_label_es_MX  = "Distancia del borde";
	ui_label_fi     = "Reunan etäisyys";
	ui_label_fr     = "Distance des contours";
	ui_label_hu     = "Szegélytávolság";
	ui_label_it     = "Distanza bordo";
	ui_label_ja     = "ボーダー距離";
	ui_label_ko     = "테두리 거리";
	ui_label_nl     = "Randafstand";
	ui_label_nb     = "Kantavstand";
	ui_label_pl     = "Odległość graniczna";
	ui_label_pt_PT  = "Distância da borda";
	ui_label_pt_BR  = "Intensidade";
	ui_label_ru     =  "Дальность границ";
	ui_label_sk     = "Vzdialenosť orámovania";
	ui_label_sl     = "Razdalja roba";
	ui_label_sv     =  "Kantdistans";
	ui_label_th     = "ระยะของขอบ";
	ui_label_tr     = "Sınır Mesafesi";
	ui_label_zh_CHS = "边界距离";
	ui_label_zh_CHT = "邊框距離";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.5;

uniform bool g_sldInvertMask < 
    ui_label        = "Reverse Depth Mask";
    ui_label_en_US  = "Reverse Depth Mask";
    ui_label_cs =  "Maska hloubky převrácení";
    ui_label_da =  "Omvendt dybdemaske";
    ui_label_de =  "Umgekehrte Tiefenmaske";
    ui_label_el =  "Ανάστροφη μάσκας βάθους";
    ui_label_en_UK =  "Reverse Depth Mask";
    ui_label_es_ES =  "Máscara de respiración invertida";
    ui_label_es_MX =  "Máscara de profundidad inversa";
    ui_label_fi =  "Käänteinen syvyysmaski";
    ui_label_fr =  "Masque de profondeur inversé";
    ui_label_hu =  "Fordított mélység maszk";
    ui_label_it =  "Maschera di profondità invertita";
    ui_label_ja =  "深度マスクの反転";
    ui_label_ko =  "역방향 깊이 마스크";
    ui_label_nl =  "Omgekeerde dieptestructuur";
    ui_label_nb =  "Omvendt dybdemaske";
    ui_label_pl =  "Maska odwróconej głębi";
    ui_label_pt_PT =  "Máscara de profundidade invertida";
    ui_label_pt_BR =  "Máscara de profundidade inversa";
    ui_label_ru =  "Обратная маска глубины";
    ui_label_sk =  "Spätná maska hĺbky";
    ui_label_sl =  "Maska obratne globine";
    ui_label_sv =  "Reverserad djupmask";
    ui_label_th =  "มาส์กกลับความลึก";
    ui_label_tr =  "Ters Derinlik Maskesi";
    ui_label_zh_CHS =  "反向深度蒙版";
    ui_label_zh_CHT =  "反向深度遮罩";
> = false;

#define RESHADE_EFFECT_REQUIRES_DEPTH
#include "NvCommon.fxh"

void PSMain(in VSOut i, out float4 color : SV_Target)
{
    color = tex2D(NV::ColorInput, i.uv);
	float depth = NV::GetLinearizedDepth(i.uv);
    float gray = NV::GetLuma(color.rgb);

    float desat_threshold = g_sldDistance * g_sldDistance;
    desat_threshold *= desat_threshold; //^4 for better tweaking response

	float desat_mask = depth > desat_threshold ? 1.0 : !g_sldEnableDepth;
    desat_mask = g_sldInvertMask ? 1.0 - desat_mask : desat_mask;
    desat_mask *= g_sldIntensity;

    color = lerp(color, gray, desat_mask);     
}

technique BlacknWhite
{
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PSMain;
    }
}
