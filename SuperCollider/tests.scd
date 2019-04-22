(
{
    var env = Env.step([0, -5, -7, -3, -7, -10, 0].reverse, [1, 1, 2, 1, 1, 2, 2] * 0.05, releaseNode: 6, loopNode: 0);
    var envgen = EnvGen.kr(env);
    var freq = (envgen + 70 + 5).midicps;
    var oscF = SinOsc.kr(0.01, 0.5, 0.5) + 1 * 5000;
    var osc = (SinOsc.ar(8, 0.5, 0.5) * oscF).clip(0, 1.0);
    var osc2 = (SinOsc.ar(5, 0.5, 0.5) * 500).clip(0, 1.0);
    var sig = SinOsc.ar([freq + 1.1 + ((1 - osc) * 200), freq + 1 + ((1 - osc) * 200)] * 1.005 * 1) * LFTri.ar([freq, freq + 0.1]) * 0.1 * osc;
    // sig = sig * (1 - osc2);
    // sig = (sig * 20).clip(-1.0, 1.0) * 0.1;
    HPF.ar(GVerb.ar(sig, 4, 10, 0.9) + Ringz.ar(sig, freq, mul:0.1) * 0.5, 175);
}.play;
)
(
~alt.free;
~alt = {
    var levels = Control.names(\levels).kr([0, 4, 7, 9, 11, 12, 0].reverse);
    var env = Env.step(levels, [1, 1, 2, 1, 1, 2, 2] * 0.05 * 1, releaseNode: 6, loopNode: 0);
    var envgen = EnvGen.kr(env);
    var freq = (envgen + 65 + 0).midicps;
    var oscF = SinOsc.kr(0.01, 0.5, 0.5) + 1 * 5000;
    var osc = (SinOsc.ar(8, 0.5, 0.5) * oscF).clip(0, 1.0);
    var osc2 = (SinOsc.ar(5, 0.5, 0.5) * 500).clip(0, 1.0);
    var sig = SinOsc.ar([freq + 1.1 + ((1 - osc) * 200), freq + 1 + ((1 - osc) * 200)] * 1.005 * 1) * LFTri.ar([freq, freq + 0.1]) * 0.1 * osc;
    var bigOsc = SinOsc.kr(0.1, 0.5, 0.5);
    // sig = sig * (1 - osc2);
    // sig = (sig * 20).clip(-1.0, 1.0) * 0.1;
    HPF.ar(GVerb.ar(sig, 4, 10, 0.9) + Ringz.ar(sig, freq, mul:0.1) * 0.75 * bigOsc, 175);
}.play;
)
~alt.free;
(
t.sched(4, {
~alt.setn(\levels, [0, 4, 7, 9, 11, 12, 0].scramble + Array.fill(6, {[-12, 0, 12, 24].choose;}));
4;
});
)
~alt.setn(\levels, [0, 4, 7, 9, 11, 12, 0].scramble + Array.fill(6, {[-12, 0, 12, 24].choose;}));