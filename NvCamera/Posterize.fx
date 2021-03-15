/*=============================================================================
	Preprocessor settings
=============================================================================*/

#define NUM_PASSES 				4		
#define OUTLINE_INTENSITY		0
#define SHARPEN_INTENSITY		0.7
#define NUM_DIRS				5
#define NUM_STEPS_PER_PASS		4

/*=============================================================================
	UI Uniforms
=============================================================================*/

uniform float ZEBRA_INTENSITY <
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
> = 0.0;

uniform float3 PALETTE_COLOR_1 <
    ui_type = "color";
    ui_label        = "Color 1";
    ui_label_en_US  = "Color 1";
	ui_label_cs     = "Barva 1";
	ui_label_da     = "Farve 1";
	ui_label_de     = "Farbe 1";
	ui_label_el     = "Χρώμα 1";
	ui_label_en_UK  = "Colour 1";
	ui_label_es_ES  = "Color 1";
	ui_label_es_MX  = "Color 1";
	ui_label_fi     = "Väri 1";
	ui_label_fr     = "Couleur 1";
	ui_label_hu     = "Szín 1";
	ui_label_it     = "Colore 1";
	ui_label_ja     = "カラー 1";
	ui_label_ko     = "컬러 1";
	ui_label_nl     = "Kleur 1";
	ui_label_nb     = "Farge 1";
	ui_label_pl     = "Kolor 1";
	ui_label_pt_PT  = "Cor 1";
	ui_label_pt_BR  = "Cor 1";
	ui_label_ru     = "Цвет 1";
	ui_label_sk     = "Farba 1";
	ui_label_sl     = "Barva 1";
	ui_label_sv     = "Färg 1";
	ui_label_th     = "สี 1";
	ui_label_tr     = "1. Renk";
	ui_label_zh_CHS = "颜色 1";
	ui_label_zh_CHT = "色彩 1";
> = float3(1/255.0, 48/255.0, 74/255.0);

uniform float3 PALETTE_COLOR_2 <
    ui_type = "color";
    ui_label        = "Color 2";
    ui_label_en_US  = "Color 2";
	ui_label_cs     = "Barva 2";
	ui_label_da     = "Farve 2";
	ui_label_de     = "Farbe 2";
	ui_label_el     = "Χρώμα 2";
	ui_label_en_UK  = "Colour 2";
	ui_label_es_ES  = "Color 2";
	ui_label_es_MX  = "Color 2";
	ui_label_fi     = "Väri 2";
	ui_label_fr     = "Couleur 2";
	ui_label_hu     = "Szín 2";
	ui_label_it     = "Colore 2";
	ui_label_ja     = "カラー 2";
	ui_label_ko     = "컬러 2";
	ui_label_nl     = "Kleur 2";
	ui_label_nb     = "Farge 2";
	ui_label_pl     = "Kolor 2";
	ui_label_pt_PT  = "Cor 2";
	ui_label_pt_BR  = "Cor 2";
	ui_label_ru     = "Цвет 2";
	ui_label_sk     = "Farba 2";
	ui_label_sl     = "Barva 2";
	ui_label_sv     = "Färg 2";
	ui_label_th     = "สี 2";
	ui_label_tr     = "2. Renk";
	ui_label_zh_CHS = "颜色 2";
	ui_label_zh_CHT = "色彩 2";
> = float3(219/255.0, 33/255.0, 38/255.0);

uniform float3 PALETTE_COLOR_3 <
    ui_type = "color";
    ui_label        = "Color 3";
    ui_label_en_US  = "Color 3";
	ui_label_cs     = "Barva 3";
	ui_label_da     = "Farve 3";
	ui_label_de     = "Farbe 3";
	ui_label_el     = "Χρώμα 3";
	ui_label_en_UK  = "Colour 3";
	ui_label_es_ES  = "Color 3";
	ui_label_es_MX  = "Color 3";
	ui_label_fi     = "Väri 3";
	ui_label_fr     = "Couleur 3";
	ui_label_hu     = "Szín 3";
	ui_label_it     = "Colore 3";
	ui_label_ja     = "カラー 3";
	ui_label_ko     = "컬러 3";
	ui_label_nl     = "Kleur 3";
	ui_label_nb     = "Farge 3";
	ui_label_pl     = "Kolor 3";
	ui_label_pt_PT  = "Cor 3";
	ui_label_pt_BR  = "Cor 3";
	ui_label_ru     = "Цвет 3";
	ui_label_sk     = "Farba 3";
	ui_label_sl     = "Barva 3";
	ui_label_sv     = "Färg 3";
	ui_label_th     = "สี 3";
	ui_label_tr     = "3. Renk";
	ui_label_zh_CHS = "颜色 3";
	ui_label_zh_CHT = "色彩 3";
> = float3(113/255.0, 153/255.0, 165/255.0);

uniform float3 PALETTE_COLOR_4 <
    ui_type = "color";
    ui_label        = "Color 4";
    ui_label_en_US  = "Color 4";
	ui_label_cs     = "Barva 4";
	ui_label_da     = "Farve 4";
	ui_label_de     = "Farbe 4";
	ui_label_el     = "Χρώμα 4";
	ui_label_en_UK  = "Colour 4";
	ui_label_es_ES  = "Color 4";
	ui_label_es_MX  = "Color 4";
	ui_label_fi     = "Väri 4";
	ui_label_fr     = "Couleur 4";
	ui_label_hu     = "Szín 4";
	ui_label_it     = "Colore 4";
	ui_label_ja     = "カラー 4";
	ui_label_ko     = "컬러 4";
	ui_label_nl     = "Kleur 4";
	ui_label_nb     = "Farge 4";
	ui_label_pl     = "Kolor 4";
	ui_label_pt_PT  = "Cor 4";
	ui_label_pt_BR  = "Cor 4";
	ui_label_ru     = "Цвет 4";
	ui_label_sk     = "Farba 4";
	ui_label_sl     = "Barva 4";
	ui_label_sv     = "Färg 4";
	ui_label_th     = "สี 4";
	ui_label_tr     = "4. Renk";
	ui_label_zh_CHS = "颜色 4";
	ui_label_zh_CHT = "色彩 4";
> = float3(255/255.0, 250/255.0, 182/255.0);

/*=============================================================================
	Textures, Samplers, Globals
=============================================================================*/

#if !defined(__RESHADE__) || __RESHADE__ < 30007
	#error "ReShade 4.0+ is required to use this header file"
#endif

#ifndef RESHADE_DEPTH_INPUT_IS_UPSIDE_DOWN
	#define RESHADE_DEPTH_INPUT_IS_UPSIDE_DOWN 0
#endif
#ifndef RESHADE_DEPTH_INPUT_IS_REVERSED
	#define RESHADE_DEPTH_INPUT_IS_REVERSED 1
#endif
#ifndef RESHADE_DEPTH_INPUT_IS_LOGARITHMIC
	#define RESHADE_DEPTH_INPUT_IS_LOGARITHMIC 0
#endif
#ifndef RESHADE_DEPTH_LINEARIZATION_FAR_PLANE
	#define RESHADE_DEPTH_LINEARIZATION_FAR_PLANE 1000.0
#endif

namespace qUINT
{
    uniform float FRAME_TIME <source = "frametime";>;

#if defined(__RESHADE_FXC__)
	float2 GetAspectRatio() { return float2(1.0, BUFFER_WIDTH * BUFFER_RCP_HEIGHT); }
	float2 GetPixelSize() { return float2(BUFFER_RCP_WIDTH, BUFFER_RCP_HEIGHT); }
	float2 GetScreenSize() { return float2(BUFFER_WIDTH, BUFFER_HEIGHT); }
	#define ASPECT_RATIO GetAspectRatio()
	#define PIXEL_SIZE GetPixelSize()
	#define SCREEN_SIZE GetScreenSize()
#else
	// Global variables
    static const float2 ASPECT_RATIO 	= float2(1.0, BUFFER_WIDTH * BUFFER_RCP_HEIGHT);
	static const float2 PIXEL_SIZE 		= float2(BUFFER_RCP_WIDTH, BUFFER_RCP_HEIGHT);
	static const float2 SCREEN_SIZE 	= float2(BUFFER_WIDTH, BUFFER_HEIGHT);
#endif

	// Global textures and samplers
	texture BackBufferTex : COLOR;
	texture DepthBufferTex : DEPTH;

	sampler sBackBufferTex 	{ Texture = BackBufferTex; 	};
	sampler sDepthBufferTex { Texture = DepthBufferTex; };

	//reusable textures for the shaders
    texture2D CommonTex0 	{ Width = BUFFER_WIDTH;   Height = BUFFER_HEIGHT;   Format = RGBA8; };
    texture2D CommonTex1 	{ Width = BUFFER_WIDTH;   Height = BUFFER_HEIGHT;   Format = RGBA8; };

    sampler2D sCommonTex0	{ Texture = CommonTex0;	};
    sampler2D sCommonTex1	{ Texture = CommonTex1;	};

    	// Helper functions
	float linear_depth(float2 uv)
	{
#if RESHADE_DEPTH_INPUT_IS_UPSIDE_DOWN
		uv.y = 1.0 - uv.y;
#endif
		float depth = tex2Dlod(sDepthBufferTex, float4(uv, 0, 0)).x;

#if RESHADE_DEPTH_INPUT_IS_LOGARITHMIC
		const float C = 0.01;
		depth = (exp(depth * log(C + 1.0)) - 1.0) / C;
#endif
#if RESHADE_DEPTH_INPUT_IS_REVERSED
		depth = 1.0 - depth;
#endif
		const float N = 1.0;
		depth /= RESHADE_DEPTH_LINEARIZATION_FAR_PLANE - depth * (RESHADE_DEPTH_LINEARIZATION_FAR_PLANE - N);

		return depth;
	}
}

// Vertex shader generating a triangle covering the entire screen
void PostProcessVS(in uint id : SV_VertexID, out float4 vpos : SV_Position, out float2 uv : TEXCOORD)
{
	uv.x = (id == 2) ? 2.0 : 0.0;
	uv.y = (id == 1) ? 2.0 : 0.0;
	vpos = float4(uv * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
}

/*=============================================================================
	Vertex Shader
=============================================================================*/

struct VSOUT
{
	float4   vpos        : SV_Position;
    float2   uv          : TEXCOORD0;
};

VSOUT VS_Paint(in uint id : SV_VertexID)
{
    VSOUT o;
    o.uv.x = (id == 2) ? 2.0 : 0.0;
    o.uv.y = (id == 1) ? 2.0 : 0.0;       
    o.vpos = float4(o.uv.xy * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
    return o;
}

/*=============================================================================
	Functions
=============================================================================*/

float3 paint_filter(in VSOUT i, in float pass_id)
{
	float3 least_divergent = 0;
	float3 total_sum = 0;
	float min_divergence = 1e10;

	[loop]
	for(int j = 0; j < NUM_DIRS; j++)
	{
		float2 dir; sincos(radians(180.0 * (j + pass_id / NUM_PASSES) / NUM_DIRS), dir.y, dir.x);

		float3 col_avg_per_dir = 0;
		float curr_divergence = 0;

		float3 col_prev = tex2Dlod(qUINT::sBackBufferTex, float4(i.uv.xy - dir * NUM_STEPS_PER_PASS * qUINT::PIXEL_SIZE, 0, 0)).rgb;

		for(int k = -NUM_STEPS_PER_PASS + 1; k <= NUM_STEPS_PER_PASS; k++)
		{
			float3 col_curr = tex2Dlod(qUINT::sBackBufferTex, float4(i.uv.xy + dir * k * qUINT::PIXEL_SIZE, 0, 0)).rgb;
			col_avg_per_dir += col_curr;

			float3 color_diff = abs(col_curr - col_prev);

			curr_divergence += max(max(color_diff.x, color_diff.y), color_diff.z);
			col_prev = col_curr;
		}

		[flatten]
		if(curr_divergence < min_divergence)
		{
			least_divergent = col_avg_per_dir;
			min_divergence = curr_divergence;
		}

		total_sum += col_avg_per_dir;
	}

	least_divergent /= 2 * NUM_STEPS_PER_PASS;
	total_sum /= 2 * NUM_STEPS_PER_PASS * NUM_DIRS;
	min_divergence /= 2 * NUM_STEPS_PER_PASS;

	float lumasharpen = dot(least_divergent - total_sum, 0.333);
	least_divergent += lumasharpen * SHARPEN_INTENSITY;

	least_divergent *= saturate(1 - min_divergence * OUTLINE_INTENSITY);
	return least_divergent;
}

/*=============================================================================
	Pixel Shaders
=============================================================================*/

void PS_Paint_1(in VSOUT i, out float4 o : SV_Target0)
{
	o.rgb = paint_filter(i, 1);
	o.w = 1;
}

void PS_Paint_2(in VSOUT i, out float4 o : SV_Target0)
{
	o.rgb = paint_filter(i, 2);
	o.w = 1;
}

void PS_Paint_3(in VSOUT i, out float4 o : SV_Target0)
{
	o.rgb = paint_filter(i, 3);
	o.w = 1;
}

void PS_Paint_4(in VSOUT i, out float4 o : SV_Target0)
{
	o.rgb = paint_filter(i, 4);
	o.w = 1;
}

void PS_Paint_5(in VSOUT i, out float4 o : SV_Target0)
{
	o.rgb = paint_filter(i, 5);
	o.w = 1;
}

void PS_Posterize(in VSOUT i, out float4 o : SV_Target0)
{	
	float3 color = tex2D(qUINT::sBackBufferTex, i.uv).rgb;

	bool zebra = frac(i.vpos.y * 0.125) > 0.5;

	float lum = dot(color, float3(0.3, 0.59, 0.11));
	int posterized = round(lum * 3 + (zebra - 0.5) * ZEBRA_INTENSITY * 0.2);
	posterized = clamp(posterized, 0, 3); 

	float3 palette[4] = 
	{
		PALETTE_COLOR_1, 
		PALETTE_COLOR_2,
		PALETTE_COLOR_3,
		PALETTE_COLOR_4
	};

	o = palette[posterized];


}

/*=============================================================================
	Techniques
=============================================================================*/

technique Posterize
{
	pass
	{
		VertexShader = VS_Paint;
		PixelShader  = PS_Paint_1;
	}
	pass
	{
		VertexShader = VS_Paint;
		PixelShader  = PS_Paint_2;
	}
	pass
	{
		VertexShader = VS_Paint;
		PixelShader  = PS_Paint_3;
	}
	pass
	{
		VertexShader = VS_Paint;
		PixelShader  = PS_Paint_4;
	}
	pass
	{
		VertexShader = VS_Paint;
		PixelShader  = PS_Posterize;
	}
}