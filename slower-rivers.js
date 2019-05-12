
// beginGLSL

// --------------- //
// fonds-marins----//
// --------------- //
setBothShaders(`
precision mediump float;
varying vec2 vTexCoord;
uniform float time;
float plot(vec2 s, float p) {
  float largeur = abs(sin(time * 0.01)) * 0.1 + 0.1;
  return smoothstep(p - largeur, p, s.y) - smoothstep(p, p + largeur, s.y);
}
float circ(float size, float vx, float vy, vec2 center) {
//   float x = center.x * (1.0 + sin(time * 20.) * 0.5);
//   float y = center.y * (1.0 + cos(time * 20.) * 0.5);
  vec2 v = center - vec2(vx, vy);
  float d = 1.0 / length(v * size);
  return d;
}
float Circle(vec2 uv, vec2 p, float r, float blur) {
    float d = length(uv - p); 
    float c = smoothstep(r, r - blur, d); 
    return c;
}
vec3 CircleRGB(vec2 uv, vec2 p, float r, float blur, vec3 col) {
    float d = length(uv - p); 
    float c = smoothstep(r, r - blur, d); 
    return col * c;
}
vec3 InvCircleRGB(vec2 uv, vec2 p, float r, float blur, vec3 col) {
    float d = length(p - uv); 
    float c = smoothstep(r - blur, r, d); 
    return col * c;
}
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//  uv *= 1.2;
    vec2 uvf = uv * 10.;
//  uv.x += 0.25;
 uv.y += 0.58;
    uv *= 0.45;
    float d = length(uv);
    float t = time * 0.125 * 0.06125 * 0.5;
    t *= 2.;
    vec2 p = vec2(3.0, 0.0);
    vec2 p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.9, 0.2, vec3(0.25, 1.4, 1.0));
//     col.r *= sin(length(uv - p));
//     col.r += abs(sin(length(uv - p) * (0.1 + sin(1. * 2.) * 0.001)) * 5.);
//  col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    
//     vec2 newV = (uv + tan(uv.x * 3.)) - (p + sin(uv));
    
    vec2 newV = pow(uv.x, -1.5) * (uv + tan(uv.y * 3.0)) - (p + sin(uv.y * 10.));
    
    newV += sin(uv * 15. + (uv * 20.0)) * t * sin(t * 2000.);
    newV += sin(uv * 15. + (uv * 20.0)) * t * sin(t * 2000.);
    newV += sin(uv * 15. + (uv * 20.0)) * t * sin(t * 2000.);
    newV += sin(uv * 15. + (uv * 20.0)) * t * sin(t * 2000.);
//     newV = cos(uv * 150. + cos(uv.x * 10. * (cos(time * 50.)) * uv.x)) * t * 0.1;
//     newV *= sin(atan(newV.x, newV.y));
    col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 150.) * 0.75)) * 50.);
    col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 150.) * 0.75)) * 50.);
    col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 150.) * 0.75)) * 50.);
//  col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//  col = max(col, 0.);
//  col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    col += CircleRGB(uv, p2, 0.4, 0.2, vec3(0.0, 0.4, 1.0));
    col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.5, 0.7, 0.0) * 0.75);
//     col += CircleRGB(uv, p2, 0.2, 0.02, vec3(-0.4, 0.4, -0.6));
//  col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.5, 0.7, 0.0));
//  col -= InvCircleRGB(uv, p2, 0.6, 0.2, vec3(1.5, 1.7, 1.0));
    float rando = rand(uvf) * 0.1;
//  col.r -= rando * 1.;
    col.g *= 0.5;
//     col += InvCircleRGB(uv, p2, 0.6, 0.2, vec3(0.5, 0.0, 0.3));
//     col += InvCircleRGB(uv, p2, 1., 0.9, vec3(0.125, 0.8, 1.5) * 0.5);
    gl_FragColor = vec4(col - rando, 1.0);
}
`);




// --------------- //
// fonds-marins--- //
// quadrilles------//
// --------------- //
setBothShaders(`
precision mediump float;
varying vec2 vTexCoord;
uniform float time;
float plot(vec2 s, float p) {
  float largeur = abs(sin(time * 0.01)) * 0.1 + 0.1;
  return smoothstep(p - largeur, p, s.y) - smoothstep(p, p + largeur, s.y);
}
float circ(float size, float vx, float vy, vec2 center) {
//   float x = center.x * (1.0 + sin(time * 20.) * 0.5);
//   float y = center.y * (1.0 + cos(time * 20.) * 0.5);
  vec2 v = center - vec2(vx, vy);
  float d = 1.0 / length(v * size);
  return d;
}
float Circle(vec2 uv, vec2 p, float r, float blur) {
    float d = length(uv - p); 
    float c = smoothstep(r, r - blur, d); 
    return c;
}
vec3 CircleRGB(vec2 uv, vec2 p, float r, float blur, vec3 col) {
    float d = length(uv - p); 
    float c = smoothstep(r, r - blur, d); 
    return col * c;
}
vec3 InvCircleRGB(vec2 uv, vec2 p, float r, float blur, vec3 col) {
    float d = length(p - uv); 
    float c = smoothstep(r - blur, r, d); 
    return col * c;
}
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//  uv *= 1.2;
    vec2 uvf = uv * 10.;
 uv.x -= 0.5;
 uv.y -= 0.58;
//     uv *= 0.45;
    float d = length(uv);
    float t = time * 0.125 * 0.06125 * 0.5;
    t *= 2.;
    vec2 p = vec2(3.0, 4.0);
    vec2 p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.9, 0.2, vec3(0.25, 1.4, 1.0));
//     col.r *= sin(length(uv - p));
//     col.r += abs(sin(length(uv - p) * (0.1 + sin(1. * 2.) * 0.001)) * 5.) * 0.25;
//  col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    
//     vec2 newV = (uv + tan(uv.x * 3.)) - (p + sin(uv));
    
    vec2 newV = pow(uv.x, -1.5) * (uv + sin(uv.y * 3.0)) - (p + sin(uv.y * 10.));
    newV += sin(uv * 0.001 + (uv * 20.0)) * t * sin(t * 200.);
    newV += sin(uv * 0.001 + (uv * 20.0)) * t * sin(t * 200.);
    newV += sin(uv * 0.001 + (uv * 20.0)) * t * sin(t * 200.);
    newV += sin(uv * 0.001 + (uv * 20.0)) * t * sin(t * 200.);
//  newV = cos(uv * 150. + cos(uv.x * 10. * (cos(time * 50.)) * uv.x)) * t * 0.1;
//  newV *= sin(atan(newV.x, newV.y));
    col *= cos(sin(atan(newV.x, newV.y) * (sin(t * 150.) * 0.75)) * 50.);
    col *= cos(cos(atan(newV.x, newV.y) * (sin(t * 150.) * 0.75)) * 50.);
    col *= cos(cos(atan(newV.x, newV.y) * (sin(t * 150.) * 0.75)) * 50.);
    col *= cos(cos(atan(newV.x, newV.y) * (sin(t * 150.) * 0.75)) * 50.);
//     col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 150.) * 0.75)) * 50.);
//  col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//  col = max(col, 0.);
//  col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    col += CircleRGB(uv, p2, 1.14, 0.6, vec3(0.0, 0.4, 1.0));
    col += CircleRGB(uv, p2, 1.75, 0.6, vec3(0.5, 0.7, 0.0) * 0.75);
//  col += CircleRGB(uv, p2, 0.2, 0.02, vec3(-0.4, 0.4, -0.6));
//  col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.5, 0.7, 0.0));
//  col -= InvCircleRGB(uv, p2, 0.6, 0.2, vec3(1.5, 1.7, 1.0));
    float rando = rand(uvf) * 0.1;
//  col.r -= rando * 1.;
    col.g *= 0.5;
//  col += InvCircleRGB(uv, p2, 0.6, 0.2, vec3(0.5, 0.0, 0.3));
//  col += InvCircleRGB(uv, p2, 1., 0.9, vec3(0.125, 0.8, 1.5) * 0.5);
    gl_FragColor = vec4(col - rando, 1.0);
}
`);






// --------------- //
// fonds-marins----//
// --------------- //
setBothShaders(`
precision mediump float;
varying vec2 vTexCoord;
uniform float time;
float plot(vec2 s, float p) {
  float largeur = abs(sin(time * 0.01)) * 0.1 + 0.1;
  return smoothstep(p - largeur, p, s.y) - smoothstep(p, p + largeur, s.y);
}
float circ(float size, float vx, float vy, vec2 center) {
//   float x = center.x * (1.0 + sin(time * 20.) * 0.5);
//   float y = center.y * (1.0 + cos(time * 20.) * 0.5);
  vec2 v = center - vec2(vx, vy);
  float d = 1.0 / length(v * size);
  return d;
}
float Circle(vec2 uv, vec2 p, float r, float blur) {
    float d = length(uv - p); 
    float c = smoothstep(r, r - blur, d); 
    return c;
}
vec3 CircleRGB(vec2 uv, vec2 p, float r, float blur, vec3 col) {
    float d = length(uv - p); 
    float c = smoothstep(r, r - blur, d); 
    return col * c;
}
vec3 InvCircleRGB(vec2 uv, vec2 p, float r, float blur, vec3 col) {
    float d = length(p - uv); 
    float c = smoothstep(r - blur, r, d); 
    return col * c;
}
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//  uv *= 1.2;
    vec2 uvf = uv * 10.;
//  uv.x -= 0.5;
 uv.y -= 0.58;
//     uv *= 0.45;
    float d = length(uv);
    float t = time * 0.125 * 0.06125 * 0.5;
    t *= 2.;
    vec2 p = vec2(3.0, 4.0);
    vec2 p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.9, 0.2, vec3(0.25, 1.4, 1.0));
//     col.r *= sin(length(uv - p));
//     col.r += abs(sin(length(uv - p) * (0.1 + sin(1. * 2.) * 0.001)) * 5.) * 0.25;
//  col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    
//     vec2 newV = (uv + tan(uv.x * 3.)) - (p + sin(uv));
    
    vec2 newV = pow(uv.x, -1.5) * (uv + sin(uv.y * 3.0)) - (p + sin(uv.y * 10.));
    uv = vec2(sin(uv.x * 10.), cos(uv.y * 10.));
//     uv.x *= 0.25;
    newV -= sin(uv * 0.01 + (uv * 10.0)) * t * sin(t * 2000.);
//     newV -= sin(uv * 0.001 + (uv * 20.0)) * t * sin(t * 200.);
//     newV -= sin(uv * 0.001 + (uv * 20.0)) * t * sin(t * 200.);
//     newV -= sin(uv * 0.001 + (uv * 20.0)) * t * sin(t * 200.);
//  newV = cos(uv * 150. + cos(uv.x * 10. * (cos(time * 50.)) * uv.x)) * t * 0.1;
//  newV *= sin(atan(newV.x, newV.y));
    col *= cos(sin(atan(newV.x, newV.y) * (sin(t * 150.) * 0.75)) * 50.);
    col *= cos(cos(atan(newV.x, newV.y) * (sin(t * 150.) * 0.75)) * 50.);
    col *= cos(cos(atan(newV.x, newV.y) * (sin(t * 150.) * 0.75)) * 50.);
    col *= cos(cos(atan(newV.x, newV.y) * (sin(t * 150.) * 0.75)) * 50.);
//     col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 150.) * 0.75)) * 50.);
//  col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//  col = max(col, 0.);
//  col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    col += CircleRGB(uv, p2, 1.14, 0.6, vec3(0.0, 0.4, 1.0));
    col += CircleRGB(uv, p2, 1.75, 0.6, vec3(0.5, 0.7, 0.0) * 0.75);
//  col += CircleRGB(uv, p2, 0.2, 0.02, vec3(-0.4, 0.4, -0.6));
//  col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.5, 0.7, 0.0));
//  col -= InvCircleRGB(uv, p2, 0.6, 0.2, vec3(1.5, 1.7, 1.0));
    float rando = rand(uvf) * 0.1;
//  col.r -= rando * 1.;
    col.g *= 0.5;
//  col += InvCircleRGB(uv, p2, 0.6, 0.2, vec3(0.5, 0.0, 0.3));
//  col += InvCircleRGB(uv, p2, 1., 0.9, vec3(0.125, 0.8, 1.5) * 0.5);
    gl_FragColor = vec4(col - rando, 1.0);
}
`);
















// --------------- //
// fonds-marins--- //
// le ventre------ //
// --------------- //
setBothShaders(`
precision mediump float;
varying vec2 vTexCoord;
uniform float time;
float plot(vec2 s, float p) {
  float largeur = abs(sin(time * 0.01)) * 0.1 + 0.1;
  return smoothstep(p - largeur, p, s.y) - smoothstep(p, p + largeur, s.y);
}
float circ(float size, float vx, float vy, vec2 center) {
//   float x = center.x * (1.0 + sin(time * 20.) * 0.5);
//   float y = center.y * (1.0 + cos(time * 20.) * 0.5);
  vec2 v = center - vec2(vx, vy);
  float d = 1.0 / length(v * size);
  return d;
}
float Circle(vec2 uv, vec2 p, float r, float blur) {
    float d = length(uv - p); 
    float c = smoothstep(r, r - blur, d); 
    return c;
}
vec3 CircleRGB(vec2 uv, vec2 p, float r, float blur, vec3 col) {
    float d = length(uv - p); 
    float c = smoothstep(r, r - blur, d); 
    return col * c;
}
vec3 InvCircleRGB(vec2 uv, vec2 p, float r, float blur, vec3 col) {
    float d = length(p - uv); 
    float c = smoothstep(r - blur, r, d); 
    return col * c;
}
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
    vec2 uvf = uv * 10.;
//  uv.x -= 0.0005;
    uv.y -= 0.9;
    uv *= 1.45;
    float d = length(uv);
    float t = time * 0.125 * 0.06125 * 0.5;
    t *= 2.;
    vec2 p = vec2(3.0, 4.0);
    vec2 p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.9, 0.2, vec3(0.25, 1.4, 1.0));
    vec2 newV = pow(uv.x, -1.5) * (uv + sin(uv.y * 3.0)) - (p + sin(uv.y * 10.));
    uv = vec2(sin(uv.x * 10.), cos(uv.y * 10.));
    newV -= sin(uv * 0.01 + (uv * 10.0)) * t * sin(t * 2000.);
    col *= cos(sin(atan(newV.x, newV.y) * (sin(t * 150.) * 0.75)) * 50.);
    col *= cos(cos(atan(newV.x, newV.y) * (sin(t * 150.) * 0.75)) * 50.);
    col += CircleRGB(uv, p2, 1.14, 0.6, vec3(0.0, 0.4, 1.0));
    col += CircleRGB(uv, p2, 1.75, 0.6, vec3(0.5, 0.7, 0.0) * 0.75);
    float rando = rand(uvf) * 0.1;
    col.g *= 0.5;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);



// --------------- //
// fonds-marins--- //
// grand ventre--- //
// --------------- //
setBothShaders(`
precision mediump float;
varying vec2 vTexCoord;
uniform float time;
float plot(vec2 s, float p) {
  float largeur = abs(sin(time * 0.01)) * 0.1 + 0.1;
  return smoothstep(p - largeur, p, s.y) - smoothstep(p, p + largeur, s.y);
}
float circ(float size, float vx, float vy, vec2 center) {
//   float x = center.x * (1.0 + sin(time * 20.) * 0.5);
//   float y = center.y * (1.0 + cos(time * 20.) * 0.5);
  vec2 v = center - vec2(vx, vy);
  float d = 1.0 / length(v * size);
  return d;
}
float Circle(vec2 uv, vec2 p, float r, float blur) {
    float d = length(uv - p); 
    float c = smoothstep(r, r - blur, d); 
    return c;
}
vec3 CircleRGB(vec2 uv, vec2 p, float r, float blur, vec3 col) {
    float d = length(uv - p); 
    float c = smoothstep(r, r - blur, d); 
    return col * c;
}
vec3 InvCircleRGB(vec2 uv, vec2 p, float r, float blur, vec3 col) {
    float d = length(p - uv); 
    float c = smoothstep(r - blur, r, d); 
    return col * c;
}
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
    vec2 uvf = uv * 10.;
//  uv.x -= 0.0005;
    uv.y -= 1.3;
    uv *= 1.145;
//     uv * 
    float d = length(uv);
    float t = time * 0.125 * 0.06125 * 0.5;
    t *= 2.;
    vec2 p = vec2(3.0, 4.0);
    vec2 p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.9, 0.2, vec3(0.25, 1.4, 1.0));
    vec2 newV = pow(uv.x, -1.5) * (uv + sin(uv.y * 3.0)) - (p + sin(uv.y * 10.));
    uv = vec2(sin(uv.x * 2.), cos(uv.y * 2.));
    newV -= sin(uv * 0.01 + (uv * 10.0)) * t * sin(t * 2000.);
    col *= cos(sin(atan(newV.x, newV.y) * (sin(t * 150.) * 0.75)) * 50.);
    col *= cos(cos(atan(newV.x, newV.y) * (sin(t * 150.) * 0.75)) * 50.);
    col += CircleRGB(uv, p2 + vec2(0.0, -0.5), 1.14, 0.6, vec3(0.0, 0.2, 0.9));
    col += CircleRGB(uv, p2, 1.75, 0.6, vec3(0.5, 0.7, 0.0) * 0.75);
    float rando = rand(uvf) * 0.1;
    col.g *= 0.5;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);






// --------------- //
// fonds-marins--- //
// jusqu'au sable- //
// --------------- //
setBothShaders(`
precision mediump float;
varying vec2 vTexCoord;
uniform float time;
float plot(vec2 s, float p) {
  float largeur = abs(sin(time * 0.01)) * 0.1 + 0.1;
  return smoothstep(p - largeur, p, s.y) - smoothstep(p, p + largeur, s.y);
}
float circ(float size, float vx, float vy, vec2 center) {
//   float x = center.x * (1.0 + sin(time * 20.) * 0.5);
//   float y = center.y * (1.0 + cos(time * 20.) * 0.5);
  vec2 v = center - vec2(vx, vy);
  float d = 1.0 / length(v * size);
  return d;
}
float Circle(vec2 uv, vec2 p, float r, float blur) {
    float d = length(uv - p); 
    float c = smoothstep(r, r - blur, d); 
    return c;
}
vec3 CircleRGB(vec2 uv, vec2 p, float r, float blur, vec3 col) {
    float d = length(uv - p); 
    float c = smoothstep(r, r - blur, d); 
    return col * c;
}
vec3 InvCircleRGB(vec2 uv, vec2 p, float r, float blur, vec3 col) {
    float d = length(p - uv); 
    float c = smoothstep(r - blur, r, d); 
    return col * c;
}
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
    vec2 uvf = uv * 10.;
//  uv.x -= 0.5;
    uv.y -= 1.3;
    uv *= 1.145;
    float d = length(uv);
    float t = time * 0.125 * 0.5;
    vec2 p = vec2(sin(uv.x * 10.), cos(uv.y * 10.));
    vec2 p2 = vec2(0.4, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.9, 0.2, vec3(0.25, 1.4, 1.0));
    vec2 newV = pow(uv.x, -1.5) * (uv + sin(uv.y * 3.0)) - (p + sin(uv.y * 10.));
    uv = vec2(sin(uv.y * 2.), cos(uv.y * 2.));
    uv *= uv * uv * vec2(sin(uv.y * 2.), cos(uv.y * 2.));
//     newV -= sin(uv * 0.01 + (uv * 10.0)) * t * sin(t * 2000.);
    col *= cos(sin(atan(newV.x, newV.y) * (sin(t * 30.) * 0.5)) * 25.);
    col *= cos(cos(atan(newV.x, newV.y) * (sin(t * 30.) * 0.5)) * 25.);
    col += CircleRGB(uv, p2 + vec2(0.0, -0.5), 1.14, 0.6, vec3(0.0, 0.2, 0.9));
    col += CircleRGB(uv, p2, 1.75, 0.6, vec3(0.5, 0.7, 0.0) * 0.75);
    float rando = rand(uvf) * 0.1;
    col.g *= 0.5;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);







// --------------- //
// fonds-marins--- //
// le ventre------ //
// --------------- //
setBothShaders(`
precision mediump float;
varying vec2 vTexCoord;
uniform float time;
float plot(vec2 s, float p) {
  float largeur = abs(sin(time * 0.01)) * 0.1 + 0.1;
  return smoothstep(p - largeur, p, s.y) - smoothstep(p, p + largeur, s.y);
}
float circ(float size, float vx, float vy, vec2 center) {
//   float x = center.x * (1.0 + sin(time * 20.) * 0.5);
//   float y = center.y * (1.0 + cos(time * 20.) * 0.5);
  vec2 v = center - vec2(vx, vy);
  float d = 1.0 / length(v * size);
  return d;
}
float Circle(vec2 uv, vec2 p, float r, float blur) {
    float d = length(uv - p); 
    float c = smoothstep(r, r - blur, d); 
    return c;
}
vec3 CircleRGB(vec2 uv, vec2 p, float r, float blur, vec3 col) {
    float d = length(uv - p); 
    float c = smoothstep(r, r - blur, d); 
    return col * c;
}
vec3 InvCircleRGB(vec2 uv, vec2 p, float r, float blur, vec3 col) {
    float d = length(p - uv); 
    float c = smoothstep(r - blur, r, d); 
    return col * c;
}
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
    vec2 uvf = uv * 10.;
//  uv.x -= 0.5;
    uv.y -= 0.6;
    uv *= 1.145;
    float d = length(uv);
    float t = time * 0.125 * 0.5;
    vec2 p = vec2(sin(uv.x * 30. * sin(uv.x)), cos(uv.y * 30. * sin(uv.x)));
    vec2 p2 = vec2(0.4, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.9, 0.2, vec3(0.25, 1.4, 1.0));
    vec2 newV = pow(uv.x, -1.5) * (uv + sin(uv.y * 3.0)) - (p + sin(uv.y * 10.));
    uv = vec2(sin(uv.y * 2.), cos(uv.y * 2.));
    uv *= uv * uv * vec2(sin(uv.y * 2.), cos(uv.y * 2.));
    col *= cos(sin(atan(newV.x, newV.y) * (sin(t * 30.) * 0.5)) * 25.);
    col *= cos(cos(atan(newV.x, newV.y) * (sin(t * 30.) * 0.5)) * 25.);
    col += CircleRGB(uv, p2 + vec2(0.0, -0.5), 1.14, 0.6, vec3(0.0, 0.2, 0.9));
    col += CircleRGB(uv, p2, 1.75, 0.6, vec3(0.5, 0.7, 0.0) * 0.75);
    float rando = rand(uvf) * 0.1;
    col.g *= 0.5;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);