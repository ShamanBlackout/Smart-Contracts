// Line 1:
// Line 2:script startup {
// Line 3:
// Line 4:	import Call;
// Line 5:
// Line 6:	code() {
// Line 7:
// Line 8:		local temp: string= "";
	ALIAS r1 $temp // 0
	ALIAS r2 $literalexpression52 // 0
	LOAD $literalexpression52 "" // 0
	COPY $literalexpression52 $temp // 4
// Line 9:		asm {
// Line 10:			LOAD $temp "hello"
// Line 11:		}
	
	LOAD $temp "hello" // 7
	
RET // 16
