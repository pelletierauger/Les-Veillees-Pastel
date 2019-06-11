(
// nouvelle doudou
~foamCluster = {
var positions, rates, offsets;
var iiSize = [32, 32, 64, 96].choose;
var oneSize = [32, 32, 64, 96].choose;
var iiiSize = [32, 32, 64, 96].choose;
var one2Size = [32, 32, 64, 96].choose;
var ii = 0.14!iiSize;
var one = 0.6!oneSize;
var iii = 0.14!iiiSize;
var one2 = 0.6!one2Size;
positions = ii ++ one ++ iii ++ one2;
rates = (0!iiSize) ++ (-7!oneSize) ++ (-2!iiiSize) ++ (-7!one2Size);
rates = rates.midiratio;
offsets = Pseries(0, rrand(0.001, 0.0005), ii.size / 2).asStream.nextN(ii.size / 2).mirror2;
offsets = offsets ++ Pseries(0, rrand(0.001, 0.0005), one.size / 2).asStream.nextN(one.size / 2).mirror2;
offsets = offsets ++ Pseries(0, rrand(0.001, 0.0005), iii.size / 2).asStream.nextN(iii.size / 2).mirror2;
offsets = offsets ++ Pseries(0, rrand(0.001, 0.0005), one2.size / 2).asStream.nextN(one2.size / 2).mirror2;
positions.size.postln;
Pbind(
    \instrument, \accords2,
    \dur, 0.5,
    \spos, Pseq(positions - 0.05, 1)
    + Pseq(offsets, inf),
    \rel, Pdefn(\foamRel, 0.5);,
    \atk, 0.01,
    \amp, [1, 1, 0.8] * 1 * Pdefn(\foamAmp, 2),
    \rate, Pseq(rates, inf) * -1.midiratio * [1, 2],
    \pan, Pwhite(-1.0, 1.0, inf),
    \out, ~reverbBus
).play(t);
0.5 * positions.size;
};
)
Pdefn(\foamAmp, 2.0);
Pdefn(\foamRel, 2.5);


(
~foamClusters = Task {
{
var waitValue = ~foamCluster.();
waitValue.wait;
}.loop;}.start(t);
)
~foamClusters.stop;