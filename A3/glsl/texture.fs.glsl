// Create shared variable. The value is given as the interpolation between normals computed in the vertex shader
uniform sampler2D rocksTexture;
varying vec2 textureCoord;

 uniform sampler2D normalMap;
 uniform int rcState;
 varying mat3 TBN;
 varying vec2 normalUV;
uniform vec3 lightPosition;

varying vec3 lightVectorNormal;
void main() {

	// LOOK UP THE COLOR IN THE TEXTURE
    // vec4 light = vec4(normalize(lightPosition),1.0);
    //vec2 tex = vec2((atan(textureCoord.y, textureCoord.x)/3.1415926 + 1.0)*0.5, (asin(textureCoord.z)/3.1415926 + 0.5));
    gl_FragColor = texture2D(rocksTexture,textureCoord);
  
    
  if(rcState==5){
    //update the normal mapping code to include the tangent-to-world space transformation:
     vec3 normal = texture2D(normalMap, normalUV).xyz;
    normal = normal*2.0 - 1.0;
     normal = normalize(TBN * normal.rgb);

    float intensity = max(dot(normal, lightVectorNormal),0.07);
    vec4 light = vec4(intensity,intensity,intensity,1.0);
     gl_FragColor = texture2D(normalMap,normalUV) * light;
   }
  

  // Set final rendered color according to the surface normal
  
}
