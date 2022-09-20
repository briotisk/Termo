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
;   Call InputPalavra
;   Call Compara
;   Call ImprimeTentativaTermo
; /Loop
;
;/Termo
;================================================
;DesenhaTelaTermo:
;
; Call ApagaTelaInicial
; [Escreve a palavra "Termo" no topo da tela com 'e' em amarelo e 'o' em verde]
; Call DesenhaTracos
;
;/DesenhaTelaTermo
;================================================
;ApagaTelaInicial:
;
; [coloca caracteres em branco sobre o que foi escrito na tela inicial]
;
;/ApagaTelaInicial
;================================================
;DesenhaTracos:
;
; Loop:
;
;   outchar('_', pos)
;   pos++
;
; /Loop
;
;/DesenhaTracos
;================================================
;Dueto:
;
; Call SortearPalavra(x2)
; Call DesenhaTelaDueto
; Loop(x7):
;   Call InputPalavra
;   Call Compara(x2)
;   Call ImprimeTentativaDueto
; /Loop
;
;/Dueto
;================================================
;DesenhaTelaDueto:
;
; Call ApagaTelaInicial
; [Escreve a palavra "Dueto" no topo da tela com 'u' em amarelo e 'o' em verde]
; Call DesenhaTracos(x2)
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
;   Call ImprimeTentativaQuarteto
; /Loop
;
;/Quarteto
;================================================
;DesenhaTelaQuarteto:
;
; Call ApagaTelaInicial
; [Escreve a palavra "Quarteto" no topo da tela com 'u' em amarelo e 'e' em verde]
; Call DesenhaTracos(x4)
;
;/DesenhaTelaQuarteto
;================================================
;InputPalavra:
;
; Loop(x5):
;   Call InputLetra
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