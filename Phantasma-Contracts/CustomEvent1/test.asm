// Line 1:
// Line 2:contract test {
// Line 3:	import Token;
// Line 4:	import Runtime;
// Line 5:	
// Line 6:	event MyPayment:number = "{address} paid {data}"; // here we use a short-form description

// ********* paySomething Method ***********
@entry_paySomething: // 0
// Line 7:
// Line 8:	public paySomething(from:address, x:number)
ALIAS r1 $from // 1
POP $from // 1
PUSH $from // 3
EXTCALL "Address()" // 5
POP $from // 20
ALIAS r2 $x // 22
POP $x // 22
CAST $x $x #Number // 24
// Line 9:	{		
// Line 10:		Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r3 $methodcallexpression102 // 28
	COPY $from r4 // 28
	PUSH r4 // 31
	LOAD $methodcallexpression102 "Runtime.IsWitness" // 33
	EXTCALL $methodcallexpression102 // 54
	POP $methodcallexpression102 // 56
	JMPIF $methodcallexpression102 @expect_methodcallexpression99 // 58
	ALIAS r4 $literalexpression105 // 62
	LOAD $literalexpression105 "witness failed" // 62
	THROW $literalexpression105 // 80
	@expect_methodcallexpression99: NOP // 83
// Line 11:
// Line 12:		local price: number = 10;
	ALIAS r3 $price // 83
	ALIAS r4 $literalexpression106 // 83
	LOAD $literalexpression106 10 // 83
	COPY $literalexpression106 $price // 88
// Line 13:		local thisAddr:address = $THIS_ADDRESS;
	ALIAS r4 $thisAddr // 91
	ALIAS r5 $literalexpression110 // 91
	LOAD $literalexpression110 0x02009F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08 // 91
	PUSH $literalexpression110 // 129
	EXTCALL "Address()" // 131
	POP $literalexpression110 // 146
	COPY $literalexpression110 $thisAddr // 148
// Line 14:		Token.transfer(from, thisAddr, "SOUL", price);
	ALIAS r5 $methodcallexpression114 // 151
	COPY $price r6 // 151
	PUSH r6 // 154
	ALIAS r6 $literalexpression121 // 156
	LOAD $literalexpression121 "SOUL" // 156
	PUSH $literalexpression121 // 164
	COPY $thisAddr r6 // 166
	PUSH r6 // 169
	COPY $from r6 // 171
	PUSH r6 // 174
	LOAD $methodcallexpression114 "Runtime.TransferTokens" // 176
	EXTCALL $methodcallexpression114 // 202
// Line 15:
// Line 16:		emit MyPayment(from, price);
	COPY $price r5 // 204
	PUSH r5 // 207
	COPY $from r5 // 209
	PUSH r5 // 212
	LOAD r5 65 // 214
	PUSH r5 // 219
	LOAD r5 "Runtime.Notify" // 221
	EXTCALL r5 // 239
@exit_paySomething: // 241
RET // 242
