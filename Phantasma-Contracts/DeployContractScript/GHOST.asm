// Line 1:token GHOST {

// ********* getName Property ***********
@entry_getName: // 0
// Line 2:	property name: string = "GHOST";
	ALIAS r1 $literalexpression43 // 1
	LOAD $literalexpression43 "GHOST" // 1
	PUSH $literalexpression43 // 10
	JMP @exit_getName // 12
@exit_getName: // 15
RET // 16
