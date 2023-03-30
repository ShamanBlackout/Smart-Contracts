// Line 1:description payment_event {
	ALIAS r1 $from // 0
	POP $from // 0
	PUSH $from // 2
	EXTCALL "Address()" // 4
	POP $from // 19
	ALIAS r2 $amount // 21
	POP $amount // 21
// Line 2:
// Line 3:	code(from:address, amount:number): string {
// Line 4:		local result:string = "";
	ALIAS r3 $result // 23
	ALIAS r4 $literalexpression48 // 23
	LOAD $literalexpression48 "" // 23
	COPY $literalexpression48 $result // 27
// Line 5:		result += from;
	COPY $result r4 // 30
	COPY $from r5 // 33
// Line 6:		result += " paid ";
// Line 7:		result += amount;
// Line 8:		return result;
// Line 9:	}
	CAST r5 r5 #String // 36
	ADD r4 r5 r6 // 40
	COPY r6 $result // 44
	COPY $result r4 // 47
	ALIAS r5 $literalexpression56 // 50
	LOAD $literalexpression56 " paid " // 50
	ADD r4 $literalexpression56 r6 // 60
	COPY r6 $result // 64
	COPY $result r4 // 67
	COPY $amount r5 // 70
	CAST r5 r5 #String // 73
	ADD r4 r5 r6 // 77
	COPY r6 $result // 81
	COPY $result r4 // 84
	PUSH r4 // 87
	RET // 89
