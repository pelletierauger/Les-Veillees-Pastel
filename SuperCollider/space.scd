(
SynthDef(\squeak, {
    arg freq = 440, pan = 0, amp = 0.1, sustime = 0.5, out = 0, rel = 15;
    var sig, x, env, lfo, envf, mod;
    env = EnvGen.ar(Env.new([0.0, 1.0, 0.5, 0.5, 0.00001], [0.1, 0.1, sustime, rel], [\linear, \linear, \linear, \exponential]), doneAction: 2);
    envf = XLine.kr(400, 2000, sustime * 0.1);
    mod = SinOsc.kr(1, mul: 0.5, add: 0.65);
    lfo = SinOsc.kr(12) * mod;
//     lfo = 1.0;
    x = {
        |i|
        var m = i * 7;
        LFSaw.ar([freq + (m * lfo), freq + 1 + (m * lfo)]) * amp * env;
    }!16;
//     sig = SinOsc.ar([freq, freq + 1]) * amp;
    sig = Splay.ar(x, spread: 1);
//     sig = sig * LFTri.ar([freq, freq - 1] * 4);
    sig = LPF.ar(sig, envf) * mod;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)
Array.series(16, -1, 1/8);
x = Synth.new(\space, [\freq, 440 * 3.midiratio, \sustime, 3, \amp, 0.3]);

(
~squeakyCloud = {
5.do({
var modif = -5.midiratio * 0.midiratio;
var scale = [0, 4, 7, 9, 11];
var key = ~toFreq.(~key) * 48.midiratio * modif * scale.choose.midiratio;
TempoClock.default.sched(rrand(0.1, 1.75), {
    Synth.new(\squeak, [\freq, key, \sustime, 3, \amp, 0.1, \pan, rrand(-1.0, 1.0)]);
});
});
};
)


~singleSqueak = Synth.new(\squeak, [\freq, ~toFreq.(~key) * 16 * 0.midiratio, \sustime, 3, \amp, 0.1, \pan, rrand(-1.0, 1.0)]);


~squeakyCloud.();
-1.midiratio;
rrand(-1.0, 1.0);
~key;
s.numSynths;
s.peakCPU;
s.avgCPU;

// The synth below is taken (and slightly adapted) from
// {}.play - SuperCollider fragments,
// a collection written by David Granström. {}.play is free software
// distributed under a GNU General Public License. 
// https://synthdef.art/function-play-license/
// My adaptation is also free software distributed under the same license.
// The fragment is titled #wavemechanics and can be found here:
// https://synthdef.art/function-play/

(
SynthDef(\space, {
    arg amp = 1, out = 0, freq = 444;
    var x = {|i|
        r = [ 3, 5, 8, 9 ] / 8;
        d = rrand(0.25*i, 3*i).round(0.25);
//         f = i % 3 + 1 * r.wrapAt(i);
           f = [0, 4, 7, 11].midiratio;
        Env.sine(12, 0.01).ar(0, TDelay.ar(Impulse.ar(1/12), d)) * Resonz.ar(WhiteNoise.ar(0.5), f * freq, 0.01);  
    } ! 8;
    Out.ar(0, HPF.ar(Limiter.ar(55 * GVerb.ar(Splay.ar(x) * amp, 99, 10).flop.sum), 30).sanitize);
}, [3]).add;
)

~space.free;
~space = Synth.new(\space, [\freq, ~toFreq.(~key) * 16]);
~space.set(\amp, 4);

~toFreq.(~key) * 16;


(
~outerSpace.free;
~outerSpace = {
    x = {|i|
        r = [ 3, 5, 8, 9 ] / 8;
        d = rrand(0.25*i, 3*i).round(0.25);
        f = i % 3 + 1 * 444 * r.wrapAt(i);
        Env.sine(12, 0.01).ar(0, TDelay.ar(Impulse.ar(1/12), d)) * Resonz.ar(WhiteNoise.ar(0.5), f, 0.01);  
    } ! 8;
    HPF.ar(Limiter.ar(55 * GVerb.ar(Splay.ar(x), 99, 10).flop.sum), 30).sanitize;
}.play();
)

~slide = Buffer.read(s, "/Users/guillaumepelletier/Desktop/Dropbox/Art/p5/Signes-Vitaux-3/SuperCollider/slide-guitar.aif");
~slide.numFrames;
~slide.numChannels;

(
SynthDef(\slideguitar, {
    arg buf = ~slide, rate = 1, spos = 0, pan = 0, amp = 1, rel = 2, atk = 0.1, out = 0;
    var sig, env, lfo;
    env = EnvGen.kr(Env.new([0, 1, 0], [atk, rel]), doneAction: 2);
    sig = PlayBuf.ar(2, ~slide, rate * BufRateScale.ir(~slide), startPos: spos * 4325888);
    sig = sig * env;
    sig = sig * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)
x = Synth.new(\slideguitar, [\spos, 0.1, \rel, 3, \amp, 1]);
(
~slidy.stop;
~slidy = Pbind(
    \instrument, \slideguitar,
    \dur, 7,
    \spos, Pwhite(0.0, 0.9, inf),
    \rel, 4,
    \rate, 0.midiratio,
    \amp, 0.125,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~slideBus
).play(quant: 1);
)

(
~slidy2.stop;
~slidy2 = Pbind(
    \instrument, \slideguitar,
    \dur, 0.05,
    \spos, Pwhite(0.0, 0.9, inf),
    \rel, 0.01,
    \rate, 0.midiratio,
    \amp, 1,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~slideBus
).play(quant: 1);
)


5!5;

{|i|i*2}!5;

i = 3;
r = [ 3, 5, 8, 9 ] / 8;
d = rrand(0.25*i, 3*i).round(0.25);
f = i % 3 + 1 * 444 * r.wrapAt(i);

[1, 2, 3].choose * 444;

0.125 * 5;
1.125/0.125;
6 % 3;
a = [0, 1, 2, 3, 4];
a.wrapAt(13);


//     envf = XLine.kr(400, 20000, sustime * 0.1);
//     sig = LPF.ar(sig, envf);

(
SynthDef.new(\brnoise, {
    arg out = 0, freq = 220, modFreq = 0.1, gate = 1, amp = 0.1;
    var sig, env, mod;
    sig = BrownNoise.ar(0.15!2);
    env = EnvGen.ar(Env.adsr(2, 0.1, 1, 10), gate, doneAction:2);
    mod = SinOsc.kr(modFreq, 3pi/2).exprange(0.001, 1);
    sig = (sig * 0.2) + Ringz.ar(sig, freq, 0.1, 0.2);
    sig = sig * env * amp * mod;
    Out.ar(out, sig);
}).add;
)

~ocean.set(\gate, 0);
~ocean = Synth.new(\brnoise, [\freq, ~toFreq.(~key) * 16]);



(
SynthDef.new(\souffle, {
    arg low = 500, top = 10000, freq = 440, out = 0, gate = 1, amp = 0.01, s = 0;
    var sig, env, mod, envAmp, envFil;
    sig = WhiteNoise.ar([1,1]);
    env = EnvGen.ar(Env.adsr(2, 0.1, 1, 15), gate, doneAction:2);
//     mod = SinOsc.kr(modFreq, 3pi/2).exprange(0.001, 1);
//     sig = (sig * 0.2) + Ringz.ar(sig, freq, 0.1, 0.2);
        sig = Ringz.ar(sig, freq, 0.1, 0.2);
    envAmp = EnvGen.kr(Env.circle([0, 1], [2 + s, 2 + s]));
//     envFil = EnvGen.kr(Env.circle([low, top], [4 + (s * 2), 0]));
    envFil = SinOsc.kr(0.1, mul: 0.5, add: 0.5) * 5000;
    sig = LPF.ar(sig, 500 + envFil);
    sig = sig * env * amp;
    Out.ar(out, sig);
}, [3, 3, 3]).add;
)


(
~soufflants.do({|item| item.set(\low, 10000)});
~soufflants.do({|item| item.set(\top, 500)});
)
(
~soufflants.do({|item| item.set(\low, 500)});
~soufflants.do({|item| item.set(\top, 10000)});
)

(
~shimmerC.stop;
~soufflants.do({|item| item.set(\gate, 0)});
)
(
var fr = ~toFreq.(~key) * 16;
~soufflants = {Synth.new(\souffle, [
    \s, [0, 1, 2, 3, 4].choose,
    \freq, fr * [0.5, 1].choose * [0, 4, 7, 11].choose.midiratio
])}!32;
)

~soufflants[3].get(\freq);
~soufflants[0].get(\freq, { arg value; ("freq is now:" + value + "Hz").postln; });

(
~soufflants.do({
|item|
    var oldFreq = 440;
    h = 440;
    item.get(\freq, {|v| h = v;});
    item.set(\freq, h * 2.midiratio);
});
)

(
h = 0;
~soufflants[5].get(\freq, {|v|h = v;});
// h;
)
h;

~soufflants.do({|item| item.set(\top, 10000)});

s.numSynths;

~soufflant.set(\gate, 0);
~soufflant = Synth.new(\souffle);
~soufflant2.set(\gate, 0);
~soufflant2 = Synth.new(\souffle);
~soufflant3.set(\gate, 0);
~soufflant3 = Synth.new(\souffle);




(
SynthDef.new(\friture, {
    arg out = 0, freq = 440, pan = 0, atk = 1, dec = 1, rel = 2, sustain = 0.001, amp = 1, gate = 1, fm1freq = 4.001, lpff = 5000;
    var sig, env, lfo, envf;
    
    // Safety measures to constrain values within reasonable bounds.
    // Important because I alter these values often, and quickly, during
    // the performance. Typing mistakes must not create audio accidents.
    fm1freq = min(max(fm1freq, 0.500125), 16);
    freq = min(max(freq, 50), 3000);
    amp = min(max(amp, 0), 15);
    
//     env = EnvGen.ar(Env.new([0.0, 1.0, 0.00001], [atk, rel], [\linear, \exponential],1), gate, doneAction: 2);
    env = EnvGen.kr(Env.new([0.0, 1.0, 0.0], [atk, rel]), doneAction:2);
    sig = Pulse.ar([freq, freq + 1], width: 0.9) * 0.1;
//     sig = LFTri.ar([freq, freq + 1]) * 0.1;
    sig = sig * SinOsc.ar([freq - 1, freq] * -5.midiratio * fm1freq);
    sig = sig * SinOsc.ar([freq + 1, freq - 1] * -5.midiratio * 1.0001 * 1, width: 0.2);
    sig = sig * amp * env;
    envf = XLine.kr(10000.0, 500.0, 0.4);
    sig = LPF.ar(sig, envf);
//     sig = HPF.ar(sig, 2000);
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}, 8!10).add;
)

s.numSynths;
~frimas.set(\fm1freq, 2.001);
~frimas.set(\fm1, 2.001);
~frimas.set(\gate, 0);
~frimas.release();
~frimas.free;
~frimas = Synth.new(\friture, [\freq, ~toFreq.("Db6"), \atk, 0.001, \rel, 0.1]);


(
~nouvelleFriture.stop;
~nouvelleFriture = Pbind(
    \instrument, \friture,
    \dur, Pseq([Pwhite(0.05, 0.1).stutter(24) * 1], inf),
//     \freq, ~toFreq.("Db6") * Pseq([Prand([0.5, 1, 2], inf)].stutter(8), inf),
//     \freq, ~toFreq.("Db6") * Prand([0, 2, 4, 5, 7, 11], inf).stutter(48).midiratio,
    \freq, ~toFreq.("F6") * Prand([0.5, 1, 1, 1], inf) * 1,
    \amp, Pwhite(0.1, 1.5 * 0.5, inf).stutter(16) * 4,
    \rel, Pwhite(0.05, 0.3, inf).stutter(16) * 1,
    \atk, 0.01,
//     \lpff, Pwhite(5000, 20000, inf).stutter(16).round,
    \lpff, 20000,
    \sustain, 0.001,
//     \fm1freq, Prand([4.001, 2.001, 1.001].stutter(8), inf),
    \fm1freq, 4.001 * 1,
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~reverbBus
).play();
)
0.75 * 15;

4.001 * 0.125;
4*4;
(4!4).sum;
[4].stutter(4).sum;
(1!4).stutter((1!4).sum).sum
~tt = Pwhite(0.1, 0.2, inf).stutter(8).asStream;
~tt.next;


e = Env([0.2,1.0,0.0],[0.1,3.0],0,1); //releaseNode at node 1, which is the pair of 0.0 level in the first array and 3.0 seconds in the second. 



a= {arg gate=1; EnvGen.ar(e,gate,doneAction:2)*SinOsc.ar(550,0,0.1)}.play



a.set(\gate, 0); //takes 3.0 seconds to fade out
