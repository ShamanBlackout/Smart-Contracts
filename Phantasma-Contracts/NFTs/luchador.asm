// Line 1:struct luchador_rom
// Line 2:{
// Line 3:	genes:bytes;
// Line 4:	name:string;
// Line 5:}
// Line 6:
// Line 7:struct luchador_ram
// Line 8:{
// Line 9:	experience:number;
// Line 10:	level:number;
// Line 11:}
// Line 12:
// Line 13:struct item_rom
// Line 14:{
// Line 15:	kind:number;
// Line 16:	quality:number;
// Line 17:}
// Line 18:
// Line 19:struct item_ram
// Line 20:{
// Line 21:	power:number;
// Line 22:	level:number;
// Line 23:}
// Line 24:
// Line 25:token NACHO {
// Line 26:	import NFT;
// Line 27:
// Line 28:	global _owner: address;
// Line 29:
// Line 30:	const LUCHADOR_SERIES: number = 1;
// Line 31:	const LUCHADOR_SUPPLY: number = 100000;
// Line 32:
// Line 33:	const ITEM_SERIES: number = 2;
// Line 34:	const ITEM_SUPPLY: number = 500000;
// Line 35:
// Line 36:	property name: string = "Nachomen";
// Line 37:
// Line 38:	property isBurnable: bool = true;
// Line 39:	property isFinite: bool = true;
// Line 40:	property isFungible: bool = false;
// Line 41:	property maxSupply: number = LUCHADOR_SUPPLY + ITEM_SUPPLY;
// Line 42:
// Line 43:	nft luchador<luchador_rom, luchador_ram> {

// ********* getName Property ***********
@entry_getName: // 0
POP r1 // get nft tokenID from stack // 1
// reading nft data
LOAD r0 "ROM" // 3
PUSH r0 // fields // 10
PUSH r1 // tokenID // 12
LOAD r0 "NACHO" // 14
PUSH r0 // symbol // 23
LOAD r0 "Runtime.ReadToken" // 25
EXTCALL r0 // 46
POP r2 // 48
UNPACK r2 r2 // 50
ALIAS r3 $_ROM // 53
LOAD r0 "ROM" // 53
GET r2 $_ROM r0 // 60
UNPACK $_ROM $_ROM // 64
// Line 44:
// Line 45:		property name: string {
// Line 46:			return _ROM.name;
	COPY $_ROM r1 // 67
	LOAD r2 "name" // 70
	GET r1 r1 r2 // 78
	PUSH r1 // 82
	JMP @exit_getName // 84
@exit_getName: // 87
RET // 88
// Line 47:		}

// ********* getDescription Property ***********
@entry_getDescription: // 89
POP r1 // get nft tokenID from stack // 90
// reading nft data
LOAD r0 "RAM" // 92
PUSH r0 // fields // 99
PUSH r1 // tokenID // 101
LOAD r0 "NACHO" // 103
PUSH r0 // symbol // 112
LOAD r0 "Runtime.ReadToken" // 114
EXTCALL r0 // 135
POP r2 // 137
UNPACK r2 r2 // 139
ALIAS r3 $_RAM // 142
LOAD r0 "RAM" // 142
GET r2 $_RAM r0 // 149
UNPACK $_RAM $_RAM // 153
// Line 48:
// Line 49:		property description: string {
// Line 50:			return "Luchador with level " + _RAM.level;
	ALIAS r1 $literalexpression172 // 156
	LOAD $literalexpression172 "Luchador with level " // 156
	COPY $_RAM r2 // 180
	LOAD r4 "level" // 183
	GET r2 r2 r4 // 192
	CAST r2 r2 #String // 196
	ADD $literalexpression172 r2 r4 // 200
	PUSH r4 // 204
	JMP @exit_getDescription // 206
@exit_getDescription: // 209
RET // 210
// Line 51:		}

// ********* getImageURL Property ***********
@entry_getImageURL: // 211
POP r1 // get nft tokenID from stack // 212
ALIAS r2 $_tokenID // 214
COPY r1 $_tokenID // tokenID // 214
// Line 52:
// Line 53:		property imageURL: string {
// Line 54:			return "https://nacho.men/img/luchador/"+ _tokenID;
	ALIAS r1 $literalexpression179 // 217
	LOAD $literalexpression179 "https://nacho.men/img/luchador/" // 217
	COPY $_tokenID r3 // 252
	CAST r3 r3 #String // 255
	ADD $literalexpression179 r3 r4 // 259
	PUSH r4 // 263
	JMP @exit_getImageURL // 265
@exit_getImageURL: // 268
RET // 269
// Line 55:		}

// ********* getInfoURL Property ***********
@entry_getInfoURL: // 270
POP r1 // get nft tokenID from stack // 271
ALIAS r2 $_tokenID // 273
COPY r1 $_tokenID // tokenID // 273
// Line 56:
// Line 57:		property infoURL: string {
// Line 58:			return "https://nacho.men/api/luchador/"+ _tokenID;
	ALIAS r1 $literalexpression186 // 276
	LOAD $literalexpression186 "https://nacho.men/api/luchador/" // 276
	COPY $_tokenID r3 // 311
	CAST r3 r3 #String // 314
	ADD $literalexpression186 r3 r4 // 318
	PUSH r4 // 322
	JMP @exit_getInfoURL // 324
@exit_getInfoURL: // 327
RET // 328
