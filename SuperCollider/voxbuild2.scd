// lenteur, lenteur
(
~voxAbc.stop;
~voxAbc = Pbind(
    \instrument, \vox,
    \dur, 2,
    \spos, Pseq([0.231, 0.295], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \rel, 0.5,
    \atk, 0.07,
    \amp, Pseq(Pgeom(8, 0.8, 4).asStream.nextN(4), inf) * 1,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: [4]);
)



(
~voxLento2.stop;
~voxLento2 = Pbind(
    \instrument, \vox,
    \dur, 2,
    \spos, Pseq([0.5, 0.531], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \rel, 0.5,
    \atk, 0.07,
    \amp, Pseq(Pgeom(8, 0.8, 4).asStream.nextN(4), inf) * 1,
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: [4, 1]);
)


(
~voxLento3.stop;
~voxLento3 = Pbind(
    \instrument, \vox,
    \dur, 2,
    \spos, Pseq([0.88, 0.89], inf) + (Pwhite(0.001, 0.002, inf) * 0.15),
    \rel, 0.5,
    \rel, Pseq([0.5, 0.75], inf),
    \atk, 0.07,
    \amp, Pseq(Pgeom(8, 0.8, 8).asStream.nextN(8), inf) * 1 * Pseq([1, 0.25], inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \out, ~reverbBus
).play(t, quant: [1, 0.25] * 4);
)
