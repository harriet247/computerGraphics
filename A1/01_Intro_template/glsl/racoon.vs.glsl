// Create shared variable for the vertex and fragment shaders
varying vec3 interpolatedNormal;
uniform vec3 remotePosition;
varying float dist;

/* HINT: YOU WILL NEED A DIFFERENT SHARED VARIABLE TO COLOR ACCORDING TO POSITION */

void main() {
    // Set shared variable to vertex normal
    interpolatedNormal = normal;
    mat4 temp = mat4(
        2.96,0,0,0,
        0,2.96,0,0,
        0,0,2.96,-2.34,
        0,0,0,1
    );

    vec3 newPosition = (vec4(position, 1.0)*temp).xyz;
    dist=distance(modelMatrix*vec4(newPosition,1.0),vec4(remotePosition,1.0));
    // Multiply each vertex by the model-view matrix and the projection matrix to get final vertex position    
    gl_Position = projectionMatrix * modelViewMatrix * vec4(newPosition, 1.0);

}
