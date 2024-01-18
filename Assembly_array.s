	.global start
start:
	.extern	putint,newline,getput,putfloat
	
	call getint
	movl %eax,%ecx
	movl $10, %ebx
	fldz
	
	loop:
	cmpl $0, %ecx
	jz end
	decl %ECX 
	call getint
	cdq
	idivl %ebx
	cmpl $0, %edx 
	jz L1
	jmp loop 
	
	L1:
	imull %ebx
	pushl %eax
	jmp L2
	
	L2:
	cmpl $0, %ecx
	jz end
	call getint
	cdq
	idivl %ebx
	cmpl $0, %edx 
	jz L3
	decl %ECX 
	jmp L2 
	L3:
	decl %ECX 
	cmpl  (%esp),%eax
	jl l4
	jmp L2
	l4:
	fld1
	faddp
	jmp L2
	end:
	call	putfloat	# read a float and push into ST0
	ret
