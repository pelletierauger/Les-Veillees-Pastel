(
~backvoice = Buffer.read(s, "/Users/guillaumepelletier/Downloads/slackjaw bv.wav");
// ~backvoice.numFrames;
SynthDef(\bvox, {
    arg buf = ~backvoice, rate = 1, spos = 0, pan = 1, amp = 1, rel = 2, atk = 0.1, out = 0;
    var sig, env;
    env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    sig = PlayBuf.ar(2, ~backvoice, rate * BufRateScale.ir(buf), startPos: spos * 7481001);
    sig = sig * env * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)

(
// many rhythms
~voxFinA.stop;
~voxFinA = Pbind(
    \instrument, \vox,
    \dur, 8,
    \spos, 0.887 + (Pwhite(0.001, 0.002, inf) * 0.15),
    \rel, 2,
    \atk, 0.07,
    \amp, 14 * Pdefn(\finA, 0.125),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~limitBus
).play(t, quant: [4, 1]);
)
Pdefn(\finA, 0.125);

(
// many rhythms bvox
~voxFinB.stop;
~voxFinB = Pbind(
    \instrument, \bvox,
    \dur, 8,
    \spos, 0.6982 + (Pwhite(0.001, 0.002, inf) * 0.15),
    \rel, 2,
    \atk, 0.07,
    \amp, 14 * Pdefn(\finB, 0.125),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~limitBus
).play(t, quant: [4, 1]);
)
Pdefn(\finB, 0.125)




(
Pdefn(\finA, 1 * 1.0);
Pdefn(\finA, 1 * 1.0);
Pdefn(\lentoB, 1 * 1.0);
Pdefn(\lentoB, 1 * 1.0);
Pdefn(\lentoB, 1 * 1.0);
Pdefn(\voxAmpA, 3 * 1.0);
Pdefn(\voxAmpB, 3 * 1.0);
Pdefn(\shimmerAmp, 1 * 1.0);
Pdefn(\nuitsAmp, 1 * 1.0);
)



(
~voxAbc.stop;
~voxFin.stop;
~voxFin2.stop;
~shimmerD2.stop;
~voxLento2.stop;
~voxLento3.stop;
~voxLento.stop;
~shimmerNuits.stop;
~sylv.set(\gate, 0);
)
