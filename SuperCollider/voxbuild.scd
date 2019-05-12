(
~voice = Buffer.read(s, "/Users/guillaumepelletier/Downloads/slackjaw vox.wav");
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
~minListB = 1;
~maxListB = 2;
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
