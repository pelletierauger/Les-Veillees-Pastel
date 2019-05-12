"/Users/guillaumepelletier/Desktop/Dropbox/Art/p5/Les-Veillees-Pastel/SuperCollider/DX7-Supercollider-master/DX7.scd".loadPaths;


// Supercollider DX7 Clone v1.0
// Implemented by Aziz Ege Gonul for more info go to www.egegonul.com
// Under GNU GPL 3 as per SuperCollider license

//Example
s.quit;
( // init
	// Server.killAll
// 	s.boot;
    ~mainCaller = "/Users/guillaumepelletier/Desktop/Dropbox/Art/SuperCollider-Sketches/DX7-Supercollider-master/DX7.scd".loadPaths.wrapAt(-1);
)
~mainCaller;
( // Note On 80 message with velocity value 100 and preset value 10000
    ~mainCaller.value(80, 100, 10000);
)

( // Note Off message
	~mainCaller.value(80, 0);
)
/*
//Some fun example below. Uncomment this area and run the below parenthesis for random preset and pitch for each note. Check CPU!!
(
~number = 15000.rand; //preset start number, dont go further than 16383
~ra = Routine {
303.do({ arg a;
~sun = 99.rand + 10;
~mainCaller.value(~sun, 127.rand, ~number);
((50.rand)/100).wait; // Waits for at most half second between each node
~mainCaller.value(~sun, 0, ~number);
~number = ~number +1;
});
// Wait half second before saying we're done
0.5.wait;
"done".postln;
}.play;
)
(//stop
~ra.stop;
~mainCaller.value(~sun, 0, ~number);
)

*/







( // init
	s.boot;
  ~mainCaller = ("./DX7.scd").loadRelative.wrapAt(-1);
)
(
var presetz = Array.fill(128, 63);

MIDIdef.noteOn(\DX7, {arg vel, note;
	~mainCaller.value(note, vel, 8127);
},srcID:~midiInINST4,chan:2).add;

MIDIdef.cc(\DX7CC, {arg ...args;
	presetz[args[1]] = args[0];
},(0..1),srcID:~midiInINST4,chan:2).add;

MIDIdef.noteOff(\DX7off, {arg vel, note;
	~mainCaller.value(note, 0);
},srcID:~midiInINST4,chan:2).add;
)


29, doux piano
56, doux orgue
61, beau bois
10024, beau bois
10025, genre de snare,
556 et 573, près du electric piano
569, spooky wobble
919, shiny california
(
MIDIIn.removeFuncFrom(\noteOn, ~myOn);
MIDIIn.removeFuncFrom(\noteOff, ~myOff);
~myOn = {arg src, chan, num, vel;
    // ~mainCaller.value(80, 100, 10000);
    ~mainCaller.value(num, vel, 919);
    // num.postln;
};
MIDIIn.addFuncTo(\noteOn, ~myOn);

~myOff = {arg src, chan, num, vel;
    ~mainCaller.value(num, 0);
    // ~mainCaller.value(80, 0);
    // num.postln;
};
MIDIIn.addFuncTo(\noteOff, ~myOff);
)

(
MIDIIn.removeFuncFrom(\noteOn, ~myOn);
MIDIIn.removeFuncFrom(\noteOff, ~myOff);
)

80.midicps
Array.fill(128, 63);

128 * 63 + 63;

(
var num = 70 + -20, vel = 50;
~mainCaller.value(num, vel, 56);
)
~mainCaller.value(70 + 12, 0);








// From : "https://gist.github.com/umbrellaprocess/973d2aa16e95bf329ee2"

MIDIClient.init;
MIDIIn.connect;
s.boot;
s.quit;

(
SynthDef("umbSinewave",{
	arg freq=440, gate=1, amp=10, pan=0;
	var x;
	x = SinOsc.ar(freq, 0, amp);
	x = EnvGen.kr(Env.adsr(0.01,0.3,0.5,1,0.6,-4),gate,doneAction: 2) * x;
	Out.ar(0, Pan2.ar(x,pan));
}).add;
)

(
var keys;
keys = Array.newClear(128);

~noteOnFunc = {arg src, chan, num, vel;
	var node;
	node = keys.at(num);
	if (node.notNil, {
		node.release;
		keys.put(num, nil);
	});
	node = Synth.tail(nil, "umbSinewave", [\freq, num.midicps, \amp, vel/127]);
	keys.put(num, node);
	[chan,num,vel/127].postln;
};
MIDIIn.addFuncTo(\noteOn, ~noteOnFunc);

~noteOffFunc = {arg src, chan, num, vel;
	var node;
	node = keys.at(num);
	if (node.notNil, {
		node.release;
		keys.put(num, nil);
	});
};
MIDIIn.addFuncTo(\noteOff, ~noteOffFunc);

)

// cleanup
(
MIDIIn.removeFuncFrom(\noteOn, ~noteOnFunc);
MIDIIn.removeFuncFrom(\noteOff, ~noteOffFunc);
MIDIIn.disconnectAll;
)

