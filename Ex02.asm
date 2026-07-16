# Ex02 - Inicializa vetor de 10 posicoes com a sequencia de 1 a 10.
# Le um inteiro entre 0 e 9 e imprime o conteudo das posicoes
# cujo indice for diferente do valor lido.

		.data
vet:		.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10		# declara vetor de 10 posicoes com a sequencia 1..10
msg1:		.asciiz "Digite um numero inteiro entre 0 e 9: "	# mensagem para pedir o indice a ignorar
msg2:		.asciiz "Posicoes com indice diferente: "		# cabecalho da impressao
msg3:		.asciiz " "					# espaco usado para separar os valores impressos
msg4:		.asciiz "\n"					# quebra de linha ao final

		.text
		# --- Leitura do inteiro (indice a ser ignorado) ---
		la $a0, msg1					# carrega em $a0 o endereco da string msg1
		li $v0, 4					# codigo 4 = imprime string
		syscall						# imprime msg1
		li $v0, 5					# codigo 5 = le um inteiro do teclado
		syscall						# o valor lido fica em $v0
		move $t0, $v0					# guarda o valor lido em $t0 (indice a ser ignorado)

		# --- Inicializacao dos contadores e ponteiro ---
		li $t1, 0					# $t1 sera o indice i do loop (comeca em 0)
		li $t2, 10					# $t2 guarda o limite superior do loop (10 posicoes)
		la $t3, vet					# $t3 recebe o endereco base do vetor

		# --- Imprime o cabecalho da saida ---
		la $a0, msg2					# carrega o endereco de "Posicoes com indice diferente: "
		li $v0, 4					# codigo 4 = imprime string
		syscall						# imprime o cabecalho

		# --- Loop: percorre as 10 posicoes e imprime as que tem indice diferente do lido ---
		LoopFiltra:
		beq $t1, $t2, FimLoop				# se i == 10 sai do loop
		beq $t1, $t0, PulaImpressao			# se i == valor lido, pula a impressao desta posicao
		lw $a0, 0($t3)					# carrega o valor da posicao atual do vetor
		li $v0, 1					# codigo 1 = imprime inteiro
		syscall						# imprime o valor
		la $a0, msg3					# carrega o endereco do espaco separador
		li $v0, 4					# codigo 4 = imprime string
		syscall						# imprime um espaco entre os valores

		PulaImpressao:
		addi $t1, $t1, 1				# incrementa o indice i
		addi $t3, $t3, 4				# avanca o ponteiro para a proxima word (4 bytes)
		j LoopFiltra					# volta para o inicio do loop

		FimLoop:
		la $a0, msg4					# carrega o endereco da quebra de linha
		li $v0, 4					# codigo 4 = imprime string
		syscall						# imprime a quebra de linha final

		# --- Encerra o programa ---
		li $v0, 10					# codigo 10 = encerra a execucao
		syscall						# executa a chamada de sistema para finalizar
