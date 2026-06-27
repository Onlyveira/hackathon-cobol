      ******************************************************************
      * SIGLA.....: BHC – BOOTCAMP HACKATHON COBOL
      * PROGRAMA..: BHCP0005
      * ANALISTA..: JOSE HILARIO VERAS LEITE JUNIOR
      * AUTOR.....: LEANDRO DAVI OLIVEIRA DE SOUZA
      * DATA......: 27/06/2026
      * OBJETIVO..: CALCULO DE MOVIMENTACAO BANCARIA
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

       PROGRAM-ID. BHCP0005.

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

       01 GDA-CONTA-CORRENTE.
           03 GDA-SALDO-INICIAL        PIC 9(4) VALUE 1000.
           03 GDA-SALDO-DEPOSITADO     PIC 9(3) VALUE 500.
           03 GDA-SALDO-SAQUE          PIC 9(3) VALUE 200.
           03 GDA-SALDO-FINAL          PIC 9(4) VALUE ZERO.

      *----------------------------------------
      *----------------------------------------
       LOCAL-STORAGE                   SECTION.
      *----------------------------------------

      ******************************************************************
       PROCEDURE DIVISION.
      ******************************************************************
           COMPUTE GDA-SALDO-FINAL =
           GDA-SALDO-DEPOSITADO +
           GDA-SALDO-INICIAL.

           SUBTRACT GDA-SALDO-SAQUE FROM GDA-SALDO-FINAL.

           DISPLAY "SALDO INICIAL: " GDA-SALDO-INICIAL
           DISPLAY "DEPOSITO: " GDA-SALDO-DEPOSITADO.
           DISPLAY "SAQUE: " GDA-SALDO-SAQUE
           DISPLAY "SALDO FINAL: " GDA-SALDO-FINAL.


           GOBACK.
      ******************************************************************
