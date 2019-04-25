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
    arg gate = 1, atk = 5, rel = 10;
    var levels = Control.names(\levels).kr([0, 4, 7, 9, 11, 12, 0].scramble + Array.fill(7, {[-12, 0, 0].choose;}));
    var env = Env.step(levels, [1, 1, 2, 1, 1, 2, 2] * 0.05 * 8, releaseNode: 6, loopNode: 0);
    var envgen = EnvGen.kr(env);
    var envRel = EnvGen.ar(Env.new([0.0, 1.0, 0.00001], [atk, rel], [\linear, \exponential],1), gate, doneAction: 2);
    var freq = (envgen + 65 + 0).midicps;
    var oscF = SinOsc.kr(0.01, 0.5, 0.5) + 1 * 50000;
    var osc = (SinOsc.ar(16, 0.5, 0.5) * oscF).clip(0, 1.0);
    var osc2 = (SinOsc.ar(5, 0.5, 0.5) * 500).clip(0, 1.0);
    var sig = SinOsc.ar([freq + 1.1 + ((1 - osc) * 200), freq + 1 + ((1 - osc) * 200)] * 1.005 * 1) * LFTri.ar([freq, freq + 0.1]) * 0.1 * osc;
    var bigOsc = SinOsc.kr(0.1, 0.5, 0.5);
    var cAmp = Control.names(\altAmp).kr(1, 3) * 0.25;
    // sig = sig * (1 - osc2);
    // sig = (sig * 20).clip(-1.0, 1.0) * 0.1;
    sig = sig * bigOsc;
    HPF.ar(GVerb.ar(sig, 4, 10, 0.9) + Ringz.ar(sig, freq, mul:0.1) * cAmp * envRel, 175);
}.play;
)

~alt.free;
~alt.set(\gate, 0);
~alt.setn(\altAmp, 10);
(
t.sched(4, {
~alt.setn(\levels, [0, 4, 7, 9, 11, 12, 0].scramble + Array.fill(6, {[-12, 0, 12, 24].choose;}));
4;
});
)
~alt.setn(\levels, [0, 4, 7, 9, 11, 12, 0].scramble + Array.fill(6, {[-12, 0, 12].choose;}));
~alt.setn(\levels, [0, 4, 7, 9, 11, 12, 0].scramble + Array.fill(7, {[-12, 0, 0].choose;}));



(
~poussiere.free;
~poussiere = {
    arg gate = 1, atk = 5, rel = 10;
    var osc = SinOsc.kr(0.05, 0.5, 0.5).range(0.1, 5);
    var sig = Dust.ar([osc, osc], 0.5);
    var envRel = EnvGen.ar(Env.new([0.0, 1.0, 0.00001], [atk, rel], [\linear, \exponential],1), gate, doneAction: 2);
    var freq = 110 * -4.midiratio * 16;
    var res  = Ringz.ar(sig, freq * 0.25 * 7.midiratio, decaytime: 0.8, mul:0.2);
//         res = res + (CombN.ar(res, 0.1, 0.05, 6) * 0.4);
    res = res * 0.5 + Ringz.ar(sig, freq * 0.5, decaytime: 0.8, mul:0.2);
    res = LPF.ar(res * envRel, 1200);
    Out.ar(~reverbBus, res);
}.play();
)
~poussiere.free;
~poussiere.set(\gate, 0);