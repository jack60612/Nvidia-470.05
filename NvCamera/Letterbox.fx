uniform int g_sldASPX <
    ui_type = "drag";
	ui_label        = "Horizontal Scale";
	ui_label_en_US  = "Horizontal Scale";
    ui_label_cs =  "Horizontální měřítko";
    ui_label_da =  "Vandret skalering";
    ui_label_de =  "Horizontale Skala";
    ui_label_el =  "Οριζόντια κλίμακα";
    ui_label_en_UK =  "Horizontal Scale";
    ui_label_es_ES =  "Escala horizontal";
    ui_label_es_MX =  "Escala horizontal";
    ui_label_fi =  "Vaakamittakaava";
    ui_label_fr =  "Échelle horizontale";
    ui_label_hu =  "Vízszintes skála";
    ui_label_it =  "Scala orizzontale";
    ui_label_ja =  "水平スケール";
    ui_label_ko =  "수평 스케일";
    ui_label_nl =  "Horizontale schaal";
    ui_label_nb =  "Horisontal skala";
    ui_label_pl =  "Skala pozioma";
    ui_label_pt_PT =  "Escala horizontal";
    ui_label_pt_BR =  "Escala horizontal";
    ui_label_ru =  "Масштаб по горизонтали";
    ui_label_sk =  "Horizontálna mierka";
    ui_label_sl =  "Vodoravno raztezanje";
    ui_label_sv =  "Horisontell skala";
    ui_label_th =  "มาตราส่วนแนวนอน";
    ui_label_tr =  "Yatay Ölçek";
    ui_label_zh_CHS =  "水平标度";
    ui_label_zh_CHT =  "水平縮放比例";
	ui_min = 1;
    ui_max = 30;
> = 21;

uniform int g_sldASPY <
    ui_type = "drag";
	ui_label        = "Vertical Scale";
	ui_label_en_US  = "Vertical Scale";
    ui_label_cs =  "Vertikální měřítko";
    ui_label_da =  "Lodret skalering";
    ui_label_de =  "Vertikale Skala";
    ui_label_el =  "Κάθετη κλίμακα";
    ui_label_en_UK =  "Vertical Scale";
    ui_label_es_ES =  "Escala vertical";
    ui_label_es_MX =  "Escala vertical";
    ui_label_fi =  "Pystymittakaava";
    ui_label_fr =  "Échelle verticale";
    ui_label_hu =  "Függőleges skála";
    ui_label_it =  "Scala verticale";
    ui_label_ja =  "垂直スケール";
    ui_label_ko =  "수직 스케일";
    ui_label_nl =  "Verticale schaal";
    ui_label_nb =  "Vertikal skala";
    ui_label_pl =  "Skala pionowa";
    ui_label_pt_PT =  "Escala vertical";
    ui_label_pt_BR =  "Escala vertical";
    ui_label_ru =  "Масштаб по вертикали";
    ui_label_sk =  "Vertikálna mierka";
    ui_label_sl =  "Navpično raztezanje";
    ui_label_sv =  "Vertikal skala";
    ui_label_th =  "มาตราส่วนแนวตั้ง";
    ui_label_tr =  "Düşey Ölçek";
    ui_label_zh_CHS =  "垂直标度";
    ui_label_zh_CHT =  "垂直縮放比例";
	ui_min = 1;
    ui_max = 30;
> = 9;

#include "NvCommon.fxh"

uniform float4 tileUV  < source = "tile_uv"; >;
uniform int captureState < source = "capture_state"; >;

void PSMain(in VSOut i, out float4 color : SV_Target)
{	
	color = tex2D(NV::ColorInput, i.uv);

    float current_aspect = BUFFER_ASPECT_RATIO;

    [branch]
	if(captureState != CAPTURE_STATE_360 && captureState != CAPTURE_STATE_360STEREO)
	{
		float g_sldASP = float(g_sldASPX) / float(g_sldASPY);
		//convert current tile uv to global image uv
		float2 ntxcoord = lerp(tileUV.xy, tileUV.zw, i.uv.xy);

        ntxcoord = ntxcoord * 2.0 - 1.0; 

		[flatten]
		if(g_sldASP < current_aspect)
		{
			ntxcoord.x *= current_aspect / g_sldASP;	
		}		
		else
		{
			ntxcoord.y /= current_aspect / g_sldASP;	
		}		
		color.rgb *= all(saturate(1.0 - ntxcoord * ntxcoord)); //0 where any component exceeds [-1,1] boundary	
	}

}

technique Letterbox
{
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PSMain;
    }
}
