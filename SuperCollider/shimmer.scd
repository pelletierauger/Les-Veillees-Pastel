s.record;
s.stopRecording;
p.pop;
(
// Le chaud shimmer en Fa majeur
~shimmerD2.stop;
~shimmerD2 = Pbind(
    \instrument, \guitare,
    \dur, 1 / 16 * 4,
    // En La majeur
    // Dmaj7, A, Dmaj7, Cm
    // IV, I, IV, iii
    \spos, Pseq([0.237, 0.2545, 0.237, 0.252].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.2545].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    // \spos, Pseq([0.23].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),

    \rel, 0.1,
    \atk, 0.7,
    \rate, [1] * -12.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, -4.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 24,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~highPassBus
).play(t);
)
p.use({~melo = {[9, 4, 7, 16, 19, 4, 7, 9].midiratio.reverse.scramble * 1}});
(
~shimmerD3.stop;
~shimmerD3 = Pbind(
    \instrument, \guitare,
    \dur, 1 / 16,
    // En La majeur
    // Dmaj7, A, Dmaj7, Cm
    // IV, I, IV, iii
    \spos, Pseq([0.237, 0.2545, 0.237, 0.252].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.2545].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    // \spos, Pseq([0.23].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),

    \rel, 0.1,
    \atk, 0.7,
    \rate, [1] * -12.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, -16.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 8,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t);
)





(
// Le chaud shimmer en Fa majeur
~shimmerD2.stop;
~shimmerD2 = Pbind(
    \instrument, \guitare,
    \dur, 1 / 16,
    // En La majeur
    // Dmaj7, A, Dmaj7, Cm
    // IV, I, IV, iii
    \spos, Pseq([0.237, 0.2545, 0.237, 0.252].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.257].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.367].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.585].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    // \spos, Pseq([0.618].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    // \spos, Pseq([0.23].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),

    \rel, 0.1,
    \atk, 0.7,
    \rate, [1] * -12.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, -4.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 24,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t);
)

(
// Le chaud shimmer en Fa majeur
~shimmerD2.stop;
~shimmerD2 = Pbind(
    \instrument, \guitare,
    \dur, 1 / 16,
    // En La majeur
    // Dmaj7, A, Dmaj7, Cm
    // IV, I, IV, iii
    \spos, Pseq([0.237, 0.2545, 0.237, 0.252].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.257].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.367].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.58, 0.365].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    // \spos, Pseq([0.618].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    // \spos, Pseq([0.23].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),

    \rel, 0.1,
    \atk, 0.7,
    \rate, [1] * -12.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, -4.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 48,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t);
)




(
// Les recherches lentes, les ruisseaux nuiteux
// le long desquels on pense à Neptune
~shimmerD2.stop;
// p.use({~melo = {[9, 4, 7, 16, 19, 4, 7, 9].midiratio.reverse.scramble * 1}});
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
~buildVoice.stop;
~buildVoice2.stop;
~buildVoice3.stop;
~shimmerD2.stop;
~shimmerD2 = Pbind(
    \instrument, \guitare,
    \dur, 1 / 16 * 4,
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
    \spos, Pseq([0.141, 0.2545, 0.141, 0.2545].stutter(64), inf) + Pwhite(0.001, 0.002, inf),
//     \spos, Pseq([ 0.0515, 0.141].stutter(64), inf) + Pwhite(0.001, 0.002, inf),
//      \spos, Pseq([0.912, 0.365].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    // \spos, Pseq([0.23].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),

    \rel, 0.1,
    \atk, 0.7,
    \rate, [1] * -12.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, Pseq([-4, -4, -6, -4].midiratio.stutter(64), inf),
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 24,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~highPassBus
).play(t);
~shimmerD2.stop;
~sylv.setn(\levels, [9, 4, 7, 16, 19, 7, 4, 7, 9].midiratio.scramble * 0.5 * 2);
)



(
// Le surprenant shimmer strummy, citron et cuivre
~shimmerD2.stop;
~shimmerD2 = Pbind(
    \instrument, \guitare,
    \dur, 1 / 16,
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
//  Le grésillement en Fa majeur
    \spos, Pseq([0.2545, 0.335].stutter(64), inf) + Pwhite(0.001, 0.002, inf),
    \spos, Pseq([0.786, 0.335, 0.79, 0.2545].stutter(4), inf) + Pwhite(0.001, 0.002, inf),
//     \spos, Pseq([ 0.0515, 0.141].stutter(64), inf) + Pwhite(0.001, 0.002, inf),
//      \spos, Pseq([0.912, 0.365].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    // \spos, Pseq([0.23].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),

    \rel, 0.8,
    \atk, 0.7,
    \rate, [1] * -12.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, Pseq([-4, -4].midiratio.stutter(64), inf),
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 24,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~highPassBus
).play(t);
)