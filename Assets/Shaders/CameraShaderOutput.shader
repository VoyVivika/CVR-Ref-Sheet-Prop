// Made with Amplify Shader Editor v1.9.6.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "RefOutput"
{
	Properties
	{
		[SingleLineTexture]_MainTex("Render Tex 0", 2D) = "white" {}
		[SingleLineTexture]_RenderTex1("Render Tex 1", 2D) = "white" {}
		[SingleLineTexture]_RenderTex2("Render Tex 2", 2D) = "white" {}
		_RenderTextureTiling("Render Texture Tiling", Vector) = (3,1,0,0)
		_BackgroundTexture("Background Texture", 2D) = "white" {}
		_BackgroundColor("Background Color", Color) = (0.376,0.6511974,1,1)
		_OffsetMultiplier("Offset Multiplier", Float) = 1
		_OffsetConstant("Offset Constant", Float) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Front
		ZTest Always
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float4 screenPos;
		};

		uniform sampler2D _MainTex;
		uniform float2 _RenderTextureTiling;
		uniform float _OffsetConstant;
		uniform sampler2D _RenderTex1;
		uniform float _OffsetMultiplier;
		uniform sampler2D _RenderTex2;
		uniform sampler2D _BackgroundTexture;
		uniform float4 _BackgroundColor;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float4 color4 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			float4 empty6 = color4;
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float2 appendResult53 = (float2(ase_screenPosNorm.x , ase_screenPosNorm.y));
			float2 ScreenUV54 = appendResult53;
			float2 break10_g4 = ScreenUV54;
			float2 tiling70 = _RenderTextureTiling;
			float2 break6_g4 = tiling70;
			float2 appendResult87 = (float2(_OffsetConstant , 0.0));
			float2 offset86 = appendResult87;
			float2 break7_g4 = ( float2( 0,0 ) + offset86 );
			float2 appendResult12_g4 = (float2((break10_g4.x*break6_g4.x + break7_g4.x) , (break10_g4.y*break6_g4.y + break7_g4.y)));
			float2 temp_output_61_0 = appendResult12_g4;
			float4 lerpResult9 = lerp( empty6 , tex2D( _MainTex, temp_output_61_0 ) , ( step( 0.0 , temp_output_61_0.x ) * step( temp_output_61_0.x , 1.0 ) ));
			float2 break10_g5 = ScreenUV54;
			float2 break6_g5 = tiling70;
			float2 appendResult78 = (float2(_OffsetMultiplier , 0.0));
			float2 offsetMultiplier80 = appendResult78;
			float2 break7_g5 = ( ( float2( -1,0 ) * offsetMultiplier80 ) + offset86 );
			float2 appendResult12_g5 = (float2((break10_g5.x*break6_g5.x + break7_g5.x) , (break10_g5.y*break6_g5.y + break7_g5.y)));
			float2 temp_output_65_0 = appendResult12_g5;
			float4 lerpResult23 = lerp( empty6 , tex2D( _RenderTex1, temp_output_65_0 ) , ( step( 0.0 , temp_output_65_0.x ) * step( temp_output_65_0.x , 1.0 ) ));
			float2 break10_g6 = ScreenUV54;
			float2 break6_g6 = tiling70;
			float2 break7_g6 = ( ( float2( -2,0 ) * offsetMultiplier80 ) + offset86 );
			float2 appendResult12_g6 = (float2((break10_g6.x*break6_g6.x + break7_g6.x) , (break10_g6.y*break6_g6.y + break7_g6.y)));
			float2 temp_output_68_0 = appendResult12_g6;
			float4 lerpResult33 = lerp( empty6 , tex2D( _RenderTex2, temp_output_68_0 ) , ( step( 0.0 , temp_output_68_0.x ) * step( temp_output_68_0.x , 1.0 ) ));
			float4 temp_output_37_0 = ( lerpResult9 + lerpResult23 + lerpResult33 );
			float layeredBlendVar38 = temp_output_37_0.a;
			float4 layeredBlend38 = ( lerp( ( tex2D( _BackgroundTexture, ScreenUV54 ) * float4( _BackgroundColor.rgb , 0.0 ) ),temp_output_37_0 , layeredBlendVar38 ) );
			o.Emission = layeredBlend38.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19603
Node;AmplifyShaderEditor.RangedFloatNode;79;-3604.233,1241.906;Inherit;False;Constant;_Float6;Float 6;7;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;76;-3680,1056;Inherit;False;Property;_OffsetMultiplier;Offset Multiplier;6;0;Create;True;0;0;0;False;0;False;1;0.55;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;78;-3424,1136;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;85;-3424,944;Inherit;False;Property;_OffsetConstant;Offset Constant;7;0;Create;True;0;0;0;False;0;False;0;0.17;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;80;-3186.233,1190.906;Inherit;False;offsetMultiplier;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;87;-3152,992;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;52;-3696,-208;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;35;-2896,1856;Inherit;False;Constant;_Vector4;Vector 2;2;0;Create;True;0;0;0;False;0;False;-2,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;82;-2944,2080;Inherit;False;80;offsetMultiplier;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;86;-2992,928;Inherit;False;offset;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;25;-2768,1120;Inherit;False;Constant;_Vector2;Vector 2;2;0;Create;True;0;0;0;False;0;False;-1,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;84;-2848,1360;Inherit;False;80;offsetMultiplier;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;53;-3488,-192;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;10;-3584,16;Inherit;False;Property;_RenderTextureTiling;Render Texture Tiling;3;0;Create;True;0;0;0;False;0;False;3,1;1.76,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;81;-2656,1968;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;83;-2592,1152;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;91;-2559.172,1357.451;Inherit;False;86;offset;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;93;-2624,2112;Inherit;False;86;offset;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;63;-2480,0;Inherit;False;Constant;_Vector5;Vector 5;5;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.GetLocalVarNode;89;-2521.963,207.668;Inherit;False;86;offset;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;54;-3312,-208;Inherit;False;ScreenUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;70;-3312,96;Inherit;False;tiling;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;64;-2374.461,-427.0454;Inherit;False;54;ScreenUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;66;-2480,480;Inherit;False;54;ScreenUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;67;-2384,1440;Inherit;False;54;ScreenUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;71;-2608,-144;Inherit;False;70;tiling;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;73;-2592,896;Inherit;False;70;tiling;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;74;-2587.044,1559.963;Inherit;False;70;tiling;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;90;-2400,1200;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;92;-2464,1792;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;88;-2320,112;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;61;-2048,-272;Inherit;True;UV Scale Offset;-1;;4;d6d3f372983e4d743bf2abcb9bfbca13;0;3;1;FLOAT2;0,0;False;2;FLOAT2;1,1;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;68;-2192,1456;Inherit;True;UV Scale Offset;-1;;6;d6d3f372983e4d743bf2abcb9bfbca13;0;3;1;FLOAT2;0,0;False;2;FLOAT2;1,1;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;65;-2208,640;Inherit;True;UV Scale Offset;-1;;5;d6d3f372983e4d743bf2abcb9bfbca13;0;3;1;FLOAT2;0,0;False;2;FLOAT2;1,1;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;4;-1648,-912;Inherit;False;Constant;_Color0;Color 0;1;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;14;-1888,288;Inherit;False;Constant;_Float1;Float 1;1;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-2096,960;Inherit;False;Constant;_Float2;Float 0;1;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-2064,1248;Inherit;False;Constant;_Float3;Float 1;1;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;32;-2048,2016;Inherit;False;Constant;_Float5;Float 1;1;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;95;-1824,96;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;7;-2000,0;Inherit;False;Constant;_Float0;Float 0;1;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;96;-1968,816;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BreakToComponentsNode;97;-1952,1616;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;31;-2080,1728;Inherit;False;Constant;_Float4;Float 0;1;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;6;-1440,-928;Inherit;False;empty;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StepOpNode;11;-1696,160;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;5;-1696,32;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;17;-1872,1120;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;28;-1856,1888;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;29;-1856,1760;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;18;-1840,992;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;36;-1840,1520;Inherit;True;Property;_RenderTex2;Render Tex 2;2;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;-1;da248b410ababae4fbb542542c78d80c;3c1e597ef30f7a54fb21a6ce6b5b9bc3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;20;-1792,736;Inherit;True;Property;_RenderTex1;Render Tex 1;1;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;-1;da248b410ababae4fbb542542c78d80c;348b97de6a6006b458ee7dc827770b69;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-1536,96;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;13;-1488,-544;Inherit;False;6;empty;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-1712,1056;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;24;-1472,720;Inherit;False;6;empty;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;30;-1696,1824;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;34;-1456,1488;Inherit;False;6;empty;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;1;-1680,-208;Inherit;True;Property;_MainTex;Render Tex 0;0;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;da248b410ababae4fbb542542c78d80c;da248b410ababae4fbb542542c78d80c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;69;-1204.855,2073.891;Inherit;False;54;ScreenUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;9;-1024,48;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;23;-1200,1008;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;33;-1184,1776;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;37;-704,1408;Inherit;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;41;-944,1968;Inherit;True;Property;_BackgroundTexture;Background Texture;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;43;-880,2176;Inherit;False;Property;_BackgroundColor;Background Color;5;0;Create;True;0;0;0;False;0;False;0.376,0.6511974,1,1;0,0.2441044,0.5660378,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.BreakToComponentsNode;45;-455.7332,1551.378;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;44;-560,1920;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LayeredBlendNode;38;-304,1728;Inherit;True;6;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;49;416,1392;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;RefOutput;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Front;0;False;;7;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;78;0;76;0
WireConnection;78;1;79;0
WireConnection;80;0;78;0
WireConnection;87;0;85;0
WireConnection;87;1;79;0
WireConnection;86;0;87;0
WireConnection;53;0;52;1
WireConnection;53;1;52;2
WireConnection;81;0;35;0
WireConnection;81;1;82;0
WireConnection;83;0;25;0
WireConnection;83;1;84;0
WireConnection;54;0;53;0
WireConnection;70;0;10;0
WireConnection;90;0;83;0
WireConnection;90;1;91;0
WireConnection;92;0;81;0
WireConnection;92;1;93;0
WireConnection;88;0;63;0
WireConnection;88;1;89;0
WireConnection;61;1;64;0
WireConnection;61;2;71;0
WireConnection;61;3;88;0
WireConnection;68;1;67;0
WireConnection;68;2;74;0
WireConnection;68;3;92;0
WireConnection;65;1;66;0
WireConnection;65;2;73;0
WireConnection;65;3;90;0
WireConnection;95;0;61;0
WireConnection;96;0;65;0
WireConnection;97;0;68;0
WireConnection;6;0;4;0
WireConnection;11;0;95;0
WireConnection;11;1;14;0
WireConnection;5;0;7;0
WireConnection;5;1;95;0
WireConnection;17;0;96;0
WireConnection;17;1;22;0
WireConnection;28;0;97;0
WireConnection;28;1;32;0
WireConnection;29;0;31;0
WireConnection;29;1;97;0
WireConnection;18;0;21;0
WireConnection;18;1;96;0
WireConnection;36;1;68;0
WireConnection;20;1;65;0
WireConnection;12;0;5;0
WireConnection;12;1;11;0
WireConnection;19;0;18;0
WireConnection;19;1;17;0
WireConnection;30;0;29;0
WireConnection;30;1;28;0
WireConnection;1;1;61;0
WireConnection;9;0;13;0
WireConnection;9;1;1;0
WireConnection;9;2;12;0
WireConnection;23;0;24;0
WireConnection;23;1;20;0
WireConnection;23;2;19;0
WireConnection;33;0;34;0
WireConnection;33;1;36;0
WireConnection;33;2;30;0
WireConnection;37;0;9;0
WireConnection;37;1;23;0
WireConnection;37;2;33;0
WireConnection;41;1;69;0
WireConnection;45;0;37;0
WireConnection;44;0;41;0
WireConnection;44;1;43;5
WireConnection;38;0;45;3
WireConnection;38;1;44;0
WireConnection;38;2;37;0
WireConnection;49;2;38;0
ASEEND*/
//CHKSM=87E541F6BF6E782E1C83C8DE31E6C07B1B689777