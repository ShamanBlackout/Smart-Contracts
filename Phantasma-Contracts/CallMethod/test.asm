// Line 1:contract test {

// ********* sum Method ***********
@entry_sum: // 0
// Line 2:	private sum(a:number, b:number): number {
ALIAS r1 $a // 1
POP $a // 1
CAST $a $a #Number // 3
ALIAS r2 $b // 7
POP $b // 7
CAST $b $b #Number // 9
// Line 3:		return a + b;
	COPY $a r3 // 13
	COPY $b r4 // 16
	ADD r3 r4 r5 // 19
	PUSH r5 // 23
	JMP @exit_sum // 25
@exit_sum: // 28
RET // 29
// Line 4:	}

// ********* calculatePrice Method ***********
@entry_calculatePrice: // 30
// Line 5:
// Line 6:	public calculatePrice(x:number): number
ALIAS r1 $x // 31
POP $x // 31
CAST $x $x #Number // 33
// Line 7:	{		
// Line 8:		local price: number = 10;
	ALIAS r2 $price // 37
	ALIAS r3 $literalexpression56 // 37
	LOAD $literalexpression56 10 // 37
	COPY $literalexpression56 $price // 42
// Line 9:		price = this.sum(price, x); // here we use 'this' for calling another method
	ALIAS r3 $methodcallexpression60 // 45
	COPY $x r4 // 45
	PUSH r4 // 48
	COPY $price r4 // 50
	PUSH r4 // 53
	CALL @entry_sum // 55
	POP $methodcallexpression60 // 59
	COPY $methodcallexpression60 $price // 61
// Line 10:
// Line 11:		return price;
	COPY $price r3 // 64
	PUSH r3 // 67
	JMP @exit_calculatePrice // 69
@exit_calculatePrice: // 72
RET // 73
