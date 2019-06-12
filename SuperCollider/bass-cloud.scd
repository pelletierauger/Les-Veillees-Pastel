(
SynthDef.new(\basschirp, {
    arg out, freq = 220, lon = 3, amp = 1, pan = 0, atk = 2, rel = 2, freqOsc = 6, triMod = 0.5, dec = 0.2, low = 200;
    var sig, sig2, env, osc, osc2, loopEnv, loopEnv2, linPass, panFlip;
    panFlip = [[0, 1], [1, 0]].choose;
    osc = LFTri.ar(freqOsc, mul: 0.5, add:0.5);
    osc2 = LFTri.ar(1, pi, mul: 0.5, add:0.5);
    loopEnv = EnvGen.kr(Env.circle([0, 1, 0], [0.01, dec, 0.1 * freqOsc]));
    loopEnv2 = EnvGen.kr(Env.circle([1, 1.1, 1], [0.01, dec, 0.1 * freqOsc]));
    env = EnvGen.kr(Env.new([0.00001, 1, 0.00001], [atk, rel], curve: 'exp'), doneAction: 2);
    sig = SinOsc.ar([freq, freq + 0.1]) * 0.1;
    sig = sig + (LFTri.ar([freq + 0.2, freq + 0.1] * 1, pi) * 0.02);
    sig = sig * env * amp;
    sig = (sig * loopEnv) * (1 + LFTri.ar([freq + 1.1, freq + 1] * 1.001 * triMod, mul: loopEnv * 1));
//     sig = sig + (sig * LFTri.ar([freq + 0.1, freq + 0.2] * 1.01) * 0.25);
    linPass = XLine.kr(low, 6000, atk + rel * 0.5);
    sig = LPF.ar(sig, linPass) * 4;
    sig = HPF.ar(sig, 250);
    sig = Balance2.ar(sig[panFlip[0]], sig[panFlip[1]], pan, 1);
    Out.ar(out, sig);
}).add;
)
(
~bassCluster = {
Synth.new(\basschirp, [\freq, ~toFreq.("F2") * [2,4].choose * [0, 4, 7, 12].choose.midiratio, \amp, 4.7, \out, ~reverbBus, \rel, 20, \pan, rrand(0.0, 2.0) - 1, \freqOsc, rrand(0.1, 0.5) * 0.25, \triMod, 0.5, \dec, rrand(0.2, 0.3) * [0.5, 0.5, 1].choose, \low, rrand(200, 800)]);
Synth.new(\basschirp, [\freq, ~toFreq.("F2") * [2,4].choose * [4, 9, 11, 19].choose.midiratio, \amp, 4.7, \out, ~reverbBus, \rel, 20, \pan, rrand(0.0, 2.0) - 1, \freqOsc, rrand(0.1, 0.5) * 0.25, \triMod, 1, \dec, rrand(0.2, 0.3) * [0.5, 0.5, 1].choose, \low, rrand(200, 800)]);
[2, 4, 6].choose;
};
)
(
~bassClusters = Task {
{~bassCluster.(); [2, 4, 6].choose.wait;}.loop;}.start;
)
~bassClusters.stop;