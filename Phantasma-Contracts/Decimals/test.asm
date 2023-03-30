// Line 1:contract test {
// Line 2:	global val: decimal<4>; // the number between <> is the number of decimal places

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
ALIAS r1 $val // 94
// Line 3:
// Line 4:	constructor(owner:address)
ALIAS r2 $owner // 94
POP $owner // 94
PUSH $owner // 96
EXTCALL "Address()" // 98
POP $owner // 113
// Line 5:	{
// Line 6:		val = 2.1425;
	ALIAS r3 $literalexpression48 // 115
	LOAD $literalexpression48 21425 // 115
	COPY $literalexpression48 $val // 121
@exit_constructor: // 124
LOAD r2 "Data.Set" // 125
// writing global: val
PUSH $val // 137
LOAD r0 "val" // 139
PUSH r0 // 146
EXTCALL r2 // 148
RET // 150
// Line 7:	}

// ********* getValue Method ***********
@entry_getValue: // 151
ALIAS r1 $dataGet // 152
LOAD $dataGet "Data.Get" // 152
ALIAS r2 $contractName // 164
LOAD $contractName "test" // 164
ALIAS r3 $val // 172
// reading global: val
LOAD r0 3 // 172
PUSH r0 // 177
LOAD r0 "val" // 179
PUSH r0 // 186
PUSH $contractName // 188
EXTCALL $dataGet // 190
POP $val // 192
// Line 8:
// Line 9:	public getValue():number
// Line 10:	{
// Line 11:		return val; // this will return 21425, which is the previous value in fixed point format
	COPY $val r1 // 194
	PUSH r1 // 197
	JMP @exit_getValue // 199
@exit_getValue: // 202
RET // 203
// Line 12:	}

// ********* getDecimals Method ***********
@entry_getDecimals: // 204
ALIAS r1 $dataGet // 205
LOAD $dataGet "Data.Get" // 205
ALIAS r2 $contractName // 217
LOAD $contractName "test" // 217
ALIAS r3 $val // 225
// reading global: val
LOAD r0 3 // 225
PUSH r0 // 230
LOAD r0 "val" // 232
PUSH r0 // 239
PUSH $contractName // 241
EXTCALL $dataGet // 243
POP $val // 245
// Line 13:
// Line 14:	public getDecimals():number
// Line 15:	{
// Line 16:		return val.decimals(); // this returns 4 as result
	LOAD r1 4 // 247
	PUSH r1 // 252
	JMP @exit_getDecimals // 254
@exit_getDecimals: // 257
RET // 258
// Line 17:	}

// ********* sum Method ***********
@entry_sum: // 259
ALIAS r1 $dataGet // 260
LOAD $dataGet "Data.Get" // 260
ALIAS r2 $contractName // 272
LOAD $contractName "test" // 272
ALIAS r3 $val // 280
// reading global: val
LOAD r0 3 // 280
PUSH r0 // 285
LOAD r0 "val" // 287
PUSH r0 // 294
PUSH $contractName // 296
EXTCALL $dataGet // 298
POP $val // 300
// Line 18:
// Line 19:	public sum(other:decimal<4>):number
ALIAS r1 $other // 302
POP $other // 302
// Line 20:	{
// Line 21:		return val + other;
	COPY $val r2 // 304
	COPY $other r4 // 307
	ADD r2 r4 r5 // 310
	PUSH r5 // 314
	JMP @exit_sum // 316
@exit_sum: // 319
RET // 320
