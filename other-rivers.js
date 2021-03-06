// beginGLSL
// ------------------ //
// rivière            //
// et taches colorées //
// ------------------ //
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
    float t = time * 0.125 * 0.5;
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
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(1., 1.4, 1.0));
    col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
//     col.r += abs(sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01)) * 1.);
//     col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
vec2 newV = (uv + sin(uv.y * 3.)) - (p + sin(uv.x * 3.)) * 0.01 - 1.75;
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
     col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.0, 0.4, 1.0));
     col += CircleRGB(uv, p2 + vec2(0.5, -0.3) * vec2(sin(t*500.), cos(t*500.)), 0.2, 0.2, vec3(1.0, 0.4, 1.0));
     col += CircleRGB(uv, p2 + vec2(0.5, -0.3) * vec2(sin(10.+t*500.), cos(10.+t*500.)), 0.2, 0.2, vec3(-1.0, -0.0, 1.0));
    float rando = rand(uv) * 0.1;
//     col.r -= rando * 1.;
     col.g *= 0.2;
    col = vec3(1.) - col;
    col -= CircleRGB(uv, p2, 1.4, 0.2, vec3(1.0, 0.4, 0.0));
    col.r = 0.5 - col.r;
     col += CircleRGB(uv, p2 + vec2(0.5, -0.3) * vec2(sin(20.+t*500.) * 0.5, cos(20.+t*500.) * 0.5), 0.2, 0.4, vec3(-1.0, -1.0, 1.0));
     col += CircleRGB(uv, p2 + vec2(0.5, -0.3) * vec2(sin(20.+t*500.) * 1.5, cos(20.+t*500.) * 1.5), 0.2, 0.4, vec3(-1.0, -1.0, 1.0));
    gl_FragColor = vec4(col - rando, 1.0);
}
`);





// ---------------------------------------------------------------------------- //
// rivière chaude, jaune, diurne
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
    float t = time * 0.125 * 0.5;
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
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(1., 1.4, 1.0));
    col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
//     col.r += abs(sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01)) * 1.);
//     col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
vec2 newV = (uv + sin(uv.y * 3.)) - (p + sin(uv.x * 3.)) * 0.01 - 1.75;
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
     col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.0, 0.4, 1.0));
     col += CircleRGB(uv, p2 + vec2(0.5, -0.3) * vec2(sin(t*500.), cos(t*500.)), 0.2, 0.2, vec3(1.0, 0.4, 1.0));
     col += CircleRGB(uv, p2 + vec2(0.5, -0.3) * vec2(sin(10.+t*500.), cos(10.+t*500.)), 0.2, 0.2, vec3(-1.0, -0.0, 1.0));
    float rando = rand(uv) * 0.1;
//     col.r -= rando * 1.;
     col.g *= 0.2;
    col = vec3(1.) - col;
    col -= CircleRGB(uv, p2, 1.4, 0.2, vec3(1.0, 0.6, 0.0));
    col.r = 0.5 - col.r;
     col += CircleRGB(uv, p2 + vec2(0.5, -0.3) * vec2(sin(20.+t*500.) * 0.5, cos(20.+t*500.) * 0.5), 0.2, 0.4, vec3(-1.0, -1.0, 1.0));
     col += CircleRGB(uv, p2 + vec2(0.5, -0.3) * vec2(sin(20.+t*500.) * 1.5, cos(20.+t*500.) * 1.5), 0.2, 0.4, vec3(-1.0, -1.0, 1.0));
    col = vec3(1.0) - col;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);









// ---------------------------------------------------------------------------- //
// rivière chaude, jaune, diurne
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
    float t = time * 0.125 * 0.5;
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
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(1., 1.4, 1.0));
//     col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
//     col.r += abs(sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01)) * 1.);
//     col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
vec2 newV = (uv + sin(uv.y * 3.)) - (p + sin(uv.x * 3.)) * 0.01 - 1.75;
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
     col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.0, 0.4, 1.0));
     col += CircleRGB(uv, p2 + vec2(0.5, -0.3) * vec2(sin(t*500.), cos(t*500.)), 0.2, 0.2, vec3(1.0, 0.4, 1.0));
     col += CircleRGB(uv, p2 + vec2(0.5, -0.3) * vec2(sin(10.+t*500.), cos(10.+t*500.)), 0.2, 0.2, vec3(-1.0, -0.0, 1.0));
    float rando = rand(uv) * 0.1;
//     col.r -= rando * 1.;
     col.g *= 0.2;
    col = vec3(1.) - col;
    col -= CircleRGB(uv, p2, 1.4, 0.2, vec3(1.0, 0.6, 1.0));
    col.r = 0.5 - col.r;
     col += CircleRGB(uv, p2 + vec2(0.5, -0.3) * vec2(sin(20.+t*500.) * 0.5, cos(20.+t*500.) * 0.5), 0.2, 0.4, vec3(-1.0, -1.0, 1.0));
     col += CircleRGB(uv, p2 + vec2(0.5, -0.3) * vec2(sin(20.+t*500.) * 1.5, cos(20.+t*500.) * 1.5), 0.2, 0.4, vec3(-1.0, -1.0, 1.0));
    col = vec3(1.0) - col;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);






// ---------------------------------------------------------------------------- //
// rivière chaude, jaune, diurne
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
    float t = time * 0.125 * 0.5;
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
//     uv.x *= sin(uv.x * 1.);
    uv.y *= -1.;
    p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.2, 0.04, vec3(1., 1.4, 1.0));
    col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
//     col.r += abs(sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01)) * 1.);
//     col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
//          uv *= 5.;
    vec2 newV = (uv + tan(uv.y * 3.) * sin(uv.x * 1.)) - (p + sin(uv.x * 3.));
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    col += CircleRGB(uv, p2, 0.4, 0.05, vec3(1.0, 0.4, 1.0));
    float rando = rand(uv) * 0.1;
//     col.r -= rando * 1.;
     col.g *= 0.2;
    col = vec3(1.) - col;
    col -= CircleRGB(uv, p2, 1.4, 0.2, vec3(1.0, 0.4, 0.0));
    col.r = 0.5 - col.r;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);







// ---------------------------------------------------------------------------- //
// rivière chaude, jaune, diurne
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
    float t = time * 0.125 * 0.5;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -1.4);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 1.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
//     uv.x *= cos(uv.y * 2. * tan(uv.x * 1.));
    uv.y *= -1.;
    p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 1.2, 0.04, vec3(1., 1.4, 1.0));
    col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
//     col.r += abs(sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01)) * 1.);
//     col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
//          uv *= 5.;
    vec2 newV = (uv + tan(uv.y * 3.) * sin(uv.x * 1.)) - (p + sin(uv.x * 3.));
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
// col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
col += CircleRGB(uv, p2, 1.8, 0.4, vec3(0.2, 0.0, 0.8));
    col += CircleRGB(uv, p2, 0.4, 0.05, vec3(1.0, 0.4, 1.0));
    float rando = rand(uv) * 0.1;
//     col.r -= rando * 1.;
     col.g *= 0.2;
    col = vec3(1.) - col;
    col -= CircleRGB(uv, p2, 1.4, 0.2, vec3(1.0, 0.4, 0.0));
//     col.g *= 1. - col.r * 2. - col.b;
    col.r = 0.5 - col.r;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);








// -------------------- //
// gros soleil tangerine//
// -------------------- //
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
    float t = time * 0.125 * 0.5;
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
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(1., 1.4, 1.0));
//     col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
//     col.r += abs(sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01)) * 1.);
//     col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
vec2 newV = (uv + tan(uv.y * 3.)) - (p + sin(uv.x * 3.));
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
//     col += CircleRGB(uv, p2, 0.8, 0.4, vec3(0.0, 0.4, 1.0));
            col += CircleRGB(uv, p2, 0.4, 0.05, vec3(1.0, 0.4, 1.0));
    float rando = rand(uv) * 0.1;
//     col.r -= rando * 1.;
     col.g *= 0.2;
    
    col = vec3(1.) - col;
    col -= CircleRGB(uv, p2, 1.4, 0.2, vec3(1.0, 0.4, 0.0));
    col.r = 0.5 - col.r;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);







// -------------------- //
// grosse tangerine-----//
// -qui fond----------- //
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
    float t = time * 0.125 * 0.5;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -10.4);
//     uv.x *= 0.9;
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
    p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(1., 1.4, 1.0));
//     col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
//     col.r += abs(sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01)) * 1.);
//     col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    vec2 newV = (uv + tan(uv.y * 3.)) - (p + sin(uv.x * 2.));
//     col *= sin(atan(newV.x, newV.y));
//       col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
//     col += CircleRGB(uv, p2, 0.8, 0.4, vec3(0.0, 0.4, 1.0));
    col += CircleRGB(uv, p2, 0.4, 0.05, vec3(1.0, 0.4, 1.0));
        col += CircleRGB(uv, p2, 0.7, 0.4, vec3(1.0, 0.4, 1.0) * 1.);
    float rando = rand(uv) * 0.1;
//     col.r -= rando * 1.;
     col.g *= 0.2;
    
    col = vec3(1.) - col;
    col -= CircleRGB(uv, p2, 1.4, 0.2, vec3(1.0, 0.4, 0.0));
    col.r = 0.5 - col.r;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);












// -------------------- //
// grosse tangerine-----//
// -qui fond-2--------- //
// -------------------- //
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
    float t = time * 0.125 * 0.5;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, -10.4);
//     uv.x *= 0.9;
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
    p2 = vec2(0.0, 0.0);
    vec3 col = CircleRGB(uv, p2, 0.9, 0.01, vec3(1., 1.4, 1.0));
//     col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
//     col.r += abs(sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01)) * 1.);
//     col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    vec2 newV = (uv + tan(uv.y * 3.)) - (p + sin(uv.x * 2.));
//     col *= sin(atan(newV.x, newV.y));
//       col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
//     col += CircleRGB(uv, p2, 0.8, 0.4, vec3(0.0, 0.4, 1.0));
    col += CircleRGB(uv, p2, 0.4, 0.05, vec3(1.0, 0.4, 1.0));
        col += CircleRGB(uv, p2, 0.7, 0.4, vec3(1.0, 0.4, 1.0) * 1.);
    col *= CircleRGB(uv, p2, 0.8, 0.1, vec3(1.0, -1.4, -3.0));
    float rando = rand(uv) * 0.1;
//     col.r -= rando * 1.;
     col.g *= 0.2;
    
    col = vec3(1.) - col;
    col -= CircleRGB(uv, p2, 1.4, 0.2, vec3(1.0, 0.4, 0.0));
    col.r = 0.5 - col.r;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);





// ------------------------- //
// lune bleue, flots roses 2 //
// ------------------------- //
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
    float t = time * 0.125 * 0.5;
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
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(1., 1.4, 1.0));
    col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    col.r += abs(sin(length(uv - p) * (1. + sin(1. * 2.) * 1.1)) * 5.);
//     col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    vec2 newV = (uv + tan(uv.y * 3.)) - (p + sin(uv.x * 3.));
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    col += CircleRGB(uv, p2, 0.4, 0.2, vec3(0.0, 0.4, 1.0));
    float rando = rand(uv) * 0.1;
    col.r -= rando * 1.;
     col.g *= 0.5;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);




// ------------------------- //
// lune bleue, flots roses 2 //
// ------------------------- //
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
    float t = time * 0.125 * 0.5;
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
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(1., 1.4, 1.0));
    col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    col.r += abs(sin(length(uv - p) * (1. + sin(1. * 2.) * 1.1)) * 5.);
//     col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    vec2 newV = (uv + (uv.y * 5.)) - (p + sin(uv.x * 3.));
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//     col += CircleRGB(uv, p2, 0.4, 0.2, vec3(0.0, 0.4, 1.0));
    col += CircleRGB(uv, p2, 0.4, 0.01, vec3(0.2, 0.0, 0.8));
    float rando = rand(uv) * 0.1;
    col.r -= rando * 1.;
     col.g *= 0.5;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);












// ------------------------- //
// grande lune de printemps- //
// ------------------------- //
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
    float t = time * 0.125 * 0.5;
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
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(1., 1.4, 1.0));
//     col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    col.r += abs(sin(length(uv - p) * (1. + sin(1. * 2.) * 0.01)) * 1.);
//     col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    vec2 newV = (uv + (uv.y * 5.)) - (p + sin(uv.x * 1.));
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//     col += CircleRGB(uv, p2, 0.4, 0.2, vec3(0.0, 0.4, 1.0));
    col += CircleRGB(uv, p2, 0.4, 0.01, vec3(0.2, 0.0, 0.8));
        col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.5, 0.7, 0.0));
        col *= CircleRGB(uv, p2, 0.9, 0.9, vec3(1.2, 1.4, 0.8));
    float rando = rand(uv) * 0.1;
//     col.r -= rando * 1.;
//     col.r *= 1.5;
     col.g *= 0.5;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);









// ------------------------- //
// grande lune de printemps- //
// -éclatante--------------- //
// ------------------------- //
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
    float t = time * 0.125 * 0.5;
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
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(1., 1.4, 1.0));
//     col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    col.r += abs(sin(length(uv - p) * (1. + sin(1. * 2.) * 0.01)) * 1.);
//     col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    vec2 newV = (uv + (uv.y * 5.)) - (p + sin(uv.x * 1.));
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//     col += CircleRGB(uv, p2, 0.4, 0.2, vec3(0.0, 0.4, 1.0));
    col += CircleRGB(uv, p2, 0.4, 0.01, vec3(0.2, 0.0, 0.8));
        col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.5, 0.7, 0.0));
//         col *= CircleRGB(uv, p2, 0.9, 0.9, vec3(1.2, 1.4, 0.8));
    float rando = rand(uv) * 0.1;
//     col.r -= rando * 1.;
     col.g *= 0.5;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);







// ------------------------- //
// grande lune de printemps- //
// -éclatante--------------- //
// ------------------------- //
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
    float t = time * 0.125 * 0.5;
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
    vec3 col = CircleRGB(uv, p2, 0.9, 0.2, vec3(1., 1.4, 1.0));
//     col.r *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    col.r += abs(sin(length(uv - p) * (1. + sin(1. * 2.) * 0.01)) * 1.);
//     col.g *= sin(length(uv - p) * (6. + sin(1. * 20.) * 0.01));
    vec2 newV = (uv + tan(uv.y * 3.)) - (p + sin(uv.x * 3.));
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
    col += CircleRGB(uv, p2, 0.3, 0.05, vec3(0.0, 0.4, 1.0));
//     col += CircleRGB(uv, p2, 0.4, 0.01, vec3(0.2, 0.0, 0.8));
        col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.5, 0.7, 0.0));
//         col *= CircleRGB(uv, p2, 0.9, 0.9, vec3(1.2, 1.4, 0.8));
//     col += CircleRGB(uv, p2, 1.5, 0.2, vec3(0.0, 0.2, 0.2)) - (col.r * 0.1);
    float rando = rand(uv) * 0.1;
//     col.r -= rando * 1.;
     col.g *= 0.5;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);






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
    float d = length(uv);
    float t = time * 0.125 * 0.5;
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
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    col += CircleRGB(uv, p2, 0.4, 0.2, vec3(0.0, 0.4, 1.0));
            col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.5, 0.7, 0.0) * 0.75);
//             col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.5, 0.7, 0.0));
//     col -= InvCircleRGB(uv, p2, 0.6, 0.2, vec3(1.5, 1.7, 1.0));
    float rando = rand(uv) * 0.1;
//     col.r -= rando * 1.;
     col.g *= 0.5;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);







// --------------- //
// flots bizarres--//
// -lune seule---- //
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
//     uv *= 2.;
    float d = length(uv);
    float t = time * 0.125 * 0.5;
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
vec2 newV = (uv + -tan(uv.y * 3.)) - (p + (sin(uv.x * 5.0)));
//     col *= sin(atan(newV.x, newV.y));
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + sin(t * 10.) * 100.);
      col *= sin(cos(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
      col *= sin(sin(atan(newV.x, newV.y) * (sin(t * 100.) * 1.)) * 10. + cos(t * 10.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    col += CircleRGB(uv, p2, 0.4, 0.02, vec3(0.0, 0.4, 1.0));
            col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.5, 0.7, 0.0) * 0.75);
//             col += CircleRGB(uv, p2, 0.5, 0.2, vec3(0.5, 0.7, 0.0));
    col -= InvCircleRGB(uv, p2, 0.6, 0.2, vec3(1.5, 1.7, 1.0));
        col -= InvCircleRGB(uv, p2, 0.6, 0.2, vec3(1.5, 1.7, 1.0));
    float rando = rand(uv) * 0.1;
//     col.r -= rando * 1.;
     col.g *= 0.5;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);

