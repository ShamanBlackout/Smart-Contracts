// Line 1:struct my_rom_data {
// Line 2:	name:string;
// Line 3:	counter:number;
// Line 4:}
// Line 5:
// Line 6:script token_minter {
	ALIAS r1 $source // 0
	POP $source // 0
	PUSH $source // 2
	EXTCALL "Address()" // 4
	POP $source // 19
	ALIAS r2 $target // 21
	POP $target // 21
	PUSH $target // 23
	EXTCALL "Address()" // 25
	POP $target // 40
// Line 7:
// Line 8:	import Token;
// Line 9:	import NFT;
// Line 10:
// Line 11:	code(source:address, target:address) {
// Line 12:		local rom_data:my_rom_data = Struct.my_rom_data("hello", 123);
	ALIAS r3 $rom_data // 42
	CLEAR r4 // 42
	ALIAS r6 $literalexpression128 // 44
	LOAD $literalexpression128 "hello" // 44
	LOAD r5 "name" // 53
	PUT $literalexpression128 r4 r5 // 61
	ALIAS r6 $literalexpression129 // 65
	LOAD $literalexpression129 123 // 65
	LOAD r5 "counter" // 70
	PUT $literalexpression129 r4 r5 // 81
	COPY r4 $rom_data // 85
// Line 13:		NFT.mint(source, target, "LOL", rom_data, "ram_can_be_anything",0);
	ALIAS r4 $methodcallexpression133 // 88
	ALIAS r5 $literalexpression145 // 88
	LOAD $literalexpression145 0 // 88
	PUSH $literalexpression145 // 93
	ALIAS r5 $literalexpression144 // 95
	LOAD $literalexpression144 "ram_can_be_anything" // 95
	CAST $literalexpression144 $literalexpression144 #Bytes // 118
	PUSH $literalexpression144 // 122
	COPY $rom_data r5 // 124
	CAST r5 r5 #Bytes // 127
	PUSH r5 // 131
	ALIAS r5 $literalexpression142 // 133
	LOAD $literalexpression142 "LOL" // 133
	PUSH $literalexpression142 // 140
	COPY $target r5 // 142
	PUSH r5 // 145
	COPY $source r5 // 147
	PUSH r5 // 150
	LOAD $methodcallexpression133 "Runtime.MintToken" // 152
	EXTCALL $methodcallexpression133 // 173
	POP $methodcallexpression133 // 175
RET // 177
