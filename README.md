# Trabalho Final de Codificacao - Assembly MIPS

Trabalho final da disciplina de Arquitetura e Organizacao de Computadores,
professor Renato de Aquino Lopes. O repo guarda os tres arquivos `.asm`
feitos em assembly MIPS, pra rodar no MARS.

## Grupo 8

- Giovana Medeiros Ferreira
- Matheus Andrade Tabchoury
- Matheus Medrado Ferreira

## O que tem aqui

```
.
├── README.md
├── Ex01.asm
├── Ex02.asm
├── Ex03.asm
└── contexto/
```

A pasta `contexto/` so guarda o material de aula (slides e exemplos que o
professor passou). Os tres arquivos que valem nota sao os `Ex0X.asm` na
raiz.

## Como rodar

Abre o `.asm` no MARS, monta com Ctrl+F3, roda com F5. A leitura dos
numeros acontece na janela "Run I/O" embaixo.

## Os exercicios

**Ex01.asm** - Le um inteiro. Se for zero, preenche os indices pares do
vetor de 10 posicoes com 2. Se nao for zero, preenche os indices impares
com 1. Vetor comeca todo zerado. No final imprime o vetor em uma linha.

**Ex02.asm** - Vetor de 10 posicoes com 1 a 10. Le um inteiro de 0 a 9
e imprime o conteudo das posicoes cujo indice for diferente do valor
lido.

**Ex03.asm** - Le 20 inteiros do usuario e guarda no vetor. Apos isso
le mais um inteiro N. Se N for menor que o segundo elemento do vetor
(vet[1]), troca os indices impares por 4. No final imprime o vetor em
uma linha.

## Restricoes seguidas

- So foram usadas instrucoes vistas em aula (aulas 8 e 9): add, addi,
  sub, mul, lw, sw, and, andi, or, ori, sll, srl, beq, bne, slt, slti,
  j, jal, jr, li, la, move e syscall (1, 4, 5, 10).
- Toda linha de codigo esta comentada.
