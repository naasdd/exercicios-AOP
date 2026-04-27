.text
    addi a7, zero, 5
    jal ra, FAT

    addi a7, zero, 1
    ecall

    addi a7, zero, 10
    ecall

FAT:
    addi sp, sp, -4      # Empilhei
    sw s0, 0(sp)
    addi s0, zero, 1
    addi t0, zero, 1

FAT_while:
    blt a7, t0, FAT_fim
    mul s0, s0, t0
    addi t0, t0, 1
    jal zero, FAT_while

FAT_fim:
    add a0, zero, s0
    lw s0, 0(sp)
    addi sp, sp, 4
    jalr zero, ra, 0 # jalr ra (também é aceito)
