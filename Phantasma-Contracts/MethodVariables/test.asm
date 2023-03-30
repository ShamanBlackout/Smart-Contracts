// Line 1:
// Line 2:/***************************************
// Line 3:  This contract appears to set methods
// Line 4:  to a variable
// Line 5:  **************************************/
// Line 6:contract test {
// Line 7:
// Line 8:	import Runtime;
// Line 9:	import Map;
// Line 10:	import Call;
// Line 11:
// Line 12:	global _counter:number;
// Line 13:
// Line 14:	global _callMap: storage_map<address,method>;

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
ALIAS r1 $_counter // 94
// clearing _callMap storage
LOAD r0 "_callMap" // 94
PUSH r0 // 106
LOAD r0 "Map.Clear" // 108
EXTCALL r0 // 121
// Line 15:
// Line 16:	constructor(owner:address)
ALIAS r2 $owner // 123
POP $owner // 123
PUSH $owner // 125
EXTCALL "Address()" // 127
POP $owner // 142
// Line 17:	{
// Line 18:		_counter = 0;
	ALIAS r3 $literalexpression79 // 144
	LOAD $literalexpression79 0 // 144
	COPY $literalexpression79 $_counter // 149
@exit_constructor: // 152
LOAD r2 "Data.Set" // 153
// writing global: _counter
PUSH $_counter // 165
LOAD r0 "_counter" // 167
PUSH r0 // 179
EXTCALL r2 // 181
RET // 183
// Line 19:	}

// ********* incCounter Method ***********
@entry_incCounter: // 184
ALIAS r1 $dataGet // 185
LOAD $dataGet "Data.Get" // 185
ALIAS r2 $contractName // 197
LOAD $contractName "test" // 197
ALIAS r3 $_counter // 205
// reading global: _counter
LOAD r0 3 // 205
PUSH r0 // 210
LOAD r0 "_counter" // 212
PUSH r0 // 224
PUSH $contractName // 226
EXTCALL $dataGet // 228
POP $_counter // 230
// Line 20:/*
// Line 21:	public callUser(from:address) {
// Line 22:		local target: method = _callMap.get(from);
// Line 23:
// Line 24:		Call.method<method>(target, from);
// Line 25:	}
// Line 26:*/
// Line 27:	private incCounter(target:address) {
ALIAS r1 $target // 232
POP $target // 232
PUSH $target // 234
EXTCALL "Address()" // 236
POP $target // 251
// Line 28:		_counter += 1;
	COPY $_counter r2 // 253
	ALIAS r4 $literalexpression85 // 256
	LOAD $literalexpression85 1 // 256
	ADD r2 $literalexpression85 r5 // 261
	COPY r5 $_counter // 265
@exit_incCounter: // 268
LOAD r1 "Data.Set" // 269
// writing global: _counter
PUSH $_counter // 281
LOAD r0 "_counter" // 283
PUSH r0 // 295
EXTCALL r1 // 297
RET // 299
// Line 29:	}

// ********* subCounter Method ***********
@entry_subCounter: // 300
ALIAS r1 $dataGet // 301
LOAD $dataGet "Data.Get" // 301
ALIAS r2 $contractName // 313
LOAD $contractName "test" // 313
ALIAS r3 $_counter // 321
// reading global: _counter
LOAD r0 3 // 321
PUSH r0 // 326
LOAD r0 "_counter" // 328
PUSH r0 // 340
PUSH $contractName // 342
EXTCALL $dataGet // 344
POP $_counter // 346
// Line 30:
// Line 31:	private subCounter(target:address) {
ALIAS r1 $target // 348
POP $target // 348
PUSH $target // 350
EXTCALL "Address()" // 352
POP $target // 367
// Line 32:		_counter -= 1;
	COPY $_counter r2 // 369
	ALIAS r4 $literalexpression93 // 372
	LOAD $literalexpression93 1 // 372
	SUB r2 $literalexpression93 r5 // 377
	COPY r5 $_counter // 381
@exit_subCounter: // 384
LOAD r1 "Data.Set" // 385
// writing global: _counter
PUSH $_counter // 397
LOAD r0 "_counter" // 399
PUSH r0 // 411
EXTCALL r1 // 413
RET // 415
// Line 33:	}

// ********* registerUser Method ***********
@entry_registerUser: // 416
// Line 34:	
// Line 35:	public registerUser(from:address, amount:number)
ALIAS r1 $from // 417
POP $from // 417
PUSH $from // 419
EXTCALL "Address()" // 421
POP $from // 436
ALIAS r2 $amount // 438
POP $amount // 438
CAST $amount $amount #Number // 440
// Line 36:	{
// Line 37:		local target: method;
// Line 38:
// Line 39:		if (amount > 10) {
	COPY $amount r3 // 444
	ALIAS r4 $literalexpression105 // 447
	LOAD $literalexpression105 10 // 447
	GT r3 $literalexpression105 r5 // 452
		JMPNOT r5 @else_ifstatement103 // 456
		ALIAS r3 $target // 460
// Line 40:			target = Call.method<method>(incCounter,from);
		COPY $from r4 // 460
		PUSH r4 // 463
		ALIAS r4 $methodcallexpression109 // 465
		CALL @entry_incCounter // 465
		POP $methodcallexpression109 // 469
		COPY $methodcallexpression109 $target // 471
		JMP @then_ifstatement103 // 474
		@else_ifstatement103: NOP // 478
// Line 41:		}
// Line 42:		else {
// Line 43:			target = Call.method<method>(subCounter,from);
		COPY $from r4 // 478
		PUSH r4 // 481
		ALIAS r4 $methodcallexpression116 // 483
		CALL @entry_subCounter // 483
		POP $methodcallexpression116 // 487
		COPY $methodcallexpression116 $target // 489
		@then_ifstatement103: NOP // 493
// Line 44:		}
// Line 45:
// Line 46:		_callMap.set(from, target);
	ALIAS r4 $methodcallexpression134 // 493
	COPY $target r5 // 493
	PUSH r5 // 496
	COPY $from r5 // 498
	PUSH r5 // 501
	ALIAS r5 $literalexpression140 // 503
	LOAD $literalexpression140 "_callMap" // 503
	PUSH $literalexpression140 // 515
	LOAD $methodcallexpression134 "Map.Set" // 517
	EXTCALL $methodcallexpression134 // 528
@exit_registerUser: // 530
RET // 531
