(
~voxAdif.stop;
~voxAdif = Pbind(
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

    \spos, Pseq([0.285, 0.2].stutter(8), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.195, 0.2].stutter(8), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \rel, 0.2,
    \rel, Pseq(Pgeom(0.2, 1.32, 8).asStream.nextN(8), inf),
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 10,
    \amp, Pseq(Pgeom(2.5, 0.9, 8).asStream.nextN(8), inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t);
)

Pgeom(0.2, 1.25, 8).asStream.nextN(8)[7];