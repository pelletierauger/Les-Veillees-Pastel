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
