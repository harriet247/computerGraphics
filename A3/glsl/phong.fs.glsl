
varying vec4 V_ViewPosition;
varying vec4 V_Normal_VCS;

varying vec3 normalVector;
varying vec3 viewVector;

uniform vec3 lightColor;
uniform vec3 ambientColor;
uniform vec3 lightPosition;

uniform float kAmbient;
uniform float kDiffuse;
uniform float kSpecular;
uniform float shininess;



void main() {
	// light
		vec3 lightV = normalize(lightPosition);
		vec3 reflection = normalize(reflect(-lightV, normalVector));

	// ambient
		// vec3 ambient = kAmbient * ambientColor;
	// diffuse
		float difuseAmount = max(0.0,dot(normalVector,lightV));
		// vec3 diffuse = difuseAmount * lightColor * kDiffuse;
	// specular
	float specAmount = pow(max(0.0, dot(reflection,viewVector)),shininess);
	// vec3 specular = specAmount*kSpecular*lightColor;
	// COMPUTE LIGHTING HERE
	gl_FragColor = vec4(kAmbient * ambientColor+difuseAmount * lightColor * kDiffuse+specAmount*kSpecular*lightColor, 1.0);
}