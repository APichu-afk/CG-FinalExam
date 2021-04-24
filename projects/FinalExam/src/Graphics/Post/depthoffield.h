#pragma once

#include "Graphics/Post/PostEffect.h"

class depthoffield : public PostEffect
{
public:
	//Initializes framebuffer
	//Overrides post effect Init
	void Init(unsigned width, unsigned height) override;

	//Applies the effect to this buffer
	//passes the previous framebuffer with the texture to apply as parameter
	void ApplyEffect(PostEffect* buffer) override;

private:
	float m_downscale = 2.0f;
	unsigned m_passes = 5;
	glm::vec2 direction;
};