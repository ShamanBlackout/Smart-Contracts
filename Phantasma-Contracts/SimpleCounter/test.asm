// Line 1:contract test {
// Line 2:	global counter: number;

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
ALIAS r1 $counter // 94
// Line 3:
// Line 4:	constructor(owner:address)
ALIAS r2 $owner // 94
POP $owner // 94
PUSH $owner // 96
EXTCALL "Address()" // 98
POP $owner // 113
// Line 5:	{
// Line 6:		counter = 0;
	ALIAS r3 $literalexpression48 // 115
	LOAD $literalexpression48 0 // 115
	COPY $literalexpression48 $counter // 120
@exit_constructor: // 123
LOAD r2 "Data.Set" // 124
// writing global: counter
PUSH $counter // 136
LOAD r0 "counter" // 138
PUSH r0 // 149
EXTCALL r2 // 151
RET // 153
// Line 7:	}

// ********* increment Method ***********
@entry_increment: // 154
ALIAS r1 $dataGet // 155
LOAD $dataGet "Data.Get" // 155
ALIAS r2 $contractName // 167
LOAD $contractName "test" // 167
ALIAS r3 $counter // 175
// reading global: counter
LOAD r0 3 // 175
PUSH r0 // 180
LOAD r0 "counter" // 182
PUSH r0 // 193
PUSH $contractName // 195
EXTCALL $dataGet // 197
POP $counter // 199
// Line 8:
// Line 9:	public increment()
// Line 10:	{
// Line 11:		if (counter < 0){
	COPY $counter r1 // 201
	ALIAS r2 $literalexpression53 // 204
	LOAD $literalexpression53 0 // 204
	LT r1 $literalexpression53 r4 // 209
		JMPNOT r4 @then_ifstatement51 // 213
// Line 12:			throw "invalid state";
		ALIAS r1 $literalexpression56 // 217
		LOAD $literalexpression56 "invalid state" // 217
		THROW $literalexpression56 // 234
		@then_ifstatement51: NOP // 237
// Line 13:		}
// Line 14:		counter += 1;
	COPY $counter r1 // 237
	ALIAS r2 $literalexpression59 // 240
	LOAD $literalexpression59 1 // 240
	ADD r1 $literalexpression59 r4 // 245
	COPY r4 $counter // 249
@exit_increment: // 252
LOAD r1 "Data.Set" // 253
// writing global: counter
PUSH $counter // 265
LOAD r0 "counter" // 267
PUSH r0 // 278
EXTCALL r1 // 280
RET // 282
