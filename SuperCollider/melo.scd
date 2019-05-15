(
~chirpBuf = Buffer.read(s, "/Users/guillaumepelletier/Desktop/Dropbox/Art/p5/synth-bayou-002.aif");
~chirpBuf.numFrames;
SynthDef(\chirp, {
    arg buf = ~chirpBuf, rate = 1, spos = 0, pan = 1, amp = 1, rel = 2, atk = 0.1, out = 0, hpass = 50;
    var sig, env, lfo;
    env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    sig = PlayBuf.ar(2, ~chirpBuf, rate * BufRateScale.ir(buf), startPos: spos * 162831);
    sig = sig * amp * env;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)




(
SynthDef.new(\simplest, {
    arg out, freq = 220, amp = 1, pan = 0, atk = 0.02, rel = 1;
    var sig, env;
    rel = min(max(rel, 0.001), 10);
    env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    sig = LFTri.ar([freq, freq + 0.1]) * 0.1;
    sig = sig * env * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)





(
Synth.new(\simplest, [\freq, 440, \amp, 1, \out, 0, \rel, 5, \pan, rrand(-0.5, 0.5)]);
// Synth.new(\simplest, [\freq, ~toFreq.("A3") * 5.midiratio, \amp, 1, \out, 0, \rel, 5, \pan, rrand(-0.5, 0.5)]);
// Synth.new(\simplest, [\freq, ~toFreq.("A3") * -8.midiratio, \amp, 1, \out, 0, \rel, 5, \pan, rrand(-0.5, 0.5)]);
)