// Line 1:contract hello
// Line 2:{
// Line 3:	import Token;
// Line 4:	import Runtime;
// Line 5:
// Line 6:	global admin: address;

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
ALIAS r1 $admin // 94
// Line 7:
// Line 8:	constructor(owner:address)
ALIAS r2 $owner // 94
POP $owner // 94
PUSH $owner // 96
EXTCALL "Address()" // 98
POP $owner // 113
// Line 9:	{
// Line 10:		admin = owner;
	COPY $owner r3 // 115
	COPY r3 $admin // 118
@exit_constructor: // 121
LOAD r2 "Data.Set" // 122
// writing global: admin
PUSH $admin // 134
LOAD r0 "admin" // 136
PUSH r0 // 145
EXTCALL r2 // 147
RET // 149
// Line 11:	}

// ********* onUpgrade Trigger ***********
@entry_onUpgrade: // 150
ALIAS r1 $dataGet // 151
LOAD $dataGet "Data.Get" // 151
ALIAS r2 $contractName // 163
LOAD $contractName "hello" // 163
ALIAS r3 $admin // 172
// reading global: admin
LOAD r0 8 // 172
PUSH r0 // 177
LOAD r0 "admin" // 179
PUSH r0 // 188
PUSH $contractName // 190
EXTCALL $dataGet // 192
POP $admin // 194
PUSH $admin // 196
EXTCALL "Address()" // 198
POP $admin // 213
// Line 12:	
// Line 13:	trigger onUpgrade(from:address) {
ALIAS r1 $from // 215
POP $from // 215
PUSH $from // 217
EXTCALL "Address()" // 219
POP $from // 234
// Line 14:		Runtime.expect(Runtime.isWitness(admin), "witness failed");
	ALIAS r2 $methodcallexpression106 // 236
	COPY $admin r4 // 236
	PUSH r4 // 239
	LOAD $methodcallexpression106 "Runtime.IsWitness" // 241
	EXTCALL $methodcallexpression106 // 262
	POP $methodcallexpression106 // 264
	JMPIF $methodcallexpression106 @expect_methodcallexpression103 // 266
	ALIAS r4 $literalexpression109 // 270
	LOAD $literalexpression109 "witness failed" // 270
	THROW $literalexpression109 // 288
	@expect_methodcallexpression103: NOP // 291
// Line 15:		return;
	JMP @exit_onUpgrade // 291
@exit_onUpgrade: // 294
RET // 295
// Line 16:	}

// ********* callMe Method ***********
@entry_callMe: // 296
// Line 17:	
// Line 18:	public callMe(from:address)
ALIAS r1 $from // 297
POP $from // 297
PUSH $from // 299
EXTCALL "Address()" // 301
POP $from // 316
// Line 19:	{
// Line 20:		Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r2 $methodcallexpression119 // 318
	COPY $from r3 // 318
	PUSH r3 // 321
	LOAD $methodcallexpression119 "Runtime.IsWitness" // 323
	EXTCALL $methodcallexpression119 // 344
	POP $methodcallexpression119 // 346
	JMPIF $methodcallexpression119 @expect_methodcallexpression116 // 348
	ALIAS r3 $literalexpression122 // 352
	LOAD $literalexpression122 "witness failed" // 352
	THROW $literalexpression122 // 370
	@expect_methodcallexpression116: NOP // 373
// Line 21:		local thisAddr:address = $THIS_ADDRESS;
	ALIAS r2 $thisAddr // 373
	ALIAS r3 $literalexpression124 // 373
	LOAD $literalexpression124 0x02002CF24DBA5FB0A30E26E83B2AC5B9E29E1B161E5C1FA7425E73043362938B9824 // 373
	PUSH $literalexpression124 // 411
	EXTCALL "Address()" // 413
	POP $literalexpression124 // 428
	COPY $literalexpression124 $thisAddr // 430
// Line 22:		Token.transfer(from, thisAddr, "KCAL", Decimal.convert(10, 5));
	ALIAS r3 $methodcallexpression128 // 433
	ALIAS r4 $literalexpression139 // 433
	LOAD $literalexpression139 10 // 433
	LOAD r5 10 // 438
	POW r5 $literalexpression139 $literalexpression139 // 443
	ALIAS r5 $literalexpression140 // 447
	LOAD $literalexpression140 5 // 447
	MUL $literalexpression140 $literalexpression139 $literalexpression139 // 452
	PUSH $literalexpression139 // 456
	ALIAS r4 $literalexpression135 // 458
	LOAD $literalexpression135 "KCAL" // 458
	PUSH $literalexpression135 // 466
	COPY $thisAddr r4 // 468
	PUSH r4 // 471
	COPY $from r4 // 473
	PUSH r4 // 476
	LOAD $methodcallexpression128 "Runtime.TransferTokens" // 478
	EXTCALL $methodcallexpression128 // 504
@exit_callMe: // 506
RET // 507
