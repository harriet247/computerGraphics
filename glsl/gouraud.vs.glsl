varying vec4 V_Color;
uniform vec3 lightColor;
uniform vec3 ambientColor;
uniform vec3 lightPosition;

uniform float kAmbient;
uniform float kDiffuse;
uniform float kSpecular;
uniform float shininess;

void main() {
	// COMPUTE COLOR ACCORDING TO GOURAUD HERE

	// light
	vec3 normalG = normalize(normalMatrix * normal);
	vec3 viewG = normalize(vec3(projectionMatrix*modelViewMatrix * vec4(position, 1.0)));
	vec3 lightPositionG = normalize(lightPosition);
	//reflection point
	vec3 reflectionG = normalize(reflect(-lightPositionG, normalG));
	//color
	
	float specAmount = pow(max(0.0, dot(reflectionG,viewG)),shininess);
	//float difuseAmount = max(0.0,dot(normalG,lightPositionG));
	
	V_Color = vec4((kAmbient * ambientColor+  kDiffuse * lightColor *max(0.0,dot(normalG,lightPositionG))+ kSpecular*specAmount*lightColor) , 1.0);

	// Position
	gl_Position = projectionMatrix *  modelViewMatrix * vec4(position, 1.0);
}