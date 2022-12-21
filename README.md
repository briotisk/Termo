# Termo
### Repositório dedicado à criação do jogo Termo em linguagem Assembly
Link para o vídeo contendo explicação do projeto: https://youtu.be/b_YtULh11EU

> Planejamento do jogo:

 Salvar palavras na memória
 Criar variáveis
 Tela para seleção de modo de jogo

 	Modo 1: Termo 	 [1 PALAVRA - 6 TENTATIVAS]
 	Modo 2: Dueto 	 [2 PALAVRAS - 7 TENTATIVAS]
 	Modo 3: Quarteto [4 PALAVRAS - 9 TENTATIVAS]

> Estrutura básica de cada modo:

 	Sorteia a palavra

 	[LOOP]
 	Espera o usuário digitar uma palavra
 	Verifica a quantidade de caracteres corretos
 	Atualiza quais caracteres estão na posição certa e quais pertencem à palavra
 	Verifica se o usuário acertou
 	[/LOOP]
