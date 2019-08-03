(
// var n;
~solo = Buffer.read(s, "/Users/guillaumepelletier/Music/SuperCollider\ Recordings/en-mer-guitare-3.aiff");
~solo.numFrames;
// 7144448/14400/2/60;
/*n = ~guitare.numFrames;*/
SynthDef(\solo3, {
    arg buf = ~solo, rate = 1, spos = 0, pan = 0, amp = 1, rel = 2, atk = 0.1, out = 0;
    var sig, env, lfo;
//     env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    // env = EnvGen.ar(Env.new([0.0, 1.0, 0.00001], [atk, rel], [\linear, \exponential],1), gate, doneAction: 2);
    env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    sig = PlayBuf.ar(2, ~solo, rate * BufRateScale.ir(buf), startPos: spos * 11012096, doneAction: 2);
    sig = sig * env;
    sig = sig * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)



(
~guitCluster2 = {
var oldList, durs, pos, rels, pulse, calcPos, offsets;
durs = 0.5!8;
pos = [rrand(0, 0.95), rrand(0.01, 0.05)];
// pos = [ 0.89190335273743, 0.028457579612732 - 0.006 ];
pos = ~listOfPositions.choose;
rels = Array.fill(8, {0.5});
calcPos = Array.fill(8, {|i| pos[0] + (pos[1] * i)});
// offsets = Pseries(0, 0.0002, 8).asStream.nextN(8).stutter(8);
Pbind(
    \instrument, \solo3,
    \dur, Pseq(durs, 16),
    \spos, Pseq(calcPos, inf),
    \atk, 0.01, 
    \rel, Pseq(rels, 16), 
    \amp, 18 * 
    Pseq(Pseries(0, 1/(64), 64).asStream.nextN(64).mirror2, inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t);
pos.postln;
durs.sum * 8;
// position;
// pos;
};
)
(
~listOfPositions = [
[ 0.85975189805031, 0.020349264144897 ],
// [ 0.39905103445053, 0.021927695274353 ],
[ 0.89771834015846, 0.011342778205872 ],
[ 0.33597189188004, 0.015660424232483 ],
[ 0.55250568389893, 0.014972105026245 ],
[ 0.5755101442337, 0.019060392379761 ],
[ 0.81367865204811, 0.012795939445496 ],
[ 0.45509357452393, 0.032274813652039 ],
// [ 0.88176180720329, 0.014097609519958 ],
[ 0.77826461195946, 0.040055723190308 ],
[ 0.89659604430199, 0.015513215065002 ],
// [ 0.24193788170815, 0.03606125831604 ],
[ 0.69908409118652, 0.048196949958801 ],
[ 0.68550804853439, 0.034339866638184 ],
[ 0.57474243044853, 0.022284417152405 ],
[ 0.64666574001312, 0.017251710891724 ],
// [ 0.89190335273743, 0.028457579612732 - 0.005 ],
// [ 0.89190335273743, 0.028457579612732 - 0.006 ],
[ 0.075162792205811, 0.01225914478302 ],
[ 0.28321458697319, 0.017780013084412 ],
[ 0.75263209939003, 0.022348704338074 ],
[ 0.68705627322197, 0.012284464836121 ],
[ 0.70276830196381, 0.026253719329834 ],
[ 0.68902465105057, 0.048710951805115 ],
[ 0.25381145477295, 0.027458500862122 ],
[ 0.549762570858, 0.04640362739563 ],
[ 0.27579191923141, 0.034456295967102 ]
];
)
(
~soloList = Array.fill(4, {rrand(0.0, 0.9)});
~guitClusters2 = Task {
{
var waitValue = ~guitCluster2.();
waitValue.wait;
}.loop;}.start(t);
)
~guitClusters2.stop;
~foamClusters.stop;
~happyLowCloud.set(\gate, 0);
~mousse.set(\gate, 0);
~mousse2.set(\gate, 0);
~brindilles.set(\gate, 0);
~shimmer.stop;
~vagueBasse.set(\gate, 0);
~vagueBasse2.set(\gate, 0);
~lowDrone.set(\gate, 0);
~p1.stop;
~p2.stop;

Pdefn(\guitClusterAmp, 1);