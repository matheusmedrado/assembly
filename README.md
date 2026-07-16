# Trabalho Final de Codificacao

> Assembly MIPS · Arquitetura e Organizacao de Computadores
> Prof. Renato de Aquino Lopes · Grupo 8

Repositorio com os tres programas feitos em assembly MIPS pro trabalho
final da disciplina. Roda no MARS.

---

## Integrantes

- Giovana Medeiros Ferreira
- Matheus Andrade Tabchoury
- Matheus Medrado Ferreira

---

## Arquivos

```
.
├── README.md
├── Ex01.asm
├── Ex02.asm
└── Ex03.asm
```

---

## Como rodar

1. Abre o MARS
2. `File > Open` e escolhe o `.asm` que quer testar
3. `Ctrl + F3` pra montar
4. `F5` pra rodar ate o fim, `F7` pra ir passo a passo
5. Quando o programa pedir um numero, digita na janela **Run I/O** que
   fica embaixo

---

## Os exercicios

### Ex01 - Preencher pares ou impares

Le um inteiro do teclado. Se for **zero**, preenche os indices pares
(0, 2, 4, 6, 8) do vetor com 2. Se for **diferente de zero**, preenche
os indices impares (1, 3, 5, 7, 9) com 1. Vetor comeca zerado.

```
Entrada:  0  -> vetor final: 2 0 2 0 2 0 2 0 2 0
Entrada:  7  -> vetor final: 0 1 0 1 0 1 0 1 0 1
```

### Ex02 - Filtrar por indice

Vetor de 10 posicoes ja inicializado com a sequencia `1 2 3 4 5 6 7 8
9 10`. Le um inteiro entre 0 e 9 e imprime o conteudo das posicoes
cujo indice for diferente do valor lido.

```
Entrada:  4  -> imprime: 1 2 3 5 6 7 8 9 10
```

### Ex03 - Atualizar impares sob condicao

Le 20 inteiros do usuario e guarda no vetor. Depois le mais um inteiro
N. Se N for menor que o segundo elemento do vetor (`vet[1]`), os
indices impares (1, 3, 5, ..., 19) sao substituidos por 4. No final
imprime o vetor em uma linha.

```
Se vet[1] = 10 e N = 3, os indices 1, 3, 5, ..., 19 viram 4
```

---

## Restricoes

- **Instrucoes:** so as que foram vistas em aula (aulas 8 e 9):
  `add`, `addi`, `sub`, `mul`, `lw`, `sw`, `and`, `andi`, `or`,
  `ori`, `sll`, `srl`, `beq`, `bne`, `slt`, `slti`, `j`, `jal`,
  `jr`, `li`, `la`, `move` e `syscall` (codigos 1, 4, 5 e 10).
- **Comentarios:** toda linha de codigo tem um comentario explicando
  o que faz.

---

## Referencia

- Patterson, D. A.; Hennessy, J. L. *Organizacao e Projeto de
  Computadores: A Interface Hardware/Software*.
