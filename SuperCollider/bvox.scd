(
~backvoice = Buffer.read(s, "/Users/guillaumepelletier/Downloads/slackjaw bv.wav");
// ~backvoice.numFrames;
SynthDef(\bvox, {
    arg buf = ~backvoice, rate = 1, spos = 0, pan = 1, amp = 1, rel = 2, atk = 0.1, out = 0;
    var sig, env, lfo;
    env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    sig = PlayBuf.ar(2, ~backvoice, rate * BufRateScale.ir(buf), startPos: spos * 7481001);
    sig = sig * env;
    sig = sig * amp;
    // sig = LPF.ar(sig, 7000);
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)

(
// many rhythms
~voxFin.stop;
~voxFin = Pbind(
    \instrument, \vox,
    \dur, 2 * 4,
    \spos, Pseq([0.887].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \rel, 5,
    \rel, Pseq([0.5], inf) * 4,
    \atk, 0.07,
    \rate, 0.midiratio,
    \amp, Pseq(Pgeom(8, 0.8, 4).asStream.nextN(4), inf) * 3 * Pseq([1, 0.75], inf),
    \amp, Pseq([20] * 1.75, inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t, quant: [1, 0.25] * 4);
)

(
// many rhythms bvox
~voxFin2.stop;
~voxFin2 = Pbind(
    \instrument, \bvox,
    \dur, 2 * 4,
    \spos, Pseq([0.6982].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \rel, 5,
    \rel, Pseq([0.5], inf) * 4,
    \atk, 0.07,
    \rate, 0.midiratio,
    \amp, Pseq(Pgeom(8, 0.8, 4).asStream.nextN(4), inf) * 5 * Pseq([1, 0.75], inf),
    \amp, Pseq([20] * 1.75, inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t, quant: [1, 0.25] * 4);
)

(
~voxAb.stop;
~voxFin.stop;
~voxFin2.stop;
~shimmerD2.stop;
~voxLento2.stop;
~voxLento3.stop;
~voxLento.stop;
~shimmerNuits.stop;
~sylv.set(\gate, 0);
)
