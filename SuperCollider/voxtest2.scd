(
SynthDef.new(\metro, {
    arg out, freq = 220, amp = 1, pan = 0, atk = 0.02, rel = 2;
    var sig, env;
//     rel = min(max(rel, 0.001), 10);
    env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    sig = LFTri.ar([freq, freq + 0.1]);
    sig = sig * env * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)

(
~metronome.stop;
~metronome = Pbind(
    \instrument, \metro,
    \dur, 0.25,
    \freq, Pseq([880, 440, 440, 440] * 2, inf),
    \rel, 0.1,
    \atk, 0.0001,
    \out, 0
).play(t, quant: 1);
)
t.tempo_(55/60);

t.beatsPerBar;
t.bar;

// --------Build-up---------------------- //
(
// Lent build-up, un la soutenu
~buildVoice2.stop;
~buildVoice2 = Pbind(
    \instrument, \vox,
    \dur, 1 / 16 * 4,
    // En La majeur
    // Dmaj7, A, Dmaj7, Cm
    // IV, I, IV, iii
    \spos, Pseq([0.237, 0.2545, 0.237, 0.252].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    // \spos, ~har - ~loc + Pwhite(-0.0001, 0.0001, inf),
//     \rel, 1 / 128 * Pseq([Pgeom(0.5, 1.1, 4 * 16)], inf),
    \spos, Pseq([0.237 + 0.041].stutter(40) + 0.0125, inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    // \spos, Pseq([0.275].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
    \spos, Pseq([0.278].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
    \spos, Pseq([0.279].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),


    // Les intros lancinantes
    \spos, Pseq([0.065, 0.067].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \spos, Pseq([0.068, 0.069].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \spos, Pseq([0.13, 0.069].stutter(8), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \spos, Pseq([0.067, 0.069].stutter(8), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \spos, Pseq([0.067, 0.0665, 0.069].stutter(8), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \rel, 0.25,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, 2 * Pseq([Pgeom(1, 1.265, 8)], inf),
//     \amp, 8,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t, quant: 1);
)



(
// Lent build-up, un la soutenu
~buildVoice3.stop;
~buildVoice3 = Pbind(
    \instrument, \vox,
    \dur, 1 / 16 * 4,
    // En La majeur
    // Dmaj7, A, Dmaj7, Cm
    // IV, I, IV, iii
    \spos, Pseq([0.237, 0.2545, 0.237, 0.252].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    // \spos, ~har - ~loc + Pwhite(-0.0001, 0.0001, inf),
//     \rel, 1 / 128 * Pseq([Pgeom(0.5, 1.1, 4 * 16)], inf),
    \spos, Pseq([0.237 + 0.041].stutter(40) + 0.0125, inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    // \spos, Pseq([0.275].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
    \spos, Pseq([0.278].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
    \spos, Pseq([0.279].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),


    // Les intros lancinantes
    \spos, Pseq([0.065, 0.067].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \spos, Pseq([0.068, 0.069].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \spos, Pseq([0.13, 0.1305].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \rel, 0.25,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, 2 * Pseq([Pgeom(1, 1.265, 8)].stutter(4), inf),
//     \amp, 8,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t, quant: 1);
)