// Line 1:
// Line 2:contract test {
// Line 3:
// Line 4:	import Leaderboard;
// Line 5:	const MY_BOARD: string = "my_test_board";

// ********* getWinnerAddreses Method ***********
@entry_getWinnerAddreses: // 0
// Line 6:
// Line 7:	// this method will return a list of addresses fetched from a leaderboard
// Line 8:	// we could use a similar approach to return numbers, strings or structs
// Line 9:
// Line 10:	public getWinnerAddreses() : address* // NOTE: we add an asterisk after the return type (it declares this method as a "multi-return")
// Line 11:	{
// Line 12:		local i:number = 0; 
	ALIAS r1 $i // 1
	ALIAS r2 $literalexpression63 // 1
	LOAD $literalexpression63 0 // 1
	COPY $literalexpression63 $i // 6
	@loop_start_whilestatement66: NOP // 10
// Line 13:		while (i < 10) {
	COPY $i r2 // 10
	ALIAS r3 $literalexpression68 // 13
	LOAD $literalexpression68 10 // 13
	LT r2 $literalexpression68 r4 // 18
		JMPNOT r4 @loop_end_whilestatement66 // 22
// Line 14:			return  Leaderboard.getAddress(MY_BOARD, i); 
		ALIAS r2 $methodcallexpression71 // 26
		COPY $i r3 // 26
		PUSH r3 // 29
		ALIAS r3 $MY_BOARD // 31
		LOAD $MY_BOARD "my_test_board" // 31
		PUSH $MY_BOARD // 48
		LOAD $methodcallexpression71 "GetAddressByIndex" // 50
		PUSH $methodcallexpression71 // 71
		LOAD $methodcallexpression71 "ranking" // 73
		CTX $methodcallexpression71 $methodcallexpression71 // 84
		SWITCH $methodcallexpression71 // 87
		POP $methodcallexpression71 // 89
		PUSH $methodcallexpression71 // 91
// Line 15:			// NOTE: in "multi-return" methods a return won't terminate execution of the method unless its expression-less return
// Line 16:			i += 1;
		COPY $i r2 // 93
		ALIAS r3 $literalexpression78 // 96
		LOAD $literalexpression78 1 // 96
		ADD r2 $literalexpression78 r5 // 101
		COPY r5 $i // 105
		JMP @loop_start_whilestatement66 // 108
		@loop_end_whilestatement66: NOP // 112
// Line 17:		}		
// Line 18:		
// Line 19:		return; // NOTE: this is optional but a expression-less return like this forces a multi-return method to end
	JMP @exit_getWinnerAddreses // 112
@exit_getWinnerAddreses: // 115
RET // 116
