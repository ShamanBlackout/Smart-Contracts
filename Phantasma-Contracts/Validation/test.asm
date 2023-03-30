// Line 1:contract test {
// Line 2:	import Runtime;

// ********* doSomething Method ***********
@entry_doSomething: // 0
// Line 3:
// Line 4:	public doSomething(from:address)  {
ALIAS r1 $from // 1
POP $from // 1
PUSH $from // 3
EXTCALL "Address()" // 5
POP $from // 20
// Line 5:		//Runtime.expect(from.isUser(), "expected user address"); // makes sure the address is of 'user' type
// Line 6:		Runtime.expect(Runtime.isWitness(from), "invalid witness"); // makes sure the transaction was signed by 'from' address
	ALIAS r2 $methodcallexpression60 // 22
	COPY $from r3 // 22
	PUSH r3 // 25
	LOAD $methodcallexpression60 "Runtime.IsWitness" // 27
	EXTCALL $methodcallexpression60 // 48
	POP $methodcallexpression60 // 50
	JMPIF $methodcallexpression60 @expect_methodcallexpression57 // 52
	ALIAS r3 $literalexpression63 // 56
	LOAD $literalexpression63 "invalid witness" // 56
	THROW $literalexpression63 // 75
	@expect_methodcallexpression57: NOP // 78
// Line 7:		Runtime.expect(Runtime.gasTarget() == $THIS_ADDRESS, "invalid donation"); // makes sure the transaction fees are donated to this contract
	ALIAS r2 $methodcallexpression68 // 78
	LOAD $methodcallexpression68 "Runtime.GasTarget" // 78
	EXTCALL $methodcallexpression68 // 99
	POP $methodcallexpression68 // 101
	ALIAS r3 $literalexpression70 // 103
	LOAD $literalexpression70 0x02009F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08 // 103
	PUSH $literalexpression70 // 141
	EXTCALL "Address()" // 143
	POP $literalexpression70 // 158
	EQUAL $methodcallexpression68 $literalexpression70 r4 // 160
	JMPIF r4 @expect_methodcallexpression65 // 164
	ALIAS r2 $literalexpression72 // 168
	LOAD $literalexpression72 "invalid donation" // 168
	THROW $literalexpression72 // 188
	@expect_methodcallexpression65: NOP // 191
@exit_doSomething: // 191
RET // 192
