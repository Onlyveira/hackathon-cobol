      ******************************************************************
      * SIGLA.....: BHC – BOOTCAMP HACKATHON COBOL
      * PROGRAMA..: BHCP0008
      * ANALISTA..: JOSE HILARIO VERAS LEITE JUNIOR
      * AUTOR.....: LEANDRO DAVI OLIVEIRA DE SOUZA
      * DATA......: 27/06/2026
      * OBJETIVO..: PARAGRAFOS
      * EXECUCAO..: COBOL - BATCH
      * ----------------------------------------------------------------
      * VRS DATA     RESPONSAVEL     DESCRICAO DA VERSAO
      * --- -------- --------------- ----------------------------------
      * 001 27.06.26 LEANDRO DAVI        IMPLANTACAO
      * ----------------------------------------------------------------
      ******************************************************************

      ******************************************************************
       IDENTIFICATION DIVISION.
      ******************************************************************

       PROGRAM-ID. BHCP0008.

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
       77 GDA-VENDA-1                  PIC 9(3) VALUE 100.
       77 GDA-VENDA-2                  PIC 9(3) VALUE 200.
       77 GDA-VENDA-3                  PIC 9(3) VALUE 150.
       77 GDA-VENDA-4                  PIC 9(3) VALUE 300.
       77 GDA-VENDA-5                  PIC 9(3) VALUE 400.
       77 GDA-RESULTADO-SOMA           PIC 9(4).
       77 GDA-MEDIA-CALCULADA          PIC 9(3).
       77 GDA-TOTAL-VENDAS             PIC 9(1) VALUE ZERO.

       77 GDA-SITUACAO                 PIC X(20).
      *----------------------------------------
       LOCAL-STORAGE                   SECTION.
      *----------------------------------------

      ******************************************************************
       PROCEDURE DIVISION.
      ******************************************************************

           0000-PRINCIPA.
               PERFORM 1000-PROCESSO
               PERFORM 2000-MEDIA
               PERFORM 3000-SITUACAO

           GOBACK.

           1000-PROCESSO SECTION.
               COMPUTE GDA-RESULTADO-SOMA = GDA-RESULTADO-SOMA +
                   GDA-VENDA-1
                   ADD 1 TO GDA-TOTAL-VENDAS.


               COMPUTE GDA-RESULTADO-SOMA = GDA-RESULTADO-SOMA +
                   GDA-VENDA-2
                   ADD 1 TO GDA-TOTAL-VENDAS.

               COMPUTE GDA-RESULTADO-SOMA = GDA-RESULTADO-SOMA +
                   GDA-VENDA-3
                   ADD 1 TO GDA-TOTAL-VENDAS.

               COMPUTE GDA-RESULTADO-SOMA = GDA-RESULTADO-SOMA +
                   GDA-VENDA-4
                   ADD 1 TO GDA-TOTAL-VENDAS.

               COMPUTE GDA-RESULTADO-SOMA = GDA-RESULTADO-SOMA +
                   GDA-VENDA-5
                   ADD 1 TO GDA-TOTAL-VENDAS.

           2000-MEDIA SECTION.
               DIVIDE GDA-RESULTADO-SOMA BY GDA-TOTAL-VENDAS
                   GIVING GDA-MEDIA-CALCULADA.


           3000-SITUACAO SECTION.
               IF GDA-RESULTADO-SOMA >= 1000
                   MOVE "META ATINGIDA" TO GDA-SITUACAO
                   ELSE
                       MOVE "META NAO ATINGIDA" TO GDA-SITUACAO
               END-IF.

                   DISPLAY "RESUMO DE VENDAS".
                   DISPLAY "QUANTIDADE: " GDA-TOTAL-VENDAS.
                   DISPLAY "TOTAL: " GDA-RESULTADO-SOMA.
                   DISPLAY "MEDIA: " GDA-MEDIA-CALCULADA.
                   DISPLAY "SITUACAO: " GDA-SITUACAO.

           GOBACK.
      ******************************************************************
