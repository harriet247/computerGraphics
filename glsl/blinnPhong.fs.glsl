
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

	// COMPUTE LIGHTING HERE
	vec3 lightVector = normalize(lightPosition);
	//halway vector 
	vec3 halfVector = normalize(lightVector + viewVector);
	
	float specAmount = pow(max(0.0,dot(normalVector,halfVector)),shininess);
	float diffuseAmount = max(0.0,dot(normalVector,lightVector));
	gl_FragColor = vec4(kAmbient*ambientColor + diffuseAmount*kDiffuse*lightColor + specAmount*kSpecular*lightColor, 1.0);
	//gl_FragColor = vec4(1,1,1,1);
}