// Line 1:
// Line 2:	
// Line 3:    contract test {
// Line 4:        import Map;
// Line 5:		global my_state:  storage_map<address,number>;

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
// clearing my_state storage
LOAD r0 "my_state" // 94
PUSH r0 // 106
LOAD r0 "Map.Clear" // 108
EXTCALL r0 // 121
// Line 6:	
// Line 7:		constructor(owner:address)
ALIAS r1 $owner // 123
POP $owner // 123
PUSH $owner // 125
EXTCALL "Address()" // 127
POP $owner // 142
// Line 8:		{
// Line 9:			my_state.set(owner, 42);
	ALIAS r2 $methodcallexpression72 // 144
	ALIAS r3 $literalexpression80 // 144
	LOAD $literalexpression80 42 // 144
	PUSH $literalexpression80 // 149
	COPY $owner r3 // 151
	PUSH r3 // 154
	ALIAS r3 $literalexpression78 // 156
	LOAD $literalexpression78 "my_state" // 156
	PUSH $literalexpression78 // 168
	LOAD $methodcallexpression72 "Map.Set" // 170
	EXTCALL $methodcallexpression72 // 181
@exit_constructor: // 183
RET // 184
// Line 10:		}

// ********* getState Method ***********
@entry_getState: // 185
// Line 11:	
// Line 12:		public getState(target:address):number
ALIAS r1 $target // 186
POP $target // 186
PUSH $target // 188
EXTCALL "Address()" // 190
POP $target // 205
// Line 13:		{
// Line 14:			return my_state.get(target);
	LOAD r2 3 // field type // 207
	PUSH r2 // 212
	COPY $target r3 // 214
	PUSH r3 // 217
	ALIAS r3 $literalexpression89 // 219
	LOAD $literalexpression89 "my_state" // 219
	PUSH $literalexpression89 // 231
	LOAD $literalexpression89 "test" // contract name // 233
	PUSH $literalexpression89 // 241
	LOAD r2 "Map.Get" // 243
	EXTCALL r2 // 254
	POP r2 // 256
	PUSH r2 // 258
	JMP @exit_getState // 260
@exit_getState: // 263
RET // 264
