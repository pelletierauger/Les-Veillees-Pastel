~lowDrone.free;
(
~lowDrone.set(\gate, 0);
~lowDrone = {
    arg gate = 1, atk = 4, rel = 16;
    var env, ctls, mods, chans, freq, sig;
    env = EnvGen.ar(Env.new(
        [0, 1.0, 0.00001], 
        [atk, rel], 
        [\linear, \exponential], 1), gate, doneAction: 2);
    freq = 440 * -28.midiratio;
    ctls = [
        // freq, phase, amp
        [freq * 1, 0, 1],
        [freq * 1.001, 0, 1],
        [freq, 0, 1],
        [freq * 1.0, 0, 1],
        [freq * 1, 0, 1],
        [freq * 1, 0, SinOsc.kr(0.1).range(1, 4)]
    ];
    mods = [
        [0.0, 0.0, 0.0, 0.0, 0.0, XLine.kr(0.0001, 1, 4)], // input of osc 0
        [0.0, 0.0, 0.0, 0.0, 0.0, XLine.kr(0.0001, 1, 4)], // input of osc 1
        [0.0, 0.0, 0.0, 0.0, 0.0, 0.0], // input of osc 2
        [0.0, 0.0, 0.0, 0.0, 0.0, 0.0], // input of osc 3
        [0.0, 0.0, 0.0, 0.0, 0.0, 0.0], // input of osc 4
        [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]  // input of osc 5
    ];
    chans = [0, 1];
    // using "slice" to select specific channels
    sig = FM7.ar(ctls, mods).slice(chans) * -12.dbamp * 0.2; 
    sig = sig * env;
    Out.ar(~limitBus, sig);
}.play;
)


(
~vagueBasse.set(\gate, 0);
~vagueBasse = {
    arg gate = 1, atk = 4, rel = 16;
    var sig, env, osc;
    env = EnvGen.ar(Env.new(
        [0, 1.0, 0.00001], 
        [atk, rel], 
        [\linear, \exponential], 1), gate, doneAction: 2);
    sig = Resonz.ar(
        BrownNoise.ar([0.5, 0.5]), ~toFreq.("F4"), 0.01)
        * 8 * SinOsc.kr(0.1, [0, pi], mul:0.5, add:0.5);
    sig = sig * SinOsc.kr(0.05, 0, mul:0.5, add:0.5);
    sig = sig * env;
    Out.ar(~limitBus, sig);
}.play;
)