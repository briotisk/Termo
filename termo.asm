;----Termo----

; <Estrutura do jogo>
;
;main:
;
; Seta parametros
; Call DesenhaTelaInicial
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
; [Escreve a palavra "Termo" no topo da tela com 'e' em amarelo e 'o' em verde]
; Call ImprimePalavra("_____")
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
; [Escreve a palavra "Dueto" no topo da tela com 'u' em amarelo e 'o' em verde]
; Call ImprimePalavra("_____")(x2)
;
;/DesenhaTelaDueto
;================================================
;Quarteto:
;
; Call SortearPalavra(x4)
; Call DesenhaTelaQuarteto
; Loop(x9):
;   Call InputPalavra
;   Call Compara(x4)
;   Call ImprimePalavra(x4)
; /Loop
;
;/Quarteto
;================================================
;DesenhaTelaQuarteto:
;
; Call ApagaTelaInicial
; [Escreve a palavra "Quarteto" no topo da tela com 'u' em amarelo e 'e' em verde]
; Call ImprimePalavra("_____")(x4)
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

Msgn1: string "Escolha um modo para jogar"
Msgn1_len: var #1
Msgn2: string "1 - Termo"
Msgn2_len: var #1
Msgn3: string "2 - Dueto"
Msgn3_len: var #1
Msgn4: string "3 - Quarteto"
Msgn4_len: var #1

;----------Inicio Programa Principal----------
main:
	
	loadn r0, #26 			;carrega o tamanho da mensagem 1 (26 chars) para r0
	store Msgn1_len, r0 	;salva o conteúdo de r0 na variável 
	loadn r0, #9 			;carrega o tamanho das mensagens 2 e 3 (9 chars) para r0
	store Msgn2_len, r0		;salva o conteúdo de r0 na variável
	store Msgn3_len, r0		;salva o conteúdo de r0 na variável
	loadn r0, #12 			;carrega o tamanho da mensagem 4 (12 chars) para r0
	store Msgn4_len, r0		;salva o conteúdo de r0 na variável

	Call DesenhaTelaInicial

	halt

;------------Fim Programa Principal-----------


;-------------------------------------------
; 			Desenha Tela Inicial 			|
;--------------------------------------------
; Descrição: Desenha o menu inicial do jogo |
;-------------------------------------------
											
DesenhaTelaInicial:

	;DAR PUSH NOS REGISTRADORES
	push fr
	push r0
	push r1
	push r2

	loadn r0, #Msgn1 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #6 ; carrega a posição na qual deve se iniciar a impressão
	load r2, Msgn1_len ; carrega para r1 o tamanho da primeira mensagem
	Call ImprimePalavra ;imprime Mensagem 1

	loadn r0, #Msgn2 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #135 ; carrega a posição na qual deve se iniciar a impressão
	load r2, Msgn2_len ; carrega para r1 o tamanho da primeira mensagem
	Call ImprimePalavra ;imprime Mensagem 2

	loadn r0, #Msgn3 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #215 ; carrega a posição na qual deve se iniciar a impressão
	load r2, Msgn3_len ; carrega para r1 o tamanho da primeira mensagem
	Call ImprimePalavra ;imprime Mensagem 3

	loadn r0, #Msgn4 ;carrega para r0 o endereço no qual começa a primeira mensagem
	loadn r1, #295 ; carrega a posição na qual deve se iniciar a impressão
	load r2, Msgn4_len ; carrega para r1 o tamanho da primeira mensagem
	Call ImprimePalavra ;imprime Mensagem 4
	
	breakp

	;DAR POP NOS REGISTRADORES
	pop r2
	pop r1
	pop r0
	pop fr

	rts
;--------------------------------------------

ImprimePalavra:
	
	push fr
	push r0
	push r1
	push r2
	push r3
	push r4

	loadn r3, #0 ;criterio de parada

	Loop_ImprimePalavra:

		loadi r4, r0
		outchar r4, r1
		inc r0
		inc r1
		dec r2
		cmp r2, r3
		jnz Loop_ImprimePalavra


	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr

	rts

