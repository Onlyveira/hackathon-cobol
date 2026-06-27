*************************************************************
      * SIGLA.....: BHC – BOOTCAMP HACKATHON COBOL
      * PROGRAMA..: BCHP0002
      * ANALISTA..: JOSE HILARIO VERAS LEITE JUNIOR
      * AUTOR.....: LEANDRO DAVI OLIVEIRA DE SOUZA
      * DATA......: 25/06/2026
      * OBJETIVO..: OPERACAO DE SOMA SIMPLES
      * EXECUCAO..: COBOL - BATCH
      * ----------------------------------------------------------------
      * VRS DATA     RESPONSAVEL     DESCRICAO DA VERSAO
      * --- -------- --------------- ----------------------------------
      * 001 25.06.26 LEANDRO DAVI       IMPLANTACAO
      * ----------------------------------------------------------------
      ******************************************************************

      **********************
       IDENTIFICATION DIVISION.
      **********************

       PROGRAM-ID. BCHP0002.

      **********************
       ENVIRONMENT DIVISION.
      **********************

      *----------------------------------------
       CONFIGURATION                   SECTION.
      *----------------------------------------
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

      **********************
       DATA DIVISION.
      **********************

      *----------------------------------------
       WORKING-STORAGE                 SECTION.
      *----------------------------------------
      *----------------------------------------
       LOCAL-STORAGE                   SECTION.
       77 LS-GDA-TX-RESULTADO     PIC 9(2).
       77 LS-GDA-NR-1          PIC 9(2).
       77 LS-GDA-NR-2          PIC 9(2).
      *----------------------------------------

      **********************
       PROCEDURE DIVISION.
      **********************

           MOVE 10 TO LS-GDA-NR-1.
           MOVE 25 TO LS-GDA-NR-2.

           ADD LS-GDA-NR-1 TO LS-GDA-NR-2
               GIVING LS-GDA-TX-RESULTADO.

           DISPLAY "Primeiro numero: " LS-GDA-NR-1.
           DISPLAY "Segundo numero: " LS-GDA-NR-2.
           DISPLAY "O resultado da soma: " LS-GDA-TX-RESULTADO.

           GOBACK.
      **********************
