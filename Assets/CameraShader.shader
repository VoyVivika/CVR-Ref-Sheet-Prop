// Made with Amplify Shader Editor v1.9.6.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "RefPreview"
{
	Properties
	{
		[SingleLineTexture]_MainTex("Render Tex 0", 2D) = "white" {}
		[SingleLineTexture]_RenderTex1("Render Tex 1", 2D) = "white" {}
		[SingleLineTexture]_RenderTex2("Render Tex 2", 2D) = "white" {}
		_BackgroundTexture("Background Texture", 2D) = "white" {}
		_BackgroundColor("Background Color", Color) = (0.376,0.6511974,1,1)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _MainTex;
		uniform sampler2D _RenderTex1;
		uniform sampler2D _RenderTex2;
		uniform sampler2D _BackgroundTexture;
		uniform float4 _BackgroundTexture_ST;
		uniform float4 _BackgroundColor;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float4 color4 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
			float4 empty6 = color4;
			float2 uv_TexCoord2 = i.uv_texcoord * float2( 3,1 );
			float4 lerpResult9 = lerp( empty6 , tex2D( _MainTex, uv_TexCoord2 ) , ( step( 0.0 , uv_TexCoord2.x ) * step( uv_TexCoord2.x , 1.0 ) ));
			float2 uv_TexCoord15 = i.uv_texcoord * float2( 3,1 ) + float2( -1,0 );
			float4 lerpResult23 = lerp( empty6 , tex2D( _RenderTex1, uv_TexCoord15 ) , ( step( 0.0 , uv_TexCoord15.x ) * step( uv_TexCoord15.x , 1.0 ) ));
			float2 uv_TexCoord26 = i.uv_texcoord * float2( 3,1 ) + float2( -2,0 );
			float4 lerpResult33 = lerp( empty6 , tex2D( _RenderTex2, uv_TexCoord26 ) , ( step( 0.0 , uv_TexCoord26.x ) * step( uv_TexCoord26.x , 1.0 ) ));
			float4 temp_output_37_0 = ( lerpResult9 + lerpResult23 + lerpResult33 );
			float2 uv_BackgroundTexture = i.uv_texcoord * _BackgroundTexture_ST.xy + _BackgroundTexture_ST.zw;
			float layeredBlendVar38 = temp_output_37_0.a;
			float4 layeredBlend38 = ( lerp( ( tex2D( _BackgroundTexture, uv_BackgroundTexture ) * float4( _BackgroundColor.rgb , 0.0 ) ),temp_output_37_0 , layeredBlendVar38 ) );
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
Node;AmplifyShaderEditor.Vector2Node;10;-2192,64;Inherit;False;Constant;_Vector0;Vector 0;1;0;Create;True;0;0;0;False;0;False;3,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;16;-2368,1024;Inherit;False;Constant;_Vector1;Vector 0;1;0;Create;True;0;0;0;False;0;False;3,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;25;-2367.116,1297.571;Inherit;False;Constant;_Vector2;Vector 2;2;0;Create;True;0;0;0;False;0;False;-1,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;27;-2352,1792;Inherit;False;Constant;_Vector3;Vector 0;1;0;Create;True;0;0;0;False;0;False;3,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;35;-2352,2064;Inherit;False;Constant;_Vector4;Vector 2;2;0;Create;True;0;0;0;False;0;False;-2,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.ColorNode;4;-1648,-912;Inherit;False;Constant;_Color0;Color 0;1;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-2016,112;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;7;-1920,0;Inherit;False;Constant;_Float0;Float 0;1;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-1888,288;Inherit;False;Constant;_Float1;Float 1;1;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-2096,960;Inherit;False;Constant;_Float2;Float 0;1;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-2064,1248;Inherit;False;Constant;_Float3;Float 1;1;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;26;-2176,1840;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;31;-2080,1728;Inherit;False;Constant;_Float4;Float 0;1;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;32;-2048,2016;Inherit;False;Constant;_Float5;Float 1;1;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;15;-2192,1072;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;6;-1440,-928;Inherit;False;empty;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StepOpNode;11;-1696,160;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;5;-1696,32;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;17;-1872,1120;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;18;-1872,992;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;28;-1856,1888;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;29;-1856,1760;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-1536,96;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;13;-1488,-544;Inherit;False;6;empty;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-1712,1056;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;24;-1472,720;Inherit;False;6;empty;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;20;-1856,752;Inherit;True;Property;_RenderTex1;Render Tex 1;1;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;-1;da248b410ababae4fbb542542c78d80c;348b97de6a6006b458ee7dc827770b69;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;30;-1696,1824;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;34;-1456,1488;Inherit;False;6;empty;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;36;-1840,1520;Inherit;True;Property;_RenderTex2;Render Tex 2;2;1;[SingleLineTexture];Create;True;0;0;0;False;0;False;-1;da248b410ababae4fbb542542c78d80c;3c1e597ef30f7a54fb21a6ce6b5b9bc3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;1;-1680,-208;Inherit;True;Property;_MainTex;Render Tex 0;0;1;[SingleLineTexture];Create;False;0;0;0;False;0;False;-1;da248b410ababae4fbb542542c78d80c;da248b410ababae4fbb542542c78d80c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.LerpOp;9;-1024,48;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;23;-1200,1008;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;33;-1184,1776;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;37;-704,1408;Inherit;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;41;-896,1840;Inherit;True;Property;_BackgroundTexture;Background Texture;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;43;-832,2048;Inherit;False;Property;_BackgroundColor;Background Color;4;0;Create;True;0;0;0;False;0;False;0.376,0.6511974,1,1;0,0.2441044,0.5660378,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;44;-560,1920;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BreakToComponentsNode;45;-455.7332,1551.378;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.LayeredBlendNode;38;-304,1728;Inherit;True;6;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;50;-2512,688;Inherit;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;49;416,1392;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;RefPreview;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2;0;10;0
WireConnection;26;0;27;0
WireConnection;26;1;35;0
WireConnection;15;0;16;0
WireConnection;15;1;25;0
WireConnection;6;0;4;0
WireConnection;11;0;2;1
WireConnection;11;1;14;0
WireConnection;5;0;7;0
WireConnection;5;1;2;1
WireConnection;17;0;15;1
WireConnection;17;1;22;0
WireConnection;18;0;21;0
WireConnection;18;1;15;1
WireConnection;28;0;26;1
WireConnection;28;1;32;0
WireConnection;29;0;31;0
WireConnection;29;1;26;1
WireConnection;12;0;5;0
WireConnection;12;1;11;0
WireConnection;19;0;18;0
WireConnection;19;1;17;0
WireConnection;20;1;15;0
WireConnection;30;0;29;0
WireConnection;30;1;28;0
WireConnection;36;1;26;0
WireConnection;1;1;2;0
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
WireConnection;44;0;41;0
WireConnection;44;1;43;5
WireConnection;45;0;37;0
WireConnection;38;0;45;3
WireConnection;38;1;44;0
WireConnection;38;2;37;0
WireConnection;49;2;38;0
ASEEND*/
//CHKSM=018D3E1E66CAF649F04E6084C65599742417FECA