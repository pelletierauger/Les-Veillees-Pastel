
(
// Lent build-up, probablement un La soutenu
1 / 16 * 4;
~voxA.stop;
~voxA = Pbind(
    \instrument, \vox,
    \dur, 0.0625 * 0.5,
    \spos, Pseq([0.237, 0.2545, 0.237, 0.252].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.237 + 0.041].stutter(40) + 0.0125, inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    // \spos, Pseq([0.275].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
    \spos, Pseq([0.278].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
    \spos, Pseq([0.279].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),


    // Les intros lancinantes
    \spos, Pseq([0.065, 0.067].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \spos, Pseq([0.068, 0.069].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \spos, Pseq([0.073, 0.0735, 0.0745, 0.075, 0.076, 0.08, 0.085, 0.13].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \spos, Pseq([0.073, 0.0735, 0.0745, 0.075, 0.076, 0.08].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
        \spos, Pseq([0.073].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.015),
    \rel, 0.1,
    \atk, 0.1,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 24,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t);
)