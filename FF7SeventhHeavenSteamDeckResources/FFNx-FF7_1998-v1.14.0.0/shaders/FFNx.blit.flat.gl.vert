VSH    o>< u_proj       7  in vec4 a_position;
in vec2 a_texcoord0;
centroid out vec2 v_texcoord0;
uniform mat4 u_proj;
void main ()
{
  vec4 pos_1;
  pos_1.xyz = a_position.xyz;
  pos_1.w = (1.0/(a_position.w));
  pos_1.xyz = (a_position.xyz * pos_1.w);
  pos_1 = (u_proj * pos_1);
  gl_Position = pos_1;
  v_texcoord0 = a_texcoord0;
}

 