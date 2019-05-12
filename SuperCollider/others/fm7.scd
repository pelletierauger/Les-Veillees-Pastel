(
~droo.free;
~droo = {
    var ctls, mods, chans, freq, sig;
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
    sig = FM7.ar(ctls, mods).slice(chans) * -12.dbamp * 0.2; // using "slice" to select specific channels
//     sig = LPF.ar(sig, 1000);
}.play;
)
-12.dbamp;
s.avgCPU;
440 * -24.midiratio;
(
{
    var ctls = [
        // freq, phase, amp
        [LFNoise1.kr(0.5).range(300, 310), 0, 1],
        [LFNoise1.kr(0.5).exprange(3, 310), 0, 1],
        [LFNoise1.kr(0.5).exprange(3, 100), 0, 1],
        [LFNoise1.kr(0.5).exprange(3, 100), 0, 1],
        [LFNoise1.kr(0.5).exprange(3, 100), 0, 1],
        [LFNoise1.kr(0.5).exprange(3, 100), 0, 1]
    ];
    FM7.arAlgo(7, ctls, MouseX.kr(0, 2))
}.play

)


~toFreq.("F2");
~r = {87.307};
~dfm1.play;
~dfm1.free;
(
//evaluate this twice with a couple of seconds of gap in between
//the argument 'mult' is used for speed - to copy and paste the entire NodeProxy and set multiplications quickly during performance
~dfm1 = {arg mult = 1; DFM1.ar(SinOsc.ar([~r,~r*1.01]*mult,0,0.1),(~r*2)*mult,SinOsc.kr(0.05).range(0.9,1.1),1,0,0.0003,0.5)}.play;

FM7.algoSpec(0, feedback: 0.0);