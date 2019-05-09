(
// ~voice = Buffer.read(s, "/Users/guillaumepelletier/Downloads/slackjaw vox.wav");
// ~voice.numFrames;
SynthDef(\vox, {
    arg buf = ~voice, rate = 1, spos = 0, pan = 1, amp = 1, rel = 2, atk = 0.1, out = 0, hpass = 50;
    var sig, env, lfo;
    env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    sig = PlayBuf.ar(2, ~voice, rate * BufRateScale.ir(buf), startPos: spos * 7481001);
    // sig = LPF.ar(sig, 7000);
    sig = HPF.ar(sig, hpass);
//     sig = sig + (Resonz.ar(sig, ~toFreq.("F5")) * 8);
//     sig = (Resonz.ar(sig, ~toFreq.("F5")) * 8);
    sig = sig * env;
    sig = sig * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)
~toFreq.("F6");
(
~voxA.stop;
~voxA = Pbind(
    \instrument, \vox,
    \dur, 0.25,
    \spos, 0.215,
// 0.05, 0.07, 0.09, 0.12, 0.15, 0.175, 0.19, 0.215, 0.225, 0.235, 
// 0.52, 0.53, 0.54, 0.565, 0.62, 0.64, 0.715, 
// 0.75, 0.78, 0.8, 0.83, 0.85, 0.87, 0.905, 0.91
    \rel, 4.0,
    \atk, 0.7,
    \amp, 3.5,
    \pan, Pwhite(-0.5, 0.5, 1),
    \out, ~reverbBus
).play(t);
)
Synth.new(\glitchVox, [\amp, 2.5, \spos, 0.3, \out, ~reverbBus, \rel, 8]);

s.avgCPU;

(
SynthDef(\glitchVox, {
    arg buf = ~voice, rate = 1, spos = 0, pan = 1, amp = 1, rel = 2, atk = 0.1, out = 0, hpass = 50;
    var sig, env, lfo, rate2;
    rate = FSinOsc.kr(XLine.kr(1, 0.2, 30), 0, 1, 0);
    rate2 = FSinOsc.kr(XLine.kr(1, 0.2, 30), pi, 1, 0);
    env = EnvGen.kr(Env.new([0.0001, 1, 0.0001], [atk, rel], [\exponential, \exponential]), doneAction: 2);
    sig = PlayBuf.ar(2, ~voice, [rate, rate2] * BufRateScale.ir(buf), startPos: spos * 7481001);
    // sig = LPF.ar(sig, 7000);
    sig = HPF.ar(sig, hpass);
//     sig = sig * SinOsc.kr(10, mul:0.5, add:0.5);
//     sig = sig + (Resonz.ar(sig, ~toFreq.("F5")) * 8);
//     sig = (Resonz.ar(sig, ~toFreq.("F5")) * 8);
    sig = sig * env;
    sig = sig * amp;
    sig = HPF.ar(sig, 1000);
    sig = GVerb.ar(sig) * 0.5;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)
















(
~voxB.stop;
~voxB = Pbind(
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

    // \spos, Pseq([0.285].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \rel, 0.5,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 4,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t);
)

(
~voxB.stop;
~voxB = Pbind(
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
    \spos, Pseq([0.285].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.3025].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.325, 0.329].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    // \spos, Pseq([0.35].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    // \spos, Pseq([0.285].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \rel, 0.5,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 4,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t);
)



(
~voxC.stop;
~voxC = Pbind(
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
    \spos, Pseq([0.285].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.3025].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.325, 0.329].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.35].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.35, 0.351].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),



    \spos, Pseq([0.355, 0.357].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.357, 0.362].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

// \spos, Pseq([0.285].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \rel, 2,
    \atk, 0.001,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 8 * 1,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t);
)




(
~voxD.stop;
~voxD = Pbind(
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
    \spos, Pseq([0.285].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.3025].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.325, 0.329].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.35].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.35, 0.351].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),



    \spos, Pseq([0.355, 0.357].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.364, 0.366].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.367, 0.372].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.372, 0.375, 0.3785, 0.3855].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

// \spos, Pseq([0.285].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \rel, 1,
    \atk, 0.001,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 8 * 1,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t);
)




(
~shimmerD2.stop;
p.use({~sylv.free;});
~drone2.free;
~drone3.free;
~voxA2.stop;
~bass0.set(\gate, 0);
~bass1.set(\gate, 0);
~bass2.set(\gate, 0);
~voxA.stop;
~voxD.stop;
~voxD = Pbind(
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
    \spos, Pseq([0.285].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.3025].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.325, 0.329].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.35].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.35, 0.351].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),



    \spos, Pseq([0.355, 0.357].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.364, 0.366].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.367, 0.372].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.372, 0.375, 0.3785, 0.3855].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.418, 0.42, 0.423, 0.428].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

// \spos, Pseq([0.285].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \rel, 0.5,
    \atk, 0.001,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 8 * 3,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t);
)





(
~voxD.stop;
~voxD = Pbind(
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
    \spos, Pseq([0.285].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.3025].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.325, 0.329].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.35].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.35, 0.351].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),



    \spos, Pseq([0.355, 0.357].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.364, 0.366].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.367, 0.372].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.372, 0.375, 0.3785, 0.3855].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.4925, 0.512].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.514, 0.515].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.52, 0.525].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),


    \spos, Pseq([0.5275, 0.525].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.532, 0.525].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.532, 0.5359].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.532, 0.5359, 0.539, 0.545].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

// \spos, Pseq([0.285].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \rel, 0.5,
    \atk, 0.01,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, Pseq(Pgeom(8, 0.8, 4).asStream.nextN(4), inf) * 0.5,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t);
)







(
~voxD.stop;
~voxD = Pbind(
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
    \spos, Pseq([0.285].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.3025].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.325, 0.329].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.35].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.35, 0.351].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),



    \spos, Pseq([0.355, 0.357].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.364, 0.366].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.367, 0.372].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.372, 0.375, 0.3785, 0.3855].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.4925, 0.512].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.514, 0.515].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.52, 0.525].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),


    \spos, Pseq([0.5275, 0.525].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.532, 0.525].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.532, 0.5359].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.532, 0.5359, 0.539, 0.545].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.539, 0.545, 0.585, 0.609].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    // \spos, Pseq([0.609, 0.611, 0.6425, 0.6659].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    // \spos, Pseq([0.667, 0.6675].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

// \spos, Pseq([0.285].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \rel, 0.5,
    \atk, 0.01,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, Pseq(Pgeom(8, 0.8, 4).asStream.nextN(4), inf) * 2,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t);
)








(
~voxD.stop;
~voxD = Pbind(
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
    \spos, Pseq([0.285].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.3025].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.325, 0.329].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.35].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.35, 0.351].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),



    \spos, Pseq([0.355, 0.357].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.364, 0.366].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.367, 0.372].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.372, 0.375, 0.3785, 0.3855].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.4925, 0.512].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.514, 0.515].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.52, 0.525].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),


    \spos, Pseq([0.5275, 0.525].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.532, 0.525].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.532, 0.5359].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.532, 0.5359, 0.539, 0.545].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    // \spos, Pseq([0.539, 0.545, 0.585, 0.609].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    // \spos, Pseq([0.609, 0.611, 0.6425, 0.6659].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    // \spos, Pseq([0.667, 0.6675, 0.668, 0.669, 0.67, 0.671].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

// \spos, Pseq([0.285].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \rel, 0.7,
    \atk, 0.01,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, Pseq(Pgeom(8, 0.8, 4).asStream.nextN(4), inf) * 1,
    // \amp, 8,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t);
)
Pgeom(8, 0.8, 4).asStream.nextN(4).reverse








(
// ~voice = Buffer.read(s, "/Users/guillaumepelletier/Downloads/slackjaw vox.wav");
// ~voice.numFrames;
SynthDef(\vox, {
    arg buf = ~voice, rate = 1, spos = 0, pan = 1, amp = 1, rel = 2, atk = 0.1, out = 0;
    var sig, env, lfo, env2;
    env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]));
    env2 = EnvGen.kr(Env.new([0, 1, 0], [atk * 8, rel * 8]), doneAction: 2);
    sig = PlayBuf.ar(2, ~voice, rate * BufRateScale.ir(buf), startPos: spos * 7481001);


    // sig = LPF.ar(sig, 7000);
//     sig = HPF.ar(sig, 2500);
    sig = sig * env;
    sig = sig * amp;
    sig = sig + (Resonz.ar(sig, ~toFreq.("F5")) * 8);
    sig = (Resonz.ar(sig, ~toFreq.("F5")) * 8);
    sig = sig * env2;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)