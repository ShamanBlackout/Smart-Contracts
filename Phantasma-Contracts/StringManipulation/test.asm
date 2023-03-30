// Line 1:contract test {
// Line 2:	import Array;

// ********* toUpper Method ***********
@entry_toUpper: // 0
// Line 3:	
// Line 4:	public toUpper(s:string):string 
ALIAS r1 $s // 1
POP $s // 1
// Line 5:	{        
// Line 6:		local my_array: array<number>;		
	ALIAS r2 $my_array // 3
// Line 7:		
// Line 8:		// extract chars from string into an array
// Line 9:		my_array = s.toArray();	
	COPY $s r3 // 3
	CAST r3 r3 #Struct // 6
	COPY r3 $my_array // 10
// Line 10:		
// Line 11:		local length :number = Array.length(my_array);
	ALIAS r3 $length // 13
	COPY $my_array r4 // 13
	COUNT r4 r4 // 16
	COPY r4 $length // 19
// Line 12:		local idx :number = 0;
	ALIAS r4 $idx // 22
	ALIAS r5 $literalexpression58 // 22
	LOAD $literalexpression58 0 // 22
	COPY $literalexpression58 $idx // 27
	@loop_start_whilestatement61: NOP // 31
// Line 13:		
// Line 14:		while (idx < length) {
	COPY $idx r5 // 31
	COPY $length r6 // 34
	LT r5 r6 r7 // 37
		JMPNOT r7 @loop_end_whilestatement61 // 41
// Line 15:			local ch : number = my_array[idx];
		ALIAS r5 $ch // 45
		COPY $idx r8 // 45
		GET $my_array r6 r8 // 48
		COPY r6 $ch // 52
// Line 16:			
// Line 17:			if (ch >= 97) {
		COPY $ch r6 // 55
		ALIAS r8 $literalexpression72 // 58
		LOAD $literalexpression72 97 // 58
		GTE r6 $literalexpression72 r9 // 63
			JMPNOT r9 @then_ifstatement70 // 67
// Line 18:				if (ch <= 122) {				
			COPY $ch r6 // 71
			ALIAS r8 $literalexpression77 // 74
			LOAD $literalexpression77 122 // 74
			LTE r6 $literalexpression77 r10 // 79
				JMPNOT r10 @then_ifstatement75 // 83
// Line 19:					my_array[idx] = ch - 32; 
				COPY $ch r6 // 87
				ALIAS r8 $literalexpression83 // 90
				LOAD $literalexpression83 32 // 90
				SUB r6 $literalexpression83 r11 // 95
				COPY $idx r6 // 99
				PUT r11 $my_array r6 // 102
				@then_ifstatement75: NOP // 107
			@then_ifstatement70: NOP // 108
// Line 20:				}
// Line 21:			}
// Line 22:						
// Line 23:			idx += 1;
		COPY $idx r6 // 108
		ALIAS r8 $literalexpression86 // 111
		LOAD $literalexpression86 1 // 111
		ADD r6 $literalexpression86 r9 // 116
		COPY r9 $idx // 120
		JMP @loop_start_whilestatement61 // 123
		@loop_end_whilestatement61: NOP // 127
// Line 24:		}
// Line 25:				
// Line 26:		// convert the array back into a unicode string
// Line 27:		local result:string = String.fromArray(my_array); 
	ALIAS r5 $result // 127
	COPY $my_array r6 // 127
	CAST r6 r6 #String // 130
	COPY r6 $result // 134
// Line 28:		return result;
	COPY $result r6 // 137
	PUSH r6 // 140
	JMP @exit_toUpper // 142
@exit_toUpper: // 145
RET // 146
