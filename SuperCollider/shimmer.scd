(
~guitare = Buffer.read(s, "/Users/guillaumepelletier/Desktop/Dropbox/Art/p5/Signes-Vitaux-3/SuperCollider/0001\ 7-Audio.aif");
SynthDef(\guitare, {
    arg buf = ~guitare, rate = 1, spos = 0, pan = 1, amp = 1, rel = 2, atk = 0.1, out = 0;
    var sig, env, lfo;
    env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    sig = PlayBuf.ar(2, ~guitare, rate * BufRateScale.ir(buf), startPos: spos * 7144448);
    sig = sig * env;
    sig = sig * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)

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
    \amp, 4,
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
// ~shimmerD2.stop;
// p.use({~melo = {[9, 4, 7, 16, 19, 4, 7, 9].midiratio.reverse.scramble * 1}});
// p.use({~sylv.free;});
// ~drone2.free;
// ~drone3.free;
// ~voxA2.stop;
// ~bass0.set(\gate, 0);
// ~bass1.set(\gate, 0);
// ~bass2.set(\gate, 0);
// ~voxA.stop;
// ~voxD.stop;
// ~voxSup.stop;
// ~buildVoice.stop;
// ~buildVoice2.stop;
// ~buildVoice3.stop;
// ~alt.free;
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
    \rate, Pseq([-4, -4, -6, -4].midiratio.stutter(64), inf) * 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 6,
    \pan, Pwhite(-0.5, 0.5, inf),
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, 0
).play(t, quant: [4]);
// ~shimmerD2.stop;
// ~shimmerD3.stop;
// ~shimmerD4.stop;
// ~sylv.setn(\levels, [9, 4, 7, 16, 19, 7, 4, 7, 9].midiratio.scramble * 0.5 * 2);
)



(
// Le surprenant shimmer strummy, citron et cuivre
~shimmerD3.stop;
~shimmerD3 = Pbind(
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






Pdefn(\bassyAmp, 1);

(
// Une petite basse se balance doucement
~shimmerD3.stop;
~shimmerD3 = Pbind(
    \instrument, \guitare,
    \dur, 2,
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
    \spos, Pseq([0.779, 0.1025, 0.779, 0.1225].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0),
    \spos, Pseq([0.779, 0.251].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0),
    \spos, Pseq([0.779].stutter(1), inf),
//     \spos, Pseq([Rest()] ++ (0.779!15), inf),
    \rel, 0.9,
    \atk, 0.001,
    \rate, [1] * -12.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, Pseq([-4, -4].midiratio.stutter(64), inf) * 1,
    \amp, Pseq([1, 0.5], inf) * 32 * Pdefn(\bassyAmp, 1) * 0.5,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: [4]);
)

(
// Quatre accords qui lancinent mais avancent
~shimmerD4.stop;
~shimmerD4 = Pbind(
    \instrument, \guitare,
    \dur, 16,
    \spos , Pseq([0.237, 0.2545, 0.237, 0.252].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
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
    \spos, Pseq([0.779, 0.1025, 0.779, 0.1225].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0),
//     \spos, Pseq([0.779, 0.251].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0),
//     \spos, Pseq([0.779].stutter(1), inf),
    \rel, 3.9,
    \atk, 0.001,
    \atk, Pseq([0.2, 0.001], inf),
    \rate, [1] * -12.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, Pseq([-4, -4].midiratio.stutter(64), inf) * 1,
    \amp, Pseq([0.6, 1, 0.6, 1], inf) * Pseq([1, 0.5], inf) * 8 * 8 * Pdefn(\bassyAmp, 1),
//     \amp, 24,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: [4]);
)



(
// Notes qui languissent
~shimmerD5.stop;
~shimmerD5 = Pbind(
    \instrument, \guitare,
    \dur, 16,
    \spos, Pseq([0.074, 0.05, 0.02], inf),
    \spos, Pseq([0.199], inf),
    \spos, Pseq([0.81, 0.85], inf),
    \rel, 5.9,
    \atk, 0.001,
    \rate, -4.midiratio,
    \amp, Pseq([1], inf) * 32 * Pdefn(\bassyAmp, 1),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: [4]);
)

(
// Notes qui languissent
~shimmerD6.stop;
~shimmerD4.stop;
~shimmerD6 = Pbind(
    \instrument, \guitare,
    \dur, 4,
    \spos, Pseq([0.074, 0.05, 0.02], inf),
    \spos, Pseq([0.1, 0.784, 0.091].stutter(4), inf),
    \spos, 0.199,
    \spos, Pseq([0.199, 0.25].stutter(4), inf),
    \rel, 2.2,
    \atk, 0.001,
    \rate, -4.midiratio,
    \amp, Pseq([1, 0.9, 0.8, 0.7], inf) * 64 * Pdefn(\bassyAmp, 1),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: [4]);
)


1 / 16 * 4 * 4 * 8 * 2;

(
// Quatre accords qui lancinent mais avancent
~shimmerPlateau.stop;
~shimmerPlateau = Pbind(
    \instrument, \guitare,
    \dur, 8,
    \spos, Pseq([0.779, 0.19925, 0.779, 0.25], inf),
    \rel, 2,
    \atk, 0.001,
    \rate, [1] * -12.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, Pseq([-4, -4].midiratio.stutter(64), inf) * 1,
    \amp, Pseq([0.5, 1, 0.5, 1], inf) * Pseq([1, 0.5], inf) * 8 * 8 * Pdefn(\bassyAmp, 1),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: [4]);
)


(
// Une petite basse se balance doucement
~shimmerD3Inv.stop;
~shimmerD3Inv = Pbind(
    \instrument, \guitare,
    \dur, 0.5,
    \spos, 0.787,
    \spos, Pseq([0.787, 0.789].stutter(16), inf),
    \rel, 0.1,
    \atk, 0.15,
//     \rate, [1] * -12.midiratio  + Pwhite(0.001, 0.01, inf),
//     \rate, Pseq([-4, -4].midiratio.stutter(64), inf) * 1,
    \rate, -4.midiratio * -1 * 2 * -12.midiratio,
    \amp, Pseq([1, 0.5], inf) * 32 * Pdefn(\bassyAmp, 1) * 1,
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~reverbBus
).play(t, quant: [4]);
)