(
// Les recherches lentes, les ruisseaux nuiteux
// le long desquels on pense à Neptune
~shimmerNuits.stop;
~shimmerNuits = Pbind(
    \instrument, \guitare,
    \dur, 1 / 16 * 64 * 4,
    // En La majeur
    // Dmaj7, A, Dmaj7, Cm
    // IV, I, IV, iii
    \spos, Pseq([0.237, 0.2545, 0.237, 0.252].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.257].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.367].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.58, 0.365].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
        \spos, Pseq([0.365, 0.257].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.0235, 0.2545].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.0245, 0.2545].stutter(64), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.0545, 0.2545].stutter(64), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.0925, 0.2545].stutter(1), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.136, 0.252, 0.136, 0.776].stutter(1), inf) + Pwhite(0.001, 0.002, inf),
//     \spos, Pseq([ 0.0515, 0.141].stutter(64), inf) + Pwhite(0.001, 0.002, inf),
//      \spos, Pseq([0.912, 0.365].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    // \spos, Pseq([0.23].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),

    \rel, 6,
    \atk, 0.7,
    \rate, [1] * -12.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, Pseq([-4, -4, -6, -4].midiratio.stutter(1), inf),
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 26 * 1.5,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t);
)
