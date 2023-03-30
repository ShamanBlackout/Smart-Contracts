// Line 1:contract test {
// Line 2:
// Line 3:	import Call;

// ********* onReceive Trigger ***********
@entry_onReceive: // 0
// Line 4:
// Line 5:	trigger onReceive(from:address,to:address, symbol:string, amount:number)
ALIAS r1 $from // 1
POP $from // 1
PUSH $from // 3
EXTCALL "Address()" // 5
POP $from // 20
ALIAS r2 $to // 22
POP $to // 22
PUSH $to // 24
EXTCALL "Address()" // 26
POP $to // 41
ALIAS r3 $symbol // 43
POP $symbol // 43
ALIAS r4 $amount // 45
POP $amount // 45
CAST $amount $amount #Number // 47
// Line 6:	{
// Line 7:		if (symbol != "SOUL") {
	COPY $symbol r5 // 51
	ALIAS r6 $literalexpression62 // 54
	LOAD $literalexpression62 "SOUL" // 54
	EQUAL r5 $literalexpression62 r7 // 62
	NOT r7 r7 // 66
		JMPNOT r7 @then_ifstatement60 // 69
// Line 8:			Call.contract<none>("Swap", "SwapTokens", from, symbol, "SOUL", amount);
		ALIAS r5 $methodcallexpression67 // 73
		COPY $amount r6 // 73
		PUSH r6 // 76
		ALIAS r6 $literalexpression75 // 78
		LOAD $literalexpression75 "SOUL" // 78
		PUSH $literalexpression75 // 86
		COPY $symbol r6 // 88
		PUSH r6 // 91
		COPY $from r6 // 93
		PUSH r6 // 96
		ALIAS r6 $literalexpression72 // 98
		LOAD $literalexpression72 "SwapTokens" // 98
		PUSH $literalexpression72 // 112
		LOAD $methodcallexpression67 "Swap" // 114
		CTX $methodcallexpression67 $methodcallexpression67 // 122
		SWITCH $methodcallexpression67 // 125
		@then_ifstatement60: NOP // 128
// Line 9:		}
// Line 10:
// Line 11:		return;
	JMP @exit_onReceive // 128
@exit_onReceive: // 131
RET // 132
