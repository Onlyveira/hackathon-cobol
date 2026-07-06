      ******************************************************************
      * SIGLA.....: BHC – BOOTCAMP HACKATHON COBOL
      * PROGRAMA..: BHCP0009
      * ANALISTA..: JOSE HILARIO VERAS LEITE JUNIOR
      * AUTOR.....: LEANDRO DAVI OLIVEIRA DE SOUZA
      * DATA......: 30/06/2026
      * OBJETIVO..: CADASTRO DE FUNCIONARIOS
      * EXECUCAO..: COBOL - BATCH
      * ----------------------------------------------------------------
      * VRS DATA     RESPONSAVEL     DESCRICAO DA VERSAO
      * --- -------- --------------- ----------------------------------
      * 001 30.06.26 LEANDRO DAVI      IMPLANTACAO
      * ----------------------------------------------------------------
      ******************************************************************

      ******************************************************************
       IDENTIFICATION DIVISION.
      ******************************************************************

       PROGRAM-ID. BHCP0009.

      ******************************************************************
       ENVIRONMENT DIVISION.
      ******************************************************************

      *----------------------------------------
       CONFIGURATION                   SECTION.
      *----------------------------------------
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

      ******************************************************************
       DATA DIVISION.
      ******************************************************************

      *----------------------------------------
       WORKING-STORAGE                 SECTION.
      *----------------------------------------
       01 GDA-CADASTRO-FUNCIONARIO         PIC X(290).

       01 REDEFINES GDA-CADASTRO-FUNCIONARIO.

           03 GDA-INFO-FUNCIONARIO OCCURS 10 TIMES.
               05 GDA-CD-FUNCIONARIO       PIC 9(4).
               05 FILLER                   PIC X(1).
               05 GDA-NM-FUNCIONARIO       PIC A(8).
               05 FILLER                   PIC X(1).
               05 GDA-SLR-FUNCIONARIO      PIC 9(4)V99.
               05 FILLER                   PIC X(1).
               05 GDA-RESULTADO-SLR        PIC X(10).
               05 GDA-SLR-EXIBICAO          PIC ZZZZ,99.
      *----------------------------------------
       LOCAL-STORAGE                   SECTION.
      *----------------------------------------
              77 GDA-INDICE-CALCULO        PIC 99.
              77 GDA-SLR-INDICE            PIC 99.
              77 GDA-LINHA-NOVA            PIC X(50).
      ******************************************************************
       PROCEDURE DIVISION.
      ******************************************************************

           0000-INICIO.
                   PERFORM 1000-CALCULO-CD.
                   PERFORM 2000-CADASTRO.
                   PERFORM 3000-CALCULO-SLR.
                   PERFORM 4000-ALTERA-E-EXIBE.
           GOBACK.

           1000-CALCULO-CD SECTION. *> Usei para facilitar o calcúlo
                                    *> e não repetir várias vezes.
           MOVE 1001 TO GDA-CD-FUNCIONARIO(1).

           PERFORM VARYING GDA-INDICE-CALCULO FROM 2 BY 1
               UNTIL GDA-INDICE-CALCULO > 10

           COMPUTE GDA-CD-FUNCIONARIO(GDA-INDICE-CALCULO) =
            GDA-CD-FUNCIONARIO(GDA-INDICE-CALCULO - 1) + 1

           *> Utilizei o perform varying semelhante ao uso do for em
           *> outras linguagens, funcionou bem.

           END-PERFORM.
           EXIT.

           2000-CADASTRO SECTION.

               MOVE "JOAO" TO GDA-NM-FUNCIONARIO(1).
               MOVE 3200 TO GDA-SLR-FUNCIONARIO(1).

               MOVE "MARIA" TO GDA-NM-FUNCIONARIO(2).
               MOVE 5000 TO GDA-SLR-FUNCIONARIO(2).

               MOVE "CARLOS" TO GDA-NM-FUNCIONARIO(3).
               MOVE 8200 TO GDA-SLR-FUNCIONARIO(3).

               MOVE "ANA" TO GDA-NM-FUNCIONARIO(4).
               MOVE 4100 TO GDA-SLR-FUNCIONARIO(4).

               MOVE "PEDRO" TO GDA-NM-FUNCIONARIO(5).
               MOVE 5100 TO GDA-SLR-FUNCIONARIO(5).

               MOVE "LUCAS" TO GDA-NM-FUNCIONARIO(6).
               MOVE 2800 TO GDA-SLR-FUNCIONARIO(6).

               MOVE "FERNANDA" TO GDA-NM-FUNCIONARIO(7).
               MOVE 5000 TO GDA-SLR-FUNCIONARIO(7).

               MOVE "PAULO" TO GDA-NM-FUNCIONARIO(8).
               MOVE 9100 TO GDA-SLR-FUNCIONARIO(8).

               MOVE "MARTA" TO GDA-NM-FUNCIONARIO(9).
               MOVE 3900 TO GDA-SLR-FUNCIONARIO(9).

               MOVE "JULIANA" TO GDA-NM-FUNCIONARIO(10).
               MOVE 6000 TO GDA-SLR-FUNCIONARIO(10).

           EXIT.


           3000-CALCULO-SLR SECTION.
               PERFORM VARYING GDA-SLR-INDICE FROM 1 BY 1
                   UNTIL GDA-SLR-INDICE > 10

               IF GDA-SLR-FUNCIONARIO(GDA-SLR-INDICE) > 5000
                 MOVE "ALTO"
                   TO GDA-RESULTADO-SLR(GDA-SLR-INDICE)

                 ELSE
                     IF GDA-SLR-FUNCIONARIO(GDA-SLR-INDICE) = 5000
                 MOVE "LIMITE"
                   TO GDA-RESULTADO-SLR(GDA-SLR-INDICE)

                   ELSE
             MOVE "NORMAL" TO GDA-RESULTADO-SLR(GDA-SLR-INDICE)

                   END-IF
                   END-IF
               END-PERFORM.

           EXIT.

           4000-ALTERA-E-EXIBE SECTION.

              PERFORM VARYING GDA-SLR-INDICE FROM 1 BY 1
               UNTIL GDA-SLR-INDICE > 10

               MOVE GDA-SLR-FUNCIONARIO(GDA-SLR-INDICE)
               TO GDA-SLR-EXIBICAO(GDA-SLR-INDICE)

               MOVE " " TO GDA-LINHA-NOVA

               STRING
                GDA-CD-FUNCIONARIO(GDA-SLR-INDICE)
                    DELIMITED BY SIZE
                    " "
                    DELIMITED BY SIZE
                GDA-NM-FUNCIONARIO(GDA-SLR-INDICE)
                    DELIMITED BY SPACE
                    "     "
                    DELIMITED BY SIZE


                       INTO GDA-LINHA-NOVA

               MOVE GDA-RESULTADO-SLR(GDA-SLR-INDICE)
                   TO GDA-LINHA-NOVA(30:10)

                   MOVE GDA-SLR-EXIBICAO(GDA-SLR-INDICE)
                   TO GDA-LINHA-NOVA(20:10)


           DISPLAY GDA-LINHA-NOVA

           END-PERFORM.
           EXIT.
             *> Aqui eu tinha usado anteriormente sem string e tive um
             *>  bom resultado somente utilizando o display, segue abaixo:

                *> 4000-ALTERA-E-EXIBE SECTION.
                *> PERFORM VARYING GDA-SLR-INDICE FROM 1 BY 1
                *>   UNTIL GDA-SLR-INDICE > 10
                *>
                *> MOVE GDA-SLR-FUNCIONARIO(GDA-SLR-INDICE)
                *>   TO GDA-SLR-EXIBICAO

                *> DISPLAY GDA-CD-FUNCIONARIO(GDA-SLR-INDICE)
                *> " "
                *> GDA-NM-FUNCIONARIO(GDA-SLR-INDICE)
                *> " "
                *> GDA-SLR-EXIBICAO
                *> " "
                *>  GDA-RESULTADO-SLR(GDA-SLR-INDICE)

                *> END-PERFORM.
                *> EXIT.

            GOBACK.
      ******************************************************************
