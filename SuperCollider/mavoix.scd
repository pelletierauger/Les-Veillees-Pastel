(
// t = TempoClock.new;
// t.tempo_(50/60);
~moi = Buffer.read(s, "/Users/guillaumepelletier/Desktop/Dropbox/Création musicale/Projets Ableton Live/By Mobile Bay Project/Samples/Recorded/0001 7-Audio.aif");
~moi.numFrames;
SynthDef(\mavoix, {
    arg buf = ~moi, rate = 1, spos = 0, pan = 1, amp = 1, rel = 2, atk = 0.1, out = 0;
    var sig, env, lfo;
    env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    sig = PlayBuf.ar(1, ~moi, rate * BufRateScale.ir(buf), startPos: spos * 1887979)!2;
    sig = sig * env;
    sig = sig * amp;
    // sig = LPF.ar(sig, 7000);
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)


(
~maVox.stop;
~maVox = Pbind(
    \instrument, \mavoix,
    \dur, 1 / 16 * 8,
    \spos, Pseq([0.14].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
    \spos, Pseq([0.16, 0.17].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
     \spos, Pseq([0.19, 0.25].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
     \spos, Pseq([0.6, 0.8].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
    \rel, 1.7,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 2.5,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t);
)


(
~maVox2.stop;
~maVox2 = Pbind(
    \instrument, \mavoix,
    \dur, 1 / 16 * 8,
    \spos, Pseq([0.14].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
    // \spos, Pseq([0.16, 0.17].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
    // \spos, Pseq([0.19, 0.25].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
    \rel, 1.7,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 2.5,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t);
)