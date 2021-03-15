
uniform bool g_sideBySideToggle <
        ui_type = "bool";
        ui_label = "Split & Compare";
    > = false;

uniform float g_splitPositionSlider <
    ui_type = "drag";
    ui_label = "Position";
	ui_min = -0.22;
    ui_max = 1.22;
> = 0.0;

uniform float g_rotationSlider <
    ui_type = "drag";
    ui_label = "Rotation";
	ui_min = -180.0;
    ui_max = 180.0;
> = 0.0;

uniform float g_widthSlider <
    ui_type = "drag";
    ui_label = "Divider Width";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.0;

uniform float g_hueSlider <
    ui_type = "drag";
    ui_label = "Divider Color";
	ui_min = 0.0;
    ui_max = 1.0;
> = 0.0;

uniform bool g_gradientToggle <
    ui_type = "bool";
    ui_label = "Gradient Fade";
    > = false;

uniform float g_imageScaleSlider <
    ui_type = "drag";
    ui_label = "Zoom";
	ui_min = 0.5;
    ui_max = 1.0;
> = 1.0;

#define RESHADE_EFFECT_REQUIRES_COLORBASE
#include "NvCommon.fxh"

uniform int captureState < source = "capture_state"; >;
uniform float4 tileUV = float4(0,0,1,1);//< source = "tile_uv"; >;

float2 ConvertToSuperResolution(float2 uv)
{
	return lerp(tileUV.xy, tileUV.zw, uv);
}

float4 sampleTexture_Border(sampler sourceSampler, float2 texCoords, float4 borderColor)
{
	if (texCoords.x < 0.0 || texCoords.x > 1.0 || texCoords.y < 0.0 || texCoords.y > 1.0)
	{
		return borderColor;
	}
	else
	{
		return tex2D(sourceSampler, texCoords);
	}
}

float2x2 GetRotationMatrix(float degreesRotation)
{
    float2 SinCos; sincos(radians(degreesRotation), SinCos.x, SinCos.y);
	return float2x2(SinCos.y, -SinCos.x, SinCos.x, SinCos.y);
}

float2 PanAndScaleUV(float2 uv, float2 pan, float scale, float2 center, float2 imageOffset)
{
	float2 uvb = uv + pan;
	uvb = uvb - center;
	uvb = uvb / scale;
	uvb = uvb + center;
	uvb = uvb + imageOffset / scale;
	return uvb;
}

float2 GetImageOffset(float2x2 imageCenterRotationMat, float splitPositionOffset)
{
	float2 imageOffset = 0.0;
	if (g_sideBySideToggle)
	{
		imageOffset.x = splitPositionOffset * 0.5;
	}
	imageOffset = mul(imageOffset, imageCenterRotationMat);
	imageOffset.y = -imageOffset.y;
	return imageOffset;
}

void PSMain(in VSOut i, out float4 color : SV_Target)
{	
    /*
    float2 uv = i.uv;

    if(captureState != CAPTURE_STATE_360 // This filter makes no sense in 360
	&& captureState != CAPTURE_STATE_360STEREO // This filter makes no sense in 360
	&& !(captureState == CAPTURE_STATE_HIGHRES && g_sideBySideToggle == true)) // Side By Side Mode makes no sense in a Super Res capture.
	{
        //cmov better
        float zoom = captureState == CAPTURE_STATE_HIGHRES ? 1.0 : g_imageScaleSlider;
        float splitPositionScalar = g_sideBySideToggle ? 0.0 : 1.0;
   
        float splitPosition = g_splitPositionSlider * splitPositionScalar + (0.5 - 0.5 * splitPositionScalar);//0.5*(1.0-splitPositionScalar);

        float2x2 tsMat = GetRotationMatrix(floor(g_rotationSlider+0.5)); //use round?

        uv = ConvertToSuperResolution(uv);

        //transform so origin is in screen center and no warping happens
        uv += 0.5;	
		uv.y = uv.y / BUFFER_ASPECT_RATIO;
        uv = mul(uv, tsMat);
		uv.y = uv.y * BUFFER_ASPECT_RATIO;
		uv += 0.5;

        //calculate transition line color
        float hue = frac(g_hueSlider + 0.3333);
		float3 hueColor = saturate(float3(abs(hue * 6.0 - 3.0) - 1.0, 
                                    2.0 - abs(hue * 6.0 - 2.0), 
                                    2.0 - abs(hue * 6.0 - 4.0)));

         //HSV hue only does not allow for black or white
        hueColor = g_hueSlider < 0.01 ? 0.0 : hueColor;
        hueColor = g_hueSlider > 0.99 ? 1.0 : hueColor;
*/

    float2 uv = i.uv;
	color = tex2D(NV::ColorInput, i.uv);
	
	if(captureState != CAPTURE_STATE_360 // This filter makes no sense in 360
		&& captureState != CAPTURE_STATE_360STEREO // This filter makes no sense in 360
		&& !(captureState == CAPTURE_STATE_HIGHRES && g_sideBySideToggle == true)) // Side By Side Mode makes no sense in a Super Res capture.
	{
		float zoom = g_imageScaleSlider;
		if (captureState == CAPTURE_STATE_HIGHRES) // Cannot zoom in a high res capture.
		{
			zoom = 1.0;
		}
		
		float splitPositionScalar = 1.0;
		if (g_sideBySideToggle) splitPositionScalar = 0.0;
		
		float splitPosition = g_splitPositionSlider * splitPositionScalar + 0.5*(1.0-splitPositionScalar);
		
        float2x2 tsMat = GetRotationMatrix(floor(g_rotationSlider+0.5));
		
		uv = ConvertToSuperResolution(uv);
		
		uv.x = uv.x - 0.5;
		uv.y = uv.y - 0.5;
		uv.y = uv.y/BUFFER_ASPECT_RATIO;
        uv = mul(uv, tsMat);
		uv.y = uv.y*BUFFER_ASPECT_RATIO;
		uv.x = uv.x + 0.5;
		uv.y = uv.y + 0.5;
		
		////////////////////////////////////////////////
		// Calculate Hue
		////////////////////////////////////////////////
		float4 hueColor;
		if (g_hueSlider < 0.01)
		{
			hueColor = float4(0.0,0.0,0.0,1.0);
		}
		else if (g_hueSlider > 0.99)
		{
			hueColor = float4(1.0,1.0,1.0,1.0);
		}
		else
		{
			float hue = frac(g_hueSlider + 0.3333);
			hueColor = saturate(float4(abs(hue * 6.0 - 3.0) - 1.0,2.0 - abs(hue * 6.0 - 2.0), 2.0 - abs(hue * 6.0 - 4.0), 1));
		}
		////////////////////////////////////////////////
		
		////////////////////////////////////////////////
		// Calculate Image UVs
		////////////////////////////////////////////////
		// Calculate image center rotation angle
		float imageCenterRotation = g_rotationSlider;
		{
			float closestMultiple = floor(imageCenterRotation/90.0+0.5) * 90.0;
			float fractionAwayFromMultiple = (imageCenterRotation-closestMultiple)/90.0;
			float scaleFactor = fractionAwayFromMultiple/0.5;
			scaleFactor = pow(scaleFactor,5);
			scaleFactor = pow(scaleFactor,5);
			imageCenterRotation = closestMultiple + (scaleFactor*0.5)*90.0;
		}
        float2x2 imageCenterRotationMat = GetRotationMatrix(floor(imageCenterRotation+0.5));
		
        float2 rawImageOffset = GetImageOffset(imageCenterRotationMat, (1.0-splitPosition));
        float2 processedImageOffset = GetImageOffset(imageCenterRotationMat, (-splitPosition));
		
		float2 panOffset = float2(0.0,0.0);
		if (g_sideBySideToggle)
		{
			panOffset = float2((0.5-g_splitPositionSlider)/2.88,0.0);
			panOffset = mul(panOffset, imageCenterRotationMat);
			panOffset.y = -panOffset.y;
		}
		
		float2 rawImageUV = PanAndScaleUV(i.uv, panOffset, zoom, float2(0.5,0.5), rawImageOffset);
		float2 processedImageUV = PanAndScaleUV(i.uv, panOffset, zoom, float2(0.5,0.5), processedImageOffset);
		
		float4 rawColor = sampleTexture_Border(NV::ColorBaseInput, rawImageUV, hueColor);
		float4 processedColor = sampleTexture_Border(NV::ColorInput, processedImageUV, hueColor);
		////////////////////////////////////////////////
		
		////////////////////////////////////////////////
		// Calculate Divider Width
		////////////////////////////////////////////////
		float dividerWidth = g_widthSlider*0.01;
		if (g_gradientToggle)
		{
			if (g_sideBySideToggle)
			{
				dividerWidth = (dividerWidth)+0.007;
			}
			else
			{
				dividerWidth = (dividerWidth*51.0)+0.007;
			}
		}
		////////////////////////////////////////////////
		
		////////////////////////////////////////////////
		// Calculate Borders
		////////////////////////////////////////////////
		float oobDividerWidth = dividerWidth/zoom;
		if (g_gradientToggle) oobDividerWidth = 0.0; 
		bool rawOutOfImage = (rawImageUV.x < -oobDividerWidth || rawImageUV.x > 1.0+oobDividerWidth || rawImageUV.y < -oobDividerWidth*BUFFER_ASPECT_RATIO || rawImageUV.y > 1.0+oobDividerWidth*BUFFER_ASPECT_RATIO);
		bool processedOutOfImage = (processedImageUV.x < -oobDividerWidth || processedImageUV.x > 1.0+oobDividerWidth || processedImageUV.y < -oobDividerWidth*BUFFER_ASPECT_RATIO || processedImageUV.y > 1.0+oobDividerWidth*BUFFER_ASPECT_RATIO);
		if (rawOutOfImage) rawColor = processedColor;
		if (processedOutOfImage) processedColor = rawColor;
		
		if (dividerWidth > 0.0 && abs(uv.x-splitPosition) < dividerWidth/2.0 && !rawOutOfImage && !processedOutOfImage)
		{
			float leftCoord = splitPosition-(dividerWidth/2.0);
			float distFromLeftCoord = uv.x - leftCoord;
			float fractionalDistFromLeft = distFromLeftCoord/dividerWidth;

			if (g_gradientToggle) // Gradient Divider
			{			
				color = lerp(rawColor, processedColor, fractionalDistFromLeft);
			}
			else // Solid Line Divider
			{
				color = hueColor;
			}
		}
		else if (uv.x < splitPosition)
		{
			color = rawColor;
		}
		else
		{
			color = processedColor;
		}
	}
	else
	{
		color = tex2D(NV::ColorInput, i.uv);
	}	
}

technique SplitScreen
{
    pass
    {
        VertexShader = VSMain;
        PixelShader  = PSMain;
    }
}
