let looping = true;
let keysActive = true;
let socket, cnvs, ctx, canvasDOM;
let fileName = "./frames-b/sketch";
let maxFrames = 103;
let gl, shaderProgram;
let time;
let positive = true;
let intensity;
let drawCount = 20;
let drawIncrement = 0.00125;

// a shader variable
let texcoordShader;

function setup() {
    socket = io.connect('http://localhost:8080');
    // socket.on('receiveOSC', receiveOSC);
    pixelDensity(1);
    // cnvs = createCanvas(windowWidth, windowWidth / 16 * 9, WEBGL);
    noCanvas();
    cnvs = document.getElementById('my_Canvas');
    gl = cnvs.getContext('webgl', { preserveDrawingBuffer: true });
    // canvasDOM = document.getElementById('my_Canvas');
    // canvasDOM = document.getElementById('defaultCanvas0');
    // gl = canvasDOM.getContext('webgl');
    // gl = cnvs.drawingContext;

    // gl = canvasDOM.getContext('webgl', { premultipliedAlpha: false });



    // gl.colorMask(false, false, false, true);
    // gl.colorMask(false, false, false, true);

    // Clear the canvas
    gl.clearColor(0.0, 0.0, 0.0, 1.0);

    // Enable the depth test
    gl.enable(gl.DEPTH_TEST);
    gl.depthMask(false);

    // Clear the color buffer bit
    gl.clear(gl.COLOR_BUFFER_BIT);
    // gl.colorMask(true, true, true, true);
    // gl.clear(gl.COLOR_BUFFER_BIT);
    gl.enable(gl.BLEND);
    // gl.blendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA);
    // gl.blendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA);
    gl.blendFuncSeparate(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA, gl.ONE, gl.ONE_MINUS_SRC_ALPHA);
    // gl.blendFunc(gl.SRC_ALPHA, gl.DST_ALPHA);
    // gl.blendFunc(gl.SRC_ALPHA, gl.DST_ALPHA);
    // Set the view port
    gl.viewport(0, 0, cnvs.width, cnvs.height);
    frameRate(20);
    background(0);
    fill(255, 50);
    noStroke();
    if (!looping) {
        noLoop();
    }
}

function draw() {
    if (frameCount == 1) {
        setShaders();
    }
    // gl.uniform1fv(time, frameCount);
    // sendSuperCollider();
    gl.uniform1f(time, drawCount);
    // shader() sets the active shader with our shader
    // shader(texcoordShader);
    // shaderProgram.setUniform('time', frameCount);
    // rect gives us some geometry on the screen
    // rect(0, 0, width, height);


    let aspect = cnvs.width / cnvs.height;
    let vertices = new Float32Array([-1, 1, 1, 1, 1, -1, // Triangle 1
        -1, 1, 1, -1, -1, 1 // Triangle 2
    ]);
    let vbuffer = gl.createBuffer();
    gl.bindBuffer(gl.ARRAY_BUFFER, vbuffer);
    gl.bufferData(gl.ARRAY_BUFFER, vertices, gl.STATIC_DRAW);

    let itemSize = 2;
    let numItems = vertices.length / itemSize;

    // gl.useProgram(shaderProgram);

    // program.uColor = gl.getUniformLocation(program, "uColor");
    // gl.uniform4fv(program.uColor, [0.0, 0.3, 0.0, 1.0]);

    shaderProgram.aVertexPosition = gl.getAttribLocation(shaderProgram, "aPosition");
    gl.enableVertexAttribArray(shaderProgram.aVertexPosition);
    gl.vertexAttribPointer(shaderProgram.aVertexPosition, itemSize, gl.FLOAT, false, 0, 0);


    gl.drawArrays(gl.TRIANGLES, 0, numItems);
    drawCount += drawIncrement;
    if (exporting && frameCount < maxFrames) {
        console.log("Tricks!");
        frameExport();
    }
}

// function windowResized() {
//     resizeCanvas(windowWidth, windowHeight);
// }

function keyPressed() {
    if (keysActive) {
        if (keyCode === 32) {
            if (looping) {
                noLoop();
                looping = false;
            } else {
                loop();
                looping = true;
            }
        }
        if (key == 'r' || key == 'R') {
            window.location.reload();
        }
        if (key == 'm' || key == 'M') {
            redraw();
        }
    }
}