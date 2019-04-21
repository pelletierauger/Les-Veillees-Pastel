(
SynthDef.new(\chirp, {
    arg out, freq = 220, lon = 3, amp = 1, pan = 0, atk = 2, rel = 2, freqOsc = 6;
    var sig, sig2, env, osc, osc2, loopEnv, loopEnv2, linPass;
    osc = LFTri.ar(freqOsc, mul: 0.5, add:0.5);
    osc2 = LFTri.ar(1, pi, mul: 0.5, add:0.5);
    loopEnv = EnvGen.kr(Env.circle([0, 1, 0], [0.01, 0.1, 0.1 * freqOsc]));
    loopEnv2 = EnvGen.kr(Env.circle([1, 1.1, 1], [0.01, 0.1, 0.1 * freqOsc]));
    env = EnvGen.kr(Env.new([0.00001, 1, 0.00001], [atk, rel], curve: 'exp'), doneAction: 2);
    sig = SinOsc.ar([freq, freq + 0.1]) * 0.1;
    sig = sig + (LFTri.ar([freq + 0.1, freq + 0.2] * 1, pi) * 0.02);
    sig = sig * env * amp;
    sig = (sig * loopEnv) * (1 + LFSaw.ar([freq + 1, freq + 1.1] * 1.001, mul: loopEnv * 1) * (1 + WhiteNoise.ar(mul: loopEnv * 0.1)));
//     sig = sig * LFSaw.ar([freq + 0.1, freq + 0.2] * 2.001);
    linPass = XLine.kr(200, 6000, atk + rel * 0.5);
    sig = LPF.ar(sig, linPass) * 4;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)

(
~chirps = {
var modif = 0.midiratio * 0.midiratio * 2;
var key = ~toFreq.("F0") * [36, 48, 48].choose.midiratio * modif;
var baseOsc = rrand(1, 12);
var minOsc = baseOsc - 0.05 / 12;
var maxOsc = baseOsc + 0.05 / 12;
Synth.new(\chirp, [\freq, key, \amp, 4, \out, 0, \rel, 20, \pan, rrand(-0.5, 0.5), \freqOsc, rrand(minOsc, maxOsc)]);
Synth.new(\chirp, [\freq, key * 4.midiratio * [1,2].choose, \amp, 4, \out, 0, \rel, 20, \pan, rrand(-0.5, 0.5), \freqOsc, rrand(minOsc, maxOsc)]);
Synth.new(\chirp, [\freq, key * 11.midiratio * [1,2].choose, \amp, 4, \out, 0, \rel, 20, \pan, rrand(-0.5, 0.5), \freqOsc, rrand(minOsc, maxOsc)]);
Synth.new(\chirp, [\freq, key * 14.midiratio, \amp, 4, \out, 0, \rel, 20, \pan, rrand(-0.5, 0.5), \freqOsc, rrand(minOsc, maxOsc)]);
6;
};
)

~chirps.();

