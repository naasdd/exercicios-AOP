.data
msg: .asciz "Fibonacci: "
espaco: .asciz "  "

.text


_start:
addi a7, zero, 4
la a0, msg
ecall

add t0, zero, zero
addi t1, zero, 1

addi t3, zero, 0 # contador do loop
addi t4, zero, 10 # referencia do limite do loop

addi a7, zero, 1
add a0, zero, t0
ecall

addi a7, zero, 4
la a0, espaco
ecall

loop_fibonacci:
addi a7, zero, 1
add a0, zero, t1
ecall

addi a7, zero, 4
la a0, espaco
ecall

add t2, t0, t1
add t0, zero, t1
add t1, zero, t2
addi t3, t3, 1
blt t3, t4, loop_fibonacci


addi a7, zero, 10
ecall
