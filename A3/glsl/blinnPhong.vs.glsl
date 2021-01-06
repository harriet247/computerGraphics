varying vec4 V_Normal_VCS;
varying vec4 V_ViewPosition;

varying vec3 normalVector;
varying vec3 viewVector;

void main() {

	// ADJUST THESE VARIABLES TO PASS PROPER DATA TO THE FRAGMENTS
	V_Normal_VCS = vec4(normal, 1.0);
	V_ViewPosition = vec4(position, 1.0);

	normalVector = normalize(normalMatrix*vec3(V_Normal_VCS));
	viewVector = normalize(vec3(projectionMatrix * modelViewMatrix* V_ViewPosition));

	gl_Position = projectionMatrix *  modelViewMatrix * vec4(position, 1.0);
}