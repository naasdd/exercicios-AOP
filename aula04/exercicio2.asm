.data
msgN: .asciz "Insira o valor de N: "
resultado: .asciz "O fatorial de N é: "

.text
_start:
# Ler o valor de N
addi a7, zero, 4
la a0, msgN

addi a7, zero, 5
ecall
add t1, zero, a0   # t1 = n (vai decrementando)
addi t2, zero, 1   # t2 = acumulador (começa em 1)

fatorial_while:
	addi t3, zero, 1
	blt t1, t3, fatorial_fim  # Sai do loop quando n < 1
	mul t2, t2, t1             # acumulador = acumulador * n
	addi t1, t1, -1            # n--
	jal fatorial_while

fatorial_fim:
# Exibir resultado
addi a7, zero, 4
la a0, resultado
ecall
addi a7, zero, 1
add a0, zero, t2
ecall
addi a7, zero, 10
ecall