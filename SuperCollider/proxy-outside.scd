p.use({~melo = {[9, 4, 7, 16, 19, 4, 7, 9].midiratio.reverse.scramble * 0.5}});
p.use({~sylv.free;});
p.use({~sylv.play;});
p.use({~sylv2.free;});
// p.use({~melo[0].postln;});



t.beatDur;
t.beatDur!9;
(
~sylv = {
    arg fmFreq = 0.502;
    var fund = 87.31 * 4;
    var levels = Control.names(\levels).kr([9, 4, 7, 16, 19, 4, 7, 9].midiratio.scramble * 0.5);
//     var levels = [9, 4, 7, 16, 19, 4, 7, 9].midiratio.reverse.scramble * 0.5;
    var env = EnvGen.ar(Env(levels, (t.beatDur)!8, curve: \step, loopNode: 0), In.ar(~pulseBus, 1));
    var envf = EnvGen.ar(Env([0, 4, 0, 1], 0.25!3), Impulse.kr(0.5));
    var envAmp = EnvGen.ar(Env([0, 1, 0], 0.25!2), Impulse.kr(t.beatDur * 8 * 2));
    var filFreq = 900 + (SinOsc.ar(0.25, 0, 0.5, 0.5) * 800);
    // envf.plot;
    var sig = SinOsc.ar([fund + 0.1 * env * 0.5, fund * env * 0.5]);
    sig = sig * LFTri.ar(fund * env * fmFreq + envf);
    sig = sig * LFTri.ar(fund * env) * 0.4;
    sig = sig * envAmp;
    sig = LPF.ar(sig, filFreq);
    sig + (GVerb.ar(sig * 0.5) * 1) * 1;
}.play();
)
s.peakCPU;
~sylv.free;
~sylv.setn(\levels, [9, 4, 7, 16, 19, 4, 7, 9].midiratio.scramble * 0.5 * 1);
~arr = {[0, 4, 0, 1] * 1};
~melo = {[9, 4, 7, 16, 19, 4, 7, 9].midiratio.reverse.scramble * 0.5};