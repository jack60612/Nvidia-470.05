#define RESHADE_EFFECT_REQUIRES_HUDLESS
#include "NvCommon.fxh"

void PSMain(in VSOut i, out float4 color : SV_Target)
{	
	color = tex2D(NV::HudlessInput, i.uv);
}

technique Hudless
{
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PSMain;
    }
}
