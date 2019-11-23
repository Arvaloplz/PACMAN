@MOVERFANTASMA:
               MOV DX,[1234]
               MOV AH,$2
               INT $10       {PONGO CURSOR DONDE ESTA EL FANTASMA}
               MOV CX,[5678]
               CMP DX,CX
               JE @game_over
               JMP @VERARRIBAABAJO
@VERIZQUIERDADERECHA:
                     MOV CX,[5678]
                     MOV DX,[1234]
                     CMP DX,CX
                     JE @game_over              {SI CHOCAN GAME OVER}
                     CMP DL,CL                  {}
                     JA @FANTASMAIZQUIERDA
                     JB @FANTASMADERECHA
                     JE @VERARRIBAABAJO
@VERARRIBAABAJO:
                MOV CX,[5678]
                MOV DX,[1234]
                CMP DX,CX
                JE @game_over              {SI CHOCAN GAME OVER}
                CMP DH,CH                  {}
                JA @FANTASMAARRIBA
                JB @FANTASMAABAJO
                JE @VERIZQUIERDADERECHA
@FANTASMADERECHA:
                 INC DL
                 CALL @MOVER_CURSOR
                 CALL @LEER_PANTALLA
                 CMP AL,$B1
                 JE @VER_SI_SE_PUEDE_MOVER_AA_D
                 CMP AL,$BA
                 JE @VER_SI_SE_PUEDE_MOVER_AA_D
                 DEC DL
                 CALL @MOVER_CURSOR
                 MOV AH,$9
                 MOV AL,$0
                 MOV BL,$0
                 MOV CX,$1
                 INT $10
                 INC DL
                 MOV AH,$2
                 INT $10
                 MOV AH,$9
                 MOV AL,$2
                 MOV BL,$4
                 MOV CX,$1
                 INT $10
                 MOV [1234],DX
                 MOV CX,[5678]
                 MOV DX,[1234]
                 CMP DX,CX
                 JE @game_over
RET
@FANTASMAIZQUIERDA:
                   DEC DL
                   CALL @MOVER_CURSOR
                   CALL @LEER_PANTALLA
                   CMP AL,$B1
                   JE @VER_SI_SE_PUEDE_MOVER_AA_I
                   CMP AL,$BA
                   JE @VER_SI_SE_PUEDE_MOVER_AA_I
                   INC DL
                   CALL @MOVER_CURSOR
                   MOV AH,$9
                   MOV AL,$0
                   MOV BL,$0
                   MOV CX,$1
                   INT $10
                   DEC DL
                   MOV AH,$2
                   INT $10
                   MOV AH,$9
                   MOV AL,$2
                   MOV BL,$4
                   MOV CX,$1
                   INT $10
                   MOV [1234],DX
                   MOV CX,[5678]
                   MOV DX,[1234]
                   CMP DX,CX
                   JE @game_over
RET
@VER_SI_SE_PUEDE_MOVER_AA_D:
                            DEC DL
                            DEC DH
                            CALL @MOVER_CURSOR
                            CALL @LEER_PANTALLA
                            CMP AL,$B1
                            JNE @POSICIONAR_PARA_M_ARRIBA
                            CMP AL,$CD
                            JNE @POSICIONAR_PARA_M_ARRIBA
                            ADD DH,$2
                            CALL @MOVER_CURSOR
                            CALL @LEER_PANTALLA
                            CMP AL,$B1
                            JNE @POSICIONAR_PARA_M_ABAJO
                            CMP AL,$CD
                            JNE @POSICIONAR_PARA_M_ABAJO
@VER_SI_SE_PUEDE_MOVER_AA_I:
                            INC DL
                            DEC DH
                            CALL @MOVER_CURSOR
                            CALL @LEER_PANTALLA
                            CMP AL,$B1
                            JNE @POSICIONAR_PARA_M_ARRIBA
                            CMP AL,$CD
                            JNE @POSICIONAR_PARA_M_ARRIBA
                            ADD DH,$2
                            CALL @MOVER_CURSOR
                            CALL @LEER_PANTALLA
                            CMP AL,$B1
                            JNE @POSICIONAR_PARA_M_ABAJO
                            CMP AL,$CD
                            JNE @POSICIONAR_PARA_M_ABAJO
@POSICIONAR_PARA_M_ABAJO:
                         DEC DH
                         CALL @MOVER_CURSOR
                         JMP @FANTASMAABAJO
@POSICIONAR_PARA_M_ARRIBA:
                          INC DH
                          CALL @MOVER_CURSOR
                          JMP @FANTASMAARRIBA
@FANTASMAABAJO:
               INC DH
               CALL @MOVER_CURSOR
               CALL @LEER_PANTALLA
               CMP AL,$B1
               JE @VER_SI_SE_PUEDE_MOVER_ID_AB
               CMP AL,$BA
               JE @VER_SI_SE_PUEDE_MOVER_ID_AB
               DEC DH
               CALL @MOVER_CURSOR
               MOV AH,$9
               MOV AL,$0
               MOV BH,$0
               MOV CX,$1
               INT $10
               INC DH
               MOV AH,$2
               INT $10
               MOV AH,$9
               MOV AL,$2
               MOV BL,$4
               MOV CX,$1
               INT $10
               MOV [1234],DX
               MOV CX,[5678]
               MOV DX,[1234]
               CMP DX,CX
               JE @game_over
RET
@FANTASMAARRIBA:
                DEC DH
                CALL @MOVER_CURSOR
                CALL @LEER_PANTALLA
                CMP AL,$B1
                JE @VER_SI_SE_PUEDE_MOVER_ID_AR
                CMP AL,$BA
                JE @VER_SI_SE_PUEDE_MOVER_ID_AR
                INC DH
                CALL @MOVER_CURSOR
                MOV AH,$9
                MOV AL,$0
                MOV BH,$0
                MOV CX,$1
                INT $10
                DEC DH
                MOV AH,$2
                INT $10
                MOV AH,$9
                MOV AL,$2
                MOV BL,$4
                MOV CX,$1
                INT $10
                MOV [1234],DX
                MOV CX,[5678]
                MOV DX,[1234]
                CMP DX,CX
                JE @game_over
RET
@VER_SI_SE_PUEDE_MOVER_ID_AB:
                             DEC DL
                             DEC DH
                             CALL @MOVER_CURSOR
                             CALL @LEER_PANTALLA
                             CMP AL,$B1
                             JNE @POSICIONAR_PARA_M_IZQUIERDA
                             CMP AL,$BA
                             JNE @POSICIONAR_PARA_M_IZQUIERDA
                             ADD DL,$2
                             CALL @MOVER_CURSOR
                             CALL @LEER_PANTALLA
                             CMP AL,$B1
                             JNE @POSICIONAR_PARA_M_DERECHA
                             CMP AL,$BA
                             JNE @POSICIONAR_PARA_M_DERECHA
@VER_SI_SE_PUEDE_MOVER_ID_AR:
                             INC DH
                             DEC DL
                             CALL @MOVER_CURSOR
                             CALL @LEER_PANTALLA
                             CMP AL,$B1
                             JNE @POSICIONAR_PARA_M_IZQUIERDA
                             CMP AL,$BA
                             JNE @POSICIONAR_PARA_M_IZQUIERDA
                             ADD DL,$2
                             CALL @MOVER_CURSOR
                             CALL @LEER_PANTALLA
                             CMP AL,$B1
                             JNE @POSICIONAR_PARA_M_DERECHA
                             CMP AL,$BA
                             JNE @POSICIONAR_PARA_M_DERECHA
@POSICIONAR_PARA_M_IZQUIERDA:
                             INC DL
                             CALL @MOVER_CURSOR
                             JMP @FANTASMAIZQUIERDA
@POSICIONAR_PARA_M_DERECHA:
                           DEC DL
                           CALL @MOVER_CURSOR
                           JMP @FANTASMADERECHA


