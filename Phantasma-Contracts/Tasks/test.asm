// Line 1:contract test {
// Line 2:	import Time;
// Line 3:	import Task;
// Line 4:	import Call;
// Line 5:
// Line 6:	global victory:bool;
// Line 7:	global deadline:timestamp;

// ********* win Method ***********
@entry_win: // 0
ALIAS r1 $dataGet // 1
LOAD $dataGet "Data.Get" // 1
ALIAS r2 $contractName // 13
LOAD $contractName "test" // 13
ALIAS r3 $victory // 21
// reading global: victory
LOAD r0 6 // 21
PUSH r0 // 26
LOAD r0 "victory" // 28
PUSH r0 // 39
PUSH $contractName // 41
EXTCALL $dataGet // 43
POP $victory // 45
// Line 8:
// Line 9:	public win(from:address)
ALIAS r1 $from // 47
POP $from // 47
PUSH $from // 49
EXTCALL "Address()" // 51
POP $from // 66
// Line 10:	{
// Line 11:		victory = true;
	ALIAS r2 $literalexpression66 // 68
	LOAD $literalexpression66 true // 68
	COPY $literalexpression66 $victory // 73
@exit_win: // 76
LOAD r1 "Data.Set" // 77
// writing global: victory
PUSH $victory // 89
LOAD r0 "victory" // 91
PUSH r0 // 102
EXTCALL r1 // 104
RET // 106
// Line 12:	}

// ********* checkResult Task ***********
@entry_checkResult: // 107
ALIAS r1 $dataGet // 108
LOAD $dataGet "Data.Get" // 108
ALIAS r2 $contractName // 120
LOAD $contractName "test" // 120
ALIAS r3 $victory // 128
// reading global: victory
LOAD r0 6 // 128
PUSH r0 // 133
LOAD r0 "victory" // 135
PUSH r0 // 146
PUSH $contractName // 148
EXTCALL $dataGet // 150
POP $victory // 152
ALIAS r4 $deadline // 154
// reading global: deadline
LOAD r0 5 // 154
PUSH r0 // 159
LOAD r0 "deadline" // 161
PUSH r0 // 173
PUSH $contractName // 175
EXTCALL $dataGet // 177
POP $deadline // 179
PUSH $deadline // 181
EXTCALL "Timestamp()" // 183
POP $deadline // 200
// Line 13:
// Line 14:
// Line 15:		task checkResult(){
// Line 16:		if (victory) {
	COPY $victory r1 // 202
		JMPNOT r1 @then_ifstatement69 // 205
// Line 17:			Call.method<method>(win);
		ALIAS r2 $methodcallexpression73 // 209
		CALL @entry_win // 209
		POP $methodcallexpression73 // 213
		@then_ifstatement69: NOP // 216
// Line 18:			//break;
// Line 19:		}
// Line 20:
// Line 21:		local now: timestamp = Time.now();
	ALIAS r1 $now // 216
	ALIAS r2 $methodcallexpression77 // 216
	LOAD $methodcallexpression77 "Runtime.Time" // 216
	EXTCALL $methodcallexpression77 // 232
	POP $methodcallexpression77 // 234
	COPY $methodcallexpression77 $now // 236
// Line 22:
// Line 23:		if (now >= deadline) {
	COPY $now r2 // 239
	COPY $deadline r5 // 242
	GTE r2 r5 r6 // 245
		JMPNOT r6 @then_ifstatement80 // 249
// Line 24:			Call.method<method>(win);//break;
		ALIAS r2 $methodcallexpression86 // 253
		CALL @entry_win // 253
		POP $methodcallexpression86 // 257
		@then_ifstatement80: NOP // 260
// Line 25:		}
// Line 26:
// Line 27:		//continue;
// Line 28:		return false;
	ALIAS r2 $literalexpression90 // 260
	LOAD $literalexpression90 false // 260
	PUSH $literalexpression90 // 265
	JMP @exit_checkResult // 267
@exit_checkResult: // 270
RET // 271
// Line 29:
// Line 30:	}

// ********* Initialize Constructor ***********
@entry_constructor: // 272
ALIAS r1 $nexus_protocol_version // 273
// validate protocol version
LOAD r0 "Runtime.Version" // 273
EXTCALL r0 // 292
POP r0 // 294
LOAD $nexus_protocol_version 0 // 296
LT r0 $nexus_protocol_version r0 // 301
JMPNOT r0 @protocol_version_validated // 305
LOAD r0 "Current nexus protocol version should be 0 or more" // 309
THROW r0 // 363
@protocol_version_validated: NOP // 366
ALIAS r1 $victory // 366
ALIAS r2 $deadline // 366
// Line 31:
// Line 32:	constructor(owner:address) {
ALIAS r3 $owner // 366
POP $owner // 366
PUSH $owner // 368
EXTCALL "Address()" // 370
POP $owner // 385
// Line 33:		victory = false;
	ALIAS r4 $literalexpression97 // 387
	LOAD $literalexpression97 false // 387
	COPY $literalexpression97 $victory // 392
// Line 34:		deadline = Time.now(); //+ Time.hours(2); no such function as Time.hours
	ALIAS r4 $methodcallexpression99 // 395
	LOAD $methodcallexpression99 "Runtime.Time" // 395
	EXTCALL $methodcallexpression99 // 411
	POP $methodcallexpression99 // 413
	COPY $methodcallexpression99 $deadline // 415
// Line 35:		Task.start(Call.method<method>(checkResult), owner, 0, TaskMode.Always, 999);
	ALIAS r4 $methodcallexpression101 // 418
	ALIAS r5 $literalexpression114 // 418
	LOAD $literalexpression114 999 // 418
	PUSH $literalexpression114 // 424
	ALIAS r5 $literalexpression113 // 426
	LOAD $literalexpression113 0 Enum // 426
	PUSH $literalexpression113 // 434
	ALIAS r5 $literalexpression112 // 436
	LOAD $literalexpression112 0 // 436
	PUSH $literalexpression112 // 441
	COPY $owner r5 // 443
	PUSH r5 // 446
	ALIAS r5 $methodcallexpression107 // 448
	CALL @entry_checkResult // 448
	POP $methodcallexpression107 // 452
	PUSH $methodcallexpression107 // 454
	LOAD $methodcallexpression101 "Task.Start" // 456
	EXTCALL $methodcallexpression101 // 470
	POP $methodcallexpression101 // 472
@exit_constructor: // 474
LOAD r3 "Data.Set" // 475
// writing global: victory
PUSH $victory // 487
LOAD r0 "victory" // 489
PUSH r0 // 500
EXTCALL r3 // 502
// writing global: deadline
PUSH $deadline // 504
LOAD r0 "deadline" // 506
PUSH r0 // 518
EXTCALL r3 // 520
RET // 522
