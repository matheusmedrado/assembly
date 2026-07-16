# Ex03 - Inicializa um vetor de 20 posicoes com zeros.
# Le 20 numeros inteiros do usuario, um por vez, e armazena no vetor.
# Em seguida le um inteiro N. Se N for menor que o segundo elemento
# do vetor (vet[1]), atualiza as posicoes de indice impar (1, 3, 5,
# 7, 9, 11, 13, 15, 17, 19) com o valor 4. No final imprime o vetor
# em uma unica linha.

		.data
vet:		.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0		# vetor de 20 posicoes inicializado com zero
msg1:		.asciiz "Digite o valor da posicao "		# parte inicial do prompt de leitura do vetor
msg2:		.asciiz ": "					# parte final do prompt (dois pontos e espaco)
msg3:		.asciiz "Digite um numero inteiro: "		# mensagem para ler o N
msg4:		.asciiz "Vetor final: "				# cabecalho da impressao do vetor
msg5:		.asciiz " "					# espaco usado para separar os valores impressos
msg6:		.asciiz "\n"					# quebra de linha

		.text
		# --- Inicializacao para o loop de leitura do vetor ---
		li $t1, 0					# $t1 sera o indice i do loop (comeca em 0)
		li $t2, 20					# $t2 guarda o limite superior do loop (20 posicoes)
		la $t3, vet					# $t3 recebe o endereco base do vetor

		# --- Loop: le os 20 valores inteiros do usuario e grava no vetor ---
		LoopLeVetor:
		beq $t1, $t2, FimLeVetor			# se i == 20 sai do loop de leitura
		la $a0, msg1					# carrega o endereco de "Digite o valor da posicao "
		li $v0, 4					# codigo 4 = imprime string
		syscall						# imprime "Digite o valor da posicao "
		addi $a0, $t1, 1				# $a0 recebe i + 1 (numero da posicao em formato humano)
		li $v0, 1					# codigo 1 = imprime inteiro
		syscall						# imprime o numero da posicao
		la $a0, msg2					# carrega o endereco de ": "
		li $v0, 4					# codigo 4 = imprime string
		syscall						# imprime ": "
		li $v0, 5					# codigo 5 = le um inteiro do teclado
		syscall						# o valor lido fica em $v0
		sw $v0, 0($t3)					# grava o valor lido na posicao atual do vetor
		addi $t1, $t1, 1				# incrementa o indice i
		addi $t3, $t3, 4				# avanca o ponteiro para a proxima word (4 bytes)
		j LoopLeVetor					# volta para o inicio do loop

		FimLeVetor:
		# --- Leitura do inteiro N para a comparacao ---
		la $a0, msg3					# carrega o endereco de "Digite um numero inteiro: "
		li $v0, 4					# codigo 4 = imprime string
		syscall						# imprime msg3
		li $v0, 5					# codigo 5 = le um inteiro do teclado
		syscall						# o valor lido fica em $v0
		move $t0, $v0					# guarda N em $t0

		# --- Carrega o segundo elemento do vetor (vet[1]) e compara com N ---
		la $t3, vet					# $t3 volta a apontar para o inicio do vetor
		lw $t1, 4($t3)					# $t1 recebe o valor de vet[1] (offset 4 bytes)
		slt $t2, $t0, $t1				# $t2 = 1 se N < vet[1], senao $t2 = 0
		beq $t2, $zero, PulaAtualizacao			# se $t2 == 0 (N >= vet[1]), pula a atualizacao

		# --- Atualizacao: percorre os 20 indices e grava 4 nos impares ---
		li $t1, 0					# $t1 = indice i (comeca em 0)
		li $t2, 20					# $t2 = limite do loop (20 posicoes)
		la $t3, vet					# $t3 = endereco base do vetor
		li $t4, 4					# $t4 = valor 4 que sera gravado nos indices impares
		LoopAtualiza:
		beq $t1, $t2, FimAtualiza			# se i == 20 sai do loop
		andi $t5, $t1, 1				# $t5 = i AND 1 -> isola o bit menos significativo (0 par, 1 impar)
		beq $t5, $zero, PulaIndice			# se i for par, pula este indice
		sw $t4, 0($t3)					# grava o valor 4 na posicao atual (indice impar)
		PulaIndice:
		addi $t1, $t1, 1				# incrementa o indice i
		addi $t3, $t3, 4				# avanca o ponteiro para a proxima word
		j LoopAtualiza					# volta para o inicio do loop

		FimAtualiza:
		PulaAtualizacao:
		# --- Impressao do vetor final em uma unica linha ---
		la $a0, msg4					# carrega o endereco de "Vetor final: "
		li $v0, 4					# codigo 4 = imprime string
		syscall						# imprime o cabecalho
		li $t1, 0					# zera o indice i para varrer o vetor
		la $t3, vet					# recarrega o endereco base do vetor
		li $t2, 20					# $t2 volta a ser o limite (20)
		LoopImprime:
		beq $t1, $t2, FimImprime				# se i == 20 sai do loop de impressao
		lw $a0, 0($t3)					# carrega o valor da posicao atual do vetor
		li $v0, 1					# codigo 1 = imprime inteiro
		syscall						# imprime o valor
		la $a0, msg5					# carrega o endereco do espaco separador
		li $v0, 4					# codigo 4 = imprime string
		syscall						# imprime um espaco entre os valores
		addi $t1, $t1, 1				# incrementa o indice i
		addi $t3, $t3, 4				# avanca o ponteiro para a proxima word
		j LoopImprime					# volta para o inicio do loop de impressao
		FimImprime:
		la $a0, msg6					# carrega o endereco da quebra de linha
		li $v0, 4					# codigo 4 = imprime string
		syscall						# imprime a quebra de linha final

		# --- Encerra o programa ---
		li $v0, 10					# codigo 10 = encerra a execucao
		syscall						# executa a chamada de sistema para finalizar
