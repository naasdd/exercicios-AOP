# exercicio de funcao recursiva
# fatorail em assembly 

.data
	msgInput: .asciz "Insira um valor: "
	msgResultado: .asciz "O resultado é: "
	
.text

	addi a7, zero, 4
	la a0, msgInput
	ecall
	
	addi a7, zero, 5
	ecall
	
	jal ra, fatorial
	
	addi a7, zero, 4
	la a0, msgResultado
	ecall
	
	
	addi a7, zero, 1
	add a0, zero, t0
	ecall
	
	addi a7, zero, 10
	ecall
	

fatorial:
	addi sp, sp, -8
	sw ra, 4(sp)
	sw a0, 0(sp)
	
	addi t0, zero, 2
	blt a0, t0, casoBase
	
	addi a0, a0, -1
	jal ra, fatorial
	lw a1, 0(sp)
	mul a0, a0, a1
	jal zero, fim:

casoBase:
	addi a0, zero, 1
	
fim:
	add t0, zero, a0
	lw ra, 4(sp)
	addi sp, sp, 8
	jalr zero, ra, 0










