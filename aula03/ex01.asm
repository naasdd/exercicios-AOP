.data
msg_1: .asciz "Informe o primeiro valor: "
msg_2: .asciz "Informe o segundo valor: "
msg_3: .asciz "Informe o terceiro valor: "
msg_res: .asciz "O maior valor eh: "

.text
_start:
addi a7, zero, 4
la a0, msg_1
ecall
addi a7, zero, 5
ecall
add s0, zero, a0

addi a7, zero, 4
la a0, msg_2
ecall
addi a7, zero, 5
ecall
add s1, zero, a0

addi a7, zero, 4
la a0, msg_3
ecall
addi a7, zero, 5
ecall
add s2, zero, a0

add a0, zero, s0
add a1, zero, s1
add a2, zero, s2

jal ra, acha_maior

add s3, zero, a0

addi a7, zero, 4
la a0, msg_res
ecall

add a0, zero, s3
addi a7, zero, 1
ecall

addi a7, zero, 10
ecall


acha_maior:
bge a0, a1, pula_segundo
add a0, zero, a1

pula_segundo:
bge a0, a2, pula_terceiro
add a0, zero, a2

pula_terceiro:
jalr zero, 0(ra)