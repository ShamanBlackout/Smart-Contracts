// Line 1:contract test {
// Line 2:	import Runtime;
// Line 3:	import Token;

// ********* paySomething Method ***********
@entry_paySomething: // 0
// Line 4:
// Line 5:	public paySomething(from:address, quantity:number)
ALIAS r1 $from // 1
POP $from // 1
PUSH $from // 3
EXTCALL "Address()" // 5
POP $from // 20
ALIAS r2 $quantity // 22
POP $quantity // 22
CAST $quantity $quantity #Number // 24
// Line 6:	{
// Line 7:		Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r3 $methodcallexpression101 // 28
	COPY $from r4 // 28
	PUSH r4 // 31
	LOAD $methodcallexpression101 "Runtime.IsWitness" // 33
	EXTCALL $methodcallexpression101 // 54
	POP $methodcallexpression101 // 56
	JMPIF $methodcallexpression101 @expect_methodcallexpression98 // 58
	ALIAS r4 $literalexpression104 // 62
	LOAD $literalexpression104 "witness failed" // 62
	THROW $literalexpression104 // 80
	@expect_methodcallexpression98: NOP // 83
// Line 8:
// Line 9:		local price: number = 10;
	ALIAS r3 $price // 83
	ALIAS r4 $literalexpression105 // 83
	LOAD $literalexpression105 10 // 83
	COPY $literalexpression105 $price // 88
// Line 10:		price *= quantity;
	COPY $price r4 // 91
	COPY $quantity r5 // 94
	MUL r4 r5 r6 // 97
	COPY r6 $price // 101
// Line 11:
// Line 12:		local thisAddr:address = $THIS_ADDRESS;
	ALIAS r4 $thisAddr // 104
	ALIAS r5 $literalexpression113 // 104
	LOAD $literalexpression113 0x02009F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08 // 104
	PUSH $literalexpression113 // 142
	EXTCALL "Address()" // 144
	POP $literalexpression113 // 159
	COPY $literalexpression113 $thisAddr // 161
// Line 13:		Token.transfer(from, thisAddr, "SOUL", price);
	ALIAS r5 $methodcallexpression117 // 164
	COPY $price r6 // 164
	PUSH r6 // 167
	ALIAS r6 $literalexpression124 // 169
	LOAD $literalexpression124 "SOUL" // 169
	PUSH $literalexpression124 // 177
	COPY $thisAddr r6 // 179
	PUSH r6 // 182
	COPY $from r6 // 184
	PUSH r6 // 187
	LOAD $methodcallexpression117 "Runtime.TransferTokens" // 189
	EXTCALL $methodcallexpression117 // 215
@exit_paySomething: // 217
RET // 218
