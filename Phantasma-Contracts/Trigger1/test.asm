// Line 1:contract test {

// ********* onReceive Trigger ***********
@entry_onReceive: // 0
// Line 2:
// Line 3:	trigger onReceive(from:address,to:address,symbol:string, amount:number)
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
// Line 4:	{
// Line 5:		if (symbol != "KCAL") {
	COPY $symbol r5 // 51
	ALIAS r6 $literalexpression54 // 54
	LOAD $literalexpression54 "KCAL" // 54
	EQUAL r5 $literalexpression54 r7 // 62
	NOT r7 r7 // 66
		JMPNOT r7 @then_ifstatement52 // 69
// Line 6:			throw "can't receive asset: " + symbol;
		ALIAS r5 $literalexpression58 // 73
		LOAD $literalexpression58 "can't receive asset: " // 73
		COPY $symbol r6 // 98
		ADD $literalexpression58 r6 r8 // 101
		THROW r8 // 105
		@then_ifstatement52: NOP // 108
// Line 7:		}
// Line 8:
// Line 9:		return;
	JMP @exit_onReceive // 108
@exit_onReceive: // 111
RET // 112
