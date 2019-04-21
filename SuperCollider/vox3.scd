(
~shimmerD2.stop;
// p.use({~sylv.free;});
~drone2.free;
~drone3.free;
~voxA2.stop;
~bass0.set(\gate, 0);
~bass1.set(\gate, 0);
~bass2.set(\gate, 0);
~voxA.stop;
~voxD.stop;
~voxSup.stop;
)
(
~voxSup.stop;
~voxSup = Pbind(
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
    // \spos, Pseq([0.278].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
    // \spos, Pseq([0.279].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),


    // Les intros lancinantes
    \spos, Pseq([0.065, 0.067].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

//     \spos, Pseq([0.068, 0.069].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
//     \spos, Pseq([0.072, 0.073].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),


    // Les lancinements avancent et se construisent
//     \spos, Pseq([0.074, 0.076].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

//     \spos, Pseq([0.095, 0.097].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \spos, Pseq([0.129, 0.1318, 0.133, 0.135].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    // peut-être
    \spos, Pseq([0.2005, 0.215].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
//     \spos, Pseq([0.2, 0.305].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \spos, Pseq([0.325, 0.2005, 0.215].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \spos, Pseq([0.325, 0.2005, 0.1765, 0.197].stutter(2), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    
//  éclosion
    \spos, Pseq([0.325, 0.3239].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
//  recherches sup
//     \spos, Pseq([0.325, 0.3239, 0.2784].stutter(2), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    
    \rel, 0.35,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, Pseq([10, 7] * 2, inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t);
)