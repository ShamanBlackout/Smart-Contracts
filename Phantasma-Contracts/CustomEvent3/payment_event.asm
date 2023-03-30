// Line 1:struct my_event_data {
// Line 2:	amount:number;
// Line 3:	symbol:string;
// Line 4:}
// Line 5:
// Line 6:description payment_event {
	ALIAS r1 $from // 0
	POP $from // 0
	PUSH $from // 2
	EXTCALL "Address()" // 4
	POP $from // 19
	ALIAS r2 $data // 21
	POP $data // 21
	UNPACK $data $data // 23
// Line 7:
// Line 8:	code(from:address, data:my_event_data): string {
// Line 9:		local result:string = "";
	ALIAS r3 $result // 26
	ALIAS r4 $literalexpression51 // 26
	LOAD $literalexpression51 "" // 26
	COPY $literalexpression51 $result // 30
// Line 10:		result += from;
	COPY $result r4 // 33
	COPY $from r5 // 36
// Line 11:		result += " paid ";
// Line 12:		result += data.amount;
// Line 13:		result += " ";
// Line 14:		result += data.symbol;
// Line 15:		return result;
// Line 16:	}
	CAST r5 r5 #String // 39
	ADD r4 r5 r6 // 43
	COPY r6 $result // 47
	COPY $result r4 // 50
	ALIAS r5 $literalexpression59 // 53
	LOAD $literalexpression59 " paid " // 53
	ADD r4 $literalexpression59 r6 // 63
	COPY r6 $result // 67
	COPY $result r4 // 70
	COPY $data r5 // 73
	LOAD r6 "amount" // 76
	GET r5 r5 r6 // 86
	CAST r5 r5 #String // 90
	ADD r4 r5 r6 // 94
	COPY r6 $result // 98
	COPY $result r4 // 101
	ALIAS r5 $literalexpression67 // 104
	LOAD $literalexpression67 " " // 104
	ADD r4 $literalexpression67 r6 // 109
	COPY r6 $result // 113
	COPY $result r4 // 116
	COPY $data r5 // 119
	LOAD r6 "symbol" // 122
	GET r5 r5 r6 // 132
	ADD r4 r5 r6 // 136
	COPY r6 $result // 140
	COPY $result r4 // 143
	PUSH r4 // 146
	RET // 148
