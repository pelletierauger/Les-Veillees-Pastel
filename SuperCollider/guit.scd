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