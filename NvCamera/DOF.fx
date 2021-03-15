/*
    changes over YAML version:

        - changed bokeh highlighting
        - merged combine pass into bokeh pass (original pre-NvCamera DoF code rendered bokeh optionally in lower resolution, hence combine pass served also as upscale)
        - adjusted the gaussian filter to adjust the sigma smoothly with increasing CoC


        Bokeh Highlighting needs to be made HDR capable (or toggled off for HDR input)!
*/

uniform float ui_fFocusDepth <
    ui_type = "drag";
    ui_label        = "Focus depth";
    ui_label_en_US  = "Focus depth";
    ui_label_cs =  "Hloubka ostrosti";
    ui_label_da =  "Fokusdybde";
    ui_label_de =  "Fokustiefe";
    ui_label_el =  "Βάθος εστίασης";
    ui_label_en_UK =  "Focus depth";
    ui_label_es_ES =  "Profundidad de enfoque";
    ui_label_es_MX =  "Profundidad de foco";
    ui_label_fi =  "Tarkennuksen syvyys";
    ui_label_fr =  "Profondeur de mise au point";
    ui_label_hu =  "Fókuszmélység";
    ui_label_it =  "Profondità focalizzazione";
    ui_label_ja =  "フォーカス深度";
    ui_label_ko =  "초점 깊이";
    ui_label_nl =  "Scherptediepte";
    ui_label_nb =  "Fokusdybde";
    ui_label_pl =  "Głębia ostrości";
    ui_label_pt_PT =  "Profundidade de focagem";
    ui_label_pt_BR =  "Profundidade de foco";
    ui_label_ru =  "Глубина фокуса";
    ui_label_sk =  "Hĺbka zaostrenia";
    ui_label_sl =  "Globina fokusa";
    ui_label_sv =  "Fokusdjup";
    ui_label_th =  "ระยะลึกของโฟกัส";
    ui_label_tr =  "Odak derinliği";
    ui_label_zh_CHS =  "焦深";
    ui_label_zh_CHT =  "焦點深度";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.5;

uniform float ui_fFarBlurCurve <
    ui_type = "drag";
    ui_label        = "Far blur curve";
    ui_label_en_US  = "Far blur curve";
    ui_label_cs =  "Křivka vzdáleného rozostření";
    ui_label_da =  "Sløringskurve langt væk";
    ui_label_de =  "Unschärfekurve entfernt";
    ui_label_el =  "Καμπύλη μακρινού θολώματος";
    ui_label_en_UK =  "Far blur curve";
    ui_label_es_ES =  "Curva de desenfoque lejana";
    ui_label_es_MX =  "Curva de desenfoque lejana";
    ui_label_fi =  "Etäsumennuskäyrä";
    ui_label_fr =  "Courbe de flou éloignée";
    ui_label_hu =  "Távoli homályossági görbe";
    ui_label_it =  "Curva sfocatura distante";
    ui_label_ja =  "遠景ぼかしカーブ";
    ui_label_ko =  "멀리 있는 블러 곡선";
    ui_label_nl =  "Vervagingsboog (veraf)";
    ui_label_nb =  "Fjern uskarphetskurve";
    ui_label_pl =  "Krzywa dalekiego rozmycia";
    ui_label_pt_PT =  "Curva de desfocagem à distância.";
    ui_label_pt_BR =  "Curva de desfoque distante";
    ui_label_ru =  "Дальняя кривая размытия";
    ui_label_sk =  "Vzdialená krivka rozostrenia";
    ui_label_sl =  "Krivulja oddaljene zameglitve";
    ui_label_sv =  "Kurva för lång oskärpa";
    ui_label_th =  "เส้นโค้งพร่ามัวระยะไกล";
    ui_label_tr =  "Uzak bulanıklaştırma eğrisi";
    ui_label_zh_CHS =  "远模糊曲线";
    ui_label_zh_CHT =  "遠端模糊曲線";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.15;

uniform float ui_fNearBlurCurve <
    ui_type = "drag";
    ui_label        = "Near blur curve";
    ui_label_en_US  = "Near blur curve";
    ui_label_cs =  "Křivka blízkého rozostření";
    ui_label_da =  "Sløringskurve tæt på";
    ui_label_de =  "Unschärfekurve nah";
    ui_label_el =  "Καμπύλη κοντινού θολώματος";
    ui_label_en_UK =  "Near blur curve";
    ui_label_es_ES =  "Curva de desenfoque cercana";
    ui_label_es_MX =  "Curva de desenfoque cercana";
    ui_label_fi =  "Lähisumennuskäyrä";
    ui_label_fr =  "Courbe de flou proche";
    ui_label_hu =  "Közeli homályossági görbe";
    ui_label_it =  "Curva sfocatura vicina";
    ui_label_ja =  "近景ぼかしカーブ";
    ui_label_ko =  "블러 곡선";
    ui_label_nl =  "Vervagingsboog (dichtbij)";
    ui_label_nb =  "Nær uskarphetskurve";
    ui_label_pl =  "Krzywa bliskiego rozmycia";
    ui_label_pt_PT =  "Curva de desfocagem próxima.";
    ui_label_pt_BR =  "Curva de desfoque próximo";
    ui_label_ru =  "Ближняя кривая размытия";
    ui_label_sk =  "Blízka krivka rozostrenia";
    ui_label_sl =  "Krivulja bližnje zameglitve";
    ui_label_sv =  "Kurva för kort oskärpa";
    ui_label_th =  "เส้นโค้งพร่ามัวระยะใกล้";
    ui_label_tr =  "Yakın bulanıklaştırma eğrisi";
    ui_label_zh_CHS =  "近模糊曲线";
    ui_label_zh_CHT =  "近端模糊曲線";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.85;

uniform float ui_fShapeRadius <
    ui_type = "drag";
    ui_label        = "Blur radius";
    ui_label_en_US  = "Blur radius";
    ui_label_cs =  "Poloměr rozostření";
    ui_label_da =  "Sløringsradius";
    ui_label_de =  "Unschärferadius";
    ui_label_el =  "Ακτίνα θολώματος";
    ui_label_en_UK =  "Blur radius";
    ui_label_es_ES =  "Radio de desenfoque";
    ui_label_es_MX =  "Radio de desenfoque";
    ui_label_fi =  "Sumennuksen säde";
    ui_label_fr =  "Rayon de flou";
    ui_label_hu =  "Homályosság sugara";
    ui_label_it =  "Raggio sfocatura";
    ui_label_ja =  "ぼかし半径";
    ui_label_ko =  "블러 크기";
    ui_label_nl =  "Vervagingsbereik";
    ui_label_nb =  "Uskarphetsradius";
    ui_label_pl =  "Promień rozmycia";
    ui_label_pt_PT =  "Raio de desfocagem";
    ui_label_pt_BR =  "Raio de desfoque";
    ui_label_ru =  "Радиус размытия";
    ui_label_sk =  "Dosah rozostrenia";
    ui_label_sl =  "Radij zameglitve";
    ui_label_sv =  "Radie för oskärpa";
    ui_label_th =  "รัศมีความพร่ามัว";
    ui_label_tr =  "Bulanıklaştırma yarıçapı";
    ui_label_zh_CHS =  "模糊半径";
    ui_label_zh_CHT =  "模糊半徑";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.5;
           
#define ui_iShapeVertices 6
#define ui_fShapeRoundness 1
#define ui_fBokehIntensity 0.7

#define RESHADE_EFFECT_REQUIRES_DEPTH
#include "NvCommon.fxh"

uniform float4 tileUV  < source = "tile_uv"; >;

float CircleOfConfusion(float2 uv, bool aggressiveLeakReduction)
{
	float2 depthdata; //x - linear scene depth, y - linear scene focus
	float scenecoc;   //blur value, signed by position relative to focus plane

    depthdata.x = NV::GetLinearizedDepth(uv);

	[branch]
	if(aggressiveLeakReduction)
	{
        float3 neighbourOffsets = float3(BUFFER_PIXEL_SIZE, 0);
        //sadly, flipped depth buffers etc don't allow for gather or linearizing in batch
        float4 neighbourDepths = float4(NV::GetLinearizedDepth(uv - neighbourOffsets.xz), //left
                                        NV::GetLinearizedDepth(uv + neighbourOffsets.xz), //right
                                        NV::GetLinearizedDepth(uv - neighbourOffsets.zy), //top
                                        NV::GetLinearizedDepth(uv + neighbourOffsets.zy));//bottom

		float neighbourMin = min(min(neighbourDepths.x,neighbourDepths.y),min(neighbourDepths.z,neighbourDepths.w));
		depthdata.x = lerp(min(neighbourMin, depthdata.x), depthdata.x, 0.001);
	}

	depthdata.y =  ui_fFocusDepth*ui_fFocusDepth*ui_fFocusDepth;

	[branch]
	if(depthdata.x < depthdata.y)
	{
		scenecoc = depthdata.x / depthdata.y - 1.0;
		scenecoc = scenecoc * exp2(-0.5*ui_fNearBlurCurve*ui_fNearBlurCurve*100.0);
	}
	else
	{
		scenecoc = (depthdata.x - depthdata.y)/(depthdata.y * exp2(pow(ui_fFarBlurCurve * 10, 1.5)) - depthdata.y);
	    scenecoc = saturate(scenecoc);
	}

	return abs(scenecoc);
}

float4 PS_CoC2Alpha(in VSOut IN) : SV_Target
{
	float4 color = tex2D(NV::ColorInput, IN.uv);

	static const float2 sampleOffsets[4] = {float2( 1.5, 0.5) * BUFFER_PIXEL_SIZE,
		                                	float2( 0.5,-1.5) * BUFFER_PIXEL_SIZE,
				                			float2(-1.5,-0.5) * BUFFER_PIXEL_SIZE,
				                			float2(-0.5, 1.5) * BUFFER_PIXEL_SIZE};

	float centerDepth = NV::GetLinearizedDepth(IN.uv);
    float2 sampleCoord = 0.0;
    float3 neighbourOffsets = float3(BUFFER_PIXEL_SIZE, 0);
    float4 coccolor = 0.0;

	[loop]
	for(int j=0; j<4; j++)
	{
		sampleCoord.xy = IN.uv + sampleOffsets[j];
		float3 sampleColor = tex2Dlod(NV::ColorInput, float4(sampleCoord, 0, 0)).rgb;

        float4 sampleDepths = float4(NV::GetLinearizedDepth(sampleCoord.xy + neighbourOffsets.xz),  //right
                                     NV::GetLinearizedDepth(sampleCoord.xy - neighbourOffsets.xz),  //left
                                     NV::GetLinearizedDepth(sampleCoord.xy + neighbourOffsets.zy),  //bottom
                                     NV::GetLinearizedDepth(sampleCoord.xy - neighbourOffsets.zy)); //top

        float sampleDepthMin = min(min(sampleDepths.x,sampleDepths.y),min(sampleDepths.z,sampleDepths.w));

		sampleColor /= 1.0 + max(max(sampleColor.r, sampleColor.g), sampleColor.b);

		float sampleWeight = saturate(sampleDepthMin * rcp(centerDepth + 1e-6) + 1e-3);
		coccolor += float4(sampleColor.rgb * sampleWeight, sampleWeight);
	}

	coccolor.rgb /= coccolor.a;
	coccolor.rgb /= 1.0 - max(coccolor.r, max(coccolor.g, coccolor.b));

	color.rgb = lerp(color.rgb, coccolor.rgb, saturate(coccolor.w * 8.0));
	color.w = CircleOfConfusion(IN.uv, 1);
    color.w = saturate(color.w * 0.5 + 0.5);
	return color;
}

void decompress_fake_hdr(inout float3 color)
{
    color.rgb /= 1.01 - color.rgb;
    color.rgb *= rcp(16.0); //prevent the sum from growing too large
}

void compress_fake_hdr(inout float3 color)
{
    color.rgb *= 16.0; //prevent the sum from growing too large
    color = color*1.01/(color + 1.0);    
}

float4 PS_Bokeh(in VSOut IN) : SV_Target
{
    float2 PixelSizeScaled = BUFFER_PIXEL_SIZE * rcp(tileUV.zw-tileUV.xy);

	float4 BokehSum;
	BokehSum		            = tex2D(NV::ColorInput, IN.uv);
    decompress_fake_hdr(BokehSum.rgb);
	float weightSum 		    = 1.0;
	float CoC 			        = abs(BokehSum.w * 2.0 - 1.0);
	float2 bokehRadiusScaled	= CoC * ui_fShapeRadius * 25;
	float nRings 			    = round(bokehRadiusScaled.x*rcp(tileUV.z-tileUV.x)*0.2) + 2 + (dot(IN.pos.xy,1) % 2) * 0.5;

	bokehRadiusScaled /= nRings;
	bokehRadiusScaled *= PixelSizeScaled;
	CoC /= nRings;

	float2 currentVertex,nextVertex,matrixVector;
	sincos(radians(10.0), currentVertex.y,currentVertex.x);
	sincos(radians(360.0 / round(ui_iShapeVertices)),matrixVector.x,matrixVector.y);

	float2x2 rotMatrix = float2x2(matrixVector.y,-matrixVector.x,matrixVector.x,matrixVector.y);

	[fastopt]
    for (int iVertices = 0; iVertices < ui_iShapeVertices; iVertices++)
    {
        nextVertex = mul(currentVertex.xy, rotMatrix);
        [fastopt]
        for(float iRings = 1; iRings <= nRings; iRings++)
        {
            [fastopt]
            for(float iSamplesPerRing = 0; iSamplesPerRing < iRings; iSamplesPerRing++)
            {
            float2 sampleOffset = lerp(currentVertex,nextVertex,iSamplesPerRing/iRings);

            //sampleOffset *= (1.0-ui_fShapeRoundness) + rsqrt(dot(sampleOffset,sampleOffset))*ui_fShapeRoundness;
            sampleOffset *= rsqrt(dot(sampleOffset,sampleOffset));

            float4 sampleBokeh 	=tex2Dlod(NV::ColorInput, float4(IN.uv + sampleOffset.xy * bokehRadiusScaled * iRings,0,0));
            float sampleWeight	= saturate(1e6 * (abs(sampleBokeh.a * 2.0 - 1.0) - CoC * (float)iRings) + 1.0);

            decompress_fake_hdr(sampleBokeh.rgb);    

            sampleBokeh.rgb *= sampleWeight;
            weightSum 		+= sampleWeight;
            BokehSum 		+= sampleBokeh;
            }
        }
        currentVertex = nextVertex;
    }

    //merge PS_Combine of YAML pendant as the original non-NvCamera DOF code was written sothat this pass runs in half resolution 
    //requiring a second pass to properly blend the outputs. As this version performs the DOF pass in full resolution, this can happen
    //in one pass
    //new - better bokeh
    BokehSum /= weightSum;

    float4 blurredColor = BokehSum;
    compress_fake_hdr(blurredColor.rgb);

	float4 originalColor  = tex2D(NV::ColorInput, IN.uv);

	CoC 		 = CircleOfConfusion(IN.uv, 0);
	bokehRadiusScaled = CoC * ui_fShapeRadius * 25;

	#define linearstep(a,b,x) saturate((x-a)/(b-a))
	float blendWeight = linearstep(0.25, 1.0, bokehRadiusScaled.x);
	blendWeight = sqrt(blendWeight);

	float4 color;
	color.rgb      = lerp(originalColor.rgb, blurredColor.rgb, blendWeight);
	color.a        = saturate(CoC * 2.0) * 0.5 + 0.5;
	return color;
}

float4 PS_Gauss1( in VSOut IN ) : SV_Target
{
	float4 centerTap = tex2D(NV::ColorInput, IN.uv);
    float CoC = abs(centerTap.a * 2.0 - 1.0);

    float nSteps 		= CoC * 2.0;
	float expCoeff 		= -2.0 * rcp(nSteps * nSteps + 1e-3); //sigma adjusted for blur width
	static const float2 blurAxisScaled 	= float2(1,0) * BUFFER_PIXEL_SIZE;

    nSteps = ceil(nSteps);

	float4 gaussianSum = 0.0;
	float  gaussianSumWeight = 1e-3;

	for(float iStep = -nSteps; iStep <= nSteps; iStep++)
	{
		float currentWeight = exp(iStep * iStep * expCoeff);
		float currentOffset = 2.0 * iStep - 0.5; //Sample between texels to double blur width at no cost

		float4 currentTap = tex2Dlod(NV::ColorInput, float4(IN.uv + blurAxisScaled.xy * currentOffset, 0, 0));
		currentWeight *= saturate(abs(currentTap.a * 2.0 - 1.0) - CoC * 0.25); //bleed fix

		gaussianSum += currentTap * currentWeight;
		gaussianSumWeight += currentWeight;
	}

	gaussianSum /= gaussianSumWeight;

	float4 color;
	color.rgb = lerp(centerTap.rgb, gaussianSum.rgb, saturate(gaussianSumWeight));
    color.a = centerTap.a;
	return color;
}

float4 PS_Gauss2( in VSOut IN ): SV_Target
{
	float4 centerTap = tex2D(NV::ColorInput, IN.uv);
    float CoC = abs(centerTap.a * 2.0 - 1.0);

    float nSteps 		= CoC * 2.0; 
	float expCoeff 		= -2.0 * rcp(nSteps * nSteps + 1e-3); //sigma adjusted for blur width, not using rounded kernel size for smooth sigma increase
	static const float2 blurAxisScaled 	= float2(0,1) * BUFFER_PIXEL_SIZE;

    nSteps = ceil(nSteps);

	float4 gaussianSum = 0.0;
	float  gaussianSumWeight = 1e-3;

	for(float iStep = -nSteps; iStep <= nSteps; iStep++)
	{
		float currentWeight = exp(iStep * iStep * expCoeff);
		float currentOffset = 2.0 * iStep - 0.5; //Sample between texels to double blur width at no cost

		float4 currentTap = tex2Dlod(NV::ColorInput, float4(IN.uv + blurAxisScaled.xy * currentOffset, 0, 0));
		currentWeight *= saturate(abs(currentTap.a * 2.0 - 1.0) - CoC * 0.25); //bleed fix

		gaussianSum += currentTap * currentWeight;
		gaussianSumWeight += currentWeight;
	}

	gaussianSum /= gaussianSumWeight;

	float4 color;
	color.rgb = lerp(centerTap.rgb, gaussianSum.rgb, saturate(gaussianSumWeight));
    color.a = centerTap.a;
	return color;
}

technique DepthOfField
{
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PS_CoC2Alpha;
    }
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PS_Bokeh;
    }
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PS_Gauss1;
    }
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PS_Gauss2;
    }
}