function setShaders() {
    /*======================= Shaders =======================*/
    // vertex shader source code
    var vertCode = `
        // our vertex data
        attribute vec3 aPosition;
        // our texcoordinates
        attribute vec2 aTexCoord;
        // this is a variable that will be shared with the fragment shader
        // we will assign the attribute texcoords to the varying texcoords to move them from the vert shader to the frag shader
        // it can be called whatever you want but often people prefiv it with 'v' to indicate that it is a varying
        varying vec2 vTexCoord;
        void main() {
        // copy the texture coordinates
        vTexCoord = aTexCoord;
        // copy the position data into a vec4, using 1.0 as the w component
        vec4 positionVec4 = vec4(aPosition, 1.0);
        positionVec4.xy = positionVec4.xy * 2.0 - 1.0;
        // send the vertex information on to the fragment shader
        gl_Position = positionVec4;
        }
    `;
    // Create a vertex shader object
    var vertShader = gl.createShader(gl.VERTEX_SHADER);
    // Attach vertex shader source code
    gl.shaderSource(vertShader, vertCode);
    // Compile the vertex shader
    gl.compileShader(vertShader);
    // fragment shader source code
    var fragCode = `
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
    vec2 uv = gl_FragCoord.xy / vec2(800, 800);
    uv -= vec2(0.5, 0.5);
    uv *= 1.2;
    float d = length(uv);
    float t = time;
    float c = d;
//     if (d < 0.3) c = 1.; else c = 0.;
    float r = 0.3;
//     c = smoothstep(r, r - 0.1, d);
//     c = c - smoothstep(r * 0.5, r * 0.5 - 0.1, d);
    vec2 p = vec2(0.0, 0.0);
    c = Circle(uv, p, 0.3, 0.1);
    vec2 p2 = vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)) * 0.4;
    float siz = sin(t * 100.);
    vec3 col = CircleRGB(uv, p2, 0.4, 0.2, vec3(1.0, 1.0, 0.0));
    col = col + CircleRGB(uv, p, 0.6, 0.2, vec3(0.2, 0.0, 0.0));
//      col = col + CircleRGB(uv, p, 0.3, 0.1, vec3(1.0, 0.1, 1.0) * 0.5) * 0.5;
    col = col - CircleRGB(uv, p2, 0.2, 0.1 * (1.0 + siz * 0.5), vec3(1.0, 1.0, 1.0));
    col = col + CircleRGB(uv, p2, 0.5 * (1.0 + siz * 0.1), 0.2, vec3(0.4, 0.0, 0.0));
//     col = col + CircleRGB(uv, vec2(0.1 * sin(t * 100.), 0.1 * cos(t * 100.)), 0.1, 0.1, vec3(0.4, 0.0, 0.0));
    col = col - CircleRGB(uv, vec2(0.0, 0.2), 0.4, 0.4, vec3(1.0, 1.0, 1.0));
    col = col + CircleRGB(uv, (vec2(0.35, -0.35) + p2) * (1.0 - siz * 0.2), 0.4, 0.8, vec3(1.0, 0.0, 0.0));
    col = col + CircleRGB(uv, (vec2(0.45, 0.15) + p2) * (1.0 - siz * 0.2), 0.4, 0.8, vec3(0.8, 0.0, 0.0));
    col = col + CircleRGB(uv, (vec2(-0.6, 0.3) + p2) * (1.0 - siz * 0.2), 0.4, 0.8, vec3(0.8, 0.0, 0.0));
    col = col + CircleRGB(uv, vec2(-0.4, -0.1) * (1.0 - siz * 0.2), 0.4, 0.8, vec3(0.8, 0.0, 0.0));
    gl_FragColor = vec4(col, 1.0);
}
    `;
    // Create fragment shader object
    var fragShader = gl.createShader(gl.FRAGMENT_SHADER);
    // Attach fragment shader source code
    gl.shaderSource(fragShader, fragCode);
    // Compile the fragmentt shader
    gl.compileShader(fragShader);
    // Create a shader program object to
    // store the combined shader program
    shaderProgram = gl.createProgram();
    // Attach a vertex shader
    gl.attachShader(shaderProgram, vertShader);
    // Attach a fragment shader
    gl.attachShader(shaderProgram, fragShader);
    // Link both the programs
    gl.linkProgram(shaderProgram);
    // Use the combined shader program object
    gl.useProgram(shaderProgram);
    time = gl.getUniformLocation(shaderProgram, "time");
}
setShaders();




function setBothShaders(fragCode) {
        // vertex shader source code
    var vertCode = `
        // our vertex data
        attribute vec3 aPosition;
        // our texcoordinates
        attribute vec2 aTexCoord;
        // this is a variable that will be shared with the fragment shader
        // we will assign the attribute texcoords to the varying texcoords to move them from the vert shader to the frag shader
        // it can be called whatever you want but often people prefiv it with 'v' to indicate that it is a varying
        varying vec2 vTexCoord;
        void main() {
        // copy the texture coordinates
        vTexCoord = aTexCoord;
        // copy the position data into a vec4, using 1.0 as the w component
        vec4 positionVec4 = vec4(aPosition, 1.0);
        positionVec4.xy = positionVec4.xy * 2.0 - 1.0;
        // send the vertex information on to the fragment shader
        gl_Position = positionVec4;
        }
    `;
    // Create a vertex shader object
    var vertShader = gl.createShader(gl.VERTEX_SHADER);
    // Attach vertex shader source code
    gl.shaderSource(vertShader, vertCode);
    // Compile the vertex shader
    gl.compileShader(vertShader);
       // Create fragment shader object
    var fragShader = gl.createShader(gl.FRAGMENT_SHADER);
    // Attach fragment shader source code
    gl.shaderSource(fragShader, fragCode);
    // Compile the fragmentt shader
    gl.compileShader(fragShader);
    // Create a shader program object to
    // store the combined shader program
    shaderProgram = gl.createProgram();
    // Attach a vertex shader
    gl.attachShader(shaderProgram, vertShader);
    // Attach a fragment shader
    gl.attachShader(shaderProgram, fragShader);
    // Link both the programs
    gl.linkProgram(shaderProgram);
    // Use the combined shader program object
    gl.useProgram(shaderProgram);
    time = gl.getUniformLocation(shaderProgram, "time");
}