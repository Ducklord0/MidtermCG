Shader "Custom/BlinnShader"
{
    Properties
    {
        _Colour ("Colour", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "Queue"="Geometry"}

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf BsicBlinn

        half4 LightingBsicBlinn(SurfaceOutput s, half3 lightDir, half3 viewDir, half atten) {
            half3 h = normalize(lightDir + viewDir);
            half diff = max(0, dot(s.Normal, lightDir));

            float nh = max(0, dot(s.Normal, h));
            float spec = pow(nh, 48);
            half4 c;

            c.rgb = (s.Albedo * _LightColor0.rgb * diff + _LightColor0.rgb * spec) * atten;
            c.a = s.Alpha;
            return c;
}

    float4 _Colour;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Colour.rgb;

        }
        ENDCG
    }
    FallBack "Diffuse"
}
