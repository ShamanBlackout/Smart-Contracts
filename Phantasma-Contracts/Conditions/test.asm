// Line 1:contract test {

// ********* isEvenAndPositive Method ***********
@entry_isEvenAndPositive: // 0
// Line 2:	public isEvenAndPositive(n:number):bool
ALIAS r1 $n // 1
POP $n // 1
CAST $n $n #Number // 3
// Line 3:	{
// Line 4:        local cond1:bool  = n>0;
	ALIAS r2 $cond1 // 7
	COPY $n r3 // 7
	ALIAS r4 $literalexpression47 // 10
	LOAD $literalexpression47 0 // 10
	GT r3 $literalexpression47 r5 // 15
	COPY r5 $cond1 // 19
// Line 5:        local cond2: bool = (n%2) == 0;        
	ALIAS r3 $cond2 // 22
	COPY $n r4 // 22
	ALIAS r5 $literalexpression52 // 25
	LOAD $literalexpression52 2 // 25
	MOD r4 $literalexpression52 r6 // 30
	ALIAS r4 $literalexpression54 // 34
	LOAD $literalexpression54 0 // 34
	EQUAL r6 $literalexpression54 r5 // 39
	COPY r5 $cond2 // 43
// Line 6:        
// Line 7:        /*Due to TOMB Compiler issues logical operators && and || do not work
// Line 8:        Also, 'and' and 'or' do not work, so a comparison should suffice for now.*/
// Line 9:		if (cond1 && cond2)
	COPY $cond1 r4 // 46
	COPY $cond2 r5 // 49
	AND r4 r5 r6 // 52
		JMPNOT r6 @else_ifstatement58 // 56
// Line 10:		{
// Line 11:			return true;
		ALIAS r4 $literalexpression63 // 60
		LOAD $literalexpression63 true // 60
		PUSH $literalexpression63 // 65
		JMP @exit_isEvenAndPositive // 67
		JMP @then_ifstatement58 // 70
		@else_ifstatement58: NOP // 74
// Line 12:		}
// Line 13:		else 
// Line 14:		{
// Line 15:			return false;
		ALIAS r4 $literalexpression66 // 74
		LOAD $literalexpression66 false // 74
		PUSH $literalexpression66 // 79
		JMP @exit_isEvenAndPositive // 81
		@then_ifstatement58: NOP // 85
@exit_isEvenAndPositive: // 85
RET // 86
