// Line 1:script startup {
	ALIAS r1 $target // 0
	POP $target // 0
	PUSH $target // 2
	EXTCALL "Address()" // 4
	POP $target // 19
// Line 2:
// Line 3:	import Call;
// Line 4:
// Line 5:	code(target:address) {
// Line 6:		local temp:number = 50000;
	ALIAS r2 $temp // 21
	ALIAS r3 $literalexpression54 // 21
	LOAD $literalexpression54 50000 // 21
	COPY $literalexpression54 $temp // 28
// Line 7:		Call.contrct<none>("Stake", "Unstake", target, temp);
	ALIAS r3 $methodcallexpression58 // 31
	COPY $temp r4 // 31
	PUSH r4 // 34
	COPY $target r4 // 36
	PUSH r4 // 39
	ALIAS r4 $literalexpression63 // 41
	LOAD $literalexpression63 "Unstake" // 41
	PUSH $literalexpression63 // 52
	LOAD $methodcallexpression58 "Stake" // 54
	CTX $methodcallexpression58 $methodcallexpression58 // 63
	SWITCH $methodcallexpression58 // 66
RET // 68
