(
// 0.2, 0.5
var r = rrand(0, 0.95);
~vox1.stop;
~vox1 = Pbind(
    \instrument, \vox,
    \dur, 4/1,
    \spos, Pseq([Pwrand([0.2, 0.539],[0.75, 0.25]), 0.5], inf),
    \rel, 0.5,
    \amp, 8,
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~reverbBus
).play(t, quant: [4, 2]);
r;
)
(
~vox2.stop;
~vox2 = Pbind(
    \instrument, \vox,
    \dur, 4/1,
    \spos, Pseq([0.15, 0.35], inf),
    \rel, 1,
    \amp, 8,
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~limitBus
).play(t, quant: [4]);
)

(
~vox3.stop;
~vox3 = Pbind(
    \instrument, \vox,
    \dur, 16,
    \spos, Pseq([0.55, 0.57], inf),
    \rel, 2,
    \amp, 12,
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~reverbBus
).play(t, quant: [4]);
)