(
// var n;
~guitare = Buffer.read(s, "/Users/guillaumepelletier/Desktop/Dropbox/Création musicale/Projets Ableton Live/Avec Caroline Project/Samples/Recorded/0002 7-Audio.aif");
// ~guitare.numChannels;
// 7144448/14400/2/60;
/*n = ~guitare.numFrames;*/
SynthDef(\accords2, {
    arg buf = ~guitare, rate = 1, spos = 0, pan = 0, amp = 1, rel = 2, atk = 0.1, out = 0;
    var sig, env, lfo;
//     env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    // env = EnvGen.ar(Env.new([0.0, 1.0, 0.00001], [atk, rel], [\linear, \exponential],1), gate, doneAction: 2);
    env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    sig = PlayBuf.ar(2, ~guitare, rate * BufRateScale.ir(buf), startPos: spos * 1047552, doneAction: 2);
    sig = sig * env;
    sig = sig * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)


(
~guitare = Buffer.read(s, "/Users/guillaumepelletier/Desktop/Dropbox/Création musicale/Projets Ableton Live/Avec Caroline Project/Samples/Recorded/0005 Guitare.aif");
~guitare.numFrames;
~guitare.numChannels;
7144448/14400/2/60;
SynthDef(\accords, {
    arg buf = ~guitare, rate = 1, spos = 0, pan = 0, amp = 1, rel = 2, atk = 0.1, out = 0;
    var sig, env, lfo;
//     env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    // env = EnvGen.ar(Env.new([0.0, 1.0, 0.00001], [atk, rel], [\linear, \exponential],1), gate, doneAction: 2);
    env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    sig = PlayBuf.ar(2, ~guitare, rate * BufRateScale.ir(buf), startPos: spos * 1615360, doneAction: 2);
    sig = sig * env;
    sig = sig * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)

// lent début à la ma doudou
(
~guitare1.stop;
~guitare1 = Pbind(
    \instrument, \accords2,
    \dur, 1/1,
    \spos, Pseq([0.2, 0.7].stutter(48) - 0.05, inf)
    + 0.0
    + Pseq(Pseries(0, 0.001, 24).asStream.nextN(24).mirror2, inf),
    \rel, 2.75,
    \amp, [1, 1, 0.8] * 1.5,
    \rate, [0.5, 1, 2] * -1.midiratio,
    \pan, Pwhite(-1.0, 1.0, inf)
).play(t);
)

(
~guitare1.stop;
~guitare1 = Pbind(
    \instrument, \accords2,
    \dur, 1/1,
    \spos, Pseq([0.5].stutter(48) - 0.05, inf)
    + 0.0
    + Pseq(Pseries(0, 0.001, 24).asStream.nextN(24).mirror2, inf),
    \rel, 2.75,
    \amp, [1, 1, 0.8] * 1.5,
    \rate, [0.5, 1, 2] * -1.midiratio,
    \pan, Pwhite(-1.0, 1.0, inf)
).play(t);
)


(
~vox1.stop;
~vox1 = Pbind(
    \instrument, \vox,
    \dur, 1/1,
    \spos, Pseq(([1]/10).stutter(64 * 2), inf)
    + 0.4
    + Pseq(Pseries(0, 0.001, 64).asStream.nextN(64).stutter(2), inf),
    \rel, 0.5,
    \amp, 8,
    \pan, Pwhite(-1.0, 1.0, inf)
).play(t);
)

// inspirante gigue vers l'avant
(
~p1.stop;
~shimmerD2.stop;
~p2.stop;
~mousse.free;
~brindilles.free;
~vagueHaute.free;
~guitare1.stop;
~guitare1 = Pbind(
    \instrument, \accords,
    \dur, 8/1,
    \spos, Pseq([0.0, 0.2, 0.4].stutter(4) + 0.1, inf)
    + 0.2
    + Pseq([Pseries(0, 0.001, 64)], inf),
    \rel, 3.5,
    \amp, 8,
    \rate, [0.5, 1, 2] * -1.midiratio,
    \pan, Pwhite(-0.5, 0.5, inf)
).play(t);
)




(
~guitarePoints.stop;
~guitarePoints = Pbind(
    \instrument, \accords2,
    \dur, 4/1,
    \spos, Pseq([0.13, 0.55, 0.7], inf),
    \rel, 1.75,
    \atk, 0.1,
    \amp, [1] * 2.5,
    \rate, [1] * -1.midiratio,
    \pan, Pwhite(-1.0, 1.0, inf)
).play(t, quant: [4]);
)


(
~vox1.stop;
~vox1 = Pbind(
    \instrument, \vox,
    \dur, 4/1,
    \spos, Pseq([0.2, 0.5], inf),
    \rel, 0.5,
    \amp, 8,
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~reverbBus
).play(t, quant: [4, 2]);
)


(
// doudou
~guitare1.stop;
~guitare1 = Pbind(
    \instrument, \accords2,
    \dur, 1/8,
    \spos, Pseq([0.1, 0.6].stutter(48) - 0.05, inf)
    + 0.0
    + Pseq(Pseries(0, 0.001, 24).asStream.nextN(24).mirror2, inf),
    \rel, 2.5,
    \amp, [1, 1, 0.8] * 1,
    \rate, [0.5, 1, 2] * -1.midiratio,
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~reverbBus
).play();
)


(
~vox2.stop;
~vox2 = Pbind(
    \instrument, \vox,
    \dur, Pseq(1!8 ++ 8 * 0.125, inf),
    \spos, Pseq(([6.5]/10).stutter(64 * 2), inf)
    + Pseq(Pseries(0, 0.01, 8).asStream.nextN(8).stutter(2), inf),
    \rel, 0.5,
    \amp, 8,
    \pan, Pwhite(-1.0, 1.0, inf)
).play(t);
)


(
// nouvelle doudou
// 1/8 * 4;
~guitare1.stop;
~guitare1 = Pbind(
    \instrument, \accords2,
    \dur, 1/8 * 4,
    \spos, Pseq([0.1, 0.6].stutter(32) - 0.05, inf)
    + 0.0
    + Pseq(Pseries(0, 0.001 * 0.5, 16).asStream.nextN(16).mirror2, inf),
    \rel, 2.5,
    \amp, [1, 1, 0.8] * 1,
    \rate, Pseq([1, -7.midiratio, -2.midiratio, -7.midiratio].stutter(32), inf) * -1.midiratio * [0.5, 1, 2],
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~reverbBus
).play(t);
)



(
~vox1.stop;
~vox1 = Pbind(
    \instrument, \vox,
    \dur, 4/1,
    \spos, Pseq([0.2, 0.5], inf),
    \rel, 0.5,
    \amp, 8,
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~reverbBus
).play(t, quant: [4, 2]);
)
(
~vox2.stop;
~vox2 = Pbind(
    \instrument, \vox,
    \dur, 4/1,
    \spos, Pseq([0.15, 0.35], inf),
    \rel, 1,
    \amp, 8,
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~limitBus
).play(t, quant: [4]);
)

(
~vox3.stop;
~vox3 = Pbind(
    \instrument, \vox,
    \dur, 16,
    \spos, Pseq([0.55, 0.57], inf),
    \rel, 2,
    \amp, 12,
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~reverbBus
).play(t, quant: [4]);
)

(
// nouvelle doudou
// 1/8 * 4;
~guitare1.stop;
~guitare1 = Pbind(
    \instrument, \accords2,
    \dur, 1/8 * 4 / 1 * 2,
    \spos, Pseq([0.14, 0.6].stutter(16) - 0.05, inf)
    + 0.0
    + Pseq(Pseries(0, 0.001 * 1, 8 * 1).asStream.nextN(8 * 1).mirror2, inf),
    \rel, Pdefn(\foamRel, 0.125 * 0.5);,
    \atk, 0.04,
    \amp, [1, 1, 0.8] * 1 * Pdefn(\foamAmp, 2),
    \rate, Pseq([0, -7, -2, -7].midiratio.stutter(16 * 1), inf) * -1.midiratio * [2],
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~reverbBus
).play(t);
)
(
// nouvelle doudou
~guitare1.stop;
~guitare1 = Pbind(
    \instrument, \accords2,
    \dur, 1/8 * 4 / 1,
    \spos, Pseq([0.14, 0.6].stutter(32 * 1) - 0.05, inf)
    + 0.0
    + Pseq(Pseries(0, 0.001 * 1, 16 * 1).asStream.nextN(16 * 1).mirror2, inf),
    \rel, Pdefn(\foamRel, 0.5);,
    \atk, 0.01,
    \amp, [1, 1, 0.8] * 1 * Pdefn(\foamAmp, 0),
    \rate, Pseq([0, -7, -2, -7].midiratio.stutter(32 * 1), inf) * -1.midiratio * [1, 2],
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~reverbBus
).play(t);
)
Pdefn(\foamAmp, 2.0);
Pdefn(\foamRel, 2.5);


(
// nouvelle doudou
// 1/8 * 4;
~guitareB.stop;
~guitareB = Pbind(
    \instrument, \accords,
    \dur, 1/8 * 4 / 1 * 2,
    \spos, Pseq([0.14, 0.6].stutter(32 * 1) - 0.05, inf)
    + 0.0
    + Pseq(Pseries(0, 0.001 * 4, 16 * 1).asStream.nextN(16 * 1).mirror2, inf),
    \rel, 2.5,
    \atk, 0.01,
    \amp, [1, 1, 0.8] * 1,
    \rate, Pseq([0, -7, -2, -7].midiratio.stutter(32 * 1), inf) * -1.midiratio * [1, 2],
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~reverbBus
).play(t);
)

(
// nouvelle doudou
// 1/8 * 4;
~guitareB.stop;
~guitareB = Pbind(
    \instrument, \accords,
    \dur, 1/8 * 4 / 1 * 8,
    \spos, Pseq([0.14, 0.6].stutter(32 * 1) - 0.05, inf)
    + 0.0
    + Pseq(Pseries(0, 0.001 * 4, 16 * 1).asStream.nextN(16 * 1).mirror2, inf),
    \rel, 5.5,
    \atk, 0.01,
    \amp, [1, 1, 0.8] * 1,
    \rate, Pseq([0, 0, 0, 0].midiratio.stutter(32 * 1), inf) * -1.midiratio * [1, 2],
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~reverbBus
).play(t);
)






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
// nouvelle doudou
// 1/8 * 4;
~guitareSolo.stop;
~guitareSolo = Pbind(
    \instrument, \solo3,
    \dur, 16,
    \spos, Pseq([0.0085, 0.0275, 0.05, 0.0275], inf),
    \rel, Pseq([4, 4, 11, 4], inf),
    \atk, 0.01,
    \amp, 3,
    \rate, 1,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~bigReverbBus
).play(t);
)


(
SynthDef(\solo3cont, {
    arg buf = ~solo, rate = 1, pan = 0, amp = 1, rel = 2, atk = 0.1, out = 0, gate = 1;
    var sig, env, lfo;
//     env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    env = EnvGen.ar(Env.new([0.0, 1.0, 0.00001], [atk, rel], [\linear, \exponential],1), gate, doneAction: 2);
    sig = PlayBuf.ar(2, ~solo, rate * BufRateScale.ir(buf), startPos: 0, doneAction: 2);
    sig = sig * env;
    sig = sig * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)

~soloCont = Synth.new(\solo3cont, [\out, ~reverbBus, \amp, 5]);
~soloCont.set(\gate, 0);




(
~guitCluster = {
// var degrees = Array.fill(3, {[1, 1, 1, 2].choose}) ++ [1, 1];
// var modif = [0].midiratio;
// var key = ~toFreq.(~key) * modif * 2;
// var notes = key * [0, 4, 7, 11, 14].midiratio;
// var arr = (notes * degrees).scramble;
// var steps = Array.fill(5, {[0.125, 0.25].choose});
// var baseOsc = rrand(1, 12);
// var minOsc = baseOsc - 0.05 / 12;
// var maxOsc = baseOsc + 0.05 / 12;
var durs = Array.fill(8, {[0.5].choose});
var positions = Array.fill(8, {rrand(0.0, 0.9)});
var rels = Array.fill(8, {[0.5, 1].choose});
var pulse = Pbind(
    \instrument, \solo3,
    \dur, Pseq(durs, 4),
    \spos, Pseq(positions, inf),
    \atk, 0.01, 
    \rel, Pseq(rels, 4), 
    \amp, 3,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~limitBus
).play(t);
durs.sum * 4;
};
)
Array.fill(6, {[1].choose});
(
~guitClusters = Task {
{
var waitValue = ~guitCluster.();
waitValue.wait;
}.loop;}.start(t);
)
~guitClusters.stop;



~soloList = Array.fill(8, {rrand(0.0, 0.9)});
(
var oldList = ~soloList;
~soloList = Array.fill(8, {
    |i| 
    [oldList[i], rrand(0.0, 0.9)].wchoose([0.9, 0.1]);
});
)
~soloList;


(
~guitCluster2 = {
var oldList, durs, positions, rels, pulse;
oldList = ~soloList;
~soloList = Array.fill(4, {
    |i| 
    [oldList[i], rrand(0.0, 0.9)].wchoose([0.5, 0.5]);
});
durs = 2!4;
positions = ~soloList;
rels = Array.fill(4, {2});
pulse = Pbind(
    \instrument, \solo3,
    \dur, Pseq(durs, 4),
    \spos, Pseq(positions, inf),
    \atk, 0.01, 
    \rel, Pseq(rels, 4), 
    \amp, 12,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t);
durs.sum * 4;
};
)

(
// ~brindilles.set(\gate, 0);
// ~mousse.set(\gate, 0);
~soloList = Array.fill(4, {rrand(0.0, 0.9)});
~guitClusters2 = Task {
{
var waitValue = ~guitCluster2.();
waitValue.wait;
}.loop;}.start(t);
)
~guitClusters2.stop;


// -----------------------------------------------------
// Automated vocal clusters



(
~voxCluster = {
var oldList, durs, positions, rels, pulse;
oldList = ~voxList;
~voxList = Array.fill(8, {
    |i| 
    [oldList[i], rrand(0.0, 0.9)].wchoose([0.5, 0.5]);
});
durs = 0.5!8;
positions = ~voxList;
rels = Array.fill(8, {[0.5, 1].choose * 0.25});
pulse = Pbind(
    \instrument, \vox,
    \dur, Pseq(durs, 4),
    \spos, Pseq(positions, inf),
    \rel, Pseq(rels, 4), 
    \amp, 8,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~limitBus
).play(t);
durs.sum * 4;
};
)

(
~voxList = Array.fill(8, {rrand(0.0, 0.9)});
~voxClusters = Task {
{
var waitValue = ~voxCluster.();
waitValue.wait;
}.loop;}.start(t);
)
~voxClusters.stop;

(
~solo1 = Buffer.read(s, "/Users/guillaumepelletier/Music/SuperCollider\ Recordings/en-mer-guitare-1.wav");
~solo1.numFrames;
SynthDef(\solo1cont, {
    arg buf = ~solo, rate = 1, pan = 0, amp = 1, rel = 2, atk = 0.1, out = 0, gate = 1;
    var sig, env, lfo;
//     env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    env = EnvGen.ar(Env.new([0.0, 1.0, 0.00001], [atk, rel], [\linear, \exponential],1), gate, doneAction: 2);
    sig = PlayBuf.ar(2, ~solo, rate * BufRateScale.ir(buf), startPos: 0, doneAction: 2);
    sig = sig * env;
    sig = sig * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)

~soloCont1 = Synth.new(\solo1cont, [\out, ~reverbBus, \amp, 10, \rate, 2]);
~soloCont1.set(\gate, 0);
~soloCont1.set(\amp, 6);


(
SynthDef(\solo1, {
    arg buf = ~solo1, rate = 1, spos = 0, pan = 0, amp = 1, rel = 2, atk = 0.1, out = 0;
    var sig, env, lfo;
//     env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    // env = EnvGen.ar(Env.new([0.0, 1.0, 0.00001], [atk, rel], [\linear, \exponential],1), gate, doneAction: 2);
    env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    sig = PlayBuf.ar(2, ~solo1, rate * BufRateScale.ir(buf), startPos: spos * 21780480, doneAction: 2);
    sig = sig * env;
    sig = sig * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)





(
~guitCluster1 = {
var durs = Array.fill(8, {[0.5].choose});
var basicPos = rrand(0.0, 0.9);
var positions = Array.fill(8, {basicPos + rrand(0.0, 0.01)});
var rels = Array.fill(8, {[0.5, 1].choose * 2});
var pulse = Pbind(
    \instrument, \solo1,
    \dur, Pseq(durs, 4),
    \spos, Pseq(positions, inf),
    \atk, 0.01, 
    \rel, Pseq(rels, 4), 
    \amp, 5,
    \rate, 1,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~limitBus
).play(t);
durs.sum * 4;
};
)
Array.fill(6, {[1].choose});
(
~guitClusters1 = Task {
{
var waitValue = ~guitCluster1.();
waitValue.wait;
}.loop;}.start(t);
)
~guitClusters1.stop;




Pwhite().asStream.next.stutter(2);


(
// nouvelle doudou
// 1/8 * 4;
// ~wobblyCluster = {
var pos = rrand(0.0, 0.9);
pos.postln;
~autreGuitare.stop;
~autreGuitare = Pbind(
    \instrument, \solo1,
    \dur, 1/2,
    \spos, Pseq([pos], 128)
    + Pseq(Pseries(0, 0.00001/2, 64).asStream.nextN(64).mirror2, inf),
    \rel, Pseq([1/4], inf),
    \atk, 0.0001,
    \amp, 24 * Pseq(Pseries(0, 1/63, 64).asStream.nextN(64).mirror2, 128)
    * Pseq([1, 0.5], inf),
    \rate, 1,
    \pan, Pwhite(-0.75, 0.75, inf),
    \out, ~reverbBus
).play(t);
// }
)

(
~wobblyCluster = {
var pos = [
    0.026112163066864,
    0.062166202068329,
    0.74659781455994,
    0.78977344036102,
    0.062755215167999,
    0.74401377439499,
    0.43313534259796,
    0.43743299245834,
    0.73360691070557,
    0.22772061824799,
    0.21568940877914,
    0.45996032953262,
    0.36069284677505,
    0.76989204883575,
    0.68512533903122,
//  les nouveaux
    0.87643947601318,
    0.66717739105225,
    0.41944223642349, //unique note basse
    0.61048032045364, //mid
    0.49029418230057,
    0.37596437931061,
    0.33566966056824,
    0.20594569444656,
    0.77303967475891,
    0.093804574012756,
    0.76832048892975,  //très haut
].choose;
pos.postln;
Pbind(
    \instrument, \solo1,
    \dur, 1/2,
    \spos, Pseq([pos], 128)
//     + Pseq(Pseries(0, 0.00001, 64).asStream.nextN(64), inf),
    + Pseq(Pseries(0, 0.00001/2, 64).asStream.nextN(64).mirror2, inf),
    \rel, Pseq([1/4], inf),
    \atk, 0.0001,
//     \amp, 24 * Pseq(Pgeom(1, 0.95, 64).asStream.nextN(64), inf)
    \amp, 24 * Pseq(Pseries(0, 1/63, 64).asStream.nextN(64).mirror2, 128)
    * Pseq([1, 0.5], inf),
    \rate, [1],
    \pan, Pwhite(-0.75, 0.75, inf),
    \out, ~reverbBus
).play(t);
15.5;
}
)
Pseries(0, 1/63, 64).asStream.nextN(64).mirror2;
(
// ~guitare1.stop;
// ~guitClusters2.stop;
~wobblyClusters = Task {
{
var waitValue = ~wobblyCluster.();
waitValue.wait;
}.loop;}.start(t);
)
~wobblyClusters.stop;
~foamClusters.stop;
~guitClusters2.stop;
~bassClusters.stop;
~guitClusters2.stop;