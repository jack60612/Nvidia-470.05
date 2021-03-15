uniform float g_sldRetro <
    ui_type = "drag";
    ui_label        = "Retro";
    ui_label_en_US  = "Retro";
    ui_label_cs =  "Retro";
    ui_label_da =  "Retro";
    ui_label_de =  "Retro";
    ui_label_el =  "Ρετρό";
    ui_label_en_UK =  "Retro";
    ui_label_es_ES =  "Retro";
    ui_label_es_MX =  "Retro";
    ui_label_fi =  "Retro";
    ui_label_fr =  "Rétro";
    ui_label_hu =  "Retró";
    ui_label_it =  "Rétro";
    ui_label_ja =  "レトロ";
    ui_label_ko =  "레트로";
    ui_label_nl =  "Retro";
    ui_label_nb =  "Retro";
    ui_label_pl =  "Retro";
    ui_label_pt_PT =  "Retro";
    ui_label_pt_BR =  "Retrô";
    ui_label_ru =  "Ретро";
    ui_label_sk =  "Retro";
    ui_label_sl =  "Retro";
    ui_label_sv =  "Retro";
    ui_label_th =  "เรโทร";
    ui_label_tr =  "Nostaljik";
    ui_label_zh_CHS =  "复古";
    ui_label_zh_CHT =  "虛線邊框";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.5;

uniform float g_sldSketch <
    ui_type = "drag";
    ui_label        = "Sketch";
    ui_label_en_US  = "Sketch";
    ui_label_cs =  "Skica";
    ui_label_da =  "Skitse";
    ui_label_de =  "Skizze";
    ui_label_el =  "Σκίτσο";
    ui_label_en_UK =  "Sketch";
    ui_label_es_ES =  "Boceto";
    ui_label_es_MX =  "Boceto";
    ui_label_fi =  "Luonnos";
    ui_label_fr =  "Esquisse";
    ui_label_hu =  "Rajz";
    ui_label_it =  "Schizzo";
    ui_label_ja =  "スケッチ";
    ui_label_ko =  "스케치";
    ui_label_nl =  "Schets";
    ui_label_nb =  "Skisse";
    ui_label_pl =  "Szkic";
    ui_label_pt_PT =  "Esboço";
    ui_label_pt_BR =  "Rascunho";
    ui_label_ru =  "Зарисовка";
    ui_label_sk =  "Skica";
    ui_label_sl =  "Skica";
    ui_label_sv =  "Skiss";
    ui_label_th =  "ภาพร่าง";
    ui_label_tr =  "Çizim";
    ui_label_zh_CHS =  "素描";
    ui_label_zh_CHT =  "草圖";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.0;

uniform float g_sldHalfTone <
    ui_type = "drag";
    ui_label        = "Half-Tone";
    ui_label_en_US  = "Half-Tone";
    ui_label_cs =  "Půltón";
    ui_label_da =  "Halvtone";
    ui_label_de =  "Halbton";
    ui_label_el =  "Μισός τόνος";
    ui_label_en_UK =  "Half-Tone";
    ui_label_es_ES =  "Medios tonos";
    ui_label_es_MX =  "Tono medio";
    ui_label_fi =  "Puolisävy";
    ui_label_fr =  "Demi-ton";
    ui_label_hu =  "Féltónus";
    ui_label_it =  "Mezzitoni";
    ui_label_ja =  "ハーフトーン";
    ui_label_ko =  "하프 톤";
    ui_label_nl =  "Halftoon";
    ui_label_nb =  "Halvtone";
    ui_label_pl =  "Półtony";
    ui_label_pt_PT =  "Meio-tom";
    ui_label_pt_BR =  "Meio tom";
    ui_label_ru =  "Полутона";
    ui_label_sk =  "Poltón";
    ui_label_sl =  "Niansa barve";
    ui_label_sv =  "Halvton";
    ui_label_th =  "ครึ่งโทนสี";
    ui_label_tr =  "Noktalı Resim";
    ui_label_zh_CHS =  "半色调";
    ui_label_zh_CHT =  "半色調";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.0;

uniform float g_sldSepia <
    ui_type = "drag";
    ui_label        = "Sepia";
    ui_label_en_US  = "Sepia";
    ui_label_cs =  "Sépie";
    ui_label_da =  "Sepia";
    ui_label_de =  "Sepia";
    ui_label_el =  "Σέπια";
    ui_label_en_UK =  "Sepia";
    ui_label_es_ES =  "Sepia";
    ui_label_es_MX =  "Sepia";
    ui_label_fi =  "Seepia";
    ui_label_fr =  "Sépia";
    ui_label_hu =  "Szépia";
    ui_label_it =  "Seppia";
    ui_label_ja =  "セピア";
    ui_label_ko =  "세피아";
    ui_label_nl =  "Sepia";
    ui_label_nb =  "Sepia";
    ui_label_pl =  "Sepia";
    ui_label_pt_PT =  "Sépia";
    ui_label_pt_BR =  "Sépia";
    ui_label_ru =  "Сепия";
    ui_label_sk =  "Sépia";
    ui_label_sl =  "Sepija";
    ui_label_sv =  "Sepia";
    ui_label_th =  "ซีเปีย";
    ui_label_tr =  "Sepya";
    ui_label_zh_CHS =  "深褐色";
    ui_label_zh_CHT =  "深褐復古";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.0;

#include "NvCommon.fxh"

//wrapping global vars from YAML
#define screenSize BUFFER_SCREEN_SIZE
uniform int captureState < source = "capture_state"; >;
uniform float4 tileUV = float4(0,0,1,1);//< source = "tile_uv"; >;

//actual code starts here
//original code from 4 different filters, made into 1

//SKETCH
float3 sketch(float3 colorInput, float2 uv)
{
	const int ks = 3;
	// Sobel Horizontal //vertical is just transposed
	float filterKernelH[ks * ks] =
	{
		 -1,  0,  1,
		 -2,  0,  2,
		 -1,  0,  1
	};

	float3 clrH = 0;
	float3 clrV = 0;
	float3 clr;

	[unroll]for(int i = -1; i <=1; i++)
	[unroll]for(int j = -1; j <=1; j++)
	{
		clr = tex2Doffset(NV::ColorInput, uv, int2(i, j)).rgb;
		clrH += clr * filterKernelH[(i+1) + (j+1) * ks];
		clrV += clr * filterKernelH[(j+1) + (i+1) * ks];
	}

	float3 sobelLengths = sqrt(clrH * clrH + clrV * clrV);

#define INVERT
#ifndef INVERT
	float3 outputColor = lerp(colorInput, sobelLengths, 0.45);
#else
	float3 outputColor = lerp(colorInput, 1-sobelLengths, 0.45);
#endif	
	return lerp(colorInput, outputColor, g_sldSketch);
}


//HALFTONE
#define FREQUENCY ((float)(screenSize.x) / 6.0)
#define CONTRAST 0.7

float AntiAlias(float threshold, float value)
{
	float width = 0.75 * fwidth(value);
	return smoothstep(threshold - width, threshold + width, value);
}

float DotGrid(float2 uvSquare, float angle, float radius, float noise, float coeff)
{
	noise *= 0.1; // Noise breaks up moire etc
	float s = sin(angle);
	float c = cos(angle);
	float2 uvRot = mul(float2x2(c, -s, s, c), uvSquare);
	float2 nearest = 2.0 * frac(FREQUENCY / coeff * uvRot) - 1.0;
	return AntiAlias(1.0 - radius, length(nearest) * CONTRAST - noise) + noise;
}

float4 CmykFromRgb(float3 c)
{
	float k = 1.0 - max(max(c.r, c.g), c.b);
	float4 cmyk;
	cmyk.rgb = (1.0.xxx - c.rgb - k.xxx) / (1.0 - k);
	cmyk.a = k;
	return cmyk;
}

float3 RgbFromCmyk(float4 c)
{
	return (1.0.xxx - c.rgb) * (1.0 - c.a);
}

//https://nullprogram.com/blog/2018/07/31/
uint lowbias32(uint x)
{
    x ^= x >> 16;
    x *= 0x7feb352dU;
    x ^= x >> 15;
    x *= 0x846ca68bU;
    x ^= x >> 16;
    return x;
}

float twodnoise(float2 uv)
{
    uv *= 2.5; //match scaling of original simplex noise code
    uint2 base = floor(uv);
    float2 part = frac(uv);
    part = part * part * (3.0 - 2.0 * part);

    //user only lower 8 bits for true 8 bit random values
    float val00 = lowbias32(base.x + lowbias32(base.y)) % 255u;
    float val01 = lowbias32(base.x + 1 + lowbias32(base.y)) % 255u;
    float val10 = lowbias32(base.x + lowbias32(base.y + 1)) % 255u;
    float val11 = lowbias32(base.x + 1 + lowbias32(base.y + 1)) % 255u;

    val00 /= 255.0;
    val01 /= 255.0;
    val10 /= 255.0;
    val11 /= 255.0;

    float val0X = lerp(val00, val01, part.x);
    float val1X = lerp(val10, val11, part.x);

    return lerp(val0X, val1X, part.y);
}

float3 halftone(float3 color, float2 uv)
{
	if (captureState == CAPTURE_STATE_360 ||
		captureState == CAPTURE_STATE_360STEREO) return color;

	float aspect = screenSize.y / screenSize.x;
	float2 uvSquare = float2(uv.x, uv.y * aspect);
	// Three Octave Fractal Noise
	float3 noise = 0.1*twodnoise(uv*100.0) + 0.05 * twodnoise(uv*200.0) + 0.025*twodnoise(uv*400.0) + 0.1;
	float4 cmyk = 1.0.xxxx - CmykFromRgb(color);

	float coeff = 1.0;

	float4 cmykDot;
	cmykDot.r = DotGrid(uvSquare, 0.261799, cmyk.r, noise.x, coeff);	// C 15 degrees
	cmykDot.g = DotGrid(uvSquare, 1.309, cmyk.g, noise.y, coeff);		// M 75 degrees
	cmykDot.b = DotGrid(uvSquare, 0, cmyk.b, noise.z, coeff);			// Y  0 degrees
	cmykDot.a = DotGrid(uvSquare, 0.785398, cmyk.a, noise.x, coeff);	// K 45 degrees

	// Convert to RGB
	return lerp(color, RgbFromCmyk(1.0.xxxx - cmykDot), g_sldHalfTone);
}

// Blur
#define fBlurSpeed				0.4 // [0.0 to 0.5] Speed at which to lerp to blur texture in half uv
// Toning (for the actual curves, see the shader)
#define fToningSpeed			0.4 // [0.0 to 0.5] Speed of toning change from center, in half uv
// Distort
#define fDistortStrength		0.2
// Desat
#define fDesat					0.2
// Vignette
#define g_sldVignette			1.5 //[0.0 to 1.0] Vignette amount


// Parameters for smart fetch
#define SMART_CLAMP_CONSTR_BORDER	2.0
#define SMART_CLAMP_FETCH_BORDER	15.0

float Curve(float x, float contrast, float scale)
{
	x -= 0.5;
	x *= contrast;
	x += 0.5;
	x *= scale;
	return x;
}

// special clamping for games that have garbage on the edge of the frame
float2 smartClampUV(float2 uvTexCoord, float constrainBorderWidth, float fetchBorderWidth)
{
	const float2 oneTexel = float2(1.0/screenSize.x, 1.0/screenSize.y);
	if (uvTexCoord.x > 1.0 - constrainBorderWidth*oneTexel.x) uvTexCoord.x = 1.0 - constrainBorderWidth*oneTexel.x - fetchBorderWidth*oneTexel.x;
	if (uvTexCoord.x < 0.0 + constrainBorderWidth*oneTexel.x) uvTexCoord.x = 0.0 + constrainBorderWidth*oneTexel.x + fetchBorderWidth*oneTexel.x;
	if (uvTexCoord.y > 1.0 - constrainBorderWidth*oneTexel.y) uvTexCoord.y = 1.0 - constrainBorderWidth*oneTexel.y - fetchBorderWidth*oneTexel.y;
	if (uvTexCoord.y < 0.0 + constrainBorderWidth*oneTexel.y) uvTexCoord.y = 0.0 + constrainBorderWidth*oneTexel.y + fetchBorderWidth*oneTexel.y;
	return uvTexCoord;
}


float3 retro(float3 color, inout float2 inout_tile_uv)
{
	//porting this with no warranty ..
	float2 uv = (tileUV.zw - tileUV.xy) * inout_tile_uv.xy + tileUV.xy; //convert local tile uv to global screen uv
	float2 uvScreen = uv;

	//doing this in main pass
	//bool arePartsAllowed = (captureState != CAPTURE_STATE_360 && captureState != CAPTURE_STATE_360STEREO);

	// Barrel distortion
	float2 uvDistort = (uv - 0.5);
	float2 uvTexCoord = inout_tile_uv;
	//if (arePartsAllowed)
	//{
		float maxDistort = (1.0 - 0.5) * (fDistortStrength / (tileUV.z - tileUV.x));
		float distortNrm = 1.0;
		// For highres pictures, we need to limit distortion to avoid artifacts
		if (captureState == CAPTURE_STATE_HIGHRES)
		{
			const float maxDistortAllowed = 0.2;
			if (maxDistort > maxDistortAllowed)
				distortNrm = maxDistortAllowed / maxDistort;
		}
		float distort = saturate(dot(uvDistort, uvDistort)) * (fDistortStrength / (tileUV.z - tileUV.x)) * distortNrm;
		uvTexCoord -= normalize(uvDistort) * distort * g_sldRetro;
		
		if (captureState == CAPTURE_STATE_HIGHRES)
		{
			uvTexCoord = smartClampUV(uvTexCoord, SMART_CLAMP_CONSTR_BORDER, SMART_CLAMP_FETCH_BORDER);
		}
	//}
	
	inout_tile_uv = uvTexCoord;

	color = tex2D(NV::ColorInput, uvTexCoord).rgb;
	color = lerp(color, dot(color, 0.333), fDesat * g_sldRetro);

	// Toning
	//if (arePartsAllowed)
	//{
		float toning = saturate(smoothstep(0.0, fToningSpeed, dot(uvDistort, uvDistort)));
		float3 colorCenter = color.rgb;
		colorCenter.r = Curve(colorCenter.r, 1.3, 1.4);
		colorCenter.g = Curve(colorCenter.g, 1.3, 1.3);
		colorCenter.b = Curve(colorCenter.b, 0.7, 0.8);
		float3 colorEdge = color.rgb;
		colorEdge.r = Curve(colorEdge.r, 1.0, 0.6);
		colorEdge.g = Curve(colorEdge.g, 1.0, 0.7);
		colorEdge.b = Curve(colorEdge.b, 0.5, 1.5);

		color.xyz = lerp(color.xyz, saturate(lerp(colorCenter, colorEdge, toning)), g_sldRetro);
	//}

	// Apply vignette
	//if (arePartsAllowed)
	//{
		float2 inTex = uv - 0.5.xx; // Distance from center
		inTex.x *= 1.2; // Slight aspect ratio correction
		float vignette = saturate(1.0 - dot( inTex, inTex )); // Length
		vignette = saturate(smoothstep(0.3, 1.0, vignette)); // Smoothstep
		color.xyz = lerp(color.xyz, float3(0.0, 0.0, 0.0), (1.0 - vignette) * g_sldVignette * g_sldRetro);
	//}
	return color;
}

float3 sepia(float3 color)
{
	return lerp(color, dot(color, float3( 0.2126, 0.7152, 0.0722)) * float3(1.2, 1.0, 0.8), g_sldSepia);
}

void PSMain(in VSOut i, out float4 color : SV_Target)
{	
	color = tex2D(NV::ColorInput, i.uv);

	if(captureState != CAPTURE_STATE_360 && captureState != CAPTURE_STATE_360STEREO)
	{
		if(g_sldRetro != 0) color.rgb = retro(color, i.uv);
		if(g_sldSketch != 0) color.rgb = sketch(color.rgb, i.uv);
		if(g_sldHalfTone != 0) color.rgb = halftone(color.rgb, i.uv);	
		if(g_sldSepia != 0) color.rgb = sepia(color.rgb);	
	}
}

technique SpecialFX
{
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PSMain;
    }
}
