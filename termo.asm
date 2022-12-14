;----Termo----

;Arthur Breno dos Reis Paula
;Caio Oliveira Godinho
;Daniel Contente Romanzini
;Felipe Cecato
;Gabriel Henrique Brioto

; <Estrutura do jogo>
;
;main:
;
; Seta parametros
; Call DesenhaTelaInicial
; Call InputLetra
; Switch(modo){
;
;  Case 1:
;
;    Call Termo
;
;  Case 2:
;
;    Call Dueto
;
;  Case 3:
;
;    Call Quarteto
; }
; 
; Halt
;
;/main
;================================================
;DesenhaTelaInicial:
;	
; [Imprime as opções no formato de menu:
;  	1 - Termo
;  	2 - Dueto
;   3 - Quarteto]
;
;/DesenhaTelaInicial
;================================================
;Termo:
;
; Call SortearPalavra
; Call DesenhaTelaTermo
; Loop(x6):
;
;   Call InputPalavra
;   Call Compara
;   Call ImprimePalavra
;
; /Loop
;
;/Termo
;================================================
;DesenhaTelaTermo:
;
; Call ApagaTela
; ImprimePalavra("TERMO")
; Call ImprimePalavra("_____")(x1)(x6)
;
;/DesenhaTelaTermo
;================================================
;Dueto:
;
; Call SortearPalavra(x2)
; Call DesenhaTelaDueto
; Loop(x7):
;	
;   Call InputPalavra
;   Call Compara(x2)
;   Call ImprimePalavra(x2)
;
; /Loop
;
;/Dueto
;================================================
;DesenhaTelaDueto:
;
; Call ApagaTela
; ImprimePalavra("DUETO")
; Call ImprimePalavra("_____")(x2)(x7)
;
;/DesenhaTelaDueto
;================================================
;Quarteto:
;
; Call SortearPalavra(x4)
; Call DesenhaTelaQuarteto
; Loop(x9):
;
;   Call InputPalavra
;   Call Compara(x4)
;   Call ImprimePalavra(x4)
;
; /Loop
;
;/Quarteto
;================================================
;DesenhaTelaQuarteto:
;
; Call ApagaTela
; ImprimePalavra("QUARTETO")
; Call ImprimePalavra("_____")(x4)(x9)
;
;/DesenhaTelaQuarteto
;================================================
;ApagaTela:
;
; [imprime espaços sobre toda a tela]
;
;/ApagaTela
;================================================
;InputPalavra:
;
; Loop(x5):
;
;   Call InputLetra
;
; /Loop
;
;/InputPalavra
;================================================
;InputLetra:
; 
; [Le uma letra do teclado]
;
;/InputLetra
;================================================
;SortearPalavra:
; 
;/SortearPalavra
;================================================
;Compara:
; 
;/Compara
;================================================
;ImprimePalavra
; 
; Loop(x5)
;
;   outchar(Palavra[i], pos)
;   pos++
;   i++   
;
; /Loop
;
;/ImprimePalavra
;================================================
;OBS: chamar as subrotinas "RealizarPushes" e "RealizarPops" a cada rotina

jmp main

;---------Armazenamento das palavras usadas no jogo---------
Offset: string "carro"
string "garfo"
string "pulga"
string "queda"
string "viola"
string "mundo"
string "carta"
string "ferro"
string "perto"
string "vital"
string "feito"
string "beijo" 
string "curto" 
string "exato" 
string "preto" 
string "julho" 
string "marco" 
string "verbo"  
string "junto" 
string "clube" 
string "hotel" 
string "louco" 
string "forte" 
string "muito" 
string "pouco" 
string "certo" 
string "quina"
string "quota" 
string "louro" 
string "couro" 
string "bromo" 
string "trave" 
string "cravo" 
string "bravo" 
string "bolha" 
string "falha" 
string "justo" 
string "pizza" 
string "morte" 
string "volta" 
string "unido" 
string "galho" 
string "filho" 
string "bomba" 
string "gesto" 
string "grilo" 
string "amido" 
string "amigo"
string "resto" 
string "choro"  
string "longe" 
string "banho" 
string "couve" 
string "chato" 
string "legal" 
string "touca" 
string "olhar" 
string "canil" 
string "cesta" 
string "ostra" 

;[OBSERVAÇÃO: Ao acrescentar palavras, mudar o valor de r4 na subrotina "SortearPalavra"]

;---------Declaração das variáveis globais---------
Iterador: var #1  	;armazena o conteúdo do iterador após o fim do jogo para verificar se o jogador ganhou ou não
Letra: var #1  		;armazena uma letra
Modo: var #1 		;armazena o modo de jogo (1 - Termo, 2 - Dueto ou 3 - Quarteto)
Cor: var #1 		;armazena a cor usada para indicar os acertos
Palavra: var #6 	;armazena a palavra digitada
PalavraCmp: var #6 	;armazena uma cópia da palavra sorteada para a comparação
PalavraCp: var #6 	;armazena uma cópia da palavra digitada para a comparação
NumAleat: var #1 	;armazena um número pseudo aleatório gerado para servir como seed na escolha das palavras
Palavra1: var #1 	;armazena a primeira palavra sorteada
Palavra2: var #1 	;armazena a segunda palavra sorteada
Palavra3: var #1 	;armazena a terceira palavra sorteada
Palavra4: var #1 	;armazena a quarta palavra sorteada
Acertos1: var #1 	;armazena a quantidade de letras na posição certa na palavra 1 
Acertos2: var #1 	;armazena a quantidade de letras na posição certa na palavra 2 
Acertos3: var #1 	;armazena a quantidade de letras na posição certa na palavra 3 
Acertos4: var #1 	;armazena a quantidade de letras na posição certa na palavra 4 

;---------Mensagens usadas no programa---------
Msgn1: string "Escolha um modo para jogar"
Msgn2: string "1 - Termo"
Msgn3: string "2 - Dueto"
Msgn4: string "3 - Quarteto"
Msgn5: string "T E R M O"
Msgn6: string "D U E T O"
Msgn7: string "Q U A R T E T O"
Msgn8: string "_____"
Msgn9: string "You Win!"
Msgn10: string "Game Over!"
Msgn11: string "Deseja jogar Novamente? (s/n)"
Msgn12: string "Ativar modo daltonico? (s/n)"
Msgn13: string "INSTRUCOES:"
Msgn14: string "Voce tera algumas tentativas para       acertar as palavras"
Msgn15: string "As dicas serao:"
Msgn16: string "Letra e posicao corretas:"
Msgn17: string "Letra correta e posicao errada:"
Msgn18: string "Letra nao existente na palavra:"
Msgn19: string "(Use a tecla espaco para apagar)"
Msgn20: string "DIGITE QUALQUER TECLA PARA CONTINUAR!"
;----------Inicio Programa Principal----------
main:

	;inicializa as variáveis em zero	
	loadn r0, #0
	store Acertos1, r0
	store Acertos2, r0
	store Acertos3, r0
	store Acertos4, r0

	loadn r0, #512  ;carrega o código da cor verde
	store Cor, r0 	;salva na variável o código da cor

	Call ModoDaltonico
	Call DesenhaTelaInstrucao		;imprime a tela de instrucoes
	Call DesenhaTelaInicial	;imprime as mensagens inicais na tela
	Call InputModo		    ;recebe o modo de jogo e desencadeia a geração de um número pseudo aleatório

	;Switch(Letra)
	load r0, Modo 			;carrega para r0 o conteúdo da variável "Modo", onde está o que foi lido no teclado

	;Case('1')
	loadn r1, #'1'			;carrega para r1 o código ASCII do caracter '1'
	cmp r1, r0				;compara o conteúdo dos registradores
	ceq Termo				;chama a subrotina "Termo" caso "Letra" corresponda a '1'

	;Case('2')
	inc r1					;carrega para r1 o código ASCII do caracter '2'
	cmp r1, r0				;compara o conteúdo dos registradores
	ceq Dueto				;chama a subrotina "Dueto" caso "Letra" corresponda a '2'

	;Case('3')
	inc r1					;carrega para r1 o código ASCII do caracter '3'
	cmp r1, r0				;compara o conteúdo dos registradores
	ceq Quarteto			;chama a subrotina "Quarteto" caso "Letra" corresponda a '3'

	Call Tela_Final		;faz impressão da mensagem de vitória ou derrota do jogador

	loadn r1, #445  	;carrega a posição na qual deve se iniciar a impressão
	loadn r0, #Msgn11 	;carrega a mensagem a ser impressa
	Call ImprimePalavra ;imprime a mensagem

	Call InputLetra 	;lê a resposta do jogador (s/n)

	load r0, Letra 		;carrega para o registrador a letra digitada pelo usuário
	loadn r1, #'s' 		;salva em r1 o caractere 'S'
	cmp r0, r1			;verifica se o usuário digitou 's'
	jeq main 			;recomeça o jogo em caso afirmativo
	Call ApagaTela 		;caso o jogador digite 'n' apenas apaga a tela e apusa a execução

	halt

;------------Fim Programa Principal-----------


;-------------------------------------------
; 			Desenha Tela Inicial 			|
;--------------------------------------------
; Descrição: Desenha o menu inicial do jogo |
;-------------------------------------------											
DesenhaTelaInicial:

	push fr
	push r0
	push r1
	push r2

	Call ApagaTela ;garante que a tela estará apagada 

	loadn r0, #Msgn1 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #46 ; carrega a posição na qual deve se iniciar a impressão
	Call ImprimePalavra ;imprime Mensagem 1

	loadn r0, #Msgn2 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #175 ; carrega a posição na qual deve se iniciar a impressão
	Call ImprimePalavra ;imprime Mensagem 2

	loadn r0, #Msgn3 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #255 ; carrega a posição na qual deve se iniciar a impressão
	Call ImprimePalavra ;imprime Mensagem 3

	loadn r0, #Msgn4 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #335 ; carrega a posição na qual deve se iniciar a impressão
	Call ImprimePalavra ;imprime Mensagem 4
	
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;--------------------------------------------

;-------------------------------------------
; 			Desenha Tela de Instrucoes  	|
;--------------------------------------------
; Descrição: Desenha tela de como jogar     |
;-------------------------------------------											
DesenhaTelaInstrucao:

	push fr
	push r0
	push r1
	push r2

	Call ApagaTela ;garante que a tela estará apagada 

	loadn r0, #Msgn13 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #80 ; carrega a posição na qual deve se iniciar a impressão
	Call ImprimePalavra ;imprime Mensagem 13

	loadn r0, #Msgn14 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #202 ; carrega a posição na qual deve se iniciar a impressão
	Call ImprimePalavra ;imprime Mensagem 14

	loadn r0, #Msgn15 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #372 ; carrega a posição na qual deve se iniciar a impressão
	Call ImprimePalavra ;imprime Mensagem 15

	loadn r0, #Msgn16 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #482 ; carrega a posição na qual deve se iniciar a impressão
	Call ImprimePalavra ;imprime Mensagem 16
	
	loadn r0, #515
	load r1, Cor
	loadn r2, #'x'
	add r2, r2, r1
	Call ImprimeLetraTermo
	
	loadn r0, #Msgn17 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #522 ; carrega a posição na qual deve se iniciar a impressão
	Call ImprimePalavra ;imprime Mensagem 17
	
	loadn r0, #555
	loadn r2, #'x'
	loadn r1, #2816
	add r2, r2, r1
	Call ImprimeLetraTermo
	
	loadn r0, #Msgn18 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #562 ; carrega a posição na qual deve se iniciar a impressão
	Call ImprimePalavra ;imprime Mensagem 18
	
	loadn r0, #595
	loadn r2, #'x'
	Call ImprimeLetraTermo

	loadn r0, #Msgn19 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #644 ; carrega a posição na qual deve se iniciar a impressão
	Call ImprimePalavra ;imprime Mensagem 19
	
	loadn r0, #Msgn20 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #762 ; carrega a posição na qual deve se iniciar a impressão
	Call ImprimePalavra ;imprime Mensagem 4
		
	Call InputLetra
	
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;--------------------------------------------

;-----------------------------------------
; 			 Apaga Tela Inicial 		  |
;-----------------------------------------
; Descrição: Apaga o menu inicial do jogo |
;-----------------------------------------	
ApagaTela:
	

	push fr
	push r0
	push r1

	loadn r0, #' ' 
	loadn r1, #1199

	ApagaTela_Loop:

		outchar r0, r1
		dec r1
		jnz ApagaTela_Loop

	pop r1
	pop r0
	pop fr

	rts
;-----------------------------------------

;------------------------------------------
; 			   Imprime Palavra 		      |
;------------------------------------------
; Descrição: Imprime uma palavra desejada |
;------------------------------------------
ImprimePalavra:
	
	push fr
	push r0
	push r1
	push r2
	push r3

	loadn r2, #'\0' 	;carrega o caractere de fim da string para r2

	ImprimePalavra_Loop:

		loadi r3, r0	;carrega para r3 o caractere presente no endereço salvo em r0
		cmp r3, r2 		;verifica se chegou ao fim da palavra, ou seja, se o caractere analisado é o '\0'
		jeq ImprimePalavra_Fim ;se chegou ao fim da palavra dá pop nos registradores e sai da subrotina
		outchar r3, r1  ;imprime o caractere em r3 na posição r1
		inc r0          ;avança para a próxima letra
		inc r1			;avança para a próxima posição
		jmp ImprimePalavra_Loop ;executa mais uma vez o trecho de código se r3 != '\0'

	ImprimePalavra_Fim:

	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;------------------------------------------

;----------------------------------------------
; 				   Input Letra				   |
;----------------------------------------------
; Descrição: Lê um caractere válido do teclado |
;----------------------------------------------
InputLetra:	

	push fr	
	push r0
	push r1
	push r2

	loadn r1, #255	; Se nao digitar nada vem 255
	loadn r2, #0	; Logo que programa a FPGA o inchar vem 0

   InputLetra_Loop:
		inchar r0			; Le o teclado, se nada for digitado = 255
		cmp r0, r1			;compara r0 com 255
		jeq InputLetra_Loop	; Fica lendo ate' que digite uma tecla valida
		cmp r0, r2			;compara r0 com 0
		jeq InputLetra_Loop	; Le novamente pois Logo que programa a FPGA o inchar vem 0

	store Letra, r0			; Salva a tecla na variavel global "Letra"
	
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;----------------------------------------------

;---------------------------------------------------
; 				  	Input Palavra				    |
;---------------------------------------------------
; Descrição: Lê uma cadeia de caracteres do teclado |
;---------------------------------------------------
InputPalavra:

	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7

	mov r0, r1		   ;copia o que estava em r1 para r0
	loadn r1, #Palavra ;ponteiro para o vetor "Palavra"
	loadn r3, #5       ;todas as palavras válidas possuem 5 letras
	loadn r4, #32  	   ;código do espaço usado para apagar(backspace não tava dando certo = (  )
	loadn r5, #0 	   ;carrega zero para comparar com o iterador
	loadn r6, #5	   ;carrega cinco para comparar com o iterador
	loadn r7, #13 	   ;código do enter 

	InputPalavra_Loop:

		Call InputLetra 	;chamada da subrotina que lê uma letra
		load r2, Letra 		;carrega a letra lida no registrador
		cmp r2, r4			;verifica se o usuário deu espaço
		jeq InputPalavra_apagaLetra		;chamada caso o usuário digite uma barra de espaço
		jne InputPalavra_insereLetra 	;chamada caso contrário	

	InputPalavra_apagaLetra:

		cmp r3, r6				;verifica se é a primeira interação
		jeq InputPalavra_Loop	;se for, não faz nada
		dec r1					;volta o ponteiro uma posição para sobrescrever a letra a ser apagada
		inc r3					;aumenta uma iteração
		dec r0					;volta a posição de impressão 
		loadn r2, #'_'			;salva o caractere '_' em r2 para realizar a impressão
		Call ImprimeLetra 		;chama a função que faz a impressão apropriada da letra digitada
		cmp r3, r5				;verifica se o iterador já chegoua zero
		jne InputPalavra_Loop	;reexecuta o loop caso r2 não tenha chegado a zero
		jeq InputPalavra_LoopEnter ;pula para o loop que espera pelo enter

	InputPalavra_insereLetra:

		storei r1, r2			;salva a letra na posição correspondente da variável "Palavra"
		dec r3					;diminui uma iteração
		inc r1					;avança o ponteiro
		Call ImprimeLetra 		;chama a função que faz a impressão apropriada da letra digitada
		inc r0					;avança a posição de impressão
		cmp r3, r5				;verifica se o iterador já chegoua zero
		jne InputPalavra_Loop	;reexecuta o loop caso r2 não tenha chegado a zero
		jeq InputPalavra_LoopEnter ;pula para o loop que espera pelo enter

	InputPalavra_LoopEnter:

		Call InputLetra 	;chamada da subrotina que lê uma letra
		load r2, Letra 		;carrega a letra lida no registrador
		cmp r2, r4			;verifica se o usuário deu espaço
		jeq InputPalavra_apagaLetra		;chamada caso o usuário digite uma barra de espaço
		cmp r2, r7			;verifica se o usuário deu enter
		jne InputPalavra_LoopEnter		;chamada caso o usuário não digite enter

	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;---------------------------------------------------

;-----------------------------------------------
; 				  Imprime Letra				    | 
;-----------------------------------------------
; Descrição: imprime uma letra lida do teclado  |
;            de acordo com o modo de jogo 		|
;-----------------------------------------------
ImprimeLetra:
	
	push fr
	push r0
	push r1
	push r2
	push r3

	;Switch(Modo)
	load r1, Modo 		;carrega para r0 o conteúdo da variável "Modo"

	;Case('1')
	loadn r3, #'1'			;carrega para r3 o código ASCII do caracter '1'
	cmp r3, r1				;compara o conteúdo dos registradores
	ceq ImprimeLetraTermo	;chama a subrotina "ImprimeLetraTermo" caso "Modo" corresponda a '1'

	;Case('2')
	inc r3					;carrega para r3 o código ASCII do caracter '2'
	cmp r3, r1				;compara o conteúdo dos registradores
	ceq ImprimeLetraDueto	;chama a subrotina "ImprimeLetraDueto" caso "Modo" corresponda a '2'

	;Case('3')
	inc r3					;carrega para r3 o código ASCII do caracter '3'
	cmp r3, r1				;compara o conteúdo dos registradores
	ceq ImprimeLetraQuarteto;chama a subrotina "ImprimeLetraQuarteto" caso "Modo" corresponda a '3'

	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts
;-----------------------------------------------

;-----------------------------------------------
; 			   Imprime Letra Termo			    | 
;-----------------------------------------------
; Descrição: imprime uma letra lida do teclado  |
;            em uma única coluna 				|
;-----------------------------------------------
ImprimeLetraTermo:
	
	push fr
	push r0
	push r1
	push r2

	outchar r2, r0 ;imprime o caractere de r2 na posição de r0

	pop r2
	pop r1
	pop r0
	pop fr

	rts
;-----------------------------------------------

;-----------------------------------------------
; 			   Imprime Letra Dueto			    | 
;-----------------------------------------------
; Descrição: imprime uma letra lida do teclado  |
;            em duas colunas simultaneamente 	|
;-----------------------------------------------
ImprimeLetraDueto:
	
	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	
	loadn r1, #15 ;espaço entre as palavras impressas somado ao tamanho das mensagens

	load r3, Acertos1		;lê a quantidade de acertos da primeira palavra
	loadn r4, #5
	cmp r3, r4
	jeq ImprimeLetraDueto_Palavra2
	outchar r2, r0 ;imprime o caractere de r2 na posição de r0

	ImprimeLetraDueto_Palavra2:
	load r3, Acertos2		;lê a quantidade de acertos da primeira palavra
	loadn r4, #5
	cmp r3, r4
	jeq ImprimeLetraDueto_Fim
	add r0, r0, r1 ;seta a posição para imprimir a nova mensagem com 10 pixels de distancia da primeira
	outchar r2, r0 ;imprime o caractere de r2 na posição de r0

	ImprimeLetraDueto_Fim:

	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;-----------------------------------------------

;-----------------------------------------------------------------
; 			 	 		  Modo Daltônico	   					  |
;-----------------------------------------------------------------
; Descrição: Pergunta ao usuário se deseja ativar o modo daltônico|
;            que consiste em trocar a cor verde pela cor azul na  |
;			 hora de indicar as letras na posição correta		  |
;-----------------------------------------------------------------
ModoDaltonico:

	push fr
	push r0
	push r1
	push r2

	Call ApagaTela 		;caso o jogador digite 'n' apenas apaga a tela e apusa a execução
	loadn r1, #445  	;carrega a posição na qual deve se iniciar a impressão
	loadn r0, #Msgn12 	;carrega a mensagem a ser impressa
	Call ImprimePalavra ;imprime a mensagem

	Call InputLetra 	;lê a resposta do jogador (s/n)

	load r0, Letra 		;carrega para o registrador a letra digitada pelo usuário
	loadn r1, #'s' 		;salva em r1 o caractere 'S'
	cmp r0, r1			;verifica se o usuário digitou 's'
	jeq ModoDaltonico_Azul 
	jne ModoDaltonico_Fim

	ModoDaltonico_Azul:

		loadn r0, #3072 ;carrega o código da cor azul
		store Cor, r0 	;salva na variável o código da cor		

	ModoDaltonico_Fim:

	pop r2
	pop r1
	pop r0
	pop fr

	rts

;-----------------------------------------------
; 			  Imprime Letra Quarteto			| 
;-----------------------------------------------
; Descrição: imprime uma letra lida do teclado  |
;            em quatro colunas simultaneamente 	|
;-----------------------------------------------
ImprimeLetraQuarteto:
	
	push fr
	push r0
	push r1
	push r2
	push r3
	push r4

	loadn r1, #9 ;espaço entre as palavras impressas somado ao tamanho das mensagens

	load r3, Acertos1	;lê a quantidade de acertos da primeira palavra
	loadn r4, #5 		;carrega para o registrador o valor de referência	
	cmp r3, r4 			;verifica se o jogador já acertou a palavra, pois em caso afirmativo não imprime mais o caractere
	jeq ImprimeLetraQuarteto_Palavra2
	outchar r2, r0 		;imprime o caractere de r2 na posição de r0

	ImprimeLetraQuarteto_Palavra2:
	add r0, r0, r1 ;seta a posição para imprimir a nova mensagem com 4 pixels de distancia da anterior
	load r3, Acertos2	;lê a quantidade de acertos da primeira palavra
	loadn r4, #5 		;carrega para o registrador o valor de referência
	cmp r3, r4 			;verifica se o jogador já acertou a palavra, pois em caso afirmativo não imprime mais o caractere
	jeq ImprimeLetraQuarteto_Palavra3
	outchar r2, r0 		;imprime o caractere de r2 na posição de r0

	ImprimeLetraQuarteto_Palavra3:
	add r0, r0, r1 ;seta a posição para imprimir a nova mensagem com 4 pixels de distancia da anterior
	load r3, Acertos3	;lê a quantidade de acertos da primeira palavra
	loadn r4, #5 		;carrega para o registrador o valor de referência
	cmp r3, r4 			;verifica se o jogador já acertou a palavra, pois em caso afirmativo não imprime mais o caractere
	jeq ImprimeLetraQuarteto_Palavra4
	outchar r2, r0 		;imprime o caractere de r2 na posição de r0

	ImprimeLetraQuarteto_Palavra4:
	add r0, r0, r1 ;seta a posição para imprimir a nova mensagem com 4 pixels de distancia da anterior
	load r3, Acertos4	;lê a quantidade de acertos da primeira palavra
	loadn r4, #5 		;carrega para o registrador o valor de referência
	cmp r3, r4			;verifica se o jogador já acertou a palavra, pois em caso afirmativo não imprime mais o caractere
	jeq ImprimeLetraQuarteto_Fim
	outchar r2, r0 		;imprime o caractere de r2 na posição de r0

	ImprimeLetraQuarteto_Fim:

	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;-----------------------------------------------

;-----------------------------------------------
; 			 	 	  Termo 		  			|
;-----------------------------------------------
; Descrição: implementa de fato o modo "Termo"  |
;-----------------------------------------------
Termo:

	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7	

	Call DesenhaTelaTermo
	Call SortearPalavra

	loadn r1, #376 ;carrega a posição na qual deve se iniciar a impressão
	loadn r5, #5   ;o valor 5 será usado para comparação com os acertos
	loadn r6, #80  ;fator para pular duas linhas
	loadn r7, #6   ;numero de tentativas

	Termo_Loop:

		loadn r0, #0
		store Acertos1, r0	
		add r1, r1, r6	  		;pula duas linhas para escrever a próxima palavra
		Call InputPalavra 		;lê a palavra
		loadn r3, #Palavra		;carrega para r3 o endereço da palavra digitada para que ele sirva de ponteiro
		loadn r2, #PalavraCp	;salva em r0 o ponteiro para a variável Palavra, que guarda a palavra digitada
		call CopiaPalavra 		;copia a palavra digitada
		load r3, Palavra1		;ponteiro para a palavra a ser comparada
		loadn r2, #PalavraCmp	;carrega para r2 o endereço de "PalavraCmp" para que ele sirva de ponteiro 
		loadn r0, #Acertos1 	;carrega para r0 a  o endereço da variável que guarda os acertos concernentes à primeira palavra
		Call CopiaPalavra 		;chamada da subrotina que faz uma cópia da palavra cujo ponteiro está guardado em r2 para que possa ser alterada durante a comparação
		Call Compara 	   		;compara a palavra digitada com a sorteada e ajusta as cores
		loadn r0, #PalavraCp 	;armazena o ponteiro da palavra a ser impressa
		Call ImprimePalavra 	;imprime a palavra com as colorida
		dec r7;					;-1 tentativa
		load r0, Acertos1		;lê a quantidade de acertos
		cmp r0, r5				;verifica se o jogador acertou a palavra
		jeq Termo_Fim			;fim de jogo
		jnz Termo_Loop 			;continua no loop até se encerrarem as tentativas

	Termo_Fim:

		store Iterador, r7 	;salva na variável r7 a quantidade de tentativas restantes

	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;-----------------------------------------------

;---------------------------------------------------
; 			  		  Tela Final					| 
;---------------------------------------------------
; Descrição: Imprime a mensagem de vitória/derrota  |
;            e pergunta se ele deseja jogar de novo	|
;---------------------------------------------------
Tela_Final:

	push fr
	push r0
	push r1
	push r2

	Call ApagaTela

	loadn r0, #0   				;carrega zero para o r0 para comparar com o conteúdo da variável "Iterador"
	loadn r1, #215 ;carrega a posição na qual deve se iniciar a impressão
	load r2, Iterador 			;carrega para r2 o conteúdo da variável
	cmp r0, r2 	   				;verifica se as tentativas se esgotaram - indicativo de que o jogador perdeu
	jeq Tela_Final_Game_Over	;em caso afirmativo, seta  a mensagem "Game over"
	jne Tela_Final_You_Win 		;caso contrário, seta  amensagem "You Win"

	Tela_Final_Game_Over:

		loadn r0, #Msgn10 ;carrega a mensagem a ser impressa
		jmp Tela_Final_Fim

	Tela_Final_You_Win:

		loadn r0, #Msgn9 ;carrega a mensagem a ser impressa

	Tela_Final_Fim:

		Call ImprimePalavra ;impreme a mensagem

	pop r2
	pop r1
	pop r0
	pop fr

	rts
;---------------------------------------------------

;---------------------------------------------------
; 			 	 Desenha Tela Termo 		  		|
;---------------------------------------------------
; Descrição: Desenha a tela inicial do modo "Termo" |
;---------------------------------------------------
DesenhaTelaTermo:

	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	
	Call ApagaTela
	loadn r0, #Msgn5 ;carrega para r0 o endereço no qual começa a sexta mensagem ("TERMO")
	loadn r1, #54 ; carrega a posição na qual deve se iniciar a impressão
	Call ImprimePalavra ;imprime a mensagem 

	loadn r3, #80 ;fator para pular 2 linhas
	loadn r4, #6  ;número de tentativas
	loadn r1, #376 ; carrega a posição na qual deve se iniciar a impressão
	loadn r0, #Msgn8 ;carrega para r0 o endereço no qual começa a sexta mensagem ("____")
	
	DesenhaTelaTermo_Loop:

		add r1, r1, r3 ;seta a posição para imprimir a nova mensagem duas linhas abaixo
		Call ImprimePalavra ;imprime a mensagem 
		dec r4 ;decrementa r4 indicando que mais uma impressão foi realizada
		jnz DesenhaTelaTermo_Loop ;enquanto não forem impressas todas as tentativas ele continua executando o trecho de código
	

	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;---------------------------------------------------

;------------------------------------------------------------
; 			 	 			Compara		   					 |
;------------------------------------------------------------
; Descrição: compara a palavra digitada e a palavra sorteada |
;            alterando as cores de acordo com as regras      |
;------------------------------------------------------------
Compara:

	push fr
	push r0
	push r1
	push r2

	loadn r2, #PalavraCmp
	loadn r1, #PalavraCp	    ;carrega para r1 o endereço contido da variável Palavra para que ele sirva de ponteiro para a palavra digitada pelo usuário
	Call VerificaVerde 		;verifica quais letras estão na posição certa
	loadn r1, #PalavraCp	    ;carrega para r0 o endereço contido da variável Palavra para que ele sirva de ponteiro para a palavra digitada pelo usuário
	Call VerificaAmarelo 	;verifica quais as letras pertencem à palavra mas estão na posição errada

	pop r2
	pop r1
	pop r0
	pop fr

	rts
;------------------------------------------------------------

;------------------------------------------------------------
; 			 	 		Verifica Verde	   					 |
;------------------------------------------------------------
; Descrição: Verifica quais as letras estão na posição certa,|
;            altera sua cor e atualiza o número de acertos   |
;------------------------------------------------------------
VerificaVerde:

	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7

	loadn r4, #5  			;iterador
	loadn r5, #5  			;iterador
	loadi r7, r0  			;salva em r7 o número de acertos

	VerificaVerde_Loop:

		loadi r3, r1			;salva em r1 o conteúdo do endereço de memória para o qual r1 aponta
		loadi r6, r2			;salva em r2 o conteúdo do endereço de memória para o qual r0 aponta
		cmp r6, r3				;verifica se as letras são iguais
		ceq SetaCorLetra    	;altera a cor da letra
		inc r2					;avança o ponteiro de "Palavrax"
		inc r1					;avança o ponteiro de "Palavra"
		dec r5					;diminui uma iteração
		dec r4					;diminui uma iteração
		jnz VerificaVerde_Loop		;verifica se o loop chegou ao fim

	storei r0, r7	;salva na variével Acertosx a quantidade de acertos

	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;------------------------------------------------------------

;------------------------------------------------------------
; 			 	 	  Verifica Amarelo   					 |
;------------------------------------------------------------
; Descrição: Verifica quais as letras pertencem à palavra e  |
;            foram digitadas pelo jogador, alterando sua cor |
;------------------------------------------------------------
VerificaAmarelo:

	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7

	loadn r0, #0
	loadn r5, #5  			;iterador da palavra digitada

	VerificaAmarelo_Loop_Externo:
		
		loadn r4, #5  		;iterador da palavra sorteada
		loadi r3, r1		;salva em r1 o conteúdo do endereço de memória para o qual r1 aponta
		loadn r2, #PalavraCmp 	;carrega para r2 o endereço de "PalavraCmp" para que ele sirva de ponteiro para a primeira palavra

		VerificaAmarelo_Loop_Interno:

			loadi r6, r2		;salva em r6 o conteúdo do endereço de memória para o qual r2 aponta	
			cmp r6, r3			;verifica se as letras são iguais
			ceq SetaCorLetra 	;altera a cor da letra
			dec r4				;indica que uma iteração foi realizada
			inc r2				;avança o ponteiro
			cmp r4, r0			;verifica se o loop chegou ao fim
			jne VerificaAmarelo_Loop_Interno ;sai do loop quando toda a palavra for comparada

		dec r5					;indica que uma letra foi comparada com a palavra toda
		inc r1 					;avança o ponteiro
		cmp r5, r0			;verifica se o loop chegou ao fim
		jne VerificaAmarelo_Loop_Externo ;sai do loop quando todas as palavras tiverem sido verificadas
	
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;------------------------------------------------------------

;--------------------------------------------------
; 			 	 	Copia Palavra		  		   |
;--------------------------------------------------
; Descrição: Faz uma cópia auxiliar de uma palavra |
;--------------------------------------------------
CopiaPalavra:

	push fr
	push r0
	push r1
	push r2
	push r3

	loadn r0, #5  			;iterador da estrutura de repetição

	CopiaPalavra_Loop:

		loadi r1, r3			;carrega um char para r1
		storei r2, r1			;salva um char na memória
		inc r3					;avança o ponteiro
		inc r2					;avança o ponteiro
		dec r0					;decrementa o iterador
		jnz CopiaPalavra_Loop	;sai do loop após as 5 iterações

	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;--------------------------------------------------

;----------------------------------------------------
; 			 	 Seta Cor Letra Verde		  		 |
;----------------------------------------------------
; Descrição: Soma o código correspondente à cor verde|
;----------------------------------------------------
SetaCorLetra:

	push fr
	push r0
	push r1
	push r2
	push r3

	loadn r0, #'-'	;carrega o valor '-' para r2
	storei r2, r0	;coloca '-' no lugar da letra

	cmp r4, r5
	jne SetaCorLetra_Amarelo
	load r0, Cor 	;carrega a cor usada para indicar o acerto
	inc r7 			;incrementa o número de acertos	
	jmp SetaCorLetra_Fim

	SetaCorLetra_Amarelo:

		loadn r0, #2816 ;código da cor amarela

	SetaCorLetra_Fim:
	add r3, r3, r0	;muda a cor da letra para a cor desejada
	storei r1, r3	;salva as alterações

	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;----------------------------------------------------

;-----------------------------------------------
; 			 	 	  Dueto 		  			|
;-----------------------------------------------
; Descrição: implementa de fato o modo "Dueto"  |
;-----------------------------------------------
Dueto:
	
	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7	
	
	Call DesenhaTelaDueto
	Call SortearPalavra
	
	loadn r1, #359 ;carrega a posição na qual deve se iniciar a impressão
	loadn r6, #55  ;fator para pular uma linha
	loadn r5, #10  ;espaçamento das margens
	loadn r4, #15  ;espaço entre as palavras impressas somado ao tamanho das mensagens
	loadn r7, #7   ;numero de tentativas

	Dueto_Loop:
	
		add r1, r1, r5 			;posiciona o cursor para a impressão da primeira palavra
		Call InputPalavra 		;lê a palavra
		load r0, Acertos1		;lê a quantidade de acertos da primeira palavra
		loadn r5, #5 			;carrega o valor de referência para r0
		cmp r0, r5 				;verifica se o jogadaor já acertou a primeira palavra
		jeq Dueto_Loop_Palavra2 ;caso tenha acertado, não compara nem imprime a palavra mais
		loadn r0, #0 			;carrega zero para r0
		store Acertos1, r0	 	;zera a quantidade de acertos antes de iniciar uma nova comparação
		loadn r3, #Palavra		;carrega para r3 o endereço da palavra digitada para que ele sirva de ponteiro
		loadn r2, #PalavraCp	;carrega para r2 o endereço da da variável que receberá uma cópia da palavra digitada para que ele sirva de ponteiro
		call CopiaPalavra 		;copia a palavra digitada
		loadn r0, #Acertos1 	;carrega para r0 a  o endereço da variável que guarda os acertos concernentes à primeira palavra
		load r3, Palavra1		;ponteiro para a palavra a ser comparada
		loadn r2, #PalavraCmp	;carrega para r2 o endereço de "PalavraCmp" para que ele sirva de ponteiro 
		Call CopiaPalavra 		;chamada da subrotina que faz uma cópia da palavra cujo ponteiro está guardado em r2 para que possa ser alterada durante a comparação
		Call Compara 	   		;compara a palavra digitada com a sorteada e ajusta as cores
		loadn r0, #PalavraCp 	;salva em r0 o ponteiro para a variável Palavra, que guarda a palavra digitada
		Call ImprimePalavra 	;imprime a palavra com as letras coloridas

		Dueto_Loop_Palavra2:
		add r1, r1, r4 			;posiciona o cursor para imprimir a próxima palavra
		load r0, Acertos2		;lê a quantidade de acertos da primeira palavra
		loadn r5, #5 			;carrega o valor de referência para r0
		cmp r0, r5 				;verifica se o jogadaor já acertou a segunda palavra
		jeq Dueto_Loop_Fim 		;caso tenha acertado, não compara nem imprime a palavra mais
		loadn r0, #0 			;carrega zero para r0
		store Acertos2, r0		;zera a quantidade de acertos antes de iniciar uma nova comparação
		loadn r3, #Palavra		;carrega para r3 o endereço da palavra digitada para que ele sirva de ponteiro
		loadn r2, #PalavraCp	;carrega para r2 o endereço da da variável que receberá uma cópia da palavra digitada para que ele sirva de ponteiro
		call CopiaPalavra 		;copia a palavra digitada 
		loadn r0, #Acertos2 	;carrega para r0 o endereço da variável que guarda os acertos concernentes à segunda palavra
		load r3, Palavra2		;ponteiro para a palavra a ser comparada
		loadn r2, #PalavraCmp	;carrega para r2 o endereço de "PalavraCmp" para que ele sirva de ponteiro 
		Call CopiaPalavra 		;chamada da subrotina que faz uma cópia da palavra cujo ponteiro está guardado em r2 para que possa ser alterada durante a comparação
		Call Compara 	   		;compara a palavra digitada com a sorteada e ajusta as cores
		loadn r0, #PalavraCp 	;salva em r0 o ponteiro para a variável Palavra, que guarda a palavra digitada
		Call ImprimePalavra 	;imprime a palavra com as colorida

		Dueto_Loop_Fim:
		add r1, r1, r6	  ;seta a posição para imprimir a nova mensagem duas linhas abaixo
		load r0, Acertos1 ;lê a quantidade de acertos da primeira palavra
		load r5, Acertos2 ;lê a quantidade de acertos da segunda palavra		
		add r0, r0, r5	  ;soma a quantidade de acertos
		loadn r5, #10  	  ;se as dez letras estiverem no lugar certo, o jogo acaba
		cmp r0, r5		  ;verifica se o jogador acertou a palavra
		jeq Dueto_Fim	  ;fim de jogo
		dec r7 			  ;-1 tentativa
		jnz Dueto_Loop
	

	Dueto_Fim:

		store Iterador, r7 	;salva na variável r7 a quantidade de tentativas restantes

	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;-----------------------------------------------

;---------------------------------------------------
; 			 	 Desenha Tela Dueto 		  		|
;---------------------------------------------------
; Descrição: Desenha a tela inicial do modo "Dueto" |
;---------------------------------------------------
DesenhaTelaDueto:

	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	
	Call ApagaTela
	loadn r0, #Msgn6 ;carrega para r0 o endereço no qual começa a sexta mensagem ("DUETO")
	loadn r1, #54 ; carrega a posição na qual deve se iniciar a impressão
	Call ImprimePalavra ;imprime a mensagem 

	loadn r3, #10 ;espaçamento das margens
	loadn r4, #7  ;número de tentativas
	loadn r5, #15 ;espaço entre as palavras impressas somado ao tamanho das mensagens
	loadn r6, #40 ;fator para pular uma linha entre as impressões
	loadn r1, #359 ; carrega a posição na qual deve se iniciar a impressão
	loadn r0, #Msgn8 ;carrega para r0 o endereço no qual começa a sexta mensagem ("____")
	
	DesenhaTelaDueto_Loop:

		add r1, r1, r3 ;seta a posição para imprimir a nova mensagem com 10 pixels da margem esquerda	
		Call ImprimePalavra ;imprime a mensagem 
		add r1, r1, r5 ;seta a posição para imprimir a nova mensagem com 10 pixels de distancia da primeira
		Call ImprimePalavra ;imprime a mensagem 
		add r1, r1, r5 ;garante o espaçamento de 10 pixels da margem direita
		add r1, r1, r6 ;seta a posição para imprimir a nova mensagem duas linhas abaixo
		dec r4 ;decrementa r4 indicando que mais uma impressão foi realizada
		jnz DesenhaTelaDueto_Loop

	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;---------------------------------------------------

;--------------------------------------------------
; 			 	 	   Quarteto 		  		   |
;--------------------------------------------------
; Descrição: implementa de fato o modo "Quarteto"  |
;--------------------------------------------------
Quarteto:
	
	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	
	Call DesenhaTelaQuarteto
	Call SortearPalavra

	loadn r1, #359 ;carrega a posição na qual deve se iniciar a impressão
	loadn r6, #49  ;fator para pular duas linhas
	loadn r7, #9   ;numero de tentativas
	loadn r4, #9 	;espaço entre as palavras impressas
	
	Quarteto_Loop:

		loadn r5, #4 			;espaçamento das margens
		add r1, r1, r5 			;posiciona o cursor antes da impressão
		Call InputPalavra 		;lê a palavra
		load r0, Acertos1		;lê a quantidade de acertos da primeira palavra
		loadn r5, #5 			;carrega o valor de referência para r0
		cmp r0, r5 				;verifica se o jogadaor já acertou a segunda palavra
		jeq Quarteto_Loop_Palavra2 ;caso tenha acertado, não compara nem imprime a palavra mais
		loadn r0, #0 			;carrega zero para r0
		store Acertos1, r0		;zera a quantidade de acertos antes de iniciar uma nova comparação
		loadn r3, #Palavra		;carrega para r3 o endereço da palavra digitada para que ele sirva de ponteiro
		loadn r2, #PalavraCp	;carrega para r2 o endereço da da variável que receberá uma cópia da palavra digitada para que ele sirva de ponteiro
		call CopiaPalavra 		;copia a palavra digitada
		loadn r0, #Acertos1 	;carrega para r0 a  o endereço da variável que guarda os acertos concernentes à primeira palavra
		load r3, Palavra1		;ponteiro para a palavra a ser comparada
		loadn r2, #PalavraCmp	;carrega para r2 o endereço de "PalavraCmp" para que ele sirva de ponteiro 
		Call CopiaPalavra 		;chamada da subrotina que faz uma cópia da palavra cujo ponteiro está guardado em r2 para que possa ser alterada durante a comparação
		Call Compara 	   		;compara a palavra digitada com a sorteada e ajusta as cores
		loadn r0, #PalavraCp 	;salva em r0 o ponteiro para a variável Palavra, que guarda a palavra digitada
		Call ImprimePalavra 	;imprime a palavra com as letras coloridas

		Quarteto_Loop_Palavra2:
		add r1, r1, r4 			;posiciona o cursor antes da impressão
		load r0, Acertos2		;lê a quantidade de acertos da primeira palavra
		loadn r5, #5 			;carrega o valor de referência para r0
		cmp r0, r5 				;verifica se o jogador já acertou a segunda palavra
		jeq Quarteto_Loop_Palavra3 ;caso tenha acertado, não compara nem imprime a palavra mais
		loadn r0, #0 			;carrega zero para r0
		store Acertos2, r0		;zera a quantidade de acertos antes de iniciar uma nova comparação
		loadn r3, #Palavra		;carrega para r3 o endereço da palavra digitada para que ele sirva de ponteiro
		loadn r2, #PalavraCp	;carrega para r2 o endereço da da variável que receberá uma cópia da palavra digitada para que ele sirva de ponteiro
		call CopiaPalavra 		;copia a palavra digitada
		loadn r0, #Acertos2 	;carrega para r0 a  o endereço da variável que guarda os acertos concernentes à segunda palavra
		load r3, Palavra2		;ponteiro para a palavra a ser comparada
		loadn r2, #PalavraCmp	;carrega para r2 o endereço de "PalavraCmp" para que ele sirva de ponteiro 
		Call CopiaPalavra 		;chamada da subrotina que faz uma cópia da palavra cujo ponteiro está guardado em r2 para que possa ser alterada durante a comparação
		Call Compara 	   		;compara a palavra digitada com a sorteada e ajusta as cores
		loadn r0, #PalavraCp 	;salva em r0 o ponteiro para a variável Palavra, que guarda a palavra digitada
		Call ImprimePalavra 	;imprime a palavra com as letras coloridas

		Quarteto_Loop_Palavra3:
		add r1, r1, r4 			;posiciona o cursor antes da impressão
		load r0, Acertos3		;lê a quantidade de acertos da primeira palavra
		loadn r5, #5 			;carrega o valor de referência para r0
		cmp r0, r5 				;verifica se o jogador já acertou a segunda palavra
		jeq Quarteto_Loop_Palavra4 ;caso tenha acertado, não compara nem imprime a palavra mais
		loadn r0, #0 			;carrega zero para r0
		store Acertos3, r0		;zera a quantidade de acertos antes de iniciar uma nova comparação
		loadn r3, #Palavra		;carrega para r3 o endereço da palavra digitada para que ele sirva de ponteiro
		loadn r2, #PalavraCp	;carrega para r2 o endereço da da variável que receberá uma cópia da palavra digitada para que ele sirva de ponteiro
		loadn r0, #Acertos3 	;carrega para r0 a  o endereço da variável que guarda os acertos concernentes à segunda palavra
		call CopiaPalavra 		;copia a palavra digitada
		load r3, Palavra3		;ponteiro para a palavra a ser comparada
		loadn r2, #PalavraCmp	;carrega para r2 o endereço de "PalavraCmp" para que ele sirva de ponteiro 
		Call CopiaPalavra 		;chamada da subrotina que faz uma cópia da palavra cujo ponteiro está guardado em r2 para que possa ser alterada durante a comparação
		Call Compara 	   		;compara a palavra digitada com a sorteada e ajusta as cores
		loadn r0, #PalavraCp 	;salva em r0 o ponteiro para a variável Palavra, que guarda a palavra digitada
		Call ImprimePalavra 	;imprime a palavra com as letras coloridas

		Quarteto_Loop_Palavra4:
		add r1, r1, r4 			;posiciona o cursor antes da impressão
		load r0, Acertos4		;lê a quantidade de acertos da primeira palavra
		loadn r5, #5 			;carrega o valor de referência para r0
		cmp r0, r5 				;verifica se o jogador já acertou a segunda palavra
		jeq Quarteto_Loop_Fim 	;caso tenha acertado, não compara nem imprime a palavra mais
		loadn r0, #0 			;carrega zero para r0
		store Acertos4, r0	 	;zera a quantidade de acertos antes de iniciar uma nova comparação
		loadn r3, #Palavra		;carrega para r3 o endereço da palavra digitada para que ele sirva de ponteiro
		loadn r2, #PalavraCp	;carrega para r2 o endereço da da variável que receberá uma cópia da palavra digitada para que ele sirva de ponteiro
		loadn r0, #Acertos4 	;carrega para r0 a  o endereço da variável que guarda os acertos concernentes à segunda palavra
		call CopiaPalavra 		;copia a palavra digitada
		load r3, Palavra4		;ponteiro para a palavra a ser comparada
		loadn r2, #PalavraCmp	;carrega para r2 o endereço de "PalavraCmp" para que ele sirva de ponteiro 
		Call CopiaPalavra 		;chamada da subrotina que faz uma cópia da palavra cujo ponteiro está guardado em r2 para que possa ser alterada durante a comparação
		Call Compara 	   		;compara a palavra digitada com a sorteada e ajusta as cores
		loadn r0, #PalavraCp 	;salva em r0 o ponteiro para a variável Palavra, que guarda a palavra digitada
		Call ImprimePalavra 	;imprime a palavra com as letras coloridas

		Quarteto_Loop_Fim:
		add r1, r1, r6	  		;seta a posição para imprimir a nova mensagem duas linhas abaixo
		load r0, Acertos1		;lê a quantidade de acertos da primeira palavra
		load r5, Acertos2		;lê a quantidade de acertos da segunda palavra		
		add r0, r0, r5			;soma a quantidade de acertos
		load r5, Acertos3		;lê a quantidade de acertos da terceira palavra		
		add r0, r0, r5			;soma a quantidade de acertos
		load r5, Acertos4		;lê a quantidade de acertos da quarta palavra		
		add r0, r0, r5			;soma a quantidade de acertos
		loadn r5, #20  			;se as dez letras estiverem no lugar certo, o jogo acaba
		cmp r0, r5				;verifica se o jogador acertou a palavra
		jeq Quarteto_Fim		;fim de jogo 
		dec r7; 				;-1 tentativa
		jnz Quarteto_Loop

	Quarteto_Fim:

		store Iterador, r7 	;salva na variável r7 a quantidade de tentativas restantes

	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;--------------------------------------------------

;------------------------------------------------------
; 			 	  Desenha Tela Quarteto    	  		   |
;------------------------------------------------------
; Descrição: Desenha a tela inicial do modo "Quarteto" |
;------------------------------------------------------
DesenhaTelaQuarteto:

	
	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	
	Call ApagaTela
	loadn r0, #Msgn7 ;carrega para r0 o endereço no qual começa a sexta mensagem ("DUETO")
	loadn r1, #54 ; carrega a posição na qual deve se iniciar a impressão
	Call ImprimePalavra ;imprime a mensagem 

	loadn r3, #4 ;espaçamento das margens
	loadn r4, #9  ;número de tentativas e espaço entre as palavras impressas somado ao tamanho das mensagens
	loadn r5, #9 ;espaço entre as palavras impressas
	loadn r6, #40 ;fator para pular uma linha entre as impressões
	loadn r1, #359 ; carrega a posição na qual deve se iniciar a impressão
	loadn r0, #Msgn8 ;carrega para r0 o endereço no qual começa a sexta mensagem ("____")
	
	DesenhaTelaQuarteto_Loop:

		add r1, r1, r3 ;seta a posição para imprimir a nova mensagem com 4 pixels da margem esquerda	
		Call ImprimePalavra ;imprime a mensagem 
		add r1, r1, r5 ;seta a posição para imprimir a nova mensagem com 4 pixels de distancia da primeira
		Call ImprimePalavra ;imprime a mensagem 
		add r1, r1, r5 ;garante o espaçamento de 4 pixels da margem direita
		Call ImprimePalavra ;imprime a mensagem 
		add r1, r1, r5 ;seta a posição para imprimir a nova mensagem com 4 pixels de distancia da primeira
		Call ImprimePalavra ;imprime a mensagem 
		add r1, r1, r5 ;garante o espaçamento de 4 pixels da margem direita
		add r1, r1, r6 ;seta a posição para imprimir a nova mensagem duas linhas abaixo
		dec r4 ;decrementa r4 indicando que mais uma impressão foi realizada
		jnz DesenhaTelaQuarteto_Loop

	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;------------------------------------------------------

;-------------------------------------------------------
; 				   		Input Modo				   		|
;-------------------------------------------------------
; Descrição: Lê o modo e gera um número pseudoaleatório |
;-------------------------------------------------------
InputModo:	

	push fr	
	push r0
	push r1
	push r2
	push r3
	push r4

	loadn r1, #255	; Se nao digitar nada vem 255
	loadn r2, #0	; Logo que programa a FPGA o inchar vem 0
	loadn r3, #65535  	;valor máximo que pode ser salvo sem buffer overflow

   InputModo_Loop1:

   		cmp r4, r3			;evita buffer overflow
   		jeq InputModo_Loop2 ;pula para o loop que decrementa
   		inc r4				;altera continuamente o valor do registrador para gerar um valor aleatório
		inchar r0			;Le o teclado, se nada for digitado = 255
		cmp r0, r1			;compara r0 com 255
		jeq InputModo_Loop1	;Fica lendo ate' que digite uma tecla valida
		cmp r0, r2			;compara r0 com 0
		jeq InputModo_Loop1	;Le novamente pois Logo que programa a FPGA o inchar vem 0
		jne InputModo_FIm	;sai da subrotina

   InputModo_Loop2:

   		cmp r4, r2			;evita buffer overflow
   		jeq InputModo_Loop1 ;volta ao loop que incrementa
   		dec r4				;altera continuamente o valor do registrador para gerar um valor aleatório
		inchar r0			;Le o teclado, se nada for digitado = 255
		cmp r0, r1			;compara r0 com 255
		jeq InputModo_Loop2	;Fica lendo ate' que digite uma tecla valida
		cmp r0, r2			;compara r0 com 0
		jeq InputModo_Loop2	;Le novamente pois Logo que programa a FPGA o inchar vem 0
		jne InputModo_FIm	;sai da subrotina

	InputModo_FIm:

		store Modo, r0			;salva a tecla na variavel global "Modo"
		store NumAleat, r4		;salva o pseudo aleatório na variável

	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;----------------------------------------------

;-----------------------------------------------------
; 			 	  	Sortear Palavra   	          	  |
;-----------------------------------------------------
; Descrição: Sorteia uma ou mais palavra(s) de acordo |
;			 com o modo e o número aleátório 		  |
;-----------------------------------------------------
SortearPalavra:

	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6

	load r2, Modo 		;carrega para r2 o modo
	load r3, NumAleat 	;carrega o número aleatório para r3
	loadn r4, #60 	  	;carrega para r4 o número de palavras
	loadn r5, #Offset	;carrega o endereço da primeira palavra para r5

	mod r0, r3, r4	  	;armazena em r0 o resto da divisão do número aleatório pela quantidade de palavras
	loadn r1, #6  	  	;carrega para r1 o tamanho padrão das palavras + '\0'
	mul r0, r0, r1 		;calcula a posição onde se inicia a palavra e armazena o resultado em r0
	add r0, r0, r5	  	;soma o endereço da primeira palavra com o resultado do módulo do número do número aleatório multiplicado pelo tamanho das palavras para selecionar uma palavra
	store Palavra1, r0	;salva a posição inicial da palavra selecionada na variável "Palavra1"
	loadn r1, #'1'		;carrega o código ascii do caractere '1' para r1
	cmp r1, r2			;verifica se o modo de jogo é 1, nesse caso apenas uma palavra é necessária
	jeq SortearPalavra_FIm ;sai da subrotina em caso afirmativo

	load r1, Palavra1	;carrega o código ascii da primeira letra da palavra para r1
	mod r1, r1, r3		;guarda o resto da divisão do numero aleatório pelo valor de r1, que será usado para selecionar outra palavra
	mod r0, r1, r4	  	;armazena em r0 o resto da divisão do número aleatório pela quantidade de palavras
	loadn r1, #6  	  	;carrega para r1 o tamanho padrão das palavras + '\0'
	mul r0, r0, r1 		;calcula a posição onde se inicia a palavra e armazena o resultado em r0
	add r0, r0, r5	  	;soma o endereço da primeira palavra com o resultado do módulo do número do número aleatório multiplicado pelo tamanho das palavras para selecionar uma palavra
	store Palavra2, r0	;salva a posição inicial da palavra selecionada na variável "Palavra2"
	loadn r1, #'2'		;carrega o código ascii do caractere '2' para r1
	cmp r1, r2			;verifica se o modo de jogo é 1, nesse caso apenas uma palavra é necessária
	jeq SortearPalavra_FIm ;sai da subrotina em caso afirmativo

	load r1, Palavra2	;carrega o código ascii da primeira letra da palavra para r1
	mod r1, r1, r3		;guarda o resto da divisão do numero aleatório pelo valor de r1, que será usado para selecionar outra palavra
	mod r0, r1, r4	  	;armazena em r0 o resto da divisão do número aleatório pela quantidade de palavras
	loadn r1, #6  	  	;carrega para r1 o tamanho padrão das palavras + '\0'
	mul r0, r0, r1 		;calcula a posição onde se inicia a palavra e armazena o resultado em r0
	add r0, r0, r5	  	;soma o endereço da primeira palavra com o resultado do módulo do número do número aleatório multiplicado pelo tamanho das palavras para selecionar uma palavra
	store Palavra3, r0	;salva a posição inicial da palavra selecionada na variável "Palavra3"

	load r1, Palavra3	;carrega o código ascii da primeira letra da palavra para r1
	mod r1, r1, r3		;guarda o resto da divisão do numero aleatório pelo valor de r1, que será usado para selecionar outra palavra
	mod r0, r1, r4	  	;armazena em r0 o resto da divisão do número aleatório pela quantidade de palavras
	loadn r1, #6  	  	;carrega para r1 o tamanho padrão das palavras + '\0'
	mul r0, r0, r1 		;calcula a posição onde se inicia a palavra e armazena o resultado em r0
	add r0, r0, r5	  	;soma o endereço da primeira palavra com o resultado do módulo do número do número aleatório multiplicado pelo tamanho das palavras para selecionar uma palavra
	store Palavra4, r0	;salva a posição inicial da palavra selecionada na variável "Palavra4"

	SortearPalavra_FIm:

	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;-----------------------------------------------------
