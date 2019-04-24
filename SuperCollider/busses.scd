s.boot;
s.quit;
s.record;
s.stopRecording;
FreqScope.new(400, 200, 0, server: s);


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