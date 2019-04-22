s.boot;
s.record;
s.stopRecording;
FreqScope.new(400, 200, 0, server: s);

(
SynthDef.new(\simplest, {
    arg out, freq = 220, amp = 1, pan = 0, atk = 0.02, rel = 2, gate = 1;
    var sig, env;
    rel = min(max(rel, 0.001), 10);
//     env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    env = EnvGen.ar(Env.new([0.0, 1.0, 0.00001], [atk, rel], [\linear, \exponential],1), gate, doneAction: 2);
    sig = LFTri.ar([freq, freq + 0.1]) * 0.1;
    sig = sig * env * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)

(
Synth.new(\simplest, [\freq, ~toFreq.("F2"), \amp, 4, \out, 0, \rel, 10, \pan, rrand(-0.5, 0.5)]);
Synth.new(\simplest, [\freq, ~toFreq.("A3") * 0.midiratio, \amp, 4, \out, 0, \rel, 10, \pan, rrand(-0.5, 0.5)]);
Synth.new(\simplest, [\freq, ~toFreq.("C3"), \amp, 3, \out, 0, \rel, 10, \pan, rrand(-0.5, 0.5)]);
)

(
~sourceGroup = Group.new;
~fxGroup = Group.after(~sourceGroup);
~reverbBus = Bus.audio(s, 2);
~highPassBus = Bus.audio(s, 2);
~pulseBus = Bus.audio(s, 1);
)

(
SynthDef.new(\reverb, {
    arg in, out = 0;
    var sig, del;
    sig = In.ar(in, 2);
    del = CombC.ar(in: sig,
    maxdelaytime: 0.1,
    delaytime: [0.25, 0.26],
    decaytime: 20,
    mul: 1, add: 0);
    del = LPF.ar(del, 600);
	sig = sig + (del * 0.125);
    Out.ar(0, sig);
}).add;
)

(
~reverbSynth.free;
~reverbSynth = Synth.new(\reverb, [\in, ~reverbBus, \out, 0], ~fxGroup);
)

(
SynthDef.new(\highPass, {
    arg in, out = 0;
    var sig;
    sig = In.ar(in, 2);
    sig = HPF.ar(sig, 300);
//     sig = LPF.ar(sig, 10000);
    Out.ar(~reverbBus, sig);
}).add;
)

(
~highPassSynth.free;
~highPassSynth = Synth.new(\highPass, [\in, ~highPassBus, \out, ~reverbBus], ~fxGroup);
)
