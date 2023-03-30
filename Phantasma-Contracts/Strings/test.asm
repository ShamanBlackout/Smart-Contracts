// Line 1:contract test {
// Line 2:	global val: string;

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
// Line 6:		val += "hello";
	COPY $val r3 // 115
	ALIAS r4 $literalexpression48 // 118
	LOAD $literalexpression48 "hello" // 118
	ADD r3 $literalexpression48 r5 // 127
	COPY r5 $val // 131
// Line 7:		val += " world";
	COPY $val r3 // 134
	ALIAS r4 $literalexpression52 // 137
	LOAD $literalexpression52 " world" // 137
	ADD r3 $literalexpression52 r5 // 147
	COPY r5 $val // 151
@exit_constructor: // 154
LOAD r2 "Data.Set" // 155
// writing global: val
PUSH $val // 167
LOAD r0 "val" // 169
PUSH r0 // 176
EXTCALL r2 // 178
RET // 180
// Line 8:	}

// ********* getLength Method ***********
@entry_getLength: // 181
ALIAS r1 $dataGet // 182
LOAD $dataGet "Data.Get" // 182
ALIAS r2 $contractName // 194
LOAD $contractName "test" // 194
ALIAS r3 $val // 202
// reading global: val
LOAD r0 4 // 202
PUSH r0 // 207
LOAD r0 "val" // 209
PUSH r0 // 216
PUSH $contractName // 218
EXTCALL $dataGet // 220
POP $val // 222
// Line 9:
// Line 10:	public getLength():number
// Line 11:	{
// Line 12:		return val.length();
	COPY $val r1 // 224
	SIZE r1 r1 // 227
	PUSH r1 // 230
	JMP @exit_getLength // 232
@exit_getLength: // 235
RET // 236
