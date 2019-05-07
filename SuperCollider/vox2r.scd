

(
~voxA.stop;
~voxA = Pbind(
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
    \spos, Pseq([0.072, 0.073].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),


    \rel, 0.5,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 8,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t);
)

(
~voxA2.stop;
~voxA2 = Pbind(
    \instrument, \vox,
    \dur, 1 / 16 * 4 * 4,
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

    // \spos, Pseq([0.068, 0.069].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    // \spos, Pseq([0.072, 0.073].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),


    // Les lancinements avancent et se construisent
    // \spos, Pseq([0.074, 0.076].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    // \spos, Pseq([0.095, 0.097].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    // \spos, Pseq([0.129, 0.1318, 0.133, 0.135].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    // peut-être
    \spos, Pseq([0.2005, 0.215].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    // \spos, Pseq([0.2, 0.305].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),


    \rel, 0.5,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 20,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t, quant: 4);
t.schedAbs(t.nextBar + 0.25, {

~bass0 = Synth.new(\simplest, [\freq, ~toFreq.("F2"), \amp, 8, \out, 0, \rel, 5, \atk, 0.1, \pan, rrand(-0.5, 0.5)]);
~bass1 = Synth.new(\simplest, [\freq, ~toFreq.("A3") * 0.midiratio, \amp, 3, \out, 0, \rel, 5, \pan, rrand(-0.5, 0.5)]);
~bass2 = Synth.new(\simplest, [\freq, ~toFreq.("C3"), \amp, 2, \out, 0, \rel, 5, \atk, 0.1, \pan, rrand(-0.5, 0.5)]);

});
// ~drone2 = {
//     var sig, index, index2, fond;
//     fond = ~toFreq.("F2");
//     index = SinOsc.ar(fond) * SinOsc.kr(0.1, mul:0.5, add:0.5).range(0.25, 1);
//     index2 = SinOsc.ar(fond + 0.1) * SinOsc.kr(0.11, mul:0.5, add:0.5).range(0.25, 1);
//     sig = Shaper.ar(~b.bufnum, [index, index2]) * 0.5;
//     // sig = sig * LFSaw.ar([fond + 0.1, fond] * 4);
//     // sig = sig + Shaper.ar(~b.bufnum, index2) * 0.5;
//     sig = LeakDC.ar(sig * 0.4);
// }.play;
// ~drone3 = {
//     var sig, index, index2, fond;
//     fond = ~toFreq.("F3");
//     index = SinOsc.ar(fond) * SinOsc.kr(0.1, mul:0.5, add:0.5).range(0.25, 1);
//     index2 = SinOsc.ar(fond + 0.1) * SinOsc.kr(0.11, mul:0.5, add:0.5).range(0.25, 1);
//     sig = Shaper.ar(~b.bufnum, [index, index2]) * 0.5;
//     // sig = sig * LFSaw.ar([fond + 0.1, fond] * 4);
//     // sig = sig + Shaper.ar(~b.bufnum, index2) * 0.5;
//     sig = LeakDC.ar(sig * 0.1);
// }.play;
)
(
~drone2.free;
~drone3.free;
~voxA2.stop;
~bass0.set(\gate, 0);
~bass1.set(\gate, 0);
~bass2.set(\gate, 0);
)
~bass1.set(\freq, ~toFreq.("A3") * 0.midiratio);


(
~shimmerD3.stop;
~shimmerD3 = Pbind(
    \instrument, \guitare,
    \dur, 1 / 16,
    // En La majeur
    // Dmaj7, A, Dmaj7, Cm
    // IV, I, IV, iii
    \spos, Pseq([0.237, 0.2545, 0.237, 0.252].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    // \spos, ~har - ~loc + Pwhite(-0.0001, 0.0001, inf),
//     \rel, 1 / 128 * Pseq([Pgeom(0.5, 1.1, 4 * 16)], inf),
    \spos, Pseq([0.237 + 0.041].stutter(40) + 0.0125, inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
    \rel, 0.1,
    \atk, 0.7,
    \rate, [1] * -7.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, -16.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, 4 * 1,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t);
)






// --------Build-up---------------------- //
(
// Lent build-up, un la soutenu
~buildVoice.stop;
~buildVoice = Pbind(
    \instrument, \vox,
    \dur, 1 / 16 * 4 * 4,
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
    \spos, Pseq([0.073, 0.0735, 0.0745, 0.075, 0.076, 0.08, 0.085, 0.13].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \spos, Pseq([0.073, 0.0735, 0.0745, 0.075, 0.076, 0.08].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
        \spos, Pseq([0.073].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \spos, Pfunc(~calcPos),
    \rel, 0.5  * Pseq([Pgeom(1, 1.1, 4)], inf),
//     \rel, 0.5,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, Pdefn(\buildAmp, 1) * Pseq([Pgeom(1, 1.1, 8)], inf),
//     \amp, Pdefn(\buildAmp, 1),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t, quant: 4);
)
~buildVoice.stop;

~sylv.setn(\levels, [9, 4, 7, 16, 19, 7, 4, 7, 9].midiratio.scramble * 0.5 * 2);
p.use({~melo = {[9, 4, 7, 16, 19, 4, 7, 9].midiratio.reverse.scramble * 0.5}});
Pdefn(\buildAmp, 10);
(
~posList = [0.073, 0.0735, 0.0745, 0.075, 0.076, 0.08];
~minList = 4;
~maxList = 5;
~currentBeat = 0;
~numBeats = 8;
~curInList = ~minList;
)

(
~calcPos = {
    var ret = ~posList[~curInList];
//     if (~currentBeat == 0, {
//         (~posList[~curInList]!4).postln;
//     });
//     ~currentBeat.postln;
    ~currentBeat = ~currentBeat + 1;
    if (~currentBeat == ~numBeats, {
        ~currentBeat = 0;
        ~curInList = ~curInList + 1;
        if (~curInList > ~maxList, {
           ~curInList = ~minList;
        });
    });
    ret;
};
)


// ------------------------------- //





// Lenteur, lenteur

1 / 16 * 8 * 4;
(
~voxAbc.stop;
~voxAbc = Pbind(
    \instrument, \vox,
    \dur, 1 / 16 * 8 * 4,
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

    \spos, Pseq([0.231, 0.295].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \rel, 0.5,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, Pseq(Pgeom(8, 0.8, 4).asStream.nextN(4), inf) * 1,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: [4]);
)


(
~voxLento.stop;
~voxLento = Pbind(
    \instrument, \vox,
    \dur, 1 / 16 * 8,
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

    \spos, Pseq([0.315, 0.32, 0.315, 0.319].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \rel, 0.85,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, Pseq(Pgeom(8, 0.8, 4).asStream.nextN(4), inf) * 2,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t, quant: [1, 0.25]);
)


(
~voxLento2.stop;
~voxLento2 = Pbind(
    \instrument, \vox,
    \dur, 1 / 16 * 8 * 4,
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

    \spos, Pseq([0.5, 0.531].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \rel, 0.5,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, Pseq(Pgeom(8, 0.8, 4).asStream.nextN(4), inf) * 1,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: [4, 1]);
)


(
~voxLento2.stop;
~voxLento2 = Pbind(
    \instrument, \vox,
    \dur, 1 / 16 * 8,
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

    \spos, Pseq([0.62].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \rel, 0.25,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, Pseq(Pgeom(8, 0.8, 4).asStream.nextN(4), inf) * 4,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t, quant: [1, 0.25]);
)


(
~voxLento2.stop;
~voxLento2 = Pbind(
    \instrument, \vox,
    \dur, 1 / 16 * 8,
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

    \spos, Pseq([0.62, 0.889].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \rel, 0.25,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, Pseq(Pgeom(8, 0.8, 4).asStream.nextN(4), inf) * 4,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t, quant: [1, 0.25]);
)



(
~voxLento3.stop;
~voxLento3 = Pbind(
    \instrument, \vox,
    \dur, 1 / 16 * 8 * 4,
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

    \spos, Pseq([0.88, 0.89].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \rel, 0.5,
    \rel, Pseq([0.5, 0.75], inf),
    \atk, 0.07,
    \rate, 0.midiratio,
    \amp, Pseq(Pgeom(8, 0.8, 8).asStream.nextN(8), inf) * 1 * Pseq([1, 0.25], inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: [1, 0.25] * 4);
)



(
~voxLento2.stop;
~voxLento2 = Pbind(
    \instrument, \vox,
    \dur, 1 / 16 * 8,
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

    \spos, Pseq([0.88, 0.82].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \rel, 0.5,
    \rel, Pseq([0.5, 0.75], inf) * 2,
    \atk, 0.07,
    \rate, 0.midiratio,
    \amp, Pseq(Pgeom(8, 0.8, 8).asStream.nextN(8), inf) * 2 * Pseq([1, 0.75], inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t, quant: [1, 0.25]);
)



(
// many new rhythms
~voxFin.stop;
~voxFin = Pbind(
    \instrument, \vox,
    \dur, 2,
    \spos, Pseq([0.887].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \rel, 5,
    \rel, Pseq([0.5], inf) * 4,
    \atk, 0.07,
    \rate, 0.midiratio,
    \amp, Pseq(Pgeom(8, 0.8, 4).asStream.nextN(4), inf) * 3 * Pseq([1, 0.75], inf),
    \amp, Pseq([20], inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t, quant: [1, 0.25]);
)



(
~voxFin2.stop;
~voxFin2 = Pbind(
    \instrument, \vox,
    \dur, 2,
    \spos, Pseq([0.19].stutter(4), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \rel, 5,
    \rel, Pseq([0.5], inf) * 4,
    \atk, 0.07,
    \rate, 0.midiratio,
    \amp, Pseq(Pgeom(8, 0.8, 4).asStream.nextN(4), inf) * 3 * Pseq([1, 0.75], inf),
    \amp, Pseq([30], inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t, quant: [1, 0.25]);
)










// Lenteur, lenteur

1 / 16 * 8 * 4;
(
~voxAc.stop;
~voxAc = Pbind(
    \instrument, \vox,
    \dur, 1 / 16 * 8 * 4,
    // En La majeur
    // Dmaj7, A, Dmaj7, Cm
    // IV, I, IV, iii
    \spos, Pseq([0.237, 0.2545, 0.237, 0.252].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    // \spos, ~har - ~loc + Pwhite(-0.0001, 0.0001, inf),
//     \rel, 1 / 128 * Pseq([Pgeom(0.5, 1.1, 4 * 16)], inf),
    \spos, Pseq([0.237 + 0.041].stutter(40) + 0.0125, inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    // \spos, Pseq([0.275].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
    \spos, Pseq([0.278].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
//     \spos, Pseq([0.279].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.295, 0.293].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

//     \spos, Pseq([0.295, 0.28, 0.283].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \spos, Pseq([0.285, 0.2732].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

//     \spos, Pseq([0.78].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \rel, 0.75,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, Pseq(Pgeom(8, 0.8, 4).asStream.nextN(4), inf) * 0.125,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, 0
).play(t, quant: [4]);
)



(
~voxAb.stop;
~voxAb = Pbind(
    \instrument, \vox,
    \dur, 1 / 16 * 8,
    // En La majeur
    // Dmaj7, A, Dmaj7, Cm
    // IV, I, IV, iii
    \spos, Pseq([0.237, 0.2545, 0.237, 0.252].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    // \spos, ~har - ~loc + Pwhite(-0.0001, 0.0001, inf),
//     \rel, 1 / 128 * Pseq([Pgeom(0.5, 1.1, 4 * 16)], inf),
    \spos, Pseq([0.237 + 0.041].stutter(40) + 0.0125, inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    // \spos, Pseq([0.275].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
    \spos, Pseq([0.278].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
//     \spos, Pseq([0.279].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.295, 0.293].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

//     \spos, Pseq([0.295, 0.28, 0.283].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \spos, Pseq([0.285, 0.2732].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \spos, Pseq([Pseries(0.787, 0.0002, 16)], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \spos, Pseq([Pseries(0.782, 0.0002, 16)], inf) + Pseq([0, 0.005], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \spos, Pseq([Pseries(0.785, 0.001, 16)], inf) + Pseq([0, 0.005], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \spos, Pseq([Pseries(0.83, 0.001, 16)], inf) + Pseq([0, 0.005], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

//     \spos, Pseq([Pseries(0.85, 0.001, 16)], inf) + Pseq([0, 0.005], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

//     \spos, Pseq([Pseries(0.87, 0.001, 16)], inf) + Pseq([0, 0.005], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

// souffle premier
    \spos, Pseq([Pseries(0.91, 0.001, 16)], inf) + Pseq([0, 0.005], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

//     \spos, Pseq([Pseries(0.91, 0.001 * 0.5, 32)], inf) + Pseq([0, -0.06], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
//     \spos, Pseq([Pseries(0.91, 0.001 * 0.25, 64)], inf) + Pseq([0, -0.06], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),


    \rel, 0.08,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, Pseq(Pgeom(8, 0.95, 32).asStream.nextN(32), inf) * 0.75,
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, 0
).play(t, quant: [4]);
)





(
~voxAd.stop;
~voxAd = Pbind(
    \instrument, \vox,
    \dur, 1 / 16 * 8,
    // En La majeur
    // Dmaj7, A, Dmaj7, Cm
    // IV, I, IV, iii
    \spos, Pseq([0.237, 0.2545, 0.237, 0.252].stutter(4 * 16), inf) + Pwhite(0.001, 0.002, inf),
    // \spos, ~har - ~loc + Pwhite(-0.0001, 0.0001, inf),
//     \rel, 1 / 128 * Pseq([Pgeom(0.5, 1.1, 4 * 16)], inf),
    \spos, Pseq([0.237 + 0.041].stutter(40) + 0.0125, inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    // \spos, Pseq([0.275].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
    \spos, Pseq([0.278].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),
//     \spos, Pseq([0.279].stutter(40), inf) + (Pwhite(0.001, 0.002, inf) * 0.5),

    \spos, Pseq([0.295, 0.293].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

//     \spos, Pseq([0.295, 0.28, 0.283].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \spos, Pseq([0.285, 0.2732].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \spos, Pseq([Pseries(0.787, 0.0002, 16)], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \spos, Pseq([Pseries(0.782, 0.0002, 16)], inf) + Pseq([0, 0.005], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \spos, Pseq([Pseries(0.785, 0.001, 16)], inf) + Pseq([0, 0.005], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \spos, Pseq([Pseries(0.83, 0.001, 16)], inf) + Pseq([0, 0.005], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

//     \spos, Pseq([Pseries(0.85, 0.001, 16)], inf) + Pseq([0, 0.005], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

//     \spos, Pseq([Pseries(0.87, 0.001, 16)], inf) + Pseq([0, 0.005], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

//     \spos, Pseq([Pseries(0.91, 0.001, 16)], inf) + Pseq([0, 0.005], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \spos, Pseq([Pseries(0.8, 0.001, 16)], inf) + Pseq([0, 0.05], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

//     beau, beau, beau
    \spos, Pseq([Pseries(0.5, 0.001, 16)], inf) + Pseq([0, 0.02], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

//     \spos, Pseq([Pseries(0.71, 0.001, 32)], inf) + Pseq([0, -0.05], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

//     \spos, Pseq([Pseries(0.55, 0.001, 32)], inf) + Pseq([0, -0.05], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
//     \spos, Pseq([Pseries(0.1, 0.003, 16)], inf) + Pseq([0, 0.2], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

//     \spos, Pseq([Pseries(0.2, 0.003, 16)], inf) + Pseq([0, 0.2], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

// belles vagues
//     \spos, Pseq([Pseries(0.2, 0.003, 64)], inf) + Pseq([0, 0.2], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

// plus de belles vagues
//     \spos, Pseq([Pseries(0.2, 0.003, 64 + 16)], inf) + Pseq([0, 0.2], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),


//     \spos, Pseq([Pseries(0.2, 0.003, 64 + 16)], inf) + Pseq([0.3, 0.2], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

//     \spos, Pseq([Pseries(0.4, 0.001, 64 + 16)], inf) + Pseq([0.1, 0.2], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

// plateaux reposants
//     \spos, Pseq([Pseries(0.9, -0.003, 64 + 16)], inf) + Pseq([0, 0.2], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
//     \spos, Pseq([Pseries(0.9, -0.001, 64 + 16)], inf) + Pseq([0, 0.2], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
// assez repos
//     \spos, Pseq([Pseries(0.85, -0.001, 32)], inf) + Pseq([0, 0.2], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
//     \spos, Pseq([Pseries(0.72, -0.001, 32)], inf) + Pseq([0, 0.2], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
//     \spos, Pseq([Pseries(0.65, -0.001, 32)], inf) + Pseq([0, 0.2], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
//     \spos, Pseq([Pseries(0.42, 0.002, 32)], inf) + Pseq([0.1, 0.2], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),



    \rel, 0.08,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio * 1,
    \amp, Pseq([Pgeom(0.5, 1.065, 4 * 16)], inf) * 0.5,
    \amp, Pseq(Pgeom(8, 0.9, 16).asStream.nextN(16), inf) * 1.5 * 0.5,
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, 0
).play(t, quant: [4]);
)




// VOX CLOUD

(
// ~voxAb.stop;
~voxAb = Pbind(
    \instrument, \vox,
    \dur, 0.5,
    \spos, Pseq([Pseries(0.91, 0.001, 16)], inf) + Pseq([0, 0.005], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
//     \spos, Pseq([Pseries(0.5, 0.001, 16)], inf) + Pseq([0, 0.02], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),

    \rel, 0.08,
    \atk, 0.07,
    \amp, Pseq(Pgeom(8, 0.95, 32).asStream.nextN(32), inf)
        * 2 * Pseq(Pseries(0, 0.01, 100).asStream.nextN(100).mirror, 1),
    \pan, Pwhite(-1.0, 1.0, inf),
    \hpass, Pseq(Pseries(50, 20, 200).asStream.nextN(199), 199),
    \out, ~reverbBus
).play(t, quant: [1]);
)
9000/200;
Pseries(0, 0.01, 100).asStream.nextN(100).mirror.size;
s.avgCPU;