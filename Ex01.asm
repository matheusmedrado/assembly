# Ex01 - Preencher posicoes pares (com 2) ou impares (com 1) do vetor
# conforme o valor lido do teclado. Vetor comeca zerado.
# Ao final imprime o vetor em uma unica linha.
# Se a opcao lida for igual a zero -> preenche indices pares com 2
# Se a opcao lida for diferente de zero -> preenche indices impares com 1

		.data
vet:		.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0		# declara vetor de 10 posicoes inicializado com zero
msg1:		.asciiz "Digite um numero inteiro: "		# mensagem para pedir o numero ao usuario
msg2:		.asciiz "Preenchendo posicao "			# parte inicial da mensagem do preenchimento
msg3:		.asciiz " com valor "				# parte do meio da mensagem do preenchimento
msg4:		.asciiz "\n"					# quebra de linha apos cada preenchimento
msg5:		.asciiz "Vetor final: "				# cabecalho da impressao final do vetor
msg6:		.asciiz " "					# espaco usado para separar os valores impressos

		.text
		# --- Leitura do numero inteiro do teclado ---
		la $a0, msg1					# carrega em $a0 o endereco da string msg1
		li $v0, 4					# codigo 4 = imprime string
		syscall						# executa a chamada de sistema para imprimir msg1
		li $v0, 5					# codigo 5 = le um inteiro do teclado
		syscall						# executa a chamada de sistema, o valor lido fica em $v0
		move $t0, $v0					# guarda o valor lido em $t0 (opcao)

		# --- Inicializacao dos contadores e ponteiro ---
		li $t1, 0					# $t1 sera o indice i do loop (comeca em 0)
		li $t2, 10					# $t2 guarda o limite superior do loop (10 posicoes)
		la $t3, vet					# $t3 recebe o endereco base do vetor

		# --- Decisao: define qual valor sera gravado no vetor ---
		beq $t0, $zero, PreenchePares			# se $t0 (opcao) for igual a zero, vai para PreenchePares
		li $t4, 1					# $t4 recebe o valor 1 (preenchimento dos indices impares)
		j LoopPreenchimento				# pula para o loop
		PreenchePares:
		li $t4, 2					# $t4 recebe o valor 2 (preenchimento dos indices pares)

		# --- Loop principal: percorre as 10 posicoes do vetor ---
		LoopPreenchimento:
		beq $t1, $t2, FimLoop				# se i == 10 sai do loop
		andi $t5, $t1, 1				# $t5 = i AND 1 -> isola o bit menos significativo (0 par, 1 impar)
		beq $t0, $zero, TestaPar				# se a opcao for zero, testa se o indice atual e par
		bne $t5, $zero, GravaValor			# se opcao != 0 e indice impar, grava o valor (1)
		j PulaGravacao					# caso contrario (indice par com opcao != 0), pula a gravacao
		TestaPar:
		bne $t5, $zero, PulaGravacao			# se opcao == 0 e indice impar, pula a gravacao

		# --- Gravacao do valor na posicao atual do vetor ---
		GravaValor:
		sw $t4, 0($t3)					# grava o valor (2 ou 1) na posicao atual do vetor

		# --- Imprime "Preenchendo posicao X com valor Y" ---
		la $a0, msg2					# carrega o endereco de "Preenchendo posicao "
		li $v0, 4					# codigo 4 = imprime string
		syscall						# imprime "Preenchendo posicao "
		move $a0, $t1					# move o indice i para $a0
		li $v0, 1					# codigo 1 = imprime inteiro
		syscall						# imprime o indice da posicao
		la $a0, msg3					# carrega o endereco de " com valor "
		li $v0, 4					# codigo 4 = imprime string
		syscall						# imprime " com valor "
		lw $a0, 0($t3)					# carrega o valor que foi gravado no vetor
		li $v0, 1					# codigo 1 = imprime inteiro
		syscall						# imprime o valor gravado
		la $a0, msg4					# carrega o endereco da quebra de linha
		li $v0, 4					# codigo 4 = imprime string
		syscall						# imprime a quebra de linha

		PulaGravacao:
		addi $t1, $t1, 1				# incrementa o indice i
		addi $t3, $t3, 4				# avanca o ponteiro para a proxima word (4 bytes)
		j LoopPreenchimento				# volta para o inicio do loop

		FimLoop:
		# --- Impressao do vetor final em uma unica linha ---
		la $a0, msg5					# carrega o endereco de "Vetor final: "
		li $v0, 4					# codigo 4 = imprime string
		syscall						# imprime o cabecalho
		li $t1, 0					# zera o indice i para varrer o vetor novamente
		la $t3, vet					# recarrega o endereco base do vetor
		li $t2, 10					# $t2 volta a ser o limite (10)
		LoopImprime:
		beq $t1, $t2, FimImprime				# se i == 10 sai do loop de impressao
		lw $a0, 0($t3)					# carrega o valor da posicao atual do vetor
		li $v0, 1					# codigo 1 = imprime inteiro
		syscall						# imprime o valor
		la $a0, msg6					# carrega o endereco do espaco separador
		li $v0, 4					# codigo 4 = imprime string
		syscall						# imprime um espaco entre os valores
		addi $t1, $t1, 1				# incrementa o indice i
		addi $t3, $t3, 4				# avanca o ponteiro para a proxima word
		j LoopImprime					# volta para o inicio do loop de impressao
		FimImprime:
		la $a0, msg4					# carrega o endereco da quebra de linha
		li $v0, 4					# codigo 4 = imprime string
		syscall						# imprime a quebra de linha final

		# --- Encerra o programa ---
		li $v0, 10					# codigo 10 = encerra a execucao
		syscall						# executa a chamada de sistema para finalizar
