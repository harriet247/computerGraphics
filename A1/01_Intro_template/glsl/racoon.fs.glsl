// Create shared variable. The value is given as the interpolation between normals computed in the vertex shader
varying vec3 interpolatedNormal;
uniform int rcState;
uniform vec3 remotePosition;
varying float dist;
uniform float time;
/* HINT: YOU WILL NEED A DIFFERENT SHARED VARIABLE TO COLOR ACCORDING TO POSITION */

vec3 rainbowGen(float t){
	float level = floor(t * 6.0);
	float r = float(level <= 2.0) + float(level > 4.0) * 0.5;
	float g = max(1.0 - abs(level - 2.0) * 0.5, 0.0);
	float b = (1.0 - (level - 4.0) * 0.5) * float(level >= 4.0);
	return vec3(r, g, b);
}

void main() {
	//vec4 color;
	if(rcState==1){		
		if(dist<4.0){
			// it will change its color for a rainbow color by time
			gl_FragColor = vec4(rainbowGen(mod(time,1.0)), 1);
		} else {
			gl_FragColor = vec4(normalize(interpolatedNormal), 1.0);
		}
	} else{
		if(dist<4.0){
			gl_FragColor = vec4(1, 1, 1, 1);
		} else{
	 		gl_FragColor = vec4(normalize(interpolatedNormal), 1.0); // REPLACE ME

		}
	}
	
}
