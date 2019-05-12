// beginGLSL

// --------------- //
// flots bizarres--//
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
//      uv *= 1.2;
    vec2 uvf = uv * 10.;
//     uv.x -= 0.75;
    uv *= 0.5;
    float d = length(uv);
    float t = time * 0.125 * 0.125;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
    p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.9, 0.2, vec3(1., 1.4, 1.0));
    col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.0001));
    col.r += abs(sin(length(uv - p) * (0.1 + sin(1. * 2.) * 0.001)) * 5.);
//     col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
vec2 newV = (uv + tan(uv.y * 3.)) - (p + sin(uv.x * 3.));
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//
//
//
//
//
//
//
//
//
    vec3 colCirc = vec3(0.0, 0.4, 1.0);
    vec3 colCirc2 = vec3(0.5, 0.7, 0.0) * 0.75;
    col += CircleRGB(uv, p2, 0.4, 0.2, colCirc);
    col += CircleRGB(uv, p2, 0.5, 0.2, colCirc2);
//     col -= InvCircleRGB(uv, p2, 0.9, 0.2, vec3(1.5, 1.7, 1.0));
    float rando = rand(uvf) * 0.1;
//
     col.g *= 0.5;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);




// --------------- //
// les ruches----- //
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
//      uv *= 1.2;
    vec2 uvf = uv * 10.;
//     uv.x += 0.25;
    uv.y += 0.4;
    uv *= 0.5;
    float d = length(uv);
    float t = time * 0.125 * 0.06125 * 0.5;
    t *= 2.;
//     t = time * 0.125;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
    p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.9, 0.2, vec3(1., 1.4, 1.0));
    col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.0001));
    col.r += abs(sin(length(uv - p) * (0.1 + sin(1. * 2.) * 0.001)) * 5.);
//     col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    vec2 newV = (uv + tan(uv.y * 3.)) - (p + sin(uv.x * 3.));
    newV += tan(sin(uv * 20.));
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    col += CircleRGB(uv, p2, 0.4, 0.2, vec3(0.0, 0.4, 1.0));
            col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.5, 0.7, 0.0) * 0.75);
//             col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.5, 0.7, 0.0));
//     col -= InvCircleRGB(uv, p2, 0.6, 0.2, vec3(1.5, 1.7, 1.0));
    float rando = rand(uvf) * 0.1;
//     col.r -= rando * 1.;
     col.g *= 0.5;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);






// --------------- //
// vagues simples- //
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
//      uv *= 1.2;
    vec2 uvf = uv * 10.;
//     uv.x += 0.25;
    uv.y += 0.4;
    uv *= 0.5;
    float d = length(uv);
    float t = time * 0.125 * 0.06125 * 0.5;
    t *= 2.;
//     t = time * 0.125;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
    p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.9, 0.2, vec3(1., 1.4, 1.0));
    col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.0001));
    col.r += abs(sin(length(uv - p) * (0.1 + sin(1. * 2.) * 0.001)) * 5.);
//     col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    vec2 newV = (uv + tan(uv.y * 3.)) - (p + sin(uv.x * 3.));
    newV += cos(sin(uv * 20.));
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    col += CircleRGB(uv, p2, 0.4, 0.2, vec3(0.0, 0.4, 1.0));
            col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.5, 0.7, 0.0) * 0.75);
//             col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.5, 0.7, 0.0));
//     col -= InvCircleRGB(uv, p2, 0.6, 0.2, vec3(1.5, 1.7, 1.0));
    float rando = rand(uvf) * 0.1;
//     col.r -= rando * 1.;
     col.g *= 0.5;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);





// --------------- //
// flots bizarres--//
// tapis ondulant- //
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
//      uv *= 1.2;
    vec2 uvf = uv * 10.;
//     uv.x += 0.25;
//     uv.y += 0.4;
    uv *= 0.5;
    float d = length(uv);
    float t = time * 0.125 * 0.06125 * 0.5;
    t *= 2.;
//     t = time * 0.125;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
    p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.9, 0.2, vec3(1., 1.4, 1.0));
    col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.0001));
    col.r += abs(sin(length(uv - p) * (0.1 + sin(1. * 2.) * 0.001)) * 5.);
//     col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    vec2 newV = (uv + tan(uv.y * 3.)) - (p + sin(uv.x * 3.));
    newV += tan(sin(uv * 100. + sin(uv.x * 100. * (sin(t * 2000.)) * uv.y)) * time * 0.00125 * 2.);
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    col += CircleRGB(uv, p2, 0.4, 0.2, vec3(0.0, 0.4, 1.0));
            col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.5, 0.7, 0.0) * 0.75);
//             col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.5, 0.7, 0.0));
//     col -= InvCircleRGB(uv, p2, 0.6, 0.2, vec3(1.5, 1.7, 1.0));
    float rando = rand(uvf) * 0.1;
//     col.r -= rando * 1.;
     col.g *= 0.5;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);




// --------------- //
// les fèves------ //
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
//      uv *= 1.2;
    vec2 uvf = uv * 10.;
//     uv.x += 0.25;
//     uv.y += 0.4;
    uv *= 0.5;
    float d = length(uv);
    float t = time * 0.125 * 0.06125 * 0.5;
    t *= 2.;
//     t = time * 0.125;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
    p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.9, 0.2, vec3(1., 1.4, 1.0));
    col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.0001));
    col.r += abs(sin(length(uv - p) * (0.1 + sin(1. * 2.) * 0.001)) * 5.);
//  col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    vec2 newV = (uv + tan(uv.x * 3.)) - (p + sin(uv.x * 30.));
    newV += tan(sin(uv * 50. + sin(uv.x * 100. * (sin(t * 2000.)) * uv.y)) * time * 0.00125 * 2.);
    newV += tan(sin(uv * 50. + sin(uv.x * 100. * (sin(t * 2000.)) * uv.y)) * time * 0.00125 * 2.);
//  col *= sin(atan(newV.x, newV.y));
    col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 1000.);
    col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
    col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//  col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//  col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    col += CircleRGB(uv, p2, 0.4, 0.2, vec3(0.0, 0.4, 1.0));
            col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.5, 0.7, 0.0) * 0.75);
//             col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.5, 0.7, 0.0));
//     col -= InvCircleRGB(uv, p2, 0.6, 0.2, vec3(1.5, 1.7, 1.0));
    float rando = rand(uvf) * 0.1;
//     col.r -= rando * 1.;
     col.g *= 0.5;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);



// --------------- //
// tapis serpent-- //
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
//  uv.y += 0.8;
    uv *= 0.5;
    float d = length(uv);
    float t = time * 0.125 * 0.06125 * 0.5;
    t *= 2.;
//  t = time * 0.125;
    float c = d;
//  if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//  c = smoothstep(r, r - 0.1, d);
//  c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
    p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.9, 0.2, vec3(1., 1.4, 1.0));
    col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.0001));
    col.r += abs(sin(length(uv - p) * (0.1 + sin(1. * 2.) * 0.001)) * 5.);
//  col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    vec2 newV = (0.001 * uv + tan(uv.x * 3.)) - (p + sin(uv.x * 5.));
    newV += sin(uv * 150. + sin(uv.y * 10. * (sin(time * 50.)) * uv.y)) * t * 0.1;
    newV += cos(uv * 150. + cos(uv.x * 10. * (cos(time * 50.)) * uv.x)) * t * 0.1;
//  col *= sin(atan(newV.x, newV.y));
    col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 0.75)) * 10. + sin(t * 10.) * 10.);
    col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 0.75)) * 10. + cos(t * 10.) * 10.);
    col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 0.75)) * 10. + cos(t * 10.) * 10.);
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
    gl_FragColor = vec4(col - rando, 1.0);
}
`);



// --------------- //
// longs remous--- //
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
//  uv.y += 0.8;
    uv *= 0.5;
    float d = length(uv);
    float t = time * 0.125 * 0.06125 * 0.5;
    t *= 2.;
    vec2 p = vec2(1.0, -1.4);
    float c = Circle(uv, p, 0.3, 0.1);
//     vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
//     vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    vec2 p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.9, 0.2, vec3(0.25, 1.4, 1.0));
//     col.r *= sin(length(uv - p));
//     col.r += abs(sin(length(uv - p) * (0.1 + sin(1. * 2.) * 0.001)) * 5.);
//  col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    
//     vec2 newV = (uv + tan(uv.x * 3.)) - (p + sin(uv));
    
    vec2 newV = (uv + tan(uv.y * 3.)) - (p + sin(uv.x * 10.));
    
    newV += sin(uv * 15. + (uv * 20.0)) * t * 0.125;
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
    gl_FragColor = vec4(col - rando, 1.0);
}
`);









// --------------- //
// grands remous-- //
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
//  uv.y += 0.8;
    uv *= 0.5;
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
    
    vec2 newV = (uv + tan(uv.y * 3.)) - (p + sin(uv.x * 10.));
    
    newV += sin(uv * 55. + (uv * 2.0)) * t * 0.125;
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
