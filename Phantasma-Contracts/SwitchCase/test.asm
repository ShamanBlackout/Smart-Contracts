// Line 1:contract test {

// ********* check Method ***********
@entry_check: // 0
// Line 2:	public check(x:number): string {
ALIAS r1 $x // 1
POP $x // 1
CAST $x $x #Number // 3
// Line 3:		switch (x) {
	COPY $x r2 // 7
// Line 4:			case 0: return "zero";
		ALIAS r3 $literalexpression48 // 10
		LOAD $literalexpression48 0 // 10
		EQUAL r2 $literalexpression48 $literalexpression48 // 15
		JMPNOT $literalexpression48 @skip_casestatement52 // 19
		ALIAS r4 $literalexpression50 // 23
		LOAD $literalexpression50 "zero" // 23
		PUSH $literalexpression50 // 31
		JMP @exit_check // 33
		JMP @end_case_switchstatement46 // 36
		@skip_casestatement52: NOP // 40
// Line 5:			case 1: return "one";
		ALIAS r3 $literalexpression53 // 40
		LOAD $literalexpression53 1 // 40
		EQUAL r2 $literalexpression53 $literalexpression53 // 45
		JMPNOT $literalexpression53 @skip_casestatement57 // 49
		ALIAS r4 $literalexpression55 // 53
		LOAD $literalexpression55 "one" // 53
		PUSH $literalexpression55 // 60
		JMP @exit_check // 62
		JMP @end_case_switchstatement46 // 65
		@skip_casestatement57: NOP // 69
// Line 6:			case 2: return "two";
		ALIAS r3 $literalexpression58 // 69
		LOAD $literalexpression58 2 // 69
		EQUAL r2 $literalexpression58 $literalexpression58 // 74
		JMPNOT $literalexpression58 @skip_casestatement62 // 78
		ALIAS r4 $literalexpression60 // 82
		LOAD $literalexpression60 "two" // 82
		PUSH $literalexpression60 // 89
		JMP @exit_check // 91
		JMP @end_case_switchstatement46 // 94
		@skip_casestatement62: NOP // 98
// Line 7:			default: return "other";
		ALIAS r3 $literalexpression64 // 98
		LOAD $literalexpression64 "other" // 98
		PUSH $literalexpression64 // 107
		JMP @exit_check // 109
		@end_case_switchstatement46: NOP // 113
@exit_check: // 113
RET // 114
