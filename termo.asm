;----Termo----

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
; Call ApagaTelaInicial
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
; Call ApagaTelaInicial
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
; Call ApagaTelaInicial
; ImprimePalavra("QUARTETO")
; Call ImprimePalavra("_____")(x4)(x9)
;
;/DesenhaTelaQuarteto
;================================================
;ApagaTelaInicial:
;
; [coloca caracteres em branco sobre o que foi escrito na tela inicial]
;
;/ApagaTelaInicial
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
;[OBSERVAÇÃO: Ao acrescentar palavras, mudar o valor de r4 na subrotina "SortearPalavra"]

;---------Declaração das variáveis globais---------
Letra: var #1
Modo: var #1
Palavra: var #5
NumAleat: var #1
Palavra1: var #1
Palavra2: var #1
Palavra3: var #1
Palavra4: var #1
PalavraCmp: var #5

;---------Mensagens usadas no program seguidas de ses respectivos comprimentos---------
Msgn1: string "Escolha um modo para jogar"
Msgn1_len: var #1
Msgn2: string "1 - Termo"
Msgn2_len: var #1
Msgn3: string "2 - Dueto"
Msgn3_len: var #1
Msgn4: string "3 - Quarteto"
Msgn4_len: var #1
Msgn5: string "                          "
Msgn5_len: var #1
Msgn6: string "T E R M O"
Msgn6_len: var #1
Msgn7: string "D U E T O"
Msgn7_len: var #1
Msgn8: string "Q U A R T E T O"
Msgn8_len: var #1
Msgn9: string "_____"
Msgn9_len: var #1
;----------Inicio Programa Principal----------
main:
	
	loadn r0, #26 			;carrega o tamanho das mensagens 1 e 5 (26 chars) para r0
	store Msgn1_len, r0 	;salva o conteúdo de r0 na variável 
	store Msgn5_len, r0 	;salva o conteúdo de r0 na variável 
	loadn r0, #9 			;carrega o tamanho das mensagens 2, 3, 6 e 7 (9 chars) para r0
	store Msgn2_len, r0		;salva o conteúdo de r0 na variável
	store Msgn3_len, r0		;salva o conteúdo de r0 na variável
	store Msgn6_len, r0		;salva o conteúdo de r0 na variável
	store Msgn7_len, r0		;salva o conteúdo de r0 na variável
	loadn r0, #5 			;carrega o tamanho da mensagem 9 (5 chars) para r0
	store Msgn9_len, r0		;salva o conteúdo de r0 na variável
	loadn r0, #12 			;carrega o tamanho da mensagem 4 (12 chars) para r0
	store Msgn4_len, r0		;salva o conteúdo de r0 na variável
	loadn r0, #15 			;carrega o tamanho da mensagem 8 (15 chars) para r0
	store Msgn8_len, r0		;salva o conteúdo de r0 na variável

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

	loadn r0, #Msgn1 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #46 ; carrega a posição na qual deve se iniciar a impressão
	load r2, Msgn1_len ; carrega para r1 o tamanho da primeira mensagem
	Call ImprimePalavra ;imprime Mensagem 1

	loadn r0, #Msgn2 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #175 ; carrega a posição na qual deve se iniciar a impressão
	load r2, Msgn2_len ; carrega para r1 o tamanho da primeira mensagem
	Call ImprimePalavra ;imprime Mensagem 2

	loadn r0, #Msgn3 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #255 ; carrega a posição na qual deve se iniciar a impressão
	load r2, Msgn3_len ; carrega para r1 o tamanho da primeira mensagem
	Call ImprimePalavra ;imprime Mensagem 3

	loadn r0, #Msgn4 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #335 ; carrega a posição na qual deve se iniciar a impressão
	load r2, Msgn4_len ; carrega para r1 o tamanho da primeira mensagem
	Call ImprimePalavra ;imprime Mensagem 4
	
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
ApagaTelaInicial:
	

	push fr
	push r0
	push r1
	push r2

	loadn r0, #Msgn5 ;carrega para r0 o endereço da mensagem "     " que será usada para sobrescrever e apagar as mensagens escritas
	load r2, Msgn5_len ; carrega para r1 o tamanho da mensagem
	loadn r1, #46 ; carrega a posição onde se inica a primeira mensagen a ser apagada
	Call ImprimePalavra ;apaga Mensagem 1
	loadn r1, #175 ; carrega a posição onde se inica a segunda mensagen a ser apagada
	Call ImprimePalavra ;apaga Mensagem 2
	loadn r1, #255 ; carrega a posição onde se inica a terceira mensagen a ser apagada
	Call ImprimePalavra ;apaga Mensagem 3
	loadn r1, #335 ; carrega a posição onde se inica a quarta mensagen a ser apagada
	Call ImprimePalavra ;apaga Mensagem 4
	
	pop r2
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

	ImprimePalavra_Loop:

		loadi r3, r0	;carrega para r3 o caractere presente no endereço salvo em r0
		outchar r3, r1  ;imprime o caractere em r3 na posição r1
		inc r0          ;avança para a próxima letra
		inc r1			;avança para a próxima posição
		dec r2			;decrementa r2 indicando que mais um caractere foi impresso na tela
		jnz ImprimePalavra_Loop ;executa mais uma vez o trecho de código se r2 != 0

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
		jeq InputPalavra_apagaLetra		;chamada caso o usuário digite um backspace
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
		jeq InputPalavra_apagaLetra		;chamada caso o usuário digite um backspace
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
	ceq ImprimeLetraDueto				;chama a subrotina "ImprimeLetraDueto" caso "Modo" corresponda a '2'

	;Case('3')
	inc r3					;carrega para r3 o código ASCII do caracter '3'
	cmp r3, r1				;compara o conteúdo dos registradores
	ceq ImprimeLetraQuarteto			;chama a subrotina "ImprimeLetraQuarteto" caso "Modo" corresponda a '3'

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
	
	loadn r1, #15 ;espaço entre as palavras impressas somado ao tamanho das mensagens

	outchar r2, r0 ;imprime o caractere de r2 na posição de r0
	add r0, r0, r1 ;seta a posição para imprimir a nova mensagem com 10 pixels de distancia da primeira
	outchar r2, r0 ;imprime o caractere de r2 na posição de r0

	pop r2
	pop r1
	pop r0
	pop fr

	rts
;-----------------------------------------------

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

	loadn r1, #9 ;espaço entre as palavras impressas somado ao tamanho das mensagens

	outchar r2, r0 ;imprime o caractere de r2 na posição de r0
	add r0, r0, r1 ;seta a posição para imprimir a nova mensagem com 10 pixels de distancia da primeira
	outchar r2, r0 ;imprime o caractere de r2 na posição de r0
	add r0, r0, r1 ;seta a posição para imprimir a nova mensagem com 10 pixels de distancia da primeira
	outchar r2, r0 ;imprime o caractere de r2 na posição de r0
	add r0, r0, r1 ;seta a posição para imprimir a nova mensagem com 10 pixels de distancia da primeira
	outchar r2, r0 ;imprime o caractere de r2 na posição de r0

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

	loadn r0, #Palavra
	loadn r1, #376 ;carrega a posição na qual deve se iniciar a impressão
	loadn r2, #5   ;tamanho da palavra
	loadn r6, #80  ;fator para pular duas linhas
	loadn r7, #6   ;numero de tentativas

	Termo_Loop:
	
		add r1, r1, r6	  ;pula duas linhas para escrever a próxima palavra
		Call InputPalavra ;lê a palavra
		Call Compara
		Call ImprimePalavra
		dec r7;
		jnz Termo_Loop

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
	
	Call ApagaTelaInicial
	loadn r0, #Msgn6 ;carrega para r0 o endereço no qual começa a sexta mensagem ("TERMO")
	loadn r1, #54 ; carrega a posição na qual deve se iniciar a impressão
	load r2, Msgn6_len ; carrega para r1 o tamanho da sexta mensagem ("TERMO")
	Call ImprimePalavra ;imprime a mensagem 

	loadn r3, #80 ;fator para pular 2 linhas
	loadn r4, #6  ;número de tentativas
	loadn r1, #376 ; carrega a posição na qual deve se iniciar a impressão
	loadn r0, #Msgn9 ;carrega para r0 o endereço no qual começa a sexta mensagem ("____")
	load r2, Msgn9_len ; carrega para r1 o tamanho da sexta mensagem ("_____")
	
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

Compara:

	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6

	loadn r5, #5  			;iterador
	loadn r6, #0  			;condição de saída dos loops
	loadn r0, #PalavraCmp 	;carrega para r0 o endereço de "PalavraCmp" para que ele sirva de ponteiro 
	load r1, Palavra1		;ponteiro para a palavra a ser copiada
	Call CopiaPalavra
	loadn r1, #Palavra	    ;carrega para r0 o endereço contido da variável Palavra para que ele sirva de ponteiro para a palavra digitada pelo usuário
	
	Compara_Loop1:

		loadi r3, r1			;salva em r1 o conteúdo do endereço de memória para o qual r1 aponta
		loadi r2, r0			;salva em r2 o conteúdo do endereço de memória para o qual r0 aponta
		cmp r2, r3				;verifica se as letras são iguais
		ceq SetaCorLetraVerde	;altera a cor da letra
		inc r0					;avança o ponteiro de "Palavra1"
		inc r1					;avança o ponteiro de "Palavra"
		dec r5					;diminui uma iteração
		cmp r5, r6				;verifica se chegou ao fim da comparação
		jne Compara_Loop1		;verifica se o loop chegou ao fim


	loadn r5, #5  			;iterador da palavra digitada
	loadn r1, #Palavra	    ;carrega para r0 o endereço contido da variável Palavra para que ele sirva de ponteiro para a palavra digitada pelo usuário
	

	Compara_Loop2_Externo:
		
		loadn r4, #5  		;iterador da palavra sorteada
		loadi r3, r1		;salva em r1 o conteúdo do endereço de memória para o qual r1 aponta
		loadn r0, #PalavraCmp 	;carrega para r0 o endereço contido em "Palavra1" para que ele sirva de ponteiro para a primeira palavra

		Compara_Loop2_Interno:

			loadi r2, r0		;salva em r2 o conteúdo do endereço de memória para o qual r0 aponta	
			cmp r2, r3			;verifica se as letras são iguais
			ceq SetaCorLetraAmarelo	;altera a cor da letra
			dec r4				;indica que uma iteração foi realizada
			inc r0				;avança o ponteiro
			cmp r4, r6			;verifica se o loop chegou ao fim
			jne Compara_Loop2_Interno ;sai do loop quando toda a palavra for comparada

		dec r5					;indica que uma letra foi comparada com a palavra toda
		inc r1 					;avança o ponteiro
		cmp r5, r6			;verifica se o loop chegou ao fim
		jne Compara_Loop2_Externo ;sai do loop quando todas as palavras tiverem sido verificadas

	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts


CopiaPalavra:

	push fr
	push r0
	push r1
	push r2
	push r3

	loadn r2, #5  			;iterador da estrutura de repetição

	CopiaPalavra_Loop:

		loadi r3, r1			;carrega rum char para r3
		storei r0, r3			;salva um char na memória
		inc r1					;avança o ponteiro
		inc r0					;avança o ponteiro
		dec r2					;decrementa o iterador
		jnz CopiaPalavra_Loop	;sai do loop após as 5 iterações

	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;----------------------------------------------------
; 			 	 	Seta Cor Letra 		  			 |
;----------------------------------------------------
; Descrição: Soma o código correspondente à desejada |
;----------------------------------------------------
SetaCorLetraVerde:

	push fr
	push r0
	push r1
	push r2
	push r3

	loadn r2, #'-'	;carrega o valor '-' para r2
	storei r0, r2	;coloca '-' no lugar da letra
	loadn r2, #512 	;código da cor verde
	add r3, r3, r2	;muda a cor da letra para a cor desejada
	storei r1, r3	;salva as alterações

	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;----------------------------------------------------

;----------------------------------------------------
; 			 	 	Seta Cor Letra 		  			 |
;----------------------------------------------------
; Descrição: Soma o código correspondente à desejada |
;----------------------------------------------------
SetaCorLetraAmarelo:

	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5

	cmp r4, r5
	jeq SetaCorLetraAmarelo_Ignora

	loadn r2, #'-' 	;carrega o valor '-' para r2
	storei r0, r2	;coloca '-' no lugar da letra
	loadn r2, #2816 ;código da cor amarela
	add r3, r3, r2	;muda a cor da letra para a cor desejada
	storei r1, r3	;salva as alterações

	SetaCorLetraAmarelo_Ignora:

	pop r5
	pop r4
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
	
	Call DesenhaTelaDueto
	Call SortearPalavra

	loadn r0, #369 ;carrega a posição na qual deve se iniciar a impressão
	loadn r1, #80  ;fator para pular duas linhas
	loadn r2, #7   ;numero de tentativas

	Dueto_Loop:
	
		Call InputPalavra ;lê a palavra
		add r0, r0, r1	  ;seta a posição para imprimir a nova mensagem duas linhas abaixo
		;Call Compara;falta implementar
		dec r2;
		jnz Dueto_Loop

	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	breakp
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
	
	Call ApagaTelaInicial
	loadn r0, #Msgn7 ;carrega para r0 o endereço no qual começa a sexta mensagem ("DUETO")
	loadn r1, #54 ; carrega a posição na qual deve se iniciar a impressão
	load r2, Msgn7_len ; carrega para r1 o tamanho da sexta mensagem ("DUETO")
	Call ImprimePalavra ;imprime a mensagem 

	loadn r3, #10 ;espaçamento das margens
	loadn r4, #7  ;número de tentativas
	loadn r5, #15 ;espaço entre as palavras impressas somado ao tamanho das mensagens
	loadn r6, #40 ;fator para pular uma linha entre as impressões
	loadn r1, #359 ; carrega a posição na qual deve se iniciar a impressão
	loadn r0, #Msgn9 ;carrega para r0 o endereço no qual começa a sexta mensagem ("____")
	load r2, Msgn9_len ; carrega para r1 o tamanho da sexta mensagem ("_____")
	
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
	
	Call DesenhaTelaQuarteto
	Call SortearPalavra

	loadn r0, #363 ;carrega a posição na qual deve se iniciar a impressão
	loadn r1, #80  ;fator para pular duas linhas
	loadn r2, #9   ;numero de tentativas

	Dueto_Loop:
	
		Call InputPalavra ;lê a palavra
		add r0, r0, r1	  ;seta a posição para imprimir a nova mensagem duas linhas abaixo
		;Call Compara;falta implementar
		dec r2;
		jnz Dueto_Loop

	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	breakp
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
	
	Call ApagaTelaInicial
	loadn r0, #Msgn8 ;carrega para r0 o endereço no qual começa a sexta mensagem ("DUETO")
	loadn r1, #54 ; carrega a posição na qual deve se iniciar a impressão
	load r2, Msgn8_len ; carrega para r1 o tamanho da sexta mensagem ("DUETO")
	Call ImprimePalavra ;imprime a mensagem 

	loadn r3, #4 ;espaçamento das margens
	loadn r4, #9  ;número de tentativas e espaço entre as palavras impressas somado ao tamanho das mensagens
	loadn r5, #9 ;espaço entre as palavras impressas
	loadn r6, #40 ;fator para pular uma linha entre as impressões
	loadn r1, #359 ; carrega a posição na qual deve se iniciar a impressão
	loadn r0, #Msgn9 ;carrega para r0 o endereço no qual começa a sexta mensagem ("____")
	load r2, Msgn9_len ; carrega para r1 o tamanho da sexta mensagem ("_____")
	
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
		inchar r0			; Le o teclado, se nada for digitado = 255
		cmp r0, r1			;compara r0 com 255
		jeq InputModo_Loop1	; Fica lendo ate' que digite uma tecla valida
		cmp r0, r2			;compara r0 com 0
		jeq InputModo_Loop1	; Le novamente pois Logo que programa a FPGA o inchar vem 0
		jne InputModo_FIm	;sai da subrotina

   InputModo_Loop2:

   		cmp r4, r2			;evita buffer overflow
   		jeq InputModo_Loop1 ;volta ao loop que incrementa
   		dec r4				;altera continuamente o valor do registrador para gerar um valor aleatório
		inchar r0			; Le o teclado, se nada for digitado = 255
		cmp r0, r1			;compara r0 com 255
		jeq InputModo_Loop2	; Fica lendo ate' que digite uma tecla valida
		cmp r0, r2			;compara r0 com 0
		jeq InputModo_Loop2	; Le novamente pois Logo que programa a FPGA o inchar vem 0
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
	loadn r4, #10 	  	;carrega para r4 o número de palavras
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
	loadn r1, #'2'		;carrega o código ascii do caractere '1' para r1
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