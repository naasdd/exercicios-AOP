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
	add t0, zero, a0
	
	addi a7, zero, 4
	la a0, msgB
	ecall
	
	addi a7, zero, 5
	ecall

	
	add a1, zero, a0
	add a0, zero, t0

	jal ra, soma
	add t0, zero, a0
	add t1, zero, a1
	
	addi a7, zero, 4
	la a0, msgResultado
	ecall
	
	addi a7, zero, 1
	add a0, zero, t0
	ecall
	
	addi a7, zero, 10
	ecall
	
	
dobro:
	addi t3, zero, 2
	mul a0, a0, t3
	jalr zero, ra, 0
	
	
soma:
	addi sp, sp, -8
	sw ra, 4(sp)
	jal ra, dobro
	add a0, a0, a1
	lw ra, 4(sp)
	addi sp, sp, 8
	jalr zero, ra, 0
