
(
~buildVoiceA.stop;
~buildVoiceA = Pbind(
    \instrument, \vox,
    \dur, Pseq([0.5] * 2, inf),
    \spos, Pseq([0.2, 0.201, 0.3035, 0.5, 0.58, 0.24, 0.2414, 0.2415, 0.242, 0.244, 0.2445].stutter(8), inf),
    \spos, Pfunc(~calcPosA),
    \rel, Pdefn(\voxRelA, 0.3),
    \atk, Pdefn(\voxAtkA, 0.05),
    \amp, 3 * max(Pdefn(\voxFloorA, 0), Pseq(Pgeom(0.1, 1.15, 16).asStream.nextN(16).mirror2, inf)) * Pseq([1, 0.5, 0.5, 0.25], inf) * Pdefn(\voxAmpA, 1) * Pseq([1, 0.15], inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: [4, 2]);
)
~buildVoiceA.stop;
Pdefn(\voxRelA, 0.75);
Pdefn(\voxAtkA, 0.05);
Pdefn(\voxAmpA, 2);
Pdefn(\voxFloorA, 2.5);

(
~posListA = [0.073, 0.0735, 0.0745, 0.075, 0.076, 0.08];
~posListA = [0.2, 0.201, 0.3035, 0.5, 0.24, 0.2414, 0.2415, 0.242, 0.2445];
~minListA = 0;
~maxListA = 4;
~currentBeatA = 0;
~numBeatsA = 32;
~curInListA = ~minListA;
)
~posListA = [0.2, 0.229, 0.08, 0.076];
~curInListA;

(
~calcPosA = {
    var ret = ~posListA[~curInListA];
    ~currentBeatA = ~currentBeatA + 1;
    if (~currentBeatA == ~numBeatsA, {
        ~currentBeatA = 0;
        ~curInListA = ~curInListA + 1;
        if (~curInListA > ~maxListA, {
           ~curInListA = ~minListA;
        });
    });
    ret;
};
)
Pgeom(0.1, 1.25, 16).asStream.nextN(16);
(
~buildVoiceB.stop;
~buildVoiceB = Pbind(
    \instrument, \vox,
    \dur, Pseq([0.5] * 2, inf),
    \spos, Pseq([0.2, 0.201, 0.3035, 0.5, 0.58, 0.24, 0.2414, 0.2415, 0.242, 0.244, 0.2445].stutter(8), inf),
    \spos, Pfunc(~calcPosB),
    \rel, Pdefn(\voxRelB, 0.3),
    \atk, Pdefn(\voxAtkB, 0.05),
    \amp, 3 * max(Pdefn(\voxFloorB, 0), Pseq(Pgeom(0.1, 1.2, 16).asStream.nextN(16).mirror2, inf)) * Pseq([1, 0.5, 0.5, 0.25], inf) * Pdefn(\voxAmpB, 2) * Pseq([0.15, 1], inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: [4, 2]);
)
~buildVoiceB.stop;
Pdefn(\voxRelB, 0.75);
Pdefn(\voxAtkB, 0.05);
Pdefn(\voxAmpB, 4);
Pdefn(\voxFloorB, 2.5);

(
~posListB = [0.073, 0.0735, 0.0745, 0.075, 0.076, 0.08];
~posListB = [0.2, 0.201, 0.3035, 0.5, 0.24, 0.2414, 0.2415, 0.242, 0.2445];
~minListB = 2;
~maxListB = 3;
~currentBeatB = 0;
~numBeatsB = 32;
~curInListB = ~minListB;
~posListB = [0.2, 0.08, 0.076];
)
~curInListB;
~posListB = [0.2, 0.229, 0.69, 0.7, 0.72, 0.73];

(
~calcPosB = {
    var ret = ~posListB[~curInListB];
//     if (~currentBeat == 0, {
//         (~posList[~curInList]!4).postln;
//     });
//     ~currentBeat.postln;
    ~currentBeatB = ~currentBeatB + 1;
    if (~currentBeatB == ~numBeatsB, {
        ~currentBeatB = 0;
        ~curInListB = ~curInListB + 1;
        if (~curInListB > ~maxListB, {
           ~curInListB = ~minListB;
        });
    });
    ret;
};
)