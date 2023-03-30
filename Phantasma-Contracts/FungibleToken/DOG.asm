// Line 1:token DOG { // this defines the token symbol as DOG
// Line 2:	import Runtime;

// ********* getName Property ***********
@entry_getName: // 0
// Line 3:
// Line 4:	property name:string = "Dog Token";
	ALIAS r1 $literalexpression53 // 1
	LOAD $literalexpression53 "Dog Token" // 1
	PUSH $literalexpression53 // 14
	JMP @exit_getName // 16
@exit_getName: // 19
RET // 20

// ********* isFungible Property ***********
@entry_isFungible: // 21
// Line 5:
// Line 6:	property isFungible: bool = true;
	ALIAS r1 $literalexpression57 // 22
	LOAD $literalexpression57 true // 22
	PUSH $literalexpression57 // 27
	JMP @exit_isFungible // 29
@exit_isFungible: // 32
RET // 33

// ********* isDivisible Property ***********
@entry_isDivisible: // 34
// Line 7:
// Line 8:	property isDivisible: bool = true;
	ALIAS r1 $literalexpression61 // 35
	LOAD $literalexpression61 true // 35
	PUSH $literalexpression61 // 40
	JMP @exit_isDivisible // 42
@exit_isDivisible: // 45
RET // 46

// ********* getDecimals Property ***********
@entry_getDecimals: // 47
// Line 9:	property decimals:number = 8; // required only if isDivisible is true
	ALIAS r1 $literalexpression65 // 48
	LOAD $literalexpression65 8 // 48
	PUSH $literalexpression65 // 53
	JMP @exit_getDecimals // 55
@exit_getDecimals: // 58
RET // 59

// ********* isTransferable Property ***********
@entry_isTransferable: // 60
// Line 10:	
// Line 11:	property isTransferable: bool = true;
	ALIAS r1 $literalexpression69 // 61
	LOAD $literalexpression69 true // 61
	PUSH $literalexpression69 // 66
	JMP @exit_isTransferable // 68
@exit_isTransferable: // 71
RET // 72

// ********* isBurnable Property ***********
@entry_isBurnable: // 73
// Line 12:	property isBurnable: bool = true;
	ALIAS r1 $literalexpression73 // 74
	LOAD $literalexpression73 true // 74
	PUSH $literalexpression73 // 79
	JMP @exit_isBurnable // 81
@exit_isBurnable: // 84
RET // 85

// ********* isFinite Property ***********
@entry_isFinite: // 86
// Line 13:	
// Line 14:	property isFinite: bool = false;
	ALIAS r1 $literalexpression77 // 87
	LOAD $literalexpression77 false // 87
	PUSH $literalexpression77 // 92
	JMP @exit_isFinite // 94
@exit_isFinite: // 97
RET // 98
// Line 15:	//property maxSupply: number = 1000000; // required only if isFinite is true
// Line 16:	
// Line 17:	global _admin: address;

// ********* Initialize Constructor ***********
@entry_constructor: // 99
ALIAS r1 $nexus_protocol_version // 100
// validate protocol version
LOAD r0 "Runtime.Version" // 100
EXTCALL r0 // 119
POP r0 // 121
LOAD $nexus_protocol_version 0 // 123
LT r0 $nexus_protocol_version r0 // 128
JMPNOT r0 @protocol_version_validated // 132
LOAD r0 "Current nexus protocol version should be 0 or more" // 136
THROW r0 // 190
@protocol_version_validated: NOP // 193
ALIAS r1 $_admin // 193
// Line 18:	
// Line 19:	constructor(owner:address)	{
ALIAS r2 $owner // 193
POP $owner // 193
PUSH $owner // 195
EXTCALL "Address()" // 197
POP $owner // 212
// Line 20:		_admin = owner;
	COPY $owner r3 // 214
	COPY r3 $_admin // 217
@exit_constructor: // 220
LOAD r2 "Data.Set" // 221
// writing global: _admin
PUSH $_admin // 233
LOAD r0 "_admin" // 235
PUSH r0 // 245
EXTCALL r2 // 247
RET // 249
// Line 21:	}

// ********* onUpgrade Trigger ***********
@entry_onUpgrade: // 250
ALIAS r1 $dataGet // 251
LOAD $dataGet "Data.Get" // 251
ALIAS r2 $contractName // 263
LOAD $contractName "DOG" // 263
ALIAS r3 $_admin // 270
// reading global: _admin
LOAD r0 8 // 270
PUSH r0 // 275
LOAD r0 "_admin" // 277
PUSH r0 // 287
PUSH $contractName // 289
EXTCALL $dataGet // 291
POP $_admin // 293
PUSH $_admin // 295
EXTCALL "Address()" // 297
POP $_admin // 312
// Line 22:
// Line 23:	// allows the token to be upgraded later, remove this trigger if you want a imutable fungible token
// Line 24:	trigger onUpgrade(from:address) 
ALIAS r1 $from // 314
POP $from // 314
PUSH $from // 316
EXTCALL "Address()" // 318
POP $from // 333
// Line 25:	{
// Line 26:		Runtime.expect(Runtime.isWitness(_admin), "witness failed");
	ALIAS r2 $methodcallexpression95 // 335
	COPY $_admin r4 // 335
	PUSH r4 // 338
	LOAD $methodcallexpression95 "Runtime.IsWitness" // 340
	EXTCALL $methodcallexpression95 // 361
	POP $methodcallexpression95 // 363
	JMPIF $methodcallexpression95 @expect_methodcallexpression92 // 365
	ALIAS r4 $literalexpression98 // 369
	LOAD $literalexpression98 "witness failed" // 369
	THROW $literalexpression98 // 387
	@expect_methodcallexpression92: NOP // 390
// Line 27:		return;
	JMP @exit_onUpgrade // 390
@exit_onUpgrade: // 393
RET // 394
