(
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

FM7.algoSpec(0, feedback: 0.0);