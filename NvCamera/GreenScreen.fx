
uniform float g_sldDIST <
	ui_type = "drag";
    ui_label        = "Focus Depth";
    ui_label_en_US  = "Focus Depth";
    ui_label_cs =  "Hloubka ostrosti";
    ui_label_da =  "Fokusdybde";
    ui_label_de =  "Fokustiefe";
    ui_label_el =  "Βάθος εστίασης";
    ui_label_en_UK =  "Focus Depth";
    ui_label_es_ES =  "Profundidad de enfoque";
    ui_label_es_MX =  "Profundidad de foco";
    ui_label_fi =  "Tarkennuksen syvyys";
    ui_label_fr =  "Profondeur de mise au point";
    ui_label_hu =  "Fókuszmélység";
    ui_label_it =  "Profondità focalizzazione";
    ui_label_ja =  "フォーカス深度";
    ui_label_ko =  "초점 깊이";
    ui_label_nl =  "Scherptediepte";
    ui_label_nb =  "Fokuser dybde";
    ui_label_pl =  "Głębia ostrości";
    ui_label_pt_PT =  "Profundidade de focagem";
    ui_label_pt_BR =  "Profundidade de foco";
    ui_label_ru =  "Глубина фокуса";
    ui_label_sk =  "Hĺbka zaostrenia";
    ui_label_sl =  "Globina gorišča";
    ui_label_sv =  "Fokusdjup";
    ui_label_th =  "โฟกัสของความลึก";
    ui_label_tr =  "Odak Derinliği";
    ui_label_zh_CHS =  "焦深";
    ui_label_zh_CHT =  "焦點深度";
	ui_min = 0.0; 
    ui_max = 1.0;
> = 0.5;

uniform float g_sldHue <
	ui_type = "drag";
    ui_label        = "Background Color";
    ui_label_en_US  = "Background Color";
    ui_label_cs =  "Barva pozadí";
    ui_label_da =  "Baggrundsfarve";
    ui_label_de =  "Hintergrundfarbe";
    ui_label_el =  "Χρώμα φόντου";
    ui_label_en_UK =  "Background Colour";
    ui_label_es_ES =  "Color de fondo";
    ui_label_es_MX =  "Color de fondo";
    ui_label_fi =  "Taustaväri";
    ui_label_fr =  "Couleur d’arrière-plan";
    ui_label_hu =  "Háttérszín";
    ui_label_it =  "Colore sfondo";
    ui_label_ja =  "背景色";
    ui_label_ko =  "배경색";
    ui_label_nl =  "Achtergrondkleur";
    ui_label_nb =  "Bakgrunnsfarge";
    ui_label_pl =  "Kolor tła";
    ui_label_pt_PT =  "Cor do padrão de fundo";
    ui_label_pt_BR =  "Cor de fundo";
    ui_label_ru =  "Цвет фона";
    ui_label_sk =  "Farba pozadia";
    ui_label_sl =  "Barva ozadja";
    ui_label_sv =  "Bakgrundsfärg";
    ui_label_th =  "สีพื้นหลัง";
    ui_label_tr =  "Arka Plan Rengi";
    ui_label_zh_CHS =  "背景颜色";
    ui_label_zh_CHT =  "背景顏色";
	ui_min = 0.0; 
    ui_max = 1.0;
> = 0.0;

uniform int g_maskID <
	ui_type = "drag";
    ui_label        = "Select Background";
    ui_label_en_US  = "Select Background";
    ui_label_cs =  "Vybrat pozadí";
    ui_label_da =  "Vælg baggrund";
    ui_label_de =  "Hintergrund auswählen";
    ui_label_el =  "Επιλογή φόντου";
    ui_label_en_UK =  "Select Background";
    ui_label_es_ES =  "Seleccionar fondo";
    ui_label_es_MX =  "Seleccionar fondo";
    ui_label_fi =  "Valitse tausta";
    ui_label_fr =  "Sélectionner l’arrière-plan";
    ui_label_hu =  "Háttér kiválasztása";
    ui_label_it =  "Seleziona sfondo";
    ui_label_ja =  "背景を選択";
    ui_label_ko =  "배경 선택";
    ui_label_nl =  "Achtergrond selecteren";
    ui_label_nb =  "Velg bakgrunn";
    ui_label_pl =  "Wybierz tło";
    ui_label_pt_PT =  "Selecionar padrão de fundo";
    ui_label_pt_BR =  "Selecionar fundo";
    ui_label_ru =  "Выбрать фон";
    ui_label_sk =  "Vybrať pozadie";
    ui_label_sl =  "Izberi ozadje";
    ui_label_sv =  "Välj bakgrund";
    ui_label_th =  "เลือกพื้นหลัง";
    ui_label_tr =  "Arka Plan Seç";
    ui_label_zh_CHS =  "选择背景";
    ui_label_zh_CHT =  "選取背景";
	ui_min = 0; 
    ui_max = 2;
> = 0;

#define RESHADE_EFFECT_REQUIRES_DEPTH
#include "NvCommon.fxh"

uniform int captureState < source = "capture_state"; >;
uniform bool depthReady < source = "bufready_depth"; >;
uniform float4 tileUV  < source = "tile_uv"; >;

texture OverlayTex1 < source = "GreenScreenBG01.jpg"; > { Width = 1920; 			  Height = 1080; 				Format = RGBA8; };
texture OverlayTex2 < source = "GreenScreenBG02.jpg"; > { Width = 1920; 			  Height = 1080; 				Format = RGBA8; };
sampler sOverlayTex1 { Texture = OverlayTex1; };
sampler sOverlayTex2 { Texture = OverlayTex2; };

void PSMain(in VSOut i, out float4 color : SV_Target)
{
	color = tex2D(NV::ColorInput, i.uv);

    if(!depthReady)
    {
        return;
    } 

    float depth = NV::GetLinearizedDepth(i.uv);

    if(captureState == CAPTURE_STATE_NOT_STARTED || captureState == CAPTURE_STATE_REGULAR || captureState == CAPTURE_STATE_HIGHRES)
	{
        float2 greenScreenUV = lerp(tileUV.xy, tileUV.zw, i.uv);
        float hue = frac(g_sldHue + 0.3333); //hue 0-1 rotates once around the color wheel, offsetting the start gives green at default hue = 0

        float4 mask = 
              g_maskID == 0 ? saturate(float4(abs(hue * 6.0 - 3.0) - 1.0,2.0 - abs(hue * 6.0 - 2.0), 2.0 - abs(hue * 6.0 - 4.0), 1))
            : g_maskID == 1 ? tex2D(sOverlayTex1, greenScreenUV)
            : g_maskID == 2 ? tex2D(sOverlayTex2, greenScreenUV)
            : 0;

        float depth_mask = depth > g_sldDIST * g_sldDIST * g_sldDIST; //^3 so the slider is  highly precise in near areas (where it counts) and becomes less precise with distance
	    color.rgb = lerp(color.rgb, mask.rgb, mask.a * depth_mask); //alpha blending the texture
    }
}
	
technique GreenScreen
{
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PSMain;
    } 
}
