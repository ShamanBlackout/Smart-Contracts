// Line 3:}
// Line 4:	
// Line 5:script deploy {
// Line 6:
// Line 7:	import Token;
// Line 8:	import Module;
// Line 9:
// Line 10:	code() {
// Line 11:		local maxSupply:number = 50000;
	ALIAS r1 $maxSupply // 0
	ALIAS r2 $literalexpression128 // 0
	LOAD $literalexpression128 50000 // 0
	COPY $literalexpression128 $maxSupply // 7
// Line 12:		local decimals:number = 1;
	ALIAS r2 $decimals // 10
	ALIAS r3 $literalexpression131 // 10
	LOAD $literalexpression131 1 // 10
	COPY $literalexpression131 $decimals // 15
// Line 13:		local flags:TokenFlags = TokenFlags.None;
	ALIAS r3 $flags // 18
	ALIAS r4 $literalexpression134 // 18
	LOAD $literalexpression134 0 Enum // 18
	COPY $literalexpression134 $flags // 26
// Line 14:		Token.create(@P2KAkQRrL62zYvb5198CHBLiKHKr4bJvAG7aXwV69rtbeSz, "GHOST",  "Ghost Token", maxSupply, decimals, flags, Module.getScript(GHOST),  Module.getABI(GHOST));
	ALIAS r4 $methodcallexpression138 // 29
	LOAD r5 0x01076765744E616D6504000000000000 // 29
	PUSH r5 // 49
	LOAD r5 0x000D01040547484F53540301081000000B // 51
	PUSH r5 // 72
	COPY $flags r5 // 74
	PUSH r5 // 77
	COPY $decimals r5 // 79
	PUSH r5 // 82
	COPY $maxSupply r5 // 84
	PUSH r5 // 87
	ALIAS r5 $literalexpression149 // 89
	LOAD $literalexpression149 "Ghost Token" // 89
	PUSH $literalexpression149 // 104
	ALIAS r5 $literalexpression148 // 106
	LOAD $literalexpression148 "GHOST" // 106
	PUSH $literalexpression148 // 115
	ALIAS r5 $literalexpression147 // 117
	LOAD $literalexpression147 0x010067939E7F431912284FABDA20CA6BAD8E2EE72D1A73F1D4A125F87E5436A0A1B7 // 117
	PUSH $literalexpression147 // 155
	EXTCALL "Address()" // 157
	POP $literalexpression147 // 172
	PUSH $literalexpression147 // 174
	LOAD $methodcallexpression138 "Nexus.CreateToken" // 176
	EXTCALL $methodcallexpression138 // 197
RET // 199
