(
~wobblyCluster = {
var pos = [
    0.026112163066864,
    0.062166202068329,
    0.74659781455994,
    0.78977344036102,
    0.062755215167999,
    0.74401377439499,
    0.43313534259796,
    0.43743299245834,
    0.73360691070557,
    0.22772061824799,
    0.21568940877914,
    0.45996032953262,
    0.36069284677505,
    0.76989204883575,
    0.68512533903122
].choose;
var num = 16;
pos.postln;
Pbind(
    \instrument, \solo1,
    \dur, 4,
    \spos, Pseq([pos], num * 2)
//     + Pseq(Pseries(0, 0.00001, 64).asStream.nextN(64), inf),
    + Pseq(Pseries(0, 0.00001/2, num).asStream.nextN(num).mirror2, inf),
    \rel, Pseq([2], inf),
    \atk, 0.0001,
//     \amp, 24 * Pseq(Pgeom(1, 0.95, 64).asStream.nextN(64), inf)
    \amp, 24 * Pseq(Pseries(0, 1/63, num).asStream.nextN(num).mirror2, num * 2)
    * Pseq([1, 0.5], inf) * 0.125 * 0.5,
    \rate, [1],
    \pan, Pwhite(-0.75, 0.75, inf),
    \out, ~reverbBus
).play(t);
15.5;
}
)