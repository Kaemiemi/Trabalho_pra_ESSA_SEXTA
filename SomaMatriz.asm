.data
    size: .word 2                # Tamanho da matriz (número de linhas/colunas)
    matriz1: .space 16           # Espaço para matriz 1 sizexsize e 4 bytes cada
    matriz2: .space 16           # Espaço para matriz 2 
    resultado: .space 16         # Espaço para matriz de resultado 

    space: .asciiz " "
    newline: .asciiz "\n"        # Nova linha para a saída
    imprimir_matriz1: .asciiz "Matrizes:\n"
    imprimir_resultado: .asciiz "Matriz resultado:\n"
    imprimir_tempo: .asciiz "TEMPO DE EXECUÇÃO: (sem o tempo de imprimir)\n"

.text
.globl main

main:
    li $v0, 30
    syscall
    
    # Carregar o tamanho da matriz
    la $t0, size
    lw $t0, 0($t0)           # $t0 = tamanho da matriz (n = 3)

    # Gerar matriz1
    la $a2, matriz1          # Ponteiro para matriz1
    jal gerar_matriz         # Preenche matriz1

    # Gerar matriz2
    la $a2, matriz2          # Ponteiro para matriz2
    jal gerar_matriz         # Preenche matriz2

    # Soma matriz1 e matriz2
    la $s1, matriz1          # Ponteiro para matriz1
    la $s2, matriz2          # Ponteiro para matriz2
    la $s0, resultado        # Ponteiro para matriz de resultado
    jal soma_matrizes        # Realiza a soma
    
    li $a0, 0x00000159
    li $a1, 0x857633FE
    
    
    move $s4, $a0
    move $s5, $a1
    
    la $a0, imprimir_matriz1     
    li $v0, 4
    syscall
    
    # Imprimir uma das matrizes
    la $s1, matriz1
    jal imprimir_matriz
    
    la $a0, imprimir_resultado     
    li $v0, 4
    syscall

    # Imprimir resultado
    la $a3, resultado        # Ponteiro para a matriz resultado
    jal imprimir_matriz      # Imprime a matriz resultado
    
    la $a0, imprimir_tempo
    li $v0, 4
    syscall
    
    move $a0, $s4
    li $v0, 1
    syscall
    
    move $a0, $s5
    li $v0, 1
    syscall
    
    # Encerrar o programa
    li $v0, 10
    syscall

# Sub-rotina para preencher uma matriz
gerar_matriz:
    li $t1, 0                # Contador de linha
loop_linhas:
    li $t2, 0                # Contador de coluna
loop_colunas:
    add $t3, $t1, $t2 # i+j
    sw $t3, 0($a2)          # Armazena o valor na matriz1
    addi $a2, $a2, 4
    addi $t2, $t2, 1         # Próxima coluna
    beq $t2, $t0, proxima_linha # Se $t8 == tamanho, próxima linha
    j loop_colunas
proxima_linha:
    addi $t1, $t1, 1         # Próxima linha
    beq $t2, $t1, fim_gerar  # final da matriz
    j loop_linhas
fim_gerar:
    jr $ra

# Sub-rotina para somar duas matrizes
soma_matrizes:
    li $t1, 0                # Contador de linha
soma_linhas:
    li $t2, 0                # Contador de coluna
soma_colunas:
    lw $t3, 0($s1)         # Carrega elemento matriz1
    lw $t4, 0($s2)         # Carrega elemento matriz2
    add $t5, $t3, $t4
    sw $t5, 0($s0)         # Armazena o resultado
    addi $s1, $s1, 4
    addi $s2, $s2, 4
    addi $s0, $s0, 4
    addi $t2, $t2, 1         # Próxima coluna
    beq $t2, $t0, proxima_linha_soma # Se $t8 == tamanho, próxima linha
    j soma_colunas
proxima_linha_soma:
    addi $t1, $t1, 1         # Próxima linha
    beq $t2, $t1, fim_soma   # Se $t7 == tamanho, fim
    j soma_linhas
fim_soma:
    jr $ra

# Sub-rotina para imprimir uma matriz
imprimir_matriz:
    li $t1, 0                # Contador de linha
imprime_linhas:
    li $t2, 0                # Contador de coluna
imprime_colunas:
    lw $a0, 0($s1)          # Carrega o elemento
    li $v0, 1                # Imprime inteiro
    syscall
    la $a0, space          # Imprime espaço
    li $v0, 4
    syscall
    addi $t2, $t2, 1         # Próxima coluna
    addi $s1, $s1, 4
    beq $t2, $t0, proxima_linha_imprime # Se $t8 == tamanho, próxima linha
    j imprime_colunas
proxima_linha_imprime:
    la $a0, newline          # Nova linha
    li $v0, 4
    syscall
    addi $t1, $t1, 1         # Próxima linha
    beq $t2, $t1, fim_imprime # Se $t7 == tamanho, fim
    j imprime_linhas
fim_imprime:
    jr $ra
