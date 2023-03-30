// Line 59:		}
// Line 60:	}
// Line 61:
// Line 62:	nft item<item_rom, item_ram> {

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
// Line 63:
// Line 64:		property name: string {
// Line 65:			local rom_kind: number = _ROM.kind;
	ALIAS r1 $rom_kind // 67
	COPY $_ROM r2 // 67
	LOAD r4 "kind" // 70
	GET r2 r2 r4 // 78
	COPY r2 $rom_kind // 82
// Line 66:			switch(rom_kind)
	COPY $rom_kind r2 // 85
// Line 67:			{
// Line 68:				case 1: return "Potion";
		ALIAS r4 $literalexpression248 // 88
		LOAD $literalexpression248 1 // 88
		EQUAL r2 $literalexpression248 $literalexpression248 // 93
		JMPNOT $literalexpression248 @skip_casestatement252 // 97
		ALIAS r5 $literalexpression250 // 101
		LOAD $literalexpression250 "Potion" // 101
		PUSH $literalexpression250 // 111
		JMP @exit_getName // 113
		JMP @end_case_switchstatement246 // 116
		@skip_casestatement252: NOP // 120
// Line 69:				case 2: return "Gloves";
		ALIAS r4 $literalexpression253 // 120
		LOAD $literalexpression253 2 // 120
		EQUAL r2 $literalexpression253 $literalexpression253 // 125
		JMPNOT $literalexpression253 @skip_casestatement257 // 129
		ALIAS r5 $literalexpression255 // 133
		LOAD $literalexpression255 "Gloves" // 133
		PUSH $literalexpression255 // 143
		JMP @exit_getName // 145
		JMP @end_case_switchstatement246 // 148
		@skip_casestatement257: NOP // 152
// Line 70:				default: return "Item #" + _ROM.kind;
		ALIAS r4 $literalexpression259 // 152
		LOAD $literalexpression259 "Item #" // 152
		COPY $_ROM r5 // 162
		LOAD r6 "kind" // 165
		GET r5 r5 r6 // 173
		CAST r5 r5 #String // 177
		ADD $literalexpression259 r5 r6 // 181
		PUSH r6 // 185
		JMP @exit_getName // 187
		@end_case_switchstatement246: NOP // 191
@exit_getName: // 191
RET // 192
// Line 71:			}
// Line 72:		}

// ********* getDescription Property ***********
@entry_getDescription: // 193
POP r1 // get nft tokenID from stack // 194
// reading nft data
LOAD r0 "RAM" // 196
PUSH r0 // fields // 203
PUSH r1 // tokenID // 205
LOAD r0 "NACHO" // 207
PUSH r0 // symbol // 216
LOAD r0 "Runtime.ReadToken" // 218
EXTCALL r0 // 239
POP r2 // 241
UNPACK r2 r2 // 243
ALIAS r3 $_RAM // 246
LOAD r0 "RAM" // 246
GET r2 $_RAM r0 // 253
UNPACK $_RAM $_RAM // 257
// Line 73:
// Line 74:		property description: string {
// Line 75:			return "Item level " + _RAM.level;
	ALIAS r1 $literalexpression266 // 260
	LOAD $literalexpression266 "Item level " // 260
	COPY $_RAM r2 // 275
	LOAD r4 "level" // 278
	GET r2 r2 r4 // 287
	CAST r2 r2 #String // 291
	ADD $literalexpression266 r2 r4 // 295
	PUSH r4 // 299
	JMP @exit_getDescription // 301
@exit_getDescription: // 304
RET // 305
// Line 76:		}

// ********* getImageURL Property ***********
@entry_getImageURL: // 306
POP r1 // get nft tokenID from stack // 307
ALIAS r2 $_tokenID // 309
COPY r1 $_tokenID // tokenID // 309
// Line 77:
// Line 78:		property imageURL: string {
// Line 79:			return "https://nacho.men/img/item/"+ _tokenID;
	ALIAS r1 $literalexpression273 // 312
	LOAD $literalexpression273 "https://nacho.men/img/item/" // 312
	COPY $_tokenID r3 // 343
	CAST r3 r3 #String // 346
	ADD $literalexpression273 r3 r4 // 350
	PUSH r4 // 354
	JMP @exit_getImageURL // 356
@exit_getImageURL: // 359
RET // 360
// Line 80:		}

// ********* getInfoURL Property ***********
@entry_getInfoURL: // 361
POP r1 // get nft tokenID from stack // 362
ALIAS r2 $_tokenID // 364
COPY r1 $_tokenID // tokenID // 364
// Line 81:
// Line 82:		property infoURL: string {
// Line 83:			return "https://nacho.men/api/item/"+ _tokenID;
	ALIAS r1 $literalexpression280 // 367
	LOAD $literalexpression280 "https://nacho.men/api/item/" // 367
	COPY $_tokenID r3 // 398
	CAST r3 r3 #String // 401
	ADD $literalexpression280 r3 r4 // 405
	PUSH r4 // 409
	JMP @exit_getInfoURL // 411
@exit_getInfoURL: // 414
RET // 415
