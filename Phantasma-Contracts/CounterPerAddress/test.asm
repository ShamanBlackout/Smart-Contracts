// Line 1:contract test {
// Line 2:	import Runtime;
// Line 3:	import Map;
// Line 4:
// Line 5:	global counters: storage_map<address, number>;

// ********* increment Method ***********
@entry_increment: // 0
// Line 6:
// Line 7:	public increment(from:address)
ALIAS r1 $from // 1
POP $from // 1
PUSH $from // 3
EXTCALL "Address()" // 5
POP $from // 20
// Line 8:	{
// Line 9:		Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r2 $methodcallexpression73 // 22
	COPY $from r3 // 22
	PUSH r3 // 25
	LOAD $methodcallexpression73 "Runtime.IsWitness" // 27
	EXTCALL $methodcallexpression73 // 48
	POP $methodcallexpression73 // 50
	JMPIF $methodcallexpression73 @expect_methodcallexpression70 // 52
	ALIAS r3 $literalexpression76 // 56
	LOAD $literalexpression76 "witness failed" // 56
	THROW $literalexpression76 // 74
	@expect_methodcallexpression70: NOP // 77
// Line 10:		local temp: number;
	ALIAS r2 $temp // 77
// Line 11:		temp = counters.get(from);
	LOAD r3 3 // field type // 77
	PUSH r3 // 82
	COPY $from r4 // 84
	PUSH r4 // 87
	ALIAS r4 $literalexpression95 // 89
	LOAD $literalexpression95 "counters" // 89
	PUSH $literalexpression95 // 101
	LOAD $literalexpression95 "test" // contract name // 103
	PUSH $literalexpression95 // 111
	LOAD r3 "Map.Get" // 113
	EXTCALL r3 // 124
	POP r3 // 126
	COPY r3 $temp // 128
// Line 12:		temp += 1;
	COPY $temp r3 // 131
	ALIAS r4 $literalexpression98 // 134
	LOAD $literalexpression98 1 // 134
	ADD r3 $literalexpression98 r5 // 139
	COPY r5 $temp // 143
// Line 13:		counters.set(from, temp);
	ALIAS r3 $methodcallexpression102 // 146
	COPY $temp r4 // 146
	PUSH r4 // 149
	COPY $from r4 // 151
	PUSH r4 // 154
	ALIAS r4 $literalexpression108 // 156
	LOAD $literalexpression108 "counters" // 156
	PUSH $literalexpression108 // 168
	LOAD $methodcallexpression102 "Map.Set" // 170
	EXTCALL $methodcallexpression102 // 181
@exit_increment: // 183
RET // 184
