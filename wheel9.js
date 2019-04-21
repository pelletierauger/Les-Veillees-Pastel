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
//       uv *= 2.2;
    float d = length(uv);
    float t = time * 0.5;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, 0.5);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
    p2 = vec2(0.0, 0.0);
vec2 newV = uv - p;
newV = (uv + cos(uv.y * 10.)) - (p + sin(uv.x * 10.));
    vec3 col = CircleRGB(uv, p, 1.9, 0.2, vec3(1.0, 0.4, 1.0));
    col.r *= cos(length(uv - p) * (60. + sin(uv.x * sin(t * 100.)) * 100.));
    col.g *= sin(length(uv - p) * (30. + cos(uv.y * sin(t * 100.)) * 100.));
     col *= sin(atan(newV.x, newV.y));
      float aat = atan(newV.x + sin(uv.x * 15.), newV.y + cos(uv.y * 15.));
//       col *= sin(sin(aat * 10.) + sin(t * 5.) * 100.);
//       col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//       col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);


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
//       uv *= 2.2;
    float d = length(uv);
    float t = time * 0.5;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, 0.5);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
    p2 = vec2(0.0, 0.0);
vec2 newV = uv - p;
newV = (uv + cos(uv.y * 10.)) - (p + sin(uv.x * 10.));
    vec3 col = CircleRGB(uv, p, 1.9, 0.2, vec3(1.0, 0.4, 1.0));
    col.r *= cos(length(uv - p) * (60. + sin(uv.x * sin(t * 100.)) * 100.));
    col.g *= sin(length(uv - p) * (30. + cos(uv.y * sin(t * 100.)) * 100.));
     col *= sin(atan(newV.x, newV.y) * (sin(t * 10.)) * 10.);
      float aat = atan(newV.x + sin(uv.x * 15.), newV.y + cos(uv.y * 15.));
//       col *= sin(sin(aat * 10.) + sin(t * 5.) * 100.);
//       col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//       col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);


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
//       uv *= 2.2;
    float d = length(uv);
    float t = time * 0.5;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(1.0, 0.5);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
    p2 = vec2(0.0, 0.0);
vec2 newV = uv - p;
newV = (uv + cos(uv.y * 10.)) - (p + sin(uv.x * 10.));
    vec3 col = CircleRGB(uv, p, 1.9, 0.2, vec3(1.0, 0.4, 1.0));
    col.r *= cos(length(uv - p) * (60. + sin(uv.x * sin(t * 100.)) * 100.));
    col.g *= sin(length(uv - p) * (30. + cos(uv.y * sin(t * 100.)) * 100.));
     col *= sin((newV.x, newV.y) * (sin(t * 10.)) * 10.);
      float aat = atan(newV.x + sin(uv.x * 15.), newV.y + cos(uv.y * 15.));
//       col *= sin(sin(aat * 10.) + sin(t * 5.) * 100.);
//       col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//       col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);




// La belle restauration au centre
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
//       uv *= 2.2;
    float d = length(uv);
    float t = time * 0.5;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(0.0, 0.0);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
    p2 = vec2(0.0, 0.0);
vec2 newV = uv - p;
newV = (uv + cos(uv.y * 10.)) - (p + sin(uv.x * 10.));
    vec3 col = CircleRGB(uv, p, 1.9, 0.2, vec3(1.0, 0.4, 1.0));
    col.r *= cos(length(uv - p) * (60. + sin(uv.x * sin(t * 100.)) * 100.));
    col.g *= sin(length(uv - p) * (30. + cos(uv.y * sin(t * 100.)) * 100.));
     col *= sin((newV.x, newV.y) * (sin(t * 10.)) * 10.);
      float aat = atan(newV.x + sin(uv.x * 15.), newV.y + cos(uv.y * 15.));
//       col *= sin(sin(aat * 10.) + sin(t * 5.) * 100.);
//       col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//       col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);






// Le croissant lunaire culbutant
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
//       uv *= 2.2;
    float d = length(uv);
    float t = time * 0.5;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(0.0, 0.0);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
    p2 = vec2(cos(t * 100.), sin(t * 100.)) * 1.5;
vec2 newV = uv - p;
newV = (uv + cos(uv.y * 10.)) - (p + sin(uv.x * 10.));
    vec3 col = CircleRGB(uv + p2, p, 1.9, 0.2, vec3(1.0, 0.4, 1.0));
    col.r *= cos(length(uv - p) * (60. + sin(uv.x * sin(t * 100.)) * 100.));
    col.g *= sin(length(uv - p) * (30. + cos(uv.y * sin(t * 100.)) * 100.));
     col *= cos(newV.y * (sin(t * 100.)) * 10.);
      float aat = atan(newV.x + sin(uv.x), newV.y + cos(uv.y));
//       col *= sin(sin(aat * 10.) + sin(t * 5.) * 100.);
//       col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//       col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);






// Les croissants fugitifs
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
//       uv *= 2.2;
    float d = length(uv);
    float t = time * 0.5;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(0.0, 0.0);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
    p2 = vec2(tan(t * 100.), sin(t * 100.)) * 1.5;
vec2 newV = uv - p;
newV = (uv + cos(uv.y * 10.)) - (p + sin(uv.x * 10.));
    vec3 col = CircleRGB(uv + p2, p, 1.9, 0.2, vec3(1.0, 0.4, 1.0));
    col.b *= cos(length(uv - p) * (60. + sin(uv.x * sin(t * 100.)) * 100.));
    col.g *= sin(length(uv - p) * (30. + cos(uv.y * sin(t * 100.)) * 100.));
     col *= cos(newV.y * (sin(t * 100.)) * 10.);
      float aat = atan(newV.x + sin(uv.x), newV.y + cos(uv.y));
//       col *= sin(sin(aat * 10.) + sin(t * 5.) * 100.);
//       col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//       col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);












// Les champignons
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
       uv *= 2.2;
    float d = length(uv);
    float t = time * 0.5;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(2.0, 0.0);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
    p2 = vec2(0, 0);
vec2 newV = uv - p;
newV = (uv + cos(uv.y * 10.)) - (p + sin(uv.x * 10.));
    vec3 col = CircleRGB(uv + p2, p, 2.9, 0.2, vec3(1.0, 0.8, 0.1));
    col.b += cos(length(uv - p) * (60. + sin(uv.x * sin(t * 100.)) * 100.));
    col.g *= sin(length(uv - p) * (30. + cos(uv.y * sin(t * 100.)) * 100.));
     col *= sin(length(uv * newV.x - p * newV.y) * (sin(t * 10.) * 0.2) * 10.);
      float aat = atan(newV.x + sin(uv.x), newV.y + cos(uv.y));
//       col *= sin(sin(aat * 10.) + sin(t * 5.) * 100.);
//       col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//       col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);









// Champignon ordinaire
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
       uv *= 5.2;
    float d = length(uv);
    float t = time * 0.5;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(0.0, 0.0);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
    p2 = vec2(0, 0);
vec2 newV = uv - p;
newV = (uv + cos(uv.y * 10.)) - (p + sin(uv.x * 10.));
    vec3 col = CircleRGB(uv + p2, p, 3.9, 1., vec3(1.0, 0.8, 0.1));
    col.b += cos(length(uv - p) * (60. + sin(uv.x * sin(t * 100.)) * 100.));
    col.g *= sin(length(uv - p) * (30. + cos(uv.y * sin(t * 100.)) * 100.));
     col *= sin(length(uv * newV.y - p * newV.y) * (sin(t * 100.) * 0.2) * 10.);
      float aat = atan(newV.x + sin(uv.x), newV.y + cos(uv.y));
//       col *= sin(sin(aat * 10.) + sin(t * 5.) * 100.);
//        col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//        col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//col +=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);











// Les croissants fugitifs
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
//       uv *= 2.2;
    float d = length(uv);
    float t = time * 0.5;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(0.0, 0.0);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    vec2 p3 = vec2(0.1 * sin(t * 50.), 0.1 * cos(t * 50.)) * 0.4;
    float siz = sin(t * 100.);
    float siz2 = sin(t * 50.);
    p2 = vec2(tan(t * 100.), sin(t * 100.)) * 1.5;
vec2 newV = uv - p;
newV = (uv + cos(uv.y * 10.)) - (p + sin(uv.x * 10.));
    vec3 col = CircleRGB(uv + p2, p, 1.9, 0.2, vec3(1.0, 0.4, 1.0));
    col.b *= cos(length(uv - p) * (60. + sin(uv.x * sin(t * 100.)) * 100.));
    col.g *= sin(length(uv - p) * (30. + cos(uv.y * sin(t * 100.)) * 100.));
     col *= cos(newV.y * (sin(t * 100.)) * 10.);
      float aat = atan(newV.x + sin(uv.x), newV.y + cos(uv.y));
//       col *= sin(sin(aat * 10.) + sin(t * 5.) * 100.);
//       col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//       col *= sin(cos(aat * 10.) + sin(t * 5.) * 100.);
//col -=  CircleRGB(uv, p2, 0.2, 0.2, vec3(1.0, 1.0, 1.0));
//     col = max(col, 0.);
//col += CircleRGB(uv, p2, 0.5, 0.1, vec3(0.2, 0.0, 0.8));
    float rando = rand(uv) * 0.1;
    gl_FragColor = vec4(col - rando, 1.0);
}
`);