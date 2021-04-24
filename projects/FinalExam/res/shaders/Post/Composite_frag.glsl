#version 420

layout(binding = 0) uniform sampler2D uScene;
layout(binding = 1) uniform sampler2D uBlur;

in vec2 TexCoords;

out vec4 fragColor;

void main() 
{
	vec4 colorA = texture(uScene, TexCoords);
	vec4 colorB = texture(uBlur, TexCoords);

	fragColor = 1.0 - (1.0 - colorA) * (1.0 - colorB);
}