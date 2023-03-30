// Line 1:contract test {
// Line 2:	import Runtime;
// Line 3:	import Token;

// ********* paySomething Method ***********
@entry_paySomething: // 0
// Line 4:
// Line 5:	public paySomething(from:address, amount:number, symbol:string)
ALIAS r1 $from // 1
POP $from // 1
PUSH $from // 3
EXTCALL "Address()" // 5
POP $from // 20
ALIAS r2 $amount // 22
POP $amount // 22
CAST $amount $amount #Number // 24
ALIAS r3 $symbol // 28
POP $symbol // 28
// Line 6:	{
// Line 7:		Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r4 $methodcallexpression103 // 30
	COPY $from r5 // 30
	PUSH r5 // 33
	LOAD $methodcallexpression103 "Runtime.IsWitness" // 35
	EXTCALL $methodcallexpression103 // 56
	POP $methodcallexpression103 // 58
	JMPIF $methodcallexpression103 @expect_methodcallexpression100 // 60
	ALIAS r5 $literalexpression106 // 64
	LOAD $literalexpression106 "witness failed" // 64
	THROW $literalexpression106 // 82
	@expect_methodcallexpression100: NOP // 85
// Line 8:
// Line 9:		local flags:TokenFlags = Token.getFlags(symbol);
	ALIAS r4 $flags // 85
	ALIAS r5 $methodcallexpression107 // 85
	COPY $symbol r6 // 85
	PUSH r6 // 88
	LOAD $methodcallexpression107 "Runtime.GetTokenFlags" // 90
	EXTCALL $methodcallexpression107 // 115
	POP $methodcallexpression107 // 117
	COPY $methodcallexpression107 $flags // 119
// Line 10:		local price : number = 1; 
	ALIAS r5 $price // 122
	ALIAS r6 $literalexpression112 // 122
	LOAD $literalexpression112 1 // 122
	COPY $literalexpression112 $price // 127
// Line 11:		if (flags.isSet(TokenFlags.Fungible)) {
	COPY $flags r6 // 130
	ALIAS r7 $literalexpression120 // 133
	LOAD $literalexpression120 2 Enum // 133
	AND r6 $literalexpression120 r6 // 141
		JMPNOT r6 @then_ifstatement115 // 145
// Line 12:			local thisAddr:address = $THIS_ADDRESS;
		ALIAS r7 $thisAddr // 149
		ALIAS r8 $literalexpression123 // 149
		LOAD $literalexpression123 0x02009F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08 // 149
		PUSH $literalexpression123 // 187
		EXTCALL "Address()" // 189
		POP $literalexpression123 // 204
		COPY $literalexpression123 $thisAddr // 206
// Line 13:			Token.transfer(from, thisAddr, "SOUL", price);
		ALIAS r8 $methodcallexpression127 // 209
		COPY $price r9 // 209
		PUSH r9 // 212
		ALIAS r9 $literalexpression134 // 214
		LOAD $literalexpression134 "SOUL" // 214
		PUSH $literalexpression134 // 222
		COPY $thisAddr r9 // 224
		PUSH r9 // 227
		COPY $from r9 // 229
		PUSH r9 // 232
		LOAD $methodcallexpression127 "Runtime.TransferTokens" // 234
		EXTCALL $methodcallexpression127 // 260
		@then_ifstatement115: NOP // 263
@exit_paySomething: // 263
RET // 264
