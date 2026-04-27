.data
    msg_entrada:   .asciz "Digite n: "
    msg_resultado: .asciz "Fatorial: "

.text
_start:
# Comentarios adicionados pelo claude pra me ajuda a entender


    addi a7, zero, 4            # syscall 4 = imprimir string
    la   a0, msg_entrada        # a0 = endereço de msg_entrada
    ecall

    addi a7, zero, 5            # syscall 5 = ler inteiro do teclado
    ecall                       # número digitado entra em a0 automaticamente

    jal  ra, fat                # ra ← endereço da próxima linha, PC ← fat
                                # ou seja: vai pra fat e guarda onde voltar

    add  t0, zero, a0           # salva resultado antes das syscalls abaixo sujarem a0

    addi a7, zero, 4
    la   a0, msg_resultado      # a0 = endereço de msg_resultado
    ecall

    addi a7, zero, 1            # syscall 1 = imprimir inteiro
    add  a0, zero, t0           # move resultado de volta pra a0
    ecall

    addi a7, zero, 10           # syscall 10 = encerrar programa
    ecall


fat:
    # === PRÓLOGO ===
    addi sp, sp, -8             # abre 8 bytes na stack (sp desce, stack cresce pra baixo)
                                # layout: sp+0 = n,  sp+4 = ra

    sw   a0, 0(sp)              # salva n na stack
                                # precisamos de n depois que fat(n-1) retornar

    sw   ra, 4(sp)              # CRÍTICO: salva ra na stack
                                # o próximo "jal ra, fat" vai sobrescrever ra
                                # se não salvar agora, perdemos o caminho de volta

    # === CASO BASE: se n <= 1, retorna 1 ===
    addi t0, zero, 1
    bge  t0, a0, fat_r1         # se 1 >= n (ou seja, n <= 1) → salta pro caso base

    # === CASO RECURSIVO ===
    addi a0, a0, -1             # a0 = n - 1 (argumento pra próxima chamada)

    jal  ra, fat                # chama fat(n-1)
                                #   ra ← endereço do "lw t1, 0(sp)" abaixo
                                #   PC ← fat
                                # ra anterior já está salvo na stack, não perde nada

    # fat(n-1) retornou. a0 tem o resultado de fat(n-1)

    lw   t1, 0(sp)              # recupera o n original que salvamos no prólogo
    lw   ra, 4(sp)              # recupera ra original, que aponta de volta pra quem chamou
    addi sp, sp, 8              # fecha os 8 bytes abertos no prólogo

    mul  a0, a0, t1             # a0 = fat(n-1) * n
    jalr zero, ra, 0            # retorna ao chamador (PC ← ra + 0)


fat_r1:
    # === CASO BASE ===
    addi a0, zero, 1            # valor de retorno = 1

    lw   ra, 4(sp)              # restaura ra (prólogo rodou antes do bge, stack foi mexida)
    addi sp, sp, 8              # fecha o espaço aberto no prólogo
    jalr zero, ra, 0            # retorna ao chamador