// --------Build-voice---------------------- //
(
~buildVoice2.stop;
~buildVoice2 = Pbind(
    \instrument, \vox,
    \dur, 0.5,
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
    \spos, Pseq([0.067, 0.0665, 0.069, 0.08].stutter(8), inf),
    \spos, Pseq([0.067, 0.0665, 0.069, 0.075].stutter(16), inf) + Pseq([Pseries(0, 0.0005, 16)], inf) + Pdefn(\buildPos, 0),
//     \spos, Pseq([0.067, 0.0665, 0.0681, 0.0695].stutter(8), inf) + Pseq([Pseries(0, 0.001, 16)], inf),
//     en mer
//     \spos, Pseq([0.162].stutter(1), inf) + Pseq([Pseries(0, 0.001 * 0.125, 24 * 4)], inf)
//      + (Pwhite(0.001, 0.002, inf) * 0.5),
//     \rel, 0.25,
    \rel, Pdefn(\buildRel, 0.025),
//     \atk, 0.07,
    \atk, Pdefn(\buildAtk, 0.07),
    \amp, 1 * Pseq([Pgeom(1, 1.1265, 8)], inf) * Pseq([1, 0.75], inf) * Pdefn(\buildAmpV2, 0.5),
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~reverbBus
).play(t, quant: [4, 2]);
)
Pdefn(\buildAmpV2, 2.25);
Pdefn(\buildRel, 0.25);
Pdefn(\buildAtk, 0.07);
Pdefn(\buildPos, 0.42);
Pdefn(\buildPos, 0.5);
Pdefn(\buildPos, 0.391);
~buildVoice2.stop;
Pdefn(\buildAmp2, 0.25);
Pdefn(\buildAmp3, 7);


(
~buildVoice2b.stop;
~buildVoice2b = Pbind(
    \instrument, \vox,
    \dur, Pseq([0.5], inf),
    \spos, Pseq([0.2, 0.201, 0.3035, 0.5, 0.58, 0.24, 0.2414, 0.2415, 0.242, 0.244, 0.2445].stutter(8), inf),
    \rel, 0.3,
    \atk, 0.005,
    \amp, 3 * Pseq([Pgeom(1, 1.1265, 16)], inf) * Pseq([1, 0.5, 0.5, 0.25], inf) * Pdefn(\buildAmp2, 1),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: [4, 2]);
)
~buildVoice2b.stop;




(
~buildVoice2b.stop;
~buildVoice2b = Pbind(
    \instrument, \vox,
    \dur, Pseq([0.5] * 2, inf),
    \spos, Pseq([0.2, 0.201, 0.3035, 0.5, 0.58, 0.24, 0.2414, 0.2415, 0.242, 0.244, 0.2445].stutter(8), inf),
    \spos, Pfunc(~calcPos),
    \rel, Pdefn(\buildVoiceRel, 0.3),
    \atk, Pdefn(\buildVoiceAtk, 0.05),
    \amp, 3 * Pseq([Pgeom(1, 0.95, 8)], inf) * Pseq([1, 0.5, 0.5, 0.25], inf) * Pdefn(\buildAmp2, 1) * Pseq([1, 0.15], inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: [4, 2]);
)
~buildVoice2b.stop;
Pdefn(\buildVoiceRel, 0.75);
Pdefn(\buildVoiceAtk, 0.05);
Pdefn(\buildAmp2, 3);

(
~posList = [0.073, 0.0735, 0.0745, 0.075, 0.076, 0.08];
~posList = [0.2, 0.201, 0.3035, 0.5, 0.24, 0.2414, 0.2415, 0.242, 0.2445];
~minList = 3;
~maxList = 8;
~currentBeat = 0;
~numBeats = 16;
~curInList = ~minList;
)
~posList = [0.2, 0.229, 0.08, 0.076];

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





(
~buildVoice3.stop;
~buildVoice3 = Pbind(
    \instrument, \vox,
    \dur, Pseq([0.5] * 2, inf),
    \spos, Pseq([0.2, 0.201, 0.3035, 0.5, 0.58, 0.24, 0.2414, 0.2415, 0.242, 0.244, 0.2445].stutter(8), inf),
    \spos, Pfunc(~calcPos2),
    \rel, Pdefn(\buildVoiceRel3, 0.3),
    \atk, Pdefn(\buildVoiceAtk3, 0.05),
    \amp, 3 * Pseq([Pgeom(1, 0.95, 8)], inf) * Pseq([1, 0.5, 0.5, 0.25], inf) * Pdefn(\buildAmp3, 2) * Pseq([0.15, 1], inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: [4, 2]);
)
~buildVoice3.stop;
Pdefn(\buildVoiceRel3, 0.75);
Pdefn(\buildVoiceAtk3, 0.05);
Pdefn(\buildAmp3, 4);

(
~posList2 = [0.073, 0.0735, 0.0745, 0.075, 0.076, 0.08];
~posList2 = [0.2, 0.201, 0.3035, 0.5, 0.24, 0.2414, 0.2415, 0.242, 0.2445];
~minList2 = 2;
~maxList2 = 3;
~currentBeat2 = 0;
~numBeats2 = 16;
~curInList2 = ~minList2;
)
~posList2 = [0.2, 0.229, 0.08, 0.076];

(
~calcPos2 = {
    var ret = ~posList2[~curInList2];
//     if (~currentBeat == 0, {
//         (~posList[~curInList]!4).postln;
//     });
//     ~currentBeat.postln;
    ~currentBeat2 = ~currentBeat2 + 1;
    if (~currentBeat2 == ~numBeats2, {
        ~currentBeat2 = 0;
        ~curInList2 = ~curInList2 + 1;
        if (~curInList2 > ~maxList2, {
           ~curInList2 = ~minList2;
        });
    });
    ret;
};
)
















(
// Lent build-up, un la soutenu
~buildVoice3.stop;
~buildVoice3 = Pbind(
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
    \spos, Pseq([0.13, 0.1305].stutter(1), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \spos, Pseq([0.1301, 0.1305].stutter(8), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \rel, 0.3,
    \atk, 0.09,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(1, 1.265, 8)].stutter(4), inf) * Pdefn(\buildAmp3, 1),
//     \amp, 8,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: [4, 2]);
)
Pdefn(\buildAmp3, 8);


(
t.schedAbs(t.nextBar + 0.25, {
~bass0 = Synth.new(\metro, [\freq, 110 * -4.midiratio * 1, \amp, 1, \out, 0, \rel, 4, \atk, 0.001, \pan, rrand(-0.5, 0.5)]);
}
);
)


(
~basse.stop;
~basse = Pbind(
    \instrument, \metro,
    \dur, Pseq([6, 2] * 2, inf),
    \freq, Pseq([55 * -4.midiratio, 55 * 3.midiratio] * 2, inf),
    \rel, Pseq([3.5, 1] * 2, inf),
    \atk, 0.0001,
    \amp, 2,
    \out, 0
).play(t, quant: 4);
)




(
~buildVoice4.stop;
~buildVoice4 = Pbind(
    \instrument, \vox,
    \dur, 1,
    \spos, Pseq([0.2005, 0.215].stutter(16), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
        \spos, Pseq([0.2005].stutter(16), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \rel, 0.75,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([Pgeom(10, 1.1, 16)], inf) * Pdefn(\buildAmp4, 1) * 0.25,
//  \amp, Pseq([Pgeom(10, 1.1, 16)], inf) * 1,
    \pan, Pwhite(-1.0, 1.0, inf),
    \pan, Pseq([-1, 1], inf),
    \out, 0
).play(t, quant: 4);
)
Pdefn(\buildAmp4, 3);



(
~buildVoice5.stop;
~buildVoice5 = Pbind(
    \instrument, \vox,
    \dur, 1,
    \spos, Pseq([0.2005].stutter(16), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \spos, Pseq([0.305, 0.202].stutter(2), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \rel, 0.5,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, Pseq([1, 0.5], inf) * Pseq([Pgeom(2, 1.12, 16)], inf) * Pdefn(\buildAmp5, 1) * 0.5,
//     \amp, 20,
    \pan, Pwhite(-1.0, 1.0, inf),
    \pan, Pseq([-1, 1], inf),
    \out, 0
).play(t, quant: 4);
)
Pdefn(\buildAmp5, 7);

(
// ~poussiere.free;
~buildVoice2.stop;
~buildVoice3.stop;
~buildVoice4.stop;
~buildVoice5.stop;
~mousse.set(\gate, 0);
~poussiere.set(\gate, 0);
~shimmerD3.stop;
~shimmerD4.stop;
~brindilles.set(\gate, 0);
)


(
Pdefn(\buildAmp2, 12 * 0.05);
Pdefn(\buildAmp3, 8 * 0.05);
Pdefn(\buildAmp4, 3 * 0.05);
Pdefn(\buildAmp5, 7 * 0.05);
Pdefn(\bassyAmp, 1 * 0.05);
~mousse.setn(\altAmp, 1 * 0.05);
~brindilles.setn(\altAmp, 1 * 0.05);
)