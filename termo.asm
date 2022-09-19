;----Termo----

; <Estrutura do jogo>
;
;main:
;
; Seta parametros
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