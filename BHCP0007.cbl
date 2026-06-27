      ******************************************************************
      * SIGLA.....: BHC – BOOTCAMP HACKATHON COBOL
      * PROGRAMA..: BHCP0007
      * ANALISTA..: JOSE HILARIO VERAS LEITE JUNIOR
      * AUTOR.....: LEANDRO DAVI OLIVEIRA DE SOUZA
      * DATA......: 27/06/2026
      * OBJETIVO..: EVALUATE
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

       PROGRAM-ID. BHCP0007.

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
       77 GDA-CODIGO-CONTA               PIC 9(2) VALUE 2.
       77 GDA-TIPO-CONTA                 PIC X(20).

      *----------------------------------------
       LOCAL-STORAGE                   SECTION.
      *----------------------------------------

      ******************************************************************
       PROCEDURE DIVISION.
      ******************************************************************

           EVALUATE GDA-CODIGO-CONTA
               WHEN 1
                   MOVE "CONTA CORRENTE" TO GDA-TIPO-CONTA

               WHEN 2
                   MOVE "CONTA POUPANCA" TO GDA-TIPO-CONTA

               WHEN 3
                   MOVE "CONTA SALARIO" TO GDA-TIPO-CONTA

               WHEN 4
                   MOVE "CONTA EMPRESARIAL" TO GDA-TIPO-CONTA

               WHEN OTHER
                   MOVE "TIPO INVALIDO" TO GDA-TIPO-CONTA
           END-EVALUATE.

           DISPLAY "CODIGO DO TIPO: " GDA-CODIGO-CONTA.
           DISPLAY "DESCRICAO: " GDA-TIPO-CONTA.

           GOBACK.
      ******************************************************************
