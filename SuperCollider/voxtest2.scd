(
SynthDef.new(\metro, {
    arg out, freq = 220, amp = 1, pan = 0, atk = 0.02, rel = 2;
    var sig, env;
//     rel = min(max(rel, 0.001), 10);
    env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    sig = LFTri.ar([freq, freq + 0.1]);
    sig = sig * env * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)

(
~metronome.stop;
~metronome = Pbind(
    \instrument, \metro,
    \dur, 1,
    \freq, Pseq([880, 440, 440, 440] * 2, inf),
    \rel, 0.1,
    \atk, 0.0001,
    \out, 0
).play(t, quant: 4);
)



(
SynthDef.new(\pulsemetro, {
    arg out;
    var sig, env;
    env = EnvGen.kr(Env.new([1, 0], [0.1]), doneAction: 2);
    sig = Pulse.ar(1) * 0.1;
    Out.ar(out, sig);
}).add;
)

(
~pulseMet.stop;
~pulseMet = Pbind(
    \instrument, \pulsemetro,
    \dur, 16 * 2,
    \out, ~pulseBus
//     \out, [0, ~pulseBus]
).play(t, quant: 4);
)
t.tempo_(55/60);

t.beatsPerBar;
t.bar;

// --------Build-up---------------------- //
(
// Lent build-up, un la soutenu
~buildVoice2.stop;
~buildVoice2 = Pbind(
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
    \spos, Pseq([0.13, 0.069].stutter(8), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \spos, Pseq([0.067, 0.069].stutter(8), inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \spos, Pseq([0.067, 0.0665, 0.069, 0.08].stutter(8), inf),
    \spos, Pseq([0.067, 0.0665, 0.0681, 0.0695].stutter(8), inf) + Pseq([0, 0.000], inf),
//     \spos, Pseq([0.067, 0.0665].stutter(1), inf),
    \rel, 0.35,
    \atk, 0.07,
    \rate, [1] * -8.midiratio  + Pwhite(0.001, 0.01, inf),
    \rate, 0.midiratio,
    \amp, 1 * Pseq([Pgeom(1, 1.1265, 8)], inf) * Pseq([1, 0.5], inf) * Pdefn(\buildAmp2, 1),
//     \amp, 8,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: 4);
)
~buildVoice2.stop;
Pdefn(\buildAmp2, 12);
Pdefn(\buildAmp3, 9);

, 0.124, 0.124

s.avgCPU;

(
~buildVoice2b.stop;
~buildVoice2b = Pbind(
    \instrument, \vox,
    \dur, 0.25,
    \spos, Pseq([0.111, 0.1119].stutter(4), inf),
    \spos, 0.0695 - 0.00025,
    \rel, 0.3,
    \atk, 0.001,
    \amp, 1 * Pseq([Pgeom(1, 1.1265, 16)], inf) * Pseq([1, 0.5], inf) * Pdefn(\buildAmp2, 1),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: 4);
)
~buildVoice2b.stop;









Pdefn(\buildAmp2, 4);

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
).play(t, quant: 4);
)
Pdefn(\buildAmp3, 6);
t.tempo * 60 / 4;
t.tempo_(55/60);
t = TempoClock.new;
t.tempo_(55 * 4/60);
t.tempo_(52 * 4/60);
t.tempo_(50 * 4/60);
t.tempo_(48 * 4/60);
t.tempo_(25 * 4/60);
t.tempo * 60/4;
t.tempo;
t.bar;
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
Pdefn(\buildAmp5, 6);

(
// ~poussiere.free;
~buildVoice2.stop;
~buildVoice3.stop;
~buildVoice4.stop;
~buildVoice5.stop;
)


(
Pdefn(\buildAmp2, 1);
Pdefn(\buildAmp3, 0.1);
Pdefn(\buildAmp4, 0.1);
Pdefn(\buildAmp5, 0.01);
Pdefn(\bassyAmp, 0.1);
~alt.setn(\altAmp, 0.45);
)