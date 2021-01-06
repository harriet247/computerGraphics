uniform sampler2D rocksTexture;
varying vec2 textureCoord;

uniform sampler2D normalMap;
uniform int rcState;
uniform vec3 lightPosition;
varying mat3 TBN;
varying vec2 normalUV;

varying vec3 lightVectorNormal;
void main() {
	
	//ADJUST THIS FILE TO SEND PROPER DATA TO THE FRAGMENT SHADER
    
        textureCoord = uv; 
    
    
    if (rcState==5){

         normalUV = vec2(1,1)*uv;
         vec4 tangent= vec4(1,1,1,1);
    //     // construct TBN matrix and send it to fs
         vec3 T = normalize( normalMatrix * tangent.xyz );
        vec3 N = normalize(normalMatrix * normal);
        vec3 B = normalize(cross(N,T)* tangent.w);
        TBN = mat3(T,B,N);
         // send a tangent-space light position, view position, and vertex position to the fragment shader
        vec4 lightV = viewMatrix*vec4(-lightPosition,1.0);
        lightVectorNormal=normalize(lightV.xyz - (modelViewMatrix*vec4(position,1.0)).xyz);
     gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
    }
   

    // Multiply each vertex by the model-view matrix and the projection matrix to get final vertex position
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
