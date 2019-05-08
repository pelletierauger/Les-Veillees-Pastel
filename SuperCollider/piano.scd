(
~pianoSamples = Array.new;
~pianoFolder = PathName.new("/Users/guillaumepelletier/Downloads/21055__samulis__vsco-2-ce-keys-upright-piano/");
~pianoFolder.entries.do({
    arg path;
    ~pianoSamples = ~pianoSamples.add(Buffer.read(s, path.fullPath));
});
)
~pianoSamples;
s.avgCPU;

The algorithm : 
- Figure out which octave we are in.
- Figure out available note is the closest one...
- Figure out what is the pitch transposition ratio.

~pianoSamples[1];
// Octave 1 starts at sample 1.... with a "C#"
// octave 2 starts at sample 4....
// octave 3 starts at sample 7....
// so octave == .... 
(
// i is the octave we are in...
i = 3;
(i - 1) * 3 + 1; // Index of the C# sample in this octave (if oct > 0), in ~pianoSamples
(i - 1) * 3 + 2; // index of the F in octave i
// (i - 1) * 3 + 3; // index of the A in octave i
)
// Inside the octave, the sampled positions are 1 (C#), 5 (F), and 9 (A);
(
// where i can be between 0 and 11
// make three substractions
// 
[0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11]; // the note we are given
[1,  1,  1,  1,  5,  5,  5,  9,  9,  9,  9,  9]; // the closest sampled note
[-1, 0,  1,  2, -1,  0,  1, -2, -1,  0,  1,  2]  // the note delta for .midiratio
)

// we are given a note... we need two numbers : the octave, and the note within the octave
24 = "C1", octave 1, note 0
floor(35 / 12) - 1; // how to get the octave, where 35 is our original note and 24 = octave 1
56 - 24 % 12; // how to get the note within the octave, where 56 is our original note

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
            \out, ~reverbBus
        ]);
    });
}
)

~piano.(~toMidi.("F8") + -2);
p.(104);
~toMidi.("F8") + -2;
(
Event.addEventType(\playPiano, {
    var no = ~num;
    topEnvironment.use({~piano.(no);});
})
)
([0, 4, 7]!2).flatten;
(
var c1 = ~toMidi.("F5");
var c2 = ~toMidi.("G5");
var c3 = ~toMidi.("A5");
var maj = ([4, 7, 12]!2).flatten;
var min1 = ([0, 3, 7]!2).flatten;
var min2 = ([0, 7, 3]!2).flatten;
var deg = min1 ++ maj ++ min2 ++ maj;
~p1.stop;
~p1 = Pbind(
    \type, \playPiano,
    \dur, Pseq([4, 2, 2], inf),
//     \num, ~toMidi.("F3") + Pseq([0, 4, 7], inf)
    \num, Pseq([c3, c1, c2, c1].stutter(6), inf) + Pseq(deg, inf) + Pwrand([0, 12], [0.9, 0.1], inf),
).play(t, quant: 4);
~shimmerD2.stop;
~shimmerD2 = Pbind(
    \instrument, \guitare,
    \dur, 0.25,
    \spos, Pseq([0.141, 0.2545, 0.141, 0.2545].stutter(64), inf) + Pdefn(\shimPos, 0.001) + Pwhite(0.001, 0.002, inf),
    \rel, 0.1,
    \atk, 0.7,
    \rate, Pseq([-4, -4, -6, -4].midiratio.stutter(64), inf) * 0.midiratio,
    \amp, 6,
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~highPassBus
).play(t, quant: [4, -0.5]);
)

(
~p2.stop;
~p2 = Pbind(
    \type, \playPiano,
    \dur, Pseq([Rest(1), 1, 1, 1, Rest(1), 1, Rest(1), 1], inf),
    \num, ~toMidi.("F6") 
        + Prand([0, 2, 4, 5, 7, 9, 11], inf) 
        + Pwrand([Rest(), 0], [0.9, 0.1], inf) 
        + Pwrand([0, 12], [0.9, 0.1], inf)
).play(t, quant: 4);
)



(
SynthDef(\piano, {
    arg buf = ~pianoSamples[0], rate = 1, spos = 0, pan = 1, amp = 1, out = ~limitBus;
    var sig, env, lfo;
    env = EnvGen.kr(Env.new([1, 0], [2]), doneAction: 2);
    sig = PlayBuf.ar(2, buf, rate * BufRateScale.ir(buf), startPos: 0, doneAction: 2);
    sig = sig * amp * 2 * env;
    sig = Balance2.ar(sig[0], sig[1], 0, 1);
    Out.ar(out, sig);
}).add;
)






(
~toMidi = {|note|
    var cleaned = note.asString.toLower;
    var octave_pair = cleaned.findRegexp("[0-9]+");
    var octave = if(octave_pair.size > 0, octave_pair[0][1], 4).asInt;
    var my_note = if(octave_pair.size > 0, cleaned.copyFromStart(octave_pair[0][0] - 1), cleaned);
    var note_name = my_note[0].asString;
    var midinote = 0;
    var detune = 0;
    if(my_note.size > 1,
    switch(my_note.copyToEnd(1),
        "b", {detune = -1},
        "bb", {detune = -2},
        "#", {detune = 1},
        "##", {detune = 2}
    ));
    switch(note_name,
        "c", {midinote = 12},
        "d", {midinote = 14},
        "e", {midinote = 16},
        "f", {midinote = 17},
        "g", {midinote = 19},
        "a", {midinote = 21},
        "b", {midinote = 23}
    );
    midinote = (midinote + (octave.clip(0,99999) * 12)) + detune;
};
)