(
~brindilles.set(\gate, 0);
~brindilles = {
    arg gate = 1, atk = 5, rel = 30;
    var levels = Control.names(\levels).kr([0, 4, 7, 9, 11, 2, 2].scramble + Array.fill(7, {[12].choose;}));
    var durations = Control.names(\durations).kr([1, 1, 2, 1, 1, 2, 2] * t.beatDur * 2);
    var env = Env.step(levels, durations, releaseNode: 6, loopNode: 0);
    var envgen = EnvGen.kr(env);
    var envRel = EnvGen.ar(Env.new([0.0, 1.0, 0.00001], [atk, rel], [\linear, \exponential],1), gate, doneAction: 2);
    var freq = (envgen + 65 + 0).midicps;
    var oscF = SinOsc.kr(0.01, 0.5, 0.5) + 1 * 50;
    var gEnv = EnvGen.kr(Env.step([16, 16, 16, 8, 32, 16].stutter(16).scramble, 1!96, 5, 0));
    var osc = (SinOsc.ar(gEnv, 0.5, 0.5) * oscF).clip(0, 1.0);
    var osc2 = (SinOsc.ar(LFNoise1.ar(2, 4, 4), 0.5, 0.5) * 500).clip(0, 1.0);
    var sig = LFSaw.ar([freq + 1.1 + ((1 - osc) * 20), freq + 1 + ((1 - osc) * 20)] * 1.005 * 1) * LFTri.ar([freq, freq + 0.1] * 1) * 0.1 * osc;
    var bigOsc = SinOsc.kr(0.1).range(0.5, 1);
    var cAmp = Control.names(\amp).kr(8, 3) * 0.125;
    // sig = sig * (1 - osc2);
    // sig = (sig * 20).clip(-1.0, 1.0) * 0.1;
    sig = sig * bigOsc;
    sig = HPF.ar(sig * cAmp * envRel, 175);
    Out.ar(~reverbBus, sig);
}.play;
)