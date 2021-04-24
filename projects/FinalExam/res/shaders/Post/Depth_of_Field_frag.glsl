#version 420

uniform vec4 u_lightPos;
uniform vec4 u_colour;

// Fragment Shader Inputs
in VertexData
{
    vec3 normal;
    vec3 texCoord;
    vec4 colour;
    vec3 posEye;
} vIn;

out vec4 frag_color;

vec3 calculatePixelColor()
{
    vec3 L = normalize(u_lightPos.xyz - vIn.posEye);
    vec3 N = normalize(vIn.normal);

    float diffuse = max(0.0, dot(N, L));

    if (diffuse <= 0.00) diffuse = 0.00;
    else if (diffuse <= 0.25) diffuse = 0.25;
    else if (diffuse <= 0.50) diffuse = 0.50;
    else if (diffuse <= 0.75) diffuse = 0.75;
    else diffuse = 1.00;

    return vec3(0.5, 0.5, 0.5) * (diffuse * 0.8f) + u_colour.rgb;
}

void main()
{
    frag_color.rgb = calculatePixelColor();
}