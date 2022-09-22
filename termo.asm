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


;---------Declaração das variáveis globais---------
Letra: var #1
Modo: var #1
Palavra: var #5

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

	Call DesenhaTelaInicial
	Call InputLetra

	;Switch(Letra)
	load r0, Letra 		;carrega para r0 o conteúdo da variável "Letra"

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
	
   InputLetra_Loop2:	
		inchar r0			; Le o teclado, se nada for digitado = 255
		cmp r0, r1			;compara r0 com 255
		jne InputLetra_Loop2	; Fica lendo ate' que digite uma tecla valida
	
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;----------------------------------------------

InputPalavra:

	push fr
	push r0
	push r1
	push r2
	push r3
	push r4

	loadn r0, #Palavra ;ponteiro para o vetor "Palavra"
	loadn r2, #5       ;todas as palavras válidas possuem 5 letras
	loadn r3, #32  	   ;código do espaço usado para apagar(backspace não tava dando certo = (  )
	loadn r4, #0

	InputPalavra_Loop:

		Call InputLetra 	;chamada da subrotina que lê uma letra
		load r1, Letra 		;carrega a letra lida no registrador
		cmp r1, r3			;verifica se o usuário deu um backspace
		jeq InputPalavra_apagaLetra		;chamada caso o usuário digite um backspace
		jne InputPalavra_insereLetra 	;chamada caso contrário	

	InputPalavra_apagaLetra:
		dec r0					;volta o ponteiro uma posição para sobrescrever a letra a ser apagada
		inc r2					;aumenta uma iteração
		cmp r2, r4
		jne InputPalavra_Loop	;reexecuta o loop caso r2 não tenha chegado a zero

	InputPalavra_insereLetra:
		storei r0, r1			;salva a letra na posição correspondente da variável "Palavra"
		dec r2					;diminui uma iteração
		inc r0					;avança o ponteiro
		cmp r2, r4
		jne InputPalavra_Loop	;reexecuta o loop caso r2 não tenha chegado a zero


	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts
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
	
	Call DesenhaTelaTermo
	Call InputPalavra

	loadn r1, #376 ;carrega a posição na qual deve se iniciar a impressão
	loadn r0, #Palavra ;carrega para r0 o endereço no qual começa o vetor "Palavra"
	loadn r2, #5 ;carrega para r2 o tamanho da palavra
	Call ImprimePalavra ;imprime a mensagem 

	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	breakp;implementar
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

	;Call sorteiaPalavra
	
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

;-----------------------------------------------
; 			 	 	  Dueto 		  			|
;-----------------------------------------------
; Descrição: implementa de fato o modo "Dueto"  |
;-----------------------------------------------
Dueto:
	
	Call DesenhaTelaDueto
	breakp;implementar
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
	
	Call DesenhaTelaQuarteto
	breakp;implementar
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