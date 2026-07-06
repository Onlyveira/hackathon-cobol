      ******************************************************************
      * SIGLA.....: BHC – BOOTCAMP HACKATHON COBOL
      * PROGRAMA..: BHCP0010
      * ANALISTA..: JOSE HILARIO VERAS LEITE JUNIOR
      * AUTOR.....: LEANDRO DAVI OLIVEIRA DE SOUZA
      * DATA......: 30/06/2026
      * OBJETIVO..: Cadastro de Produtos
      * EXECUCAO..: COBOL - BATCH
      * ----------------------------------------------------------------
      * VRS DATA     RESPONSAVEL     DESCRICAO DA VERSAO
      * --- -------- --------------- ----------------------------------
      * 001 30.06.26 SEU NOME        IMPLANTACAO
      * ----------------------------------------------------------------
      ******************************************************************

      ******************************************************************
       IDENTIFICATION DIVISION.
      ******************************************************************

       PROGRAM-ID. BHCP0010.

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
       01 GDA-QNT-ESTOQUE PIC 9(38) VALUES ZEROS.

       01 GDA-ESTQ-RELATORIO.
           05 GDA-CADASTRO-ESTOQUE OCCURS 1 TO 100 TIMES
           DEPENDING ON GDA-QNT-ESTOQUE.
               10 GDA-CD-PRODUTO       PIC 9(3).
               10 GDA-NM-PRODUTO       PIC X(10).
               10 GDA-VLR-PRODUTO      PIC 9(4).
               10 FILLER               PIC X(30).
               10 GDA-VLR-RESULTADO    PIC X(10).
      *----------------------------------------
       LOCAL-STORAGE                   SECTION.
      *----------------------------------------

       77 GDA-INDICE-CLC               PIC 99.
       77 GDA-LINHA-NOVA               PIC X(50).

      ******************************************************************
       PROCEDURE DIVISION.
      ******************************************************************

           0000-INIT.
              PERFORM 1000-CALCULO-IND.
              PERFORM 2000-CADASTRO-PRODUTOS.
              PERFORM 3000-CALCULO-REGRA.
              PERFORM 4000-EXIBICAO.
           GOBACK.


           1000-CALCULO-IND SECTION.
              MOVE 10 TO GDA-QNT-ESTOQUE. *> CADASTRO INDICE
              MOVE 101 TO GDA-CD-PRODUTO(1). *> DA O VALOR DE 101 AO ARRAY

                PERFORM VARYING GDA-QNT-ESTOQUE FROM 2 BY 1 *> INICIA
                   UNTIL GDA-QNT-ESTOQUE > 10 *> AO FICAR MAIOR QUE 10 ELE PARA

           COMPUTE GDA-CD-PRODUTO(GDA-QNT-ESTOQUE) =
            GDA-CD-PRODUTO(GDA-QNT-ESTOQUE - 1) + 1 *> CD = ESTOQUE - 1 + 1. VALIDA 11

                END-PERFORM.
            EXIT.

           2000-CADASTRO-PRODUTOS SECTION.

               MOVE "MOUSE" TO GDA-NM-PRODUTO(1) *> 1 NOME
               MOVE 80 TO GDA-VLR-PRODUTO(1) *> 1 VALOR

               MOVE "MONITOR" TO GDA-NM-PRODUTO(2)
               MOVE 900 TO GDA-VLR-PRODUTO(2)

               MOVE "TECLADO" TO GDA-NM-PRODUTO(3)
               MOVE 150 TO GDA-VLR-PRODUTO(3)

               MOVE "NOTEBOOK" TO GDA-NM-PRODUTO(4)
               MOVE 4200 TO GDA-VLR-PRODUTO(4)

               MOVE "HEADSET" TO GDA-NM-PRODUTO(5)
               MOVE 280 TO GDA-VLR-PRODUTO(5)

               MOVE "WEBCAM" TO GDA-NM-PRODUTO(6)
               MOVE 320 TO GDA-VLR-PRODUTO(6)

               MOVE "SSD" TO GDA-NM-PRODUTO(7)
               MOVE 550 TO GDA-VLR-PRODUTO(7)

               MOVE "PENDRIVE" TO GDA-NM-PRODUTO(8)
               MOVE 60 TO GDA-VLR-PRODUTO(8)

               MOVE "HD EXTERNO" TO GDA-NM-PRODUTO(9)
               MOVE 480 TO GDA-VLR-PRODUTO(9)

               MOVE "IMPRESSORA" TO GDA-NM-PRODUTO(10)
               MOVE 1100 TO GDA-VLR-PRODUTO(10)

               EXIT.

           3000-CALCULO-REGRA SECTION.
               PERFORM VARYING GDA-INDICE-CLC FROM 1 BY 1
                   UNTIL GDA-INDICE-CLC > 10

               EVALUATE GDA-VLR-PRODUTO(GDA-INDICE-CLC)
                   WHEN NOT GREATER THAN 100
                    MOVE "BARATO" TO GDA-VLR-RESULTADO(GDA-INDICE-CLC)

                   WHEN NOT LESS THAN 101 AND NOT GREATER THAN 499
                    MOVE "NORMAL" TO GDA-VLR-RESULTADO(GDA-INDICE-CLC)

                   WHEN NOT LESS THAN 500 AND NOT EQUAL TO 500 *> VALIDAÇÃO PARA NÃO SER IGUAL A 500
                   MOVE "CARO" TO GDA-VLR-RESULTADO(GDA-INDICE-CLC)

                      WHEN OTHER
                          DISPLAY "ERRO" *> RETORNA ERRO SE ALGUM VLAOR ESTA DESCREPANTE

                   END-EVALUATE
               END-PERFORM.
              EXIT.



           4000-EXIBICAO SECTION.
           PERFORM VARYING GDA-INDICE-CLC FROM 1 BY 1
               UNTIL GDA-INDICE-CLC > 10


               MOVE SPACES TO GDA-LINHA-NOVA

               STRING
                GDA-CD-PRODUTO(GDA-INDICE-CLC)
                    DELIMITED BY SIZE
                    SPACE
                    DELIMITED BY SIZE
                GDA-NM-PRODUTO(GDA-INDICE-CLC)
                    DELIMITED BY SPACE
                    SPACE
                    DELIMITED BY SIZE

                       INTO GDA-LINHA-NOVA
               END-STRING

               MOVE GDA-VLR-RESULTADO(GDA-INDICE-CLC)
                   TO GDA-LINHA-NOVA(20:10)

           DISPLAY GDA-LINHA-NOVA

           END-PERFORM.
           EXIT.


           GOBACK.
      ******************************************************************
