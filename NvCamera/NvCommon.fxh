/*
    Modified version of ReShade.fxh for Ansel/FreeStyle specific requirements
*/

#pragma once

#define BUFFER_PIXEL_SIZE float2(BUFFER_RCP_WIDTH, BUFFER_RCP_HEIGHT)
#define BUFFER_SCREEN_SIZE float2(BUFFER_WIDTH, BUFFER_HEIGHT)
#define BUFFER_ASPECT_RATIO (BUFFER_WIDTH * BUFFER_RCP_HEIGHT)

//NvCamera capture state enum
//use with following code in effect file
//   uniform int captureState < source = "capture_state"; >;
//not present in common file as uniforms use memory

#define CAPTURE_STATE_NOT_STARTED		0
#define CAPTURE_STATE_REGULAR			1
#define CAPTURE_STATE_REGULARSTEREO		2
#define CAPTURE_STATE_HIGHRES			3
#define CAPTURE_STATE_360			    4
#define CAPTURE_STATE_360STEREO			5

namespace NV
{
    //standard texture inputs wrapped into namespace
    texture ColorInputTex : COLOR;
	texture DepthInputTex : DEPTH;
	sampler ColorInput { Texture = ColorInputTex; };
	sampler DepthInput { Texture = DepthInputTex; };

//only create texture if filter requires it
#ifdef RESHADE_EFFECT_REQUIRES_HUDLESS
    texture HudlessInputTex : HUDLESS;
    sampler HudlessInput { Texture = HudlessInputTex; };
#endif
#ifdef RESHADE_EFFECT_REQUIRES_COLORBASE
    texture ColorBaseInputTex : COLOR_BASE;
    sampler ColorBaseInput { Texture = ColorBaseInputTex; };
#endif

#ifdef RESHADE_EFFECT_REQUIRES_DEPTH
    uniform bool g_sldInvertedDepth <
        ui_type = "bool";
        ui_label = "Depth input is reversed";
        //can maybe reuse localization? Only "Invert Depth" is translated.
    > = 1;

    float GetLinearizedDepth(float2 uv)
    {
        float depth = tex2Dlod(DepthInput, float4(uv, 0, 0)).x;    
        depth = g_sldInvertedDepth ? 1.0 - depth : depth;

        //not user adjustable in FreeStyle anyways
        const float N = 1.0;
        const float F = 1000.0;
        depth /= F - depth * (F - N);
        return depth;
    }
#endif

    //using Rec.709 at the moment, needs extension for different input formats
    float GetLuma(float3 color)
    {
        const float3 luma_weights = float3(0.299, 0.587, 0.114);
        return dot(luma_weights, color);
    }
}

struct VSOut
{
	float4 pos : SV_POSITION;
    float2 uv : TEXCOORD0;
};

VSOut VSMain(in uint vid : SV_VertexID)
{
    VSOut o;
	o.uv.x = (vid == 2) ? 2.0 : 0.0;
	o.uv.y = (vid == 1) ? 2.0 : 0.0;
	o.pos = float4(o.uv * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
    return o;
}