//Μελίνα Λογοθετίδη-TX2017024, Διαδραστικά Συστήματα Ήχου [Τελική Εργασία]

//Boot server
s.boot;

//Define our sound (synth)
(
SynthDef(\simpleTone, {
	arg freq = 440, amp = 0.2, pan = 0;
	var env = EnvGen.kr(Env.perc(0.01, 0.2), doneAction: 2); // Envelope for short sound
    var sound = SinOsc.ar(freq) * env; // Sine wave with the envelope
    Out.ar(0, Pan2.ar(sound, pan, amp)); // Stereo panning
}).add;
)

// Define all of our rhythmic patterns
(
~pattern1 = Pbind(
    \instrument, \simpleTone,    // Use the tone synth
    \dur, Pseq([4/8, 4/8, 4/8, 4/8], inf),  // A 4/8 melody
    \freq, Pseq([440, 560, 680, 800], inf),  // Different pitches
    \amp, 0.2, // Volume
	\pan, 1 // Right speaker
);


~pattern2 = Pbind(
    \instrument, \simpleTone,    // Use the same tone synth
    \dur, Pseq([3/8, 3/8, 3/8, 3/8], inf),     // A 3/8 melody
    \freq, Pseq([440, 480, 520, 600], inf),  // Different pitches
    \amp, 0.2, // Volume
	\pan, -1 // Left speaker
);

~pattern3 = Pbind(
    \instrument, \simpleTone,    // Use the same tone synth
    \dur, Pseq([6/8, 6/8, 6/8, 6/8], inf),  // A 6/8 kick
    \freq, Pseq([100], inf),       // Steady pitch
    \amp, 1, // Volume
	\pan, 0 // Center
);
)
//Parameters such as frequency, amplitude etc. can be altered for every pattern but you must redefine them!


// Test each pattern seperately
~x = ~pattern1.play;
~y = ~pattern2.play;
~z = ~pattern3.play;

// Stop each pattern seperately
~x.stop;
~y.stop;
~z.stop;

// Patterns start together for polyrhytmic effect with "Ctrl" + "Enter"
(
~x = ~pattern1.play;
~y = ~pattern2.play;
~z = ~pattern3.play;
)

// Stops all patterns
(
 ~x.stop;
 ~y.stop;
 ~z.stop;
)