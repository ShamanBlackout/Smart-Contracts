// Line 1:// NOTE - like other custom types, it is declared outside the scope of a contract
// Line 2:enum MyEnum { A = 0, B = 1, C = 2}
// Line 3:// if the numbers are sequential, it is ok to ommit them, eg:
// Line 4://enum MyEnum { A, B, C}
// Line 5:
// Line 6:contract test {
// Line 7:	global state: MyEnum;

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
ALIAS r1 $state // 94
// Line 8:
// Line 9:	constructor(owner:address)
ALIAS r2 $owner // 94
POP $owner // 94
PUSH $owner // 96
EXTCALL "Address()" // 98
POP $owner // 113
// Line 10:	{
// Line 11:		state = MyEnum.B;
	ALIAS r3 $literalexpression49 // 115
	LOAD $literalexpression49 1 Enum // 115
	COPY $literalexpression49 $state // 123
@exit_constructor: // 126
LOAD r2 "Data.Set" // 127
// writing global: state
PUSH $state // 139
LOAD r0 "state" // 141
PUSH r0 // 150
EXTCALL r2 // 152
RET // 154
// Line 12:	}

// ********* getValue Method ***********
@entry_getValue: // 155
ALIAS r1 $dataGet // 156
LOAD $dataGet "Data.Get" // 156
ALIAS r2 $contractName // 168
LOAD $contractName "test" // 168
ALIAS r3 $state // 176
// reading global: state
LOAD r0 7 // 176
PUSH r0 // 181
LOAD r0 "state" // 183
PUSH r0 // 192
PUSH $contractName // 194
EXTCALL $dataGet // 196
POP $state // 198
// Line 13:
// Line 14:	public getValue():MyEnum
// Line 15:	{
// Line 16:		return state;
	COPY $state r1 // 200
	PUSH r1 // 203
	JMP @exit_getValue // 205
@exit_getValue: // 208
RET // 209
