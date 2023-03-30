// Line 1:contract test {
// Line 2:	import Random;
// Line 3:
// Line 4:	global my_state: number;

// ********* Initialize Constructor ***********
@entry_constructor: // 0
ALIAS r1 $nexus_protocol_version // 1
// validate protocol version
LOAD r0 "Runtime.Version" // 1
EXTCALL r0 // 20
POP r0 // 22
LOAD $nexus_protocol_version 0 // 24
LT r0 $nexus_protocol_version r0 // 29
JMPNOT r0 @protocol_version_validated // 33
LOAD r0 "Current nexus protocol version should be 0 or more" // 37
THROW r0 // 91
@protocol_version_validated: NOP // 94
ALIAS r1 $my_state // 94
// Line 5:
// Line 6:	constructor(owner:address)
ALIAS r2 $owner // 94
POP $owner // 94
PUSH $owner // 96
EXTCALL "Address()" // 98
POP $owner // 113
// Line 7:	{
// Line 8:		Random.seed(16676869); // optionally we can specify a seed, this will make the next sequence of random numbers to be deterministic
	ALIAS r3 $methodcallexpression50 // 115
	ALIAS r4 $literalexpression52 // 115
	LOAD $literalexpression52 16676869 // 115
	PUSH $literalexpression52 // 123
	LOAD $methodcallexpression50 "Runtime.SetSeed" // 125
	EXTCALL $methodcallexpression50 // 144
// Line 9:		//my_state = mutateState(); // unable to call function inside constructor.
// Line 10:		my_state = Random.generate() %1024;
	ALIAS r3 $methodcallexpression54 // 146
	LOAD $methodcallexpression54 "Runtime.Random" // 146
	EXTCALL $methodcallexpression54 // 164
	POP $methodcallexpression54 // 166
	ALIAS r4 $literalexpression55 // 168
	LOAD $literalexpression55 1024 // 168
	MOD $methodcallexpression54 $literalexpression55 r5 // 174
	COPY r5 $my_state // 178
@exit_constructor: // 181
LOAD r2 "Data.Set" // 182
// writing global: my_state
PUSH $my_state // 194
LOAD r0 "my_state" // 196
PUSH r0 // 208
EXTCALL r2 // 210
RET // 212
// Line 11:	}

// ********* mutateState Method ***********
@entry_mutateState: // 213
ALIAS r1 $dataGet // 214
LOAD $dataGet "Data.Get" // 214
ALIAS r2 $contractName // 226
LOAD $contractName "test" // 226
ALIAS r3 $my_state // 234
// reading global: my_state
LOAD r0 3 // 234
PUSH r0 // 239
LOAD r0 "my_state" // 241
PUSH r0 // 253
PUSH $contractName // 255
EXTCALL $dataGet // 257
POP $my_state // 259
// Line 12:
// Line 13:	public mutateState(): number
// Line 14:	{
// Line 15:		my_state = Random.generate() % 1024; // Use modulus operator to constrain the random number to a specific range
	ALIAS r1 $methodcallexpression60 // 261
	LOAD $methodcallexpression60 "Runtime.Random" // 261
	EXTCALL $methodcallexpression60 // 279
	POP $methodcallexpression60 // 281
	ALIAS r2 $literalexpression61 // 283
	LOAD $literalexpression61 1024 // 283
	MOD $methodcallexpression60 $literalexpression61 r4 // 289
	COPY r4 $my_state // 293
// Line 16:		return my_state;
	COPY $my_state r1 // 296
	PUSH r1 // 299
	JMP @exit_mutateState // 301
@exit_mutateState: // 304
LOAD r1 "Data.Set" // 305
// writing global: my_state
PUSH $my_state // 317
LOAD r0 "my_state" // 319
PUSH r0 // 331
EXTCALL r1 // 333
RET // 335
