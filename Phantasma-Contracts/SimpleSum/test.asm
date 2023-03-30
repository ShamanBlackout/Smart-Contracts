// Line 1:contract test {

// ********* sum Method ***********
@entry_sum: // 0
// Line 2:	public sum(a:number, b:number):number
ALIAS r1 $a // 1
POP $a // 1
CAST $a $a #Number // 3
ALIAS r2 $b // 7
POP $b // 7
CAST $b $b #Number // 9
// Line 3:	{
// Line 4:		return a + b;
	COPY $a r3 // 13
	COPY $b r4 // 16
	ADD r3 r4 r5 // 19
	PUSH r5 // 23
	JMP @exit_sum // 25
@exit_sum: // 28
RET // 29
