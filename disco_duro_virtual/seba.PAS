program pacman;
begin
asm

@MAIN:
      CALL @SETVIDEO
      CALL @CURSORSUP
      CALL @BORDESUP
      CALL @CURSORINF
      CALL @BORDEINF
      CALL @BORDEIZQ
      CALL @BORDEDER
      CALL @ESQUINAS
      CALL @SETCURSORPRINT
      CALL @PRINT
      JMP @LEER


@SETVIDEO:
          MOV AH,$0
          MOV AL,$3
          INT $10
          RET

@APAGARCURSOR:
              PUSH AX
              PUSH CX
              MOV CH,$32
              MOV AH,$1
              INT $10
              POP AX
              POP CX
              RET

@CURSORSUP:
           MOV DH,$3
           MOV DL,$0
           MOV BH,$0
           MOV AH,$2
           INT $10
           RET

@BORDESUP:
          MOV AH,$A
          MOV CX,$50
          MOV BH,$0
          MOV AL,$CD
          INT $10
          RET

@CURSORINF:
           MOV DH,$18
           MOV DL,$0
           MOV BH,$0
           MOV AH,$2
           INT $10
           RET

@BORDEINF:
          MOV AH,$A
          MOV CX,$50
          MOV BH,$0
          MOV AL,$CD
          INT $10
          RET

@BORDEIZQ:
          MOV AH,$2
          MOV BH,$0
          MOV DH,$4
          MOV DL,$0
          INT $10
          MOV AH,$A
          MOV CX,$1
          MOV AL,$BA
          INT $10
          INC DH
          MOV AH,$2
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          RET

@BORDEDER:
          MOV AH,$2
          MOV BH,$0
          MOV DH,$4
          MOV DL,$4F
          INT $10
          MOV AH,$A
          MOV CX,$1
          MOV AL,$BA
          INT $10
          INC DH
          MOV AH,$2
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          RET

@ESQUINAS:
          MOV AH,$2
          MOV DH,$3
          MOV DL,$0
          INT $10
          MOV AH,$A
          MOV CX,$1
          MOV AL,$C9
          INT $10
          MOV AH,$2
          MOV DL,$4F
          INT $10
          MOV AH,$A
          MOV AL,$BB
          INT $10
          MOV AH,$2
          MOV DH,$18
          INT $10
          MOV AH,$A
          MOV AL,$BC
          INT $10
          MOV AH,$2
          MOV DL,$0
          INT $10
          MOV AH,$A
          MOV AL,$C8
          INT $10
          RET


@SETCURSORPRINT:
          MOV AH,$2
          MOV DH,$C
          MOV DL,$10
          MOV BX,$0
          INT $10   {SETEA CURSOR}
          RET

@PRINT:
       MOV BH,$0
       MOV AL,'R'
       MOV CX,$1
       MOV AH,$A
       INT $10
       MOV AH,$2
       INC DL
       INT $10
       MOV AH,$A
       MOV AL,'U'
       INT $10
       MOV AH,$2
       INC DL
       INT $10
       MOV AH,$A
       MOV AL,'T'
       INT $10
       MOV AH,$2
       INC DL
       INT $10
       MOV AH,$A
       MOV AL,':'
       INT $10
       MOV AH,$2
       INC DL
       INT $10
       RET

@LEER:
        MOV AH,$0
        INT $16
        CMP AH,$1
        JE @FIN
        CMP AH,$2
        JE @PRINT1
        JMP @PRINT

@PRINT1:
        MOV AH,$A
        MOV AL,'1'
        INT $10
        MOV AH,$2
        INC DL
        INT $10
        MOV AH,$0
        INT $16
        CMP AH,$1
        JE @FIN
        CMP AH,$0A
        JE @PRINT9
        JMP @PRINT

@PRINT9:
        MOV AH,$A
        MOV AL,'9'
        INT $10
        MOV AH,$2
        INC DL
        INT $10
        MOV AH,$0
        INT $16
        CMP AH,$1
        JE @FIN
        CMP AH,$6
        JE @PRINT51
        JMP @PRINT

@PRINT51:
          MOV AH,$A
          MOV AL,'5'
          INT $10
          MOV AH,$2
          INC DL
          INT $10
          MOV AH,$0
          INT $16
          CMP AH,$1
          JE @FIN
          CMP AH,$6
          JE @PRINT52
          JMP @PRINT

@PRINT52:
         MOV AH,$A
         MOV AL,'5'
         INT $10
         MOV AH,$2
         INC DL
         INT $10
         MOV AH,$0
         INT $16
         CMP AH,$1
         JE @FIN
         CMP AH,$B
         JE @PRINT0
         JMP @PRINT

@PRINT0:
         MOV AH,$A
         MOV AL,'0'
         INT $10
         MOV AH,$2
         INC DL
         INT $10
         MOV AH,$0
         INT $16
         CMP AH,$1
         JE @FIN
         CMP AH,$A
         JE @PRINT92
         JMP @PRINT

@PRINT92:
         MOV AH,$A
         MOV AL,'9'
         INT $10
         MOV AH,$2
         INC DL
         INT $10
         MOV AH,$0
         INT $16
         CMP AH,$1
         JE @FIN
         CMP AH,$7
         JE @PRINT6
         JMP @PRINT

@PRINT6:
         MOV AH,$A
         MOV AL,'6'
         INT $10
         MOV AH,$2
         INC DL
         INT $10
         MOV AH,$0
         INT $16
         CMP AH,$1
         JE @FIN
         CMP AH,$3
         JE @PRINT2
         JMP @PRINT

@PRINT2:
         MOV AH,$A
         MOV AL,'2'
         INT $10
         MOV AH,$2
         INC DL
         INT $10
         MOV AH,$0
         INT $16
         CMP AH,$1
         JE @FIN
         CMP AH,$25
         JE @PRINTK
         JMP @PRINT

@PRINTK:
         MOV AH,$A
         MOV AL,'K'
         INT $10
         JMP @PRINTFELICIDADES

@PRINTFELICIDADES:
                  MOV AH,$2
                  MOV DL,$10
                  MOV DH,$F
                  MOV BH,$0
                  INT $10
                  MOV AL,'P'
                  MOV CX,$1
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                  MOV AL,'R'
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                  MOV AL,'E'
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                   MOV AL,'S'
                  MOV CX,$1
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                  MOV AL,'I'
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                  MOV AL,'O'
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                   MOV AL,'N'
                  MOV CX,$1
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                  MOV AL,'E'
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                  MOV AL,' '
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                   MOV AL,'C'
                  MOV CX,$1
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                  MOV AL,'U'
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                  MOV AL,'A'
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                   MOV AL,'L'
                  MOV CX,$1
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                  MOV AL,'Q'
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                  MOV AL,'U'
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                   MOV AL,'I'
                  MOV CX,$1
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                  MOV AL,'E'
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                  MOV AL,'R'
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                  MOV AL,' '
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                   MOV AL,'T'
                  MOV CX,$1
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                  MOV AL,'E'
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                  MOV AL,'C'
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                   MOV AL,'L'
                  MOV AH,$A
                  INT $10
                  MOV AH,$2
                  INC DL
                  INT $10
                  MOV AL,'A'
                  MOV AH,$A
                  INT $10
                  MOV AH,$0
                  INT $16
                  JMP @MAPA1

@MAPA1:
                  CALL @SETVIDEO
                  CALL @CURSORSUP
                  CALL @BORDESUP
                  CALL @CURSORINF
                  CALL @BORDEINF
                  CALL @BORDEIZQ
                  CALL @BORDEDER
                  CALL @ESQUINAS
                  CALL @PUNTOS
                  CALL @PUNTOSESP
                  CALL @BLOQUE1
                  CALL @BLOQUE2
                  CALL @BLOQUE3
                  CALL @BLOQUE4
                  CALL @BLOQUE5
                  CALL @BLOQUE6
                  CALL @BLOQUE7
                  CALL @BLOQUE8
                  CALL @BLOQUE9
                  CALL @BLOQUE10
                  CALL @BLOQUE11
                  CALL @BLOQUE12
                  CALL @BLOQUE13
                  CALL @BLOQUE14
                  CALL @BLOQUE15
                  CALL @APAGARCURSOR
                  CALL @PRINTSCORE
                  CALL @PRINTFANTASMA
                  CALL @PRINTJUGADOR
                  JMP @CONTROLES

@PUNTOS:
        MOV DH,$4
        MOV DL,$1
        MOV BH,$0
        MOV AH,$2
        INT $10
        MOV AH,$A
        MOV AL,$07
        MOV CX,$4E
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        MOV AH,$2
        INC DH
        INT $10
        MOV AH,$A
        INT $10
        RET

@PUNTOSESP:
           MOV AH,$2
           MOV DH,$4
           MOV DL,$1
           INT $10
           MOV AH,$9
           MOV AL,$A
           MOV BL,$E
           MOV CX,$1
           INT $10
           MOV DL,$4E
           MOV AH,$2
           INT $10
           MOV AH,$9
           INT $10
           MOV DH,$17
           MOV AH,$2
           INT $10
           MOV AH,$9
           INT $10
           MOV DL,$1
           MOV AH,$2
           INT $10
           MOV AH,$9
           INT $10
           RET

@BLOQUE1:
         MOV DH,$5
         MOV DL,$2
         MOV BH,$0
         MOV AH,$2
         INT $10
         MOV AH,$A
         MOV CX,$16
         MOV AL,$DB
         INT $10
         MOV AH,$2
         MOV DH,$6
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         MOV DH,$7
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         MOV DH,$8
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         MOV DH,$9
         INT $10
         MOV AH,$A
         INT $10
         RET

@BLOQUE2:
         MOV AH,$2
         MOV DH,$B
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         MOV DH,$C
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         MOV DH,$D
         INT $10
         MOV AH,$A
         INT $10
         RET

@BLOQUE3:
         MOV DL,$1
         MOV DH,$F
         MOV AH,$2
         INT $10
         MOV AH,$A
         MOV CX,$B
         INT $10
         MOV AH,$2
         MOV DH,$10
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
         RET

@BLOQUE4:
         MOV DL,$D
         MOV DH,$F
         MOV AH,$2
         INT $10
         MOV AH,$A
         MOV CX,$B
         INT $10
         MOV AH,$2
         MOV DH,$10
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
         RET

@BLOQUE5:
         MOV DH,$14
         MOV DL,$2
         MOV BH,$0
         MOV AH,$2
         INT $10
         MOV AH,$A
         MOV CX,$16
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
         RET

@BLOQUE6:
          MOV DH,$5
         MOV DL,$38
         MOV BH,$0
         MOV AH,$2
         INT $10
         MOV AH,$A
         MOV CX,$16
         MOV AL,$DB
         INT $10
         MOV AH,$2
         MOV DH,$6
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         MOV DH,$7
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         MOV DH,$8
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         MOV DH,$9
         INT $10
         MOV AH,$A
         INT $10
          RET

@BLOQUE7:
          MOV AH,$2
         MOV DH,$B
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         MOV DH,$C
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         MOV DH,$D
         INT $10
         MOV AH,$A
         INT $10
         RET

@BLOQUE8:
         MOV DL,$38
         MOV DH,$F
         MOV AH,$2
         INT $10
         MOV AH,$A
         MOV CX,$B
         INT $10
         MOV AH,$2
         MOV DH,$10
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
         RET

@BLOQUE9:
         MOV DL,$44
         MOV DH,$F
         MOV AH,$2
         INT $10
         MOV AH,$A
         MOV CX,$B
         INT $10
         MOV AH,$2
         MOV DH,$10
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
         RET

@BLOQUE10:
         MOV DH,$14
         MOV DL,$38
         MOV BH,$0
         MOV AH,$2
         INT $10
         MOV AH,$A
         MOV CX,$16
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
          RET

@BLOQUE11:
         MOV AH,$2
         MOV DH,$5
         MOV DL,$19
         INT $10
         MOV AH,$A
         MOV CX,$1E
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
         INT $10
         MOV AH,$2
         INC DH
         INC DH
         MOV DL,$26
         INT $10
         MOV AH,$A
         MOV CX,$4
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
         MOV AH,$2
         INC DH
         INT $10
         MOV AH,$A
         INT $10
          RET

@BLOQUE12:
          MOV DH,$8
          MOV DL,$19
          MOV AH,$2
          INT $10
          MOV AH,$A
          MOV CX,$C
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          RET

@BLOQUE13:
          MOV DH,$8
          MOV DL,$2B
          MOV AH,$2
          INT $10
          MOV AH,$A
          MOV CX,$C
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
           MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          RET

@BLOQUE14:
          MOV DH,$F
          MOV DL,$19
          MOV AH,$2
          INT $10
          MOV AH,$A
          MOV CX,$1E
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          INC DH
          MOV AH,$2
          INT $10
          MOV AH,$A
          MOV CX,$1E
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          RET

@BLOQUE15:
          INC DH
          INC DH
          MOV AH,$2
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          MOV AH,$2
          INC DH
          INT $10
          MOV AH,$A
          INT $10
          RET

@PRINTSCORE:
            MOV DH,$1
            MOV DL,$2F
            MOV AH,$2
            INT $10
            MOV AH,$A
            MOV CX,$1
            MOV AL,'S'
            INT $10
            MOV AH,$2
            INC DL
            INT $10
            MOV AH,$A
            MOV AL,'C'
            INT $10
            MOV AH,$2
            INC DL
            INT $10
            MOV AH,$A
            MOV AL,'O'
            INT $10
            MOV AH,$2
            INC DL
            INT $10
            MOV AH,$A
            MOV AL,'R'
            INT $10
            MOV AH,$2
            INC DL
            INT $10
            MOV AH,$A
            MOV AL,'E'
            INT $10
            MOV AH,$2
            INC DL
            INT $10
            MOV AH,$A
            MOV AL,':'
            INT $10
            MOV AH,$2
            INC DL
            INT $10
            MOV AH,$A
            MOV AL,'0'
            INT $10
            MOV AH,$2
            INC DL
            INT $10
            MOV AH,$A
            MOV AL,'0'
            INT $10
            MOV AH,$2
            INC DL
            INT $10
            MOV AH,$A
            MOV AL,'0'
            INT $10
            MOV AH,$2
            INC DL
            INT $10
            MOV AH,$A
            MOV AL,'0'
            INT $10

            RET

@PRINTJUGADOR:
         MOV DH,$E
         MOV DL,$28
         MOV AH,$2
         INT $10
         MOV AH,$9
         MOV BL,$E
         MOV AL,$10
         MOV CX,$1
         INT $10
         RET






@CONTROLES:
           MOV AH,$0
           INT $16

           CMP AH,$4B
           JE @IZQUIERDA
           CMP AH,$48
           JE @ARRIBA
           CMP AH,$50
           JE @ABAJO
           CMP AH,$4D
           JE @DERECHA
           CMP AH,$1
           JE @FIN
           JMP @CONTROLES

@FPS:
     PUSH AX
     PUSH CX
     PUSH DX

     MOV AH,$86
     MOV DX,$5FFF
     MOV CX,$1
     INT $15

     POP DX
     POP CX
     POP AX

     RET

@DERECHA:
        MOV AH,$1
        INT $16
        JNZ @CONTROLES

        MOV AH,$9
        MOV AL,$10
        MOV BL,$E
        INT $10

        INC DL
        MOV AH,$2
        INT $10
        MOV AH,$8
        INT $10

        DEC DL
        MOV AH,$2
        INT $10

        CMP AL,$DB
        JE @CONTROLES
        CMP AL,$BA
        JE @CONTROLES

        MOV [5678],DX
        CALL @PUNTAJE
        CALL @MOVERFANTASMA
        MOV DX,[5678]
        MOV AH,$2
        INT $10
        CALL @FPS

        MOV AH,$A
        MOV AL,$0
        MOV CX,$1
        INT $10

        INC DL
        MOV AH,$2
        INT $10
        MOV AH,$9
        MOV AL,$10
        MOV BL,$E
        INT $10
        JMP @DERECHA

@IZQUIERDA:
        MOV AH,$1
        INT $16
        JNZ @CONTROLES

        MOV AH,$9
        MOV AL,$11
        MOV BL,$E
        INT $10

        DEC DL
        MOV AH,$2
        INT $10
        MOV AH,$8
        INT $10

        INC DL
        MOV AH,$2
        INT $10

        CMP AL,$DB
        JE @CONTROLES
        CMP AL,$BA
        JE @CONTROLES

        MOV [5678],DX
        CALL @PUNTAJE
        CALL @MOVERFANTASMA
        MOV DX,[5678]
        MOV AH,$2
        INT $10
        CALL @FPS

        MOV AH,$A
        MOV AL,$0
        MOV CX,$1
        INT $10

        DEC DL
        MOV AH,$2
        INT $10
        MOV AH,$9
        MOV AL,$11
        MOV BL,$E
        INT $10
        JMP @IZQUIERDA

@ABAJO:
        MOV AH,$1
        INT $16
        JNZ @CONTROLES

        MOV AH,$9
        MOV AL,$1F
        MOV BL,$E
        INT $10

        INC DH
        MOV AH,$2
        INT $10
        MOV AH,$8
        INT $10

        DEC DH
        MOV AH,$2
        INT $10

        CMP AL,$DB
        JE @CONTROLES
        CMP AL,$CD
        JE @CONTROLES
        CMP AL,$07

        MOV [5678],DX
        CALL @PUNTAJE
        CALL @MOVERFANTASMA
        MOV DX,[5678]
        MOV AH,$2
        INT $10
        CALL @FPS

        MOV AH,$A
        MOV AL,$0
        MOV CX,$1
        INT $10

        INC DH
        MOV AH,$2
        INT $10
        MOV AH,$9
        MOV AL,$1F
        MOV BL,$E
        INT $10
        JMP @ABAJO

@ARRIBA:
        MOV AH,$1
        INT $16
        JNZ @CONTROLES

        MOV AH,$9
        MOV AL,$1E
        MOV BL,$E
        INT $10

        DEC DH
        MOV AH,$2
        INT $10
        MOV AH,$8
        INT $10

        INC DH
        MOV AH,$2
        INT $10

        CMP AL,$DB
        JE @CONTROLES
        CMP AL,$CD
        JE @CONTROLES

        MOV [5678],DX
        CALL @PUNTAJE
        CALL @MOVERFANTASMA
        MOV DX,[5678]
        MOV AH,$2
        INT $10
        CALL @FPS

        MOV AH,$A
        MOV AL,$0
        MOV CX,$1
        INT $10

        DEC DH
        MOV AH,$2
        INT $10
        MOV AH,$9
        MOV AL,$1E
        MOV BL,$E
        INT $10
        JMP @ARRIBA

PRINTFANTASMA

@PUNTAJE:

         MOV AH,$2
         MOV DH,$1
         MOV DL,$37
         INT $10

         CMP AL,$7
         JE @SUBIRNORMAL
         CMP AL,$A
         JE @SUBIRESP

         RET



@NUEVE:
       MOV AH,$A
       MOV AL,$30
       INT $10
       DEC DL
       MOV AH,$2
       INT $10
       MOV AH,$8
       INT $10
       CMP AL,$39
       JE @NUEVE
       INC AL
       MOV AH,$A
       INT $10
       RET


@SUBIRESP:
           DEC DL
           MOV AH,$2
           INT $10
           MOV AH,$8
           INT $10
           CMP AL,$35
           JE @SUBIRESPCINCO
           CMP AL,$36
           JE @SUBIRESPSEIS
           CMP AL,$37
           JE @SUBIRESPSIETE
           CMP AL,$38
           JE @SUBIRESPOCHO
           CMP AL,$39
           JE @SUBIRESPNUEVE
           ADD AL,$5
           MOV AH,$A
           INT $10
           RET

@SUBIRESPCINCO:
               MOV AH,$A
               MOV AL,$30
               INT $10
               DEC DL
               MOV AH,$2
               INT $10
               MOV AH,$8
               INT $10
               CMP AL,$39
               JE @NUEVE
               INC AL
               MOV AH,$A
               INT $10
               RET

@SUBIRESPSEIS:
               MOV AH,$A
               MOV AL,$31
               INT $10
               DEC DL
               MOV AH,$2
               INT $10
               MOV AH,$8
               INT $10
               CMP AL,$39
               JE @NUEVE
               INC AL
               MOV AH,$A
               INT $10
               RET

@SUBIRESPSIETE:
               MOV AH,$A
               MOV AL,$32
               INT $10
               DEC DL
               MOV AH,$2
               INT $10
               MOV AH,$8
               INT $10
               CMP AL,$39
               JE @NUEVE
               INC AL
               MOV AH,$A
               INT $10
               RET

@SUBIRESPOCHO:
               MOV AH,$A
               MOV AL,$33
               INT $10
               DEC DL
               MOV AH,$2
               INT $10
               MOV AH,$8
               INT $10
               CMP AL,$39
               JE @NUEVE
               INC AL
               MOV AH,$A
               INT $10
               RET

@SUBIRESPNUEVE:
               MOV AH,$A
               MOV AL,$34
               INT $10
               DEC DL
               MOV AH,$2
               INT $10
               MOV AH,$8
               INT $10
               CMP AL,$39
               JE @NUEVE
               INC AL
               MOV AH,$A
               INT $10
               RET


@FIN:
     NOP
     NOP
     NOP
     END;
     END.


