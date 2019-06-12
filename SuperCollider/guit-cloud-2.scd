

(
~guitCluster1 = {
var oldList, durs, pos, rels, pulse, calcPos, offsets;
durs = 0.5!8;
pos = [rrand(0, 0.95), rrand(0.01, 0.05)];
// pos = [ 0.89190335273743, 0.028457579612732 - 0.006 ];
// pos = ~listOfPositions.choose;
rels = Array.fill(8, {0.5});
calcPos = Array.fill(8, {|i| pos[0] + (pos[1] * i)});
// offsets = Pseries(0, 0.0002, 8).asStream.nextN(8).stutter(8);
Pbind(
    \instrument, \solo1,
    \dur, Pseq(durs, 16),
    \spos, Pseq(calcPos, inf),
    \atk, 0.01, 
    \rel, Pseq(rels, 16), 
    \amp, 12 * 
    Pseq(Pseries(0, 1/(64), 64).asStream.nextN(64).mirror2, inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t);
pos.postln;
durs.sum * 8;
// position;
// pos;
};
)
(
~listOfPositions = [
[ 0.4081679046154, 0.022549905776978 ],

];
)
(
// ~soloList = Array.fill(4, {rrand(0.0, 0.9)});
~guitClusters1 = Task {
{
var waitValue = ~guitCluster1.();
waitValue.wait;
}.loop;}.start(t);
)
~guitClusters1.stop;
~foamClusters.stop;

