
s.record;
s.stopRecording;

(
var c1 = ~toMidi.("A6");
var c2 = ~toMidi.("E6");
var c3 = ~toMidi.("B5");
var c4 = ~toMidi.("D6");
var c1n = ([0, 3, 7]!8).flatten;
var c2n = ([3, 7, 12]!8).flatten;
var c3n = ([7, 15, 24]!8).flatten;
var c4n = ([3, 15, 24]!8).flatten;
var deg = c1n ++ c2n ++ c3n ++ c4n;
~p3.stop;
~p3 = Pbind(
    \type, \playPiano,
    \dur, Pseq([4, 2, 2] * 0.25, inf),
    \num, Pseq([c1, c2, c3, c4].stutter(12 * 2), inf) 
    + Pseq(deg, inf) - 12
).play(t, quant: 4);
c1n = ([0, 3, 7]!4).flatten;
c2n = ([3, 7, 12]!4).flatten;
c3n = ([7 - 12, 15, 24]!4).flatten;
c4n = ([3 - 12, 15, 24]!4).flatten;
deg = c1n ++ c2n ++ c3n ++ c4n;
~p4.stop;
~p4 = Pbind(
    \type, \playPiano,
    \dur, Pseq([4, 2, 2] * 0.5, inf),
    \num, Pseq([c1, c2, c3, c4].stutter(12), inf) 
    + Pseq(deg, inf) - 36,
).play(t, quant: 2);
)


(
~lancinement.free;
~lancinement = {
    arg gate = 1, atk = 5, rel = 10;
    var levels = Control.names(\levels).kr([0, -5, 2, 5]);
    var env = Env.step(levels, [1, 1, 1, 1] * 4 * t.beatDur *4, releaseNode: 3, loopNode: 0);
    var envgen = EnvGen.kr(env);
    var envRel = EnvGen.ar(Env.new([0.0, 1.0, 0.00001], [atk, rel], [\linear, \exponential],1), gate, doneAction: 2);
    var freq = (envgen + 69).midicps;
    var oscF = SinOsc.kr(0.01, 0.5, 0.5) + 1 * 50000;
    var osc = (SinOsc.ar(16, 0.5, 0.5) * oscF).clip(0, 1.0);
    var osc2 = (SinOsc.ar(5, 0.5, 0.5) * 500).clip(0, 1.0);
    var sig = SinOsc.ar([freq + 1.1 + ((1 - osc) * 200), freq + 1 + ((1 - osc) * 200)] * 1.005 * 1) * LFTri.ar([freq, freq + 0.1]) * 0.1 * osc;
    var bigOsc = SinOsc.kr(0.1, 0.5, 0.5);
    var cAmp = Control.names(\amp).kr(4, 3) * 0.25;
    // sig = sig * (1 - osc2);
    // sig = (sig * 20).clip(-1.0, 1.0) * 0.1;
    sig = sig * bigOsc;
    sig = HPF.ar(GVerb.ar(sig, 4, 10, 0.9) + Ringz.ar(sig, freq, mul:0.1) * cAmp * envRel, 175);
    Out.ar(0, sig);
}.play;
)

~lancinement.setn(\amp, 4);


(
~piano = {|i|
    if (i <= 111, {
        var note = i;
        var dynamic = 2;
        var octave = floor(note / 12) - 1;
        var degree = note - 24 % 12;
        var noteDeltas = [-1, 0,  1,  2, -1,  0,  1, -2, -1,  0,  1,  2];
        var pitch = noteDeltas[degree];
        var sampledNote = [1,  1,  1,  1,  2,  2,  2,  3,  3,  3,  3,  3];
        var sampleToGet = (octave - 1) * 3 + sampledNote[degree];
        var dynamicOffset = dynamic - 1 * 23;
        sampleToGet = sampleToGet + dynamicOffset;
        Synth.new(\piano, [
            \buf, ~pianoSamples[sampleToGet], 
            \rate, pitch.midiratio,
            \pan, rrand(-0.75, 0.75),
            \out, ~reverbBus
            
        ]);
    });
};
)