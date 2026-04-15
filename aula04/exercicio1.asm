.data
msgA: .asciz "Insira o primeiro valor: "
msgB: .asciz "Insira o segundo valor: "
resultado: .asciz "O MDC é: "
espaco: .asciz "  "

.text


_start:
# Ler primero valor
addi a7, zero, 4
la a0, msgA
ecall

addi a7, zero, 5
ecall
add t1, zero, a0

# Ler segundo valor
addi a7, zero, 4
la a0, msgB
ecall

addi a7, zero, 5
ecall
add t2, zero, a0


loop:
beq t1, t2, fimLoop # Verifica se roda o loop ou nao

addi t3, t1, 1
blt t3, t2, else  # IF
sub t1, t1, t2
jal loop

else:
sub t2, t2, t1
jal loop

fimLoop:


# Exibir resultado
addi a7, zero, 4
la a0, resultado
ecall

addi a7, zero, 1
add a0, zero, t1
ecall