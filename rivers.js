// beginGLSL
// ---------------------------------------------------------------------------- //
// wheel5
// ---------------------------------------------------------------------------- //
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
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//      uv *= 1.2;
    float d = length(uv);
    float t = time * 0.125;
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
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(0.5, 1.4, 1.0));
    col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
vec2 newV = (uv + tan(uv.y * 3.)) - (p + sin(uv.x * 3.));
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);





// ---------------------------------------------------------------------------- //
// wheel5
// ---------------------------------------------------------------------------- //
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
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//      uv *= 1.2;
    float d = length(uv);
    float t = time * 0.125;
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
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(0.5, 1.0, 1.0));
    col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
vec2 newV = (uv + tan(uv.y * 3.)) - (p + sin(uv.x * 3.));
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);








// --------------------- //
// golden-hour-river---- //
// --------------------- //
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
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//      uv *= 1.2;
    float d = length(uv);
    float t = time * 0.125;
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
//     p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(1.5, 1.0, 1.0));
    col.r *= sin(length(uv - p2) * (6. + sin(1. * 20.) * 0.01));
    col.g *= sin(length(uv - p2) * (6. + sin(1. * 20.) * 0.01));
vec2 newV = (uv + tan(uv.y * 3.)) - (p + sin(uv.x * 3.));
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);






// --------------------- //
// golden-hour-river---- //
// --------------------- //
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
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//      uv *= 1.2;
    float d = length(uv);
    float t = time * 0.125;
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
//     p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(1.5, 1.0, 1.0));
    col.r *= sin(length(uv - p2) * (6. + sin(1. * 20.) * 0.01));
    col.g *= sin(length(uv - p2) * (6. + sin(1. * 20.) * 0.01));
    vec2 newV = (uv + cos(uv.y * 3.)) - (p + sin(uv.x * 3.));
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);







// --------------------- //
// golden-hour-river---- //
// --------------------- //
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
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//      uv *= 1.2;
    float d = length(uv);
    float t = time * 0.125;
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
//     p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(1.5, 0.7, 0.7));
    col.r *= sin(length(uv - p2) * (6. + sin(1. * 20.) * 0.01));
    col.g *= sin(length(uv - p2) * (6. + sin(1. * 20.) * 0.01));
    vec2 newV = (p * 2.5 + cos(p.y * 1.)) - (p2 + sin(uv.x * 1.));
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);








// --------------------- //
// golden-hour-river---- //
// --------------------- //
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
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//      uv *= 1.2;
    float d = length(uv);
    float t = time * 0.125;
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
//     p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(1.5, 0.7, 0.7));
    col.r *= sin(length(uv - p2) * (6. + sin(1. * 20.) * 0.01));
    col.g *= sin(length(uv - p2) * (6. + sin(1. * 20.) * 0.01));
    vec2 newV = (p * 2.5 + cos(p.y * 1.)) * (p2 + sin(uv.y * 1.));
    newV.y += 1.;
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);







// --------------------- //
// les-lignes-bleues---- //
// --------------------- //
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
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//      uv *= 1.2;
    float d = length(uv);
    float t = time * 0.125;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 10.), 0.1 * cos(t * 1.0)) * 0.5;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 1.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
//     p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(1.5, 0.7, 0.7));
    vec2 newV = (p * 10.5 * sin(t * 100.) + cos(uv.x * 10.)) * (p2 + sin(uv.y * 1.));
    newV.y += 1.;
    col.r *= sin(length(newV - p2 * sin(t)) * (6. + sin(1. * 20.) * 0.01));
    col.g *= sin(length(newV - p2 * cos(t)) * (6. + sin(1. * 20.) * 0.01));
//     col *= sin(atan(newV.x, newV.y));
//        col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
//       col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//       col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.2));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);






// --------------------- //
// les-lignes-bleues---- //
// --------------------- //
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
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//      uv *= 1.2;
    float d = length(uv);
    float t = time * 0.125;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 10.), 0.1 * cos(t * 1.0)) * 0.5;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 1.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
//     p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(1.5, 0.7, 0.4));
    vec2 newV = (p * 10.5 * sin(t * 100.) + cos(uv.y * 100.)) * (p2 + sin(uv.y * 1.));
    newV.y += 1.;
    col.r *= sin(length(newV - p2 * sin(t)) * (6. + sin(1. * 20.) * 0.01));
    col.g *= sin(length(newV - p2 * cos(t)) * (6. + sin(1. * 20.) * 0.01));
//     col *= sin(atan(newV.x, newV.y));
//        col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
//       col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//       col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.2));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);





// --------------------- //
// les-lignes-bleues---- //
// --------------------- //
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
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//      uv *= 1.2;
    float d = length(uv);
    float t = time * 0.125;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * cos(t * 50.), 0.1 * cos(t * 1.0)) * 0.5;
    vec2 p3 = vec2(0.1 * sin(t * 5.), 0.1 * cos(t * 1.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
//     p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.2, 0.1, vec3(1., 0.7, 0.4));
    vec2 newV = (p * 5.0 * sin(t * 10.) + cos(uv.y * 100.)) * (p2 + sin(uv.y * 1.));
    newV.y += 20.;
    newV *= 0.4 * sin(t * 1.);
    newV.y += sin(sin(atan(uv.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
    newV.x += cos(sin(atan(uv.y, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
    col.r *= sin(length(newV - p * sin(t)) * (2. + sin(t * 0.1) * 0.01));
    col.g *= sin(length(newV - p * cos(t)) * (2. + sin(t * 0.1) * 0.01));
//     col *= sin(atan(newV.x, newV.y));
//        col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
//       col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//       col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.2));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);







// --------------------- //
// les-lignes-bleues---- //
// --------------------- //
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
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//      uv *= 1.2;
    float d = length(uv);
    float t = time * 0.0125;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(1. * cos(t * 50.), 0.1 * cos(t * 1.0)) * 0.5;
    vec2 p3 = vec2(2. * sin(t * 5.), 0.1 * cos(t * 0.1)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
//     p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.4, 0.1, vec3(1., 0.7, 0.4));
    vec2 newV = (p * 5.0 * sin(t * 1.) + cos(uv.y * 100.)) * (p2 + sin(uv.y * 1.));
     newV.y += 50.;
     uv.y += 0.1;
    newV *= 0.04;
    newV.y += sin(sin(atan(uv.x, newV.y) * (sin(t * 0.1) * 10.)) * 4.);
    newV.x += cos(sin(atan(uv.y, newV.y) * (sin(t * 0.1) * 10.)) * sin(uv.x * 10. + sin(t * 100.) * 100.));
    newV.x *= 10.;
    newV.y *= sin(uv.y * uv.x * 100.);
    col.r *= sin(length(newV - p * sin(t)) * (2. + sin(t * 0.1) * 0.01));
     col.g *= sin(length(newV - p * cos(t)) * (2. + sin(t * 0.1) * 0.01));
//     col *= sin(atan(newV.x, newV.y));
//        col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
//       col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//       col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.2));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);







// --------------------- //
// les-lignes-bleues---- //
// --------------------- //
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
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//      uv *= 1.2;
    float d = length(uv);
    float t = time * 0.0125;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(1. * cos(t * 50.), 0.1 * cos(t * 1.0)) * 0.5;
    vec2 p3 = vec2(2. * sin(t * 5.), 0.1 * cos(t * 0.1)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
//     p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.4, 0.01, vec3(1.0, 0.7, 0.4));
    vec2 newV = (p * 5.0 * sin(t * 1.) + cos(uv.y * 100.)) * (p2 + sin(uv.y * 1.));
     newV.y += 50.;
     uv.y += 0.1;
    newV *= 0.04;
    newV.y += sin(sin(atan(uv.x, newV.y) * (sin(t * 1.5) * 10.)) * 4.);
    newV.x += cos(sin(atan(uv.y, newV.y) * (sin(t * 1.5) * 10.)) * sin(uv.x * 10. + sin(t * 100.) * 100.));
    newV.x *= 10.;
    newV.y *= sin(uv.y * uv.x * 1.);
    col.b *= sin(length(newV * sin(t)) * (10. * 0.1));
//     col.r -= col.g * 0.75;
     col.g *= sin(length(newV - p * cos(t)) * (2. + sin(t * 0.1) * 0.01));
//     col *= sin(atan(newV.x, newV.y));
//        col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
//       col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//       col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.2));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);







// --------------------- //
// les-flots-étincelants //
// --------------------- //
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
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//      uv *= 1.2;
    float d = length(uv);
    float t = time * 0.0125;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(1. * cos(t * 50.), 0.1 * cos(t * 1.0)) * 0.5;
    vec2 p3 = vec2(2. * sin(t * 5.), 0.1 * cos(t * 0.1)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
//     p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.4, 0.01, vec3(1.0, 0.7, 0.4));
    vec2 newV = (p * 5.0 * sin(t * 1.) + cos(uv.y * 100.)) * (p2 + sin(uv.y * 1.));
     newV.y += 50.;
     uv.y += 0.1;
    newV *= 0.04;
    newV.y += sin(sin(atan(uv.x, newV.y) * (sin(t * 1.5) * 10.)) * 4.);
    newV.x += cos(sin(atan(uv.y, newV.y) * (sin(t * 1.5) * 10.)) * sin(uv.x * 10. + sin(t * 100.) * 100.)) * 0.2;
    newV.x *= 10.;
    newV.y *= sin(uv.y * uv.x * 1.);
    col.b *= sin(length(newV * sin(t)) * (10. * 0.1));
//     col.r -= col.g * 0.75;
     col.g *= sin(length(newV - p * cos(t)) * (2. + sin(t * 0.1) * 0.01));
//     col *= sin(atan(newV.x, newV.y));
//        col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
//       col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//       col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.2));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);





// --------------------- //
// les-flots-étincelants //
// --------------------- //
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
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//      uv *= 1.2;
    float d = length(uv);
    float t = time * 0.0125;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(1. * cos(t * 50.), 0.1 * cos(t * 1.0)) * 0.5;
    vec2 p3 = vec2(2. * sin(t * 5.), 0.1 * cos(t * 0.1)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
//     p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.4, 0.01, vec3(1.0, 0.7, 0.4));
    vec2 newV = (p * 5.0 * sin(t * 1.) + cos(uv.y * 100.)) * (p2 + sin(uv.y * 1.));
     newV.y += 50.;
     uv.y += 1.;
    newV *= 0.04;
    newV.y += sin(sin(atan(uv.x, newV.y) * (sin(t * 1.5) * 10.)) * 4.);
    newV.x += cos(sin(atan(uv.y, newV.y) * (sin(t * 1.5) * 10.)) * sin(uv.x * 10. + sin(t * 100.) * 100.)) * 0.2;
    newV.x *= 10.;
    newV.y *= sin(uv.y * uv.x * 2.) * 2.;
    col.b *= sin(length(newV * sin(t)) * (10. * 0.1));
//     col.r -= col.g * 0.75;
     col.g *= sin(length(newV - p * cos(t)) * (2. + sin(t * 0.1) * 0.01));
//     col *= sin(atan(newV.x, newV.y));
//        col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
//       col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//       col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.2));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);






// --------------------- //
// les-flots-bleutés---- //
// --------------------- //
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
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//      uv *= 1.2;
    float d = length(uv);
    float t = time * 0.0125;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(1. * cos(t * 50.), 0.1 * cos(t * 1.0)) * 0.5;
    vec2 p3 = vec2(2. * sin(t * 5.), 0.1 * cos(t * 0.1)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
//     p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.4, 0.01, vec3(0.4, 0.2, 1.0));
    vec2 newV = (p * 5.0 * sin(t * 1.) + cos(uv.y * 100.)) * (p2 + sin(uv.y * 1.));
     newV.y += 50.;
     uv.y += 1.;
    newV *= 0.04;
    newV.y += sin(sin(atan(uv.x, newV.y) * (sin(t * 1.5) * 10.)) * 4.);
    newV.x += cos(sin(atan(uv.y, newV.y) * (sin(t * 1.5) * 10.)) * sin(uv.x * 10. + sin(t * 100.) * 100.)) * 0.2;
    newV.x *= 10.;
    newV.y *= sin(uv.y * uv.x * 2.) * 2.;
    col.r *= sin(length(newV * sin(t)) * (10. * 0.1));
//     col.r -= col.g * 0.75;
     col.b *= sin(length(newV - p * cos(t)) * (2. + sin(t * 0.1) * 0.01));
//     col *= sin(atan(newV.x, newV.y));
//        col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
//       col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//       col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.2));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);







// --------------------- //
// les-flots-bleutés---- //
// --------------------- //
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
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//      uv *= 1.2;
    float d = length(uv);
    float t = time * 0.0125;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(1. * cos(t * 50.), 0.1 * cos(t * 1.0)) * 0.5;
    vec2 p3 = vec2(2. * sin(t * 5.), 0.1 * cos(t * 0.1)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
//     p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.4, 0.01, vec3(0.4, 0.2, 1.0));
    vec2 newV = (p * 50.0 * sin(t * 10.) + cos(uv.y * 10.)) * (p2 + sin(uv.y * 1.));
     newV.y += 50.;
     uv.y += 1.;
    newV *= 0.4;
    newV.y += sin(sin(atan(uv.x, newV.y) * (sin(t * 1.5) * 10.)) * 4.);
    newV.x += cos(sin(atan(uv.y, newV.y) * (sin(t * 1.5) * 10.)) * sin(uv.x * 10. + sin(t * 100.) * 100.)) * 0.2;
    newV.x *= 10.;
    newV.y *= sin(uv.y * uv.x * 2.) * 2.;
    col.r *= sin(length(newV * sin(t)) * (10. * 0.1));
//     col.r -= col.g * 0.75;
     col.b *= sin(length(newV - p * cos(t)) * (2. + sin(t * 0.1) * 0.01));
//     col *= sin(atan(newV.x, newV.y));
//        col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
//       col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//       col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.2));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);







// --------------------- //
// montagnes-bleutées--- //
// --------------------- //
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
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//      uv *= 1.2;
    float d = length(uv);
    float t = time * 0.0125;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(1. * cos(t * 50.), 0.1 * cos(t * 1.0)) * 0.5;
    vec2 p3 = vec2(2. * sin(t * 5.), 0.1 * cos(t * 0.1)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
//     p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.4, 0.01, vec3(0.4, 0.2, 1.0));
    vec2 newV = (p * 50.0 * sin(t * 10.) + cos(uv.y * 10.)) * (p2 + sin(uv.y * 1.));
     newV.y += 100.;
     uv.x += 2.;
    newV *= 0.05;
    newV.y += sin(sin(atan(uv.x, newV.y) * (sin(t * 1.5) * 10.)) * 4.);
    newV.x += cos(sin(atan(uv.y, newV.y) * (sin(t * 1.5) * 10.)) * sin(uv.x * 10. + sin(t * 100.) * 100.)) * 0.2;
    newV.x *= 10.;
    newV.y *= sin(uv.y * uv.x * 2.) * 2.;
    col.r *= sin(length(newV * sin(t)) * (10. * 0.1));
//     col.r -= col.g * 0.75;
     col.b *= sin(length(newV - p * cos(t)) * (2. + sin(t * 0.1) * 0.01));
//     col *= sin(atan(newV.x, newV.y));
//        col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
//       col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//       col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.2));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);





// --------------------- //
// montagnes-bleutées--- //
// --------------------- //
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
float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453 * (2.0 + sin(time)));
}
void main() {
    vec2 uv = gl_FragCoord.xy / vec2(1280, 800);
    uv -= vec2(0.5, 0.5);
    uv.x *= 1280.0/800.0;
//      uv *= 1.2;
    float d = length(uv);
    float t = time * 0.0125;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(1. * cos(t * 1000.), 0.1 * cos(t * 1.0)) * 0.5;
    vec2 p3 = vec2(2. * sin(t * 50.), 0.1 * cos(t * 0.1)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
//     p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.4, 0.01, vec3(0.4, 0.2, 1.0));
    vec2 newV = (p * 50.0 * sin(t * 10.) + cos(uv.y * 10.)) * (p2 + sin(uv.y * 1.));
     newV.y += 100.;
     uv.x += 1.;
    newV *= 0.05;
    newV.y += sin(sin(atan(uv.x, newV.y) * (sin(t * 1.5) * 10.)) * 4.);
    newV.x += cos(sin(atan(uv.y, newV.y) * (sin(t * 1.5) * 10.)) * sin(uv.x * 10. + sin(t * 100.) * 100.)) * 0.2;
    newV.x *= 10.;
    newV.y *= sin(uv.y * uv.x * 2.) * 2.;
    col.r *= sin(length(newV * sin(t)) * (10. * 0.1));
//     col.r -= col.g * 0.75;
     col.b *= sin(length(newV - p * cos(t)) * (2. + sin(t * 0.1) * 0.01));
//     col *= sin(atan(newV.x, newV.y));
//        col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
//       col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//       col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.2));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);