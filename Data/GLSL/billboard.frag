//   Copyright 2022 Wolfire Games LLC
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
//
//-----------------------------------------------------------------------------
#version 150
#extension GL_ARB_shading_language_420pack : enable

uniform sampler2D tex;
uniform vec4 color;

#pragma bind_out_color
out vec4 out_color;

in vec2 uv;

void main() {	
	vec4 colormap = texture(tex, uv);
    colormap *= color;
#ifndef ALPHA_TO_COVERAGE
    if(colormap.a < 0.5){
        discard;
    }
#endif
	out_color = colormap;
}
