// Line 1:
// Line 2:contract test {
// Line 3:	import Runtime;
// Line 4:	import List;
// Line 5:	import Call;
// Line 6:
// Line 7:	global owners: storage_list<address>;

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
// clearing owners storage
LOAD r0 "owners" // 94
PUSH r0 // 104
LOAD r0 "List.Clear" // 106
EXTCALL r0 // 120
// Line 8:
// Line 9:	constructor(owner:address)
ALIAS r1 $owner // 122
POP $owner // 122
PUSH $owner // 124
EXTCALL "Address()" // 126
POP $owner // 141
// Line 10:	{
// Line 11:		owners.add(owner);
	ALIAS r2 $methodcallexpression90 // 143
	COPY $owner r3 // 143
	PUSH r3 // 146
	ALIAS r3 $literalexpression94 // 148
	LOAD $literalexpression94 "owners" // 148
	PUSH $literalexpression94 // 158
	LOAD $methodcallexpression90 "List.Add" // 160
	EXTCALL $methodcallexpression90 // 172
@exit_constructor: // 174
RET // 175
// Line 12:	}

// ********* validateSignatures Method ***********
@entry_validateSignatures: // 176
// Line 13:
// Line 14:	private validateSignatures() {
// Line 15:		local index:number = 0;
	ALIAS r1 $index // 177
	ALIAS r2 $literalexpression98 // 177
	LOAD $literalexpression98 0 // 177
	COPY $literalexpression98 $index // 182
// Line 16:		local count:number = owners.count();
	ALIAS r2 $count // 185
	ALIAS r3 $methodcallexpression101 // 185
	ALIAS r4 $literalexpression103 // 185
	LOAD $literalexpression103 "owners" // 185
	PUSH $literalexpression103 // 195
	LOAD $literalexpression103 "test" // contract name // 197
	PUSH $literalexpression103 // 205
	LOAD $methodcallexpression101 "List.Count" // 207
	EXTCALL $methodcallexpression101 // 221
	POP $methodcallexpression101 // 223
	COPY $methodcallexpression101 $count // 225
	@loop_start_whilestatement106: NOP // 229
// Line 17:	
// Line 18:		while (index < count) {
	COPY $index r3 // 229
	COPY $count r4 // 232
	LT r3 r4 r5 // 235
		JMPNOT r5 @loop_end_whilestatement106 // 239
// Line 19:			local addr:address = owners.get(index);
		ALIAS r3 $addr // 243
		LOAD r4 8 // field type // 243
		PUSH r4 // 248
		COPY $index r6 // 250
		PUSH r6 // 253
		ALIAS r6 $literalexpression114 // 255
		LOAD $literalexpression114 "owners" // 255
		PUSH $literalexpression114 // 265
		LOAD $literalexpression114 "test" // contract name // 267
		PUSH $literalexpression114 // 275
		LOAD r4 "List.Get" // 277
		EXTCALL r4 // 289
		POP r4 // 291
		PUSH r4 // 293
		EXTCALL "Address()" // 295
		POP r4 // 310
		COPY r4 $addr // 312
// Line 20:			if (!Runtime.isWitness(addr)) {
		ALIAS r4 $methodcallexpression119 // 315
		COPY $addr r6 // 315
		PUSH r6 // 318
		LOAD $methodcallexpression119 "Runtime.IsWitness" // 320
		EXTCALL $methodcallexpression119 // 341
		POP $methodcallexpression119 // 343
		NOT $methodcallexpression119 $methodcallexpression119 // 345
			JMPNOT $methodcallexpression119 @then_ifstatement118 // 348
// Line 21:				throw "missing signature of "+addr;
			ALIAS r6 $literalexpression124 // 352
			LOAD $literalexpression124 "missing signature of " // 352
			COPY $addr r7 // 377
			CAST r7 r7 #String // 380
			ADD $literalexpression124 r7 r8 // 384
			THROW r8 // 388
			@then_ifstatement118: NOP // 391
		JMP @loop_start_whilestatement106 // 391
		@loop_end_whilestatement106: NOP // 395
@exit_validateSignatures: // 395
RET // 396
// Line 22:			}
// Line 23:		}
// Line 24:	}

// ********* isOwner Method ***********
@entry_isOwner: // 397
// Line 25:
// Line 26:	public isOwner(target:address):bool {
ALIAS r1 $target // 398
POP $target // 398
PUSH $target // 400
EXTCALL "Address()" // 402
POP $target // 417
// Line 27:		local index:number = 0;
	ALIAS r2 $index // 419
	ALIAS r3 $literalexpression133 // 419
	LOAD $literalexpression133 0 // 419
	COPY $literalexpression133 $index // 424
// Line 28:		local count:number = owners.count();
	ALIAS r3 $count // 427
	ALIAS r4 $methodcallexpression136 // 427
	ALIAS r5 $literalexpression138 // 427
	LOAD $literalexpression138 "owners" // 427
	PUSH $literalexpression138 // 437
	LOAD $literalexpression138 "test" // contract name // 439
	PUSH $literalexpression138 // 447
	LOAD $methodcallexpression136 "List.Count" // 449
	EXTCALL $methodcallexpression136 // 463
	POP $methodcallexpression136 // 465
	COPY $methodcallexpression136 $count // 467
	@loop_start_whilestatement141: NOP // 471
// Line 29:
// Line 30:		while (index < count) {
	COPY $index r4 // 471
	COPY $count r5 // 474
	LT r4 r5 r6 // 477
		JMPNOT r6 @loop_end_whilestatement141 // 481
// Line 31:			local addr:address = owners.get(index);
		ALIAS r4 $addr // 485
		LOAD r5 8 // field type // 485
		PUSH r5 // 490
		COPY $index r7 // 492
		PUSH r7 // 495
		ALIAS r7 $literalexpression149 // 497
		LOAD $literalexpression149 "owners" // 497
		PUSH $literalexpression149 // 507
		LOAD $literalexpression149 "test" // contract name // 509
		PUSH $literalexpression149 // 517
		LOAD r5 "List.Get" // 519
		EXTCALL r5 // 531
		POP r5 // 533
		PUSH r5 // 535
		EXTCALL "Address()" // 537
		POP r5 // 552
		COPY r5 $addr // 554
// Line 32:			if (addr == target) {
		COPY $addr r5 // 557
		COPY $target r7 // 560
		EQUAL r5 r7 r8 // 563
			JMPNOT r8 @then_ifstatement153 // 567
// Line 33:				return true;
			ALIAS r5 $literalexpression158 // 571
			LOAD $literalexpression158 true // 571
			PUSH $literalexpression158 // 576
			JMP @exit_isOwner // 578
			@then_ifstatement153: NOP // 582
		JMP @loop_start_whilestatement141 // 582
		@loop_end_whilestatement141: NOP // 586
// Line 34:			}
// Line 35:		}
// Line 36:
// Line 37:		return false;
	ALIAS r4 $literalexpression160 // 586
	LOAD $literalexpression160 false // 586
	PUSH $literalexpression160 // 591
	JMP @exit_isOwner // 593
@exit_isOwner: // 596
RET // 597
// Line 38:	}

// ********* addOwner Method ***********
@entry_addOwner: // 598
// Line 39:	
// Line 40:
// Line 41:	public addOwner(target:address) {
ALIAS r1 $target // 599
POP $target // 599
PUSH $target // 601
EXTCALL "Address()" // 603
POP $target // 618
// Line 42:	
// Line 43:		Runtime.expect(!this.isOwner(target), "already is owner");
	ALIAS r2 $methodcallexpression170 // 620
	COPY $target r3 // 620
	PUSH r3 // 623
	CALL @entry_isOwner // 625
	POP $methodcallexpression170 // 629
	NOT $methodcallexpression170 $methodcallexpression170 // 631
	JMPIF $methodcallexpression170 @expect_methodcallexpression167 // 634
	ALIAS r3 $literalexpression174 // 638
	LOAD $literalexpression174 "already is owner" // 638
	THROW $literalexpression174 // 658
	@expect_methodcallexpression167: NOP // 661
// Line 44:		this.validateSignatures();
	ALIAS r2 $methodcallexpression176 // 661
	CALL @entry_validateSignatures // 661
// Line 45:		owners.add(target);
	ALIAS r2 $methodcallexpression178 // 665
	COPY $target r3 // 665
	PUSH r3 // 668
	ALIAS r3 $literalexpression182 // 670
	LOAD $literalexpression182 "owners" // 670
	PUSH $literalexpression182 // 680
	LOAD $methodcallexpression178 "List.Add" // 682
	EXTCALL $methodcallexpression178 // 694
@exit_addOwner: // 696
RET // 697
// Line 46:	}

// ********* onSend Trigger ***********
@entry_onSend: // 698
// Line 47:
// Line 48:	trigger onSend(from:address, to:address, symbol:string,amount:number){
ALIAS r1 $from // 699
POP $from // 699
PUSH $from // 701
EXTCALL "Address()" // 703
POP $from // 718
ALIAS r2 $to // 720
POP $to // 720
PUSH $to // 722
EXTCALL "Address()" // 724
POP $to // 739
ALIAS r3 $symbol // 741
POP $symbol // 741
ALIAS r4 $amount // 743
POP $amount // 743
CAST $amount $amount #Number // 745
// Line 49:		this.validateSignatures();
	ALIAS r5 $methodcallexpression195 // 749
	CALL @entry_validateSignatures // 749
@exit_onSend: // 753
RET // 754
