# Exercicio para revisar Jump and Link
# main: chama soma(3, 4)
# soma: recebe a0 e a1, chama dobro(a0), retorna dobro(a0) + a1
# dobro: recebe a0, retorna a0 * 2
.data
	msgA: .asciz "Digite um núemro: "
	msgB: .asciz "Digite outro número: "
	msgResultado: .asciz "O resultado é: "
.text
main:
	addi a7, zero, 4
	la a0, msgA
	ecall
	
	addi a7, zero, 5
	ecall
	add s0, zero, a0
	
	addi a7, zero, 4
	la a0, msgB
	ecall
	
	addi a7, zero, 5
	ecall
	add s1, zero, a0
	
	jal ra, soma
	
	addi a7, zero, 4
	la a0, msgResultado
	ecall
	
	addi a7, zero, 1
	add a0, zero, t2
	ecall
	
	addi a7, zero, 10
	ecall
dobro:
	addi s3, zero, 2
	mul s0, s0, s3
	lw ra, 4(sp)
	jalr zero, ra, 0
soma:
	addi sp, sp, -8
	sw ra, 4(sp)
	jal ra, dobro
	add s2, s0, s1
	jalr ra