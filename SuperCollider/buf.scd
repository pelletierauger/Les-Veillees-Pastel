// Très beau
play{a=VarSaw;Splay ar:ar(BLowPass,ar(a,kr(a,b=(1..15)/151,b,1/5.15,1,1.5).ceil*kr(Select,kr(a,1/15,1/5,b,5).ceil+5/5,[51*1.5,51,151]).lag(b)+kr(a,5+b)*kr(a,b,b,b,b/5,[1.5,5,1]),b,kr(a,b)+5/15,kr(a,5-b,b,b,5,5)>1.515),1515**(kr(a,1-b/5)/15+1+b),1.5**kr(a,b)/5)/5}

// Avec MIDI
a=play{|n=48|x=perform(LFTri,\kr,_);perform(BLowPass,\ar,perform(Pulse,\ar,perform(Duty,\kr,1/8,0,Dseq([1,8,13,1,13,1,11,6,1,8,1,13,1,11,1,13]+n,inf).midicps)+[0,0.4],x.(1/9)/6+0.2),2**x.(0.1)*400,x.(1/7)/7+0.3).tanh};MIDIIn.connectAll.noteOn={|i,c,n|a.set(\n,n)}

play{LocalOut ar:d=MoogFF.perform(\ar,PitchShift.perform(\ar,LocalIn ar:2,1.5,0.5)+Splay.perform(\ar,VarSaw.perform(\ar,(a=LFSaw.perform(\ar,_)).(1/b=[2,5,1,6,3])>0/4+1.25**b*99,0,a.(b/9)%1)*HPF.perform(\ar,a.(a.(1/b).round+1/2)>0,a.(b/33)*4+8)),a.(1/9)+2*4e3);d}

play{x={|z...y|perform(z,*y)};Splay ar:({|i|(b=x.(a=SinOscFB,f=\ar,x.(e=Duty,f,i+1/9,0,Dseq(9.fib%8,inf))/c=1/x.(e,f,1+i/8,0,Dstutter(24,Dseq(99/(1..4),inf))).lag(4),x.(a,f,c)))*x.(CombN,f,b,1,i/99+0.1)/8+x.(Ringz,f,x.(Pulse,f,4/9,i/19.4,c),b+1*99,c).tanh/4}!20)}

// 14 Sep 2018
play{a=SinOsc;c=VarSaw;Splay ar:perform(a,x=\ar,0,perform(BRF,x,perform(c,x,perform(c,x,perform(a,x,b=(6..1)*2.1)*b,0,7-b/9)>0+(perform(a,x,1/b)>perform(a,x,0.1/b)+1)*[99,198]*b/9,0,perform(c,x,b/48)+1/2),2**perform(c,x,b/24)*488,0.4)*perform(a,x,0.012,b,2pi))/2}

// 29 Jun 2018 Très doux, très beau
play{a=LFTri;c=perform(Splay,x=\ar,perform(Resonz,x,perform(VarSaw,x,5,0,d=perform(a,x,0.15,b=(1..5)),perform(EnvGen,x,Env.perc(f=15e-4,0.05,d,d*5),perform(a,x,b/1.5))),1.5**b*(50*perform(a,x,0.015,b/5).round+150),d+1.15*f,150));c+perform(PitchShift,x,c,1.5,0.5)}

// 19 Nov 2017
play{a=SinOsc;e=EnvGen.ar(Env.perc(5e-3,0.2),t=a.ar([7.992,8]));f={|i|Demand.ar(t[i],0,Dseq([Dseq('@BGIJB@IGBJI'.ascii,240),Dseq('@LEGJLEG'.ascii,120),Dseq('EGJL'.ascii,60)])).midicps}!2;x=a.ar(f,a.ar(1/[12,9])/4+1*a.ar(f,e*pi))*e/2;FreeVerb2.ar(x@0,x@1,0.1,1,0)}

// 26 Oct 2017
play{a=LFTri;Splay ar:Pulse.ar(fold((2..5)/(a.ar(0.1)>0+2)**a.ar(b=a.ar(2/(9..7))).ceil.lag*99*[3,1,8,2,4],9,999),2-b/5)/2}

play{a=LFTri;c=Klank.ar(`[[12,4,3,9,10]*2*99],a.ar(5*b=[1,9/8]),b)*d=a.ar(b/8);a.ar(b*2).sum<0*SinOscFB.ar(b*99,d+1/2)+c/2}

play{a=LFTri;c=Klank.ar(Ref([[12,4,3,9,10]*2*99]),a.ar(5*b=[1,9/8]),b)*d=a.ar(b/8);a.ar(b*2).sum<0*SinOscFB.ar(b*99,d+1/2)+c/2}// 

File.getcwd;
thisProcess.nowExecutingPath.dirname;
thisProcess.nowExecutingPath;


"others/names.scd".loadRelative;
"others/names.scd".resolveRelative.load;
"./busses.scd".loadRelative.wrapAt(-1);
~toFreq.("F2");





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
~space = Synth.new(\space, [\freq, ~toFreq.("F1") * 16]);
~space.set(\amp, 4);

~toFreq.(~key) * 16;


(
~outerSpace.free;
~outerSpace = {
    x = {|i|
        r = [ 3, 5, 8, 9 ] / 8;
        d = rrand(0.25*i, 3*i).round(0.25);
        f = i % 3 + 1 * 444 * r.wrapAt(i);
//         f = 440 * [0.375, 0.625, 1, 1.125].wrapAt(i) * [1, 2, 3].wrapAt(i);
        Env.sine(12, 0.01).ar(0, TDelay.ar(Impulse.ar(1/12), d)) * Resonz.ar(WhiteNoise.ar(0.5), f, 0.01);  
    } ! 8;
    HPF.ar(Limiter.ar(55 * GVerb.ar(Splay.ar(x), 99, 10).flop.sum), 30).sanitize;
}.play();
)
440 * -5.midiratio;
440 * 0.75;
(
{Resonz.ar(WhiteNoise.ar([0.5, 0.5]), 440, 0.01)}.play;
{Resonz.ar(WhiteNoise.ar([0.5, 0.5]), 440 * 1.125, 0.01)}.play;
{Resonz.ar(WhiteNoise.ar([0.5, 0.5]), 440 * 0.75, 0.01)}.play;
)
(
{Resonz.ar(WhiteNoise.ar([0.5, 0.5]), 440, 0.01)}.play;
{Resonz.ar(WhiteNoise.ar([0.5, 0.5]), 440 * 4.midiratio, 0.01)}.play;
{Resonz.ar(WhiteNoise.ar([0.5, 0.5]), 440 * -5.midiratio, 0.01)}.play;
)

s.quit;
(
{Resonz.ar(WhiteNoise.ar([0.5, 0.5]), 329.63 * 0.5, 0.02)}.play;
{Resonz.ar(WhiteNoise.ar([0.5, 0.5]), 440 * 2 * SinOsc.kr(1/16).range(1.125, 4.midiratio), 0.01)}.play;
{Resonz.ar(WhiteNoise.ar([0.5, 0.5]), 329.63 * SinOsc.kr(1/16).range(0.75, -5.midiratio), 0.01)}.play;
)


(
// Un drone flottant et doux
{Resonz.ar(PinkNoise.ar([0.5, 0.5]), 440 * -4.midiratio * 1, 0.01) * 4}.play;
{Resonz.ar(PinkNoise.ar([0.5, 0.5]), 440 * -4.midiratio * 0.5 * 0.5, 0.01) * 4}.play;
{Resonz.ar(PinkNoise.ar([0.5, 0.5]), 440 * -4.midiratio * 1 * 1.125, 0.01) * 4}.play;
{Resonz.ar(PinkNoise.ar([0.5, 0.5]), 440 * -4.midiratio * 0.75, 0.01) * 4}.play;
)

// Un brin de mystère
{Resonz.ar(WhiteNoise.ar([0.5, 0.5]), 440 * 2 * SinOsc.kr(1/16).range(1.125, 4.midiratio), 0.01)}.play;

{Splay.ar({|i|Resonz.ar(WhiteNoise.ar([0.5, 0.5]), 55 * (i + 1), 0.01 / (i + 1))}!10) * 16}.play;
{Splay.ar({|i|Resonz.ar(WhiteNoise.ar([0.5, 0.5]), 55 * 0.75 * (i + 1), 0.01 / (i + 1))}!24) * 16}.play;
{Splay.ar({|i|Resonz.ar(WhiteNoise.ar([0.5, 0.5]), 55 * 1.25 * (i + 1), 0.01 / (i + 1))}!10)}.play;


{Resonz.ar(WhiteNoise.ar([0.5, 0.5]), 440 * -12.midiratio, 0.01)}.play;
{Resonz.ar(WhiteNoise.ar([0.5, 0.5]), 440 * -17.midiratio, 0.01)}.play;


[ 3, 5, 8, 9 ] / 8;
r.wrapAt(4)
1, 2, 3 * 444 * 
440 * 1.125;
rrand(0.25*7, 3*7).round(0.25);
1, 2, 3
{Env.sine(1, 0.01).ar(0, TDelay.ar(Impulse.ar(1), 0.5))}.plot(2);
