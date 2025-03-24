.text
#load a to $s0
addi $v0 , $0, 5
syscall
addi $s0 , $v0 ,0
#load n to $s1
addi $v0 , $0, 5
syscall
addi $s1 , $v0 ,0
#load x to $2
addi $v0 , $0, 5
syscall
addi $s2 , $v0 ,0

addi $a0 , $s0, 0
addi $a1 , $s1, 0
addi $a2 , $s2, 0
jal Function
addi $a0,$v0,0
addi $v0 ,$0, 1
syscall # printing sum
j End



Mult:# x1 and x2 are the argumans so we have $a1 = x1 , $a2 = x2
add $v0,$a0,$0
li $t7,1
Mult_loop:# we add x1 to its self for x2 times
beq $t7,$a1,Mult_end
add $v0, $a0,$v0
addi $t7,$t7,1
j Mult_loop
Mult_end: jr $ra # back to caller function
 

Pow:
beq  $a1,$0,Pow_zero_power # if power is zero return 1
sw  $ra,-8($sp) # save function pointer
sw  $t4,-12($sp)# saving t4 and use it
sw  $t5,-16($sp)# saving t5 and use it
sw  $t6,-20($sp)# saving t6 and use it
addi $t4,$a1,0 # number of power that gonna be used in condition
#sw $a1,12($sp)# saveing the power number
add $a1,$a0,$0 # making a1 for multiply
addi $a1 , $a0,0
add $v0 , $a0, $0
#li $v0,0 # the finall answer of pow
li $t6,1 # our counter
li $t5,0 # temporary answer holder

Pow_loop:# we multiply x1 to its self for x2 times
beq  $t6,$t4,Pow_end
jal Mult
#add $t5 ,$v0,$t5
addi $a0,$v0,0
addi $t6,$t6,1 # increasing the counter
j Pow_loop
Pow_end:
lw $ra ,-8($sp) #load function pointer
#add $v0 , $t5 , $0 # finall answer getting ready to send back
lw $t4,-12($sp)# getting back t4
lw $t5,-16($sp)# getting back t5
lw $t6,-20($sp)# getting back t6
jr $ra
Pow_zero_power:
addi $v0,$0 ,1
jr $ra

Function:
sw  $ra, -4($sp) # save function pointer
addi $t0 , $a0, 0 # saving a in t0
addi $t1 , $a1, 0 # saving n in t1
addi $t2 , $a2, 0 # saving x in t2
li $t3 , 0 # temporary for  a-(n)
li $t4 ,0 # counter
li $t5 ,0 #sum of answers
Function_loop:
blt $t1 ,$0,Function_loop_end
sub $t3 , $t0 , $t4 # a -(n)
add $a0 ,$t2 ,$0 # x
add $a1 ,$t1 ,$0 # power of x
jal Pow
#addi $t6 , $v0 ,0 # saving answer of pow
 addi $a1 ,$v0,0 # load x^n
 addi $a0 ,$t3 ,0 # load a
 jal Mult # (a-1) * x^n
 add $t5 , $v0 ,$t5#  sum+=(a-n)x^n
 subi $t1,$t1 ,1 # n --
 addi $t4 ,$t4,1 # counter ++
 j Function_loop
 
Function_loop_end:
lw $ra ,-4($sp) #load function pointer
add $v0,$0, $t5 # putting sum to v0
jr $ra
End:
