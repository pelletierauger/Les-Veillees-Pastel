(
~solo = Buffer.read(s, "/Users/guillaumepelletier/Music/SuperCollider\ Recordings/en-mer-guitare-3.aiff");
SynthDef(\solo3cont, {
    arg buf = ~solo, rate = 1, pan = 0, amp = 1, rel = 30, atk = 0.1, out = 0, gate = 1;
    var sig, env, lfo;
//     env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    env = EnvGen.ar(Env.new([0.0, 1.0, 0.00001], [atk, rel], [\linear, \exponential],1), gate, doneAction: 2);
    sig = PlayBuf.ar(2, ~solo, rate * BufRateScale.ir(buf), startPos: 0, doneAction: 2);
    sig = sig * env;
    sig = sig * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)



~soloCont = Synth.new(\solo3cont, [\out, ~reverbBus, \amp, 5]);
~soloCont.set(\gate, 0);
~soloCont.setn(\amp, 2.5);