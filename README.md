# Trabalho de Assembly MIPS

Repositorio com as solucoes dos exercicios praticos da disciplina de
Arquitetura e Organizacao de Computadores, ministrada pelo professor
Renato de Aquino Lopes.

Os programas foram escritos em assembly MIPS e devem ser executados no
simulador MARS (MIPS Assembler and Runtime Simulator).

## Grupo 8

- Giovana Medeiros Ferreira
- Matheus Andrade Tabchoury
- Matheus Medrado Ferreira

## Sobre o trabalho

O trabalho e composto por tres exercicios que praticam manipulacao de
vetores, leitura e escrita de inteiros via syscall e estruturas basicas
de repeticao e decisao em assembly MIPS.

Restricoes adotadas:

- Foram utilizadas apenas instrucoes vistas em aula, conforme o conjunto
  apresentado nas aulas 8 e 9 (Linguagem de Montagem e Suporte a
  Procedimentos): add, addi, sub, mul, lw, sw, and, andi, or, ori,
  sll, srl, beq, bne, slt, slti, j, jal, jr, li, la, move e syscall
  com os codigos 1, 4, 5 e 10.
- Todas as linhas de codigo estao comentadas, descrevendo de forma
  objetiva o que cada instrucao executa.

## Estrutura dos arquivos

```
.
├── README.md
├── Ex01.asm
├── Ex02.asm
└── Ex03.asm
```

A pasta `contexto/` contem o material de apoio utilizado durante o
desenvolvimento (slides das aulas e exemplos fornecidos pelo professor).

## Como executar

1. Abra o MARS.
2. Carregue o arquivo `.asm` desejado atraves do menu File > Open.
3. Monte o programa com o botao Assemble (ou Ctrl + F3).
4. Execute passo a passo com F7 ou ate o final com F5.
5. A interacao com o usuario (leitura de inteiros) acontece na janela
   "Run I/O", na parte inferior do MARS.

## Descricao dos exercicios

### Ex01.asm

Le um numero inteiro do teclado. Se o valor lido for igual a zero,
preenche as posicoes de indice par (0, 2, 4, 6 e 8) do vetor com o
valor 2. Caso o valor seja diferente de zero, preenche as posicoes de
indice impar (1, 3, 5, 7 e 9) com o valor 1. O vetor de dez posicoes e
inicializado com zeros e, durante o preenchimento, o programa imprime
qual posicao esta sendo alterada. Ao final, o vetor resultante e
exibido em uma unica linha, com os valores separados por espaco.

### Ex02.asm

Inicializa um vetor de dez posicoes com a sequencia de 1 a 10. Em
seguida, le um numero inteiro entre 0 e 9 e imprime o conteudo de
todas as posicoes cujo indice seja diferente do valor informado. A
saida e apresentada em uma unica linha.

### Ex03.asm

Inicializa um vetor de vinte posicoes com zeros e solicita ao usuario
que informe, um a um, os vinte valores que irao compor o vetor. Apos o
preenchimento, le um numero inteiro N. Se N for estritamente menor do
que o segundo elemento do vetor (indice 1), as posicoes de indice
impar (1, 3, 5, ..., 19) sao atualizadas com o valor 4. Caso contrario,
o vetor permanece inalterado. O vetor final e exibido em uma unica
linha, com os valores separados por espaco.

## Material de consulta

- Patterson, D. A.; Hennessy, J. L. Organizacao e Projeto de
  Computadores: A Interface Hardware/Software.
- Slides da disciplina (pasta `contexto/Aulas/`).
- Exemplos de codigo fornecidos em aula (pasta `contexto/`).
