// Line 1:
// Line 2:
// Line 3:contract test {
// Line 4:
// Line 5:	import Map;
// Line 6:	import Storage;
// Line 7:	import Call;
// Line 8:	
// Line 9:	global counters: storage_map<number, number>;

// ********* getContractCount Method ***********
@entry_getContractCount: // 0
// Line 10:
// Line 11:	private getContractCount(tokenId:number):number {
ALIAS r1 $tokenId // 1
POP $tokenId // 1
CAST $tokenId $tokenId #Number // 3
// Line 12:	
// Line 13:		local count:number = Call.interop<none>("Map.Get",  "OTHERCONTRACT", "_storageMap", tokenId, $TYPE_OF(number));
	ALIAS r2 $count // 7
	ALIAS r3 $methodcallexpression95 // 7
	ALIAS r4 $literalexpression103 // 7
	LOAD $literalexpression103 3 Enum // 7
	PUSH $literalexpression103 // 15
	COPY $tokenId r4 // 17
	PUSH r4 // 20
	ALIAS r4 $literalexpression100 // 22
	LOAD $literalexpression100 "_storageMap" // 22
	PUSH $literalexpression100 // 37
	ALIAS r4 $literalexpression99 // 39
	LOAD $literalexpression99 "OTHERCONTRACT" // 39
	PUSH $literalexpression99 // 56
	LOAD $methodcallexpression95 "Map.Get" // 58
	EXTCALL $methodcallexpression95 // 69
	COPY $methodcallexpression95 $count // 71
// Line 14:		return count;
	COPY $count r3 // 74
	PUSH r3 // 77
	JMP @exit_getContractCount // 79
@exit_getContractCount: // 82
RET // 83
// Line 15:		
// Line 16:	}

// ********* updateCount Method ***********
@entry_updateCount: // 84
// Line 17:
// Line 18:	public updateCount(tokenID:number) {
ALIAS r1 $tokenID // 85
POP $tokenID // 85
CAST $tokenID $tokenID #Number // 87
// Line 19:	
// Line 20:		local contractCounter:number = this.getContractCount(tokenID);
	ALIAS r2 $contractCounter // 91
	ALIAS r3 $methodcallexpression112 // 91
	COPY $tokenID r4 // 91
	PUSH r4 // 94
	CALL @entry_getContractCount // 96
	POP $methodcallexpression112 // 100
	COPY $methodcallexpression112 $contractCounter // 102
// Line 21:		contractCounter += 1;
	COPY $contractCounter r3 // 105
	ALIAS r4 $literalexpression118 // 108
	LOAD $literalexpression118 1 // 108
	ADD r3 $literalexpression118 r5 // 113
	COPY r5 $contractCounter // 117
// Line 22:		counters.set(tokenID, contractCounter);
	ALIAS r3 $methodcallexpression134 // 120
	COPY $contractCounter r4 // 120
	PUSH r4 // 123
	COPY $tokenID r4 // 125
	PUSH r4 // 128
	ALIAS r4 $literalexpression140 // 130
	LOAD $literalexpression140 "counters" // 130
	PUSH $literalexpression140 // 142
	LOAD $methodcallexpression134 "Map.Set" // 144
	EXTCALL $methodcallexpression134 // 155
@exit_updateCount: // 157
RET // 158
// Line 23:		
// Line 24:	}

// ********* getCount Method ***********
@entry_getCount: // 159
// Line 25:
// Line 26:	public getCount(tokenID:number):number {
ALIAS r1 $tokenID // 160
POP $tokenID // 160
CAST $tokenID $tokenID #Number // 162
// Line 27:	
// Line 28:		local temp:number = counters.get(tokenID);
	ALIAS r2 $temp // 166
	LOAD r3 3 // field type // 166
	PUSH r3 // 171
	COPY $tokenID r4 // 173
	PUSH r4 // 176
	ALIAS r4 $literalexpression151 // 178
	LOAD $literalexpression151 "counters" // 178
	PUSH $literalexpression151 // 190
	LOAD $literalexpression151 "test" // contract name // 192
	PUSH $literalexpression151 // 200
	LOAD r3 "Map.Get" // 202
	EXTCALL r3 // 213
	POP r3 // 215
	COPY r3 $temp // 217
// Line 29:		return temp;
	COPY $temp r3 // 220
	PUSH r3 // 223
	JMP @exit_getCount // 225
@exit_getCount: // 228
RET // 229
