
.text
   # li $v0,  4
   # la $a0,  msg1
   #syscall             # print msg
    li $v0,  5
    syscall             # read an int
    add $s2, $v0, $zero # move n to $s2
    li $v0,  5
    syscall             # read an int
    add $s3, $v0, $zero # move x to $s3
    subi $s4 , $s3 ,1 # (x-1)= $s4
    li $t0 ,3  #$t0 =3
    mult $t0 , $s3
    mflo $s3 # $s3 = 3x
    addi $s3 , $s3,5 #S3 is 3x+5
    addi $a0 , $s2,0
    jal fib             # call fib

    add $a0, $v0, $zero
    li  $v0, 1
    syscall

    li $v0, 10
    syscall

fib:
    # $a0 = y
    # if (y == 0) return 0;
    # if (y == 1) return 1;
    # return fib(y - 1) + fib(y - 2);

    #save in stack
    addi $sp, $sp, -12 
    sw   $ra, 0($sp)
    sw   $s0, 4($sp)
    sw   $s1, 8($sp)

    add $s0, $a0, $zero

    addi $t1, $zero, 1
    addi $t2, $zero, 2

    beq  $s0, $t1,   return1
    beq  $s0, $t2,   return2
    addi $a0, $s0, -1

    jal fib

    add $s1, $zero, $v0         # $s1 = fib(y - 1)
	
	
    addi $a0, $s0, -2

    jal fib                     # $v0 = fib(n - 2)
	mult $v0,$s4 	# fib(y - 1) * (x-1) 
	mflo $v0 
    add $v0, $v0, $s1           # $v0 = fib(n - 2)* (x-1) + $s1

    exitfib:

        lw   $ra, 0($sp)        # read registers from stack
        lw   $s0, 4($sp)
        lw   $s1, 8($sp)
        addi $sp, $sp, 12       # bring back stack pointer
        jr $ra

    return1:
    	addi $v0 ,$0,2
        #li $v0,1
        j exitfib

    return2: 
    	add $v0 ,$0,$s3   
        #li $v0,2
        j exitfib
