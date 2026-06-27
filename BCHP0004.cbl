************************************************************
      * SIGLA.....: BHC – BOOTCAMP HACKATHON COBOL
      * PROGRAMA..: BHCP0004
      * ANALISTA..: JOSE HILARIO VERAS LEITE JUNIOR
      * AUTOR.....: LEANDRO DAVI OLIVEIRA DE SOUZA
      * DATA......: 26/06/2026
      * OBJETIVO..: CADASTRO SIMPLES DE CLIENTE
      * EXECUCAO..: COBOL - BATCH
      * ----------------------------------------------------------------
      * VRS DATA     RESPONSAVEL     DESCRICAO DA VERSAO
      * --- -------- --------------- ----------------------------------
      * 001 26.06.26 LEANDRO DAVI       IMPLANTACAO
      * ----------------------------------------------------------------
      ******************************************************************

      ******************************************************************
       IDENTIFICATION DIVISION.
      ******************************************************************

       PROGRAM-ID. BHCP0004.

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
      *----------------------------------------
       LOCAL-STORAGE                   SECTION.
      *----------------------------------------
       01 GDA-CADASTRO-CLIENTE.
           03 GDA-CODIGO-CLIENTE       PIC X(9).
           03 GDA-NOME-CLIENTE         PIC X(12).
           03 GDA-CODIGO-AGENCIA       PIC X(4).
           03 GDA-NUMERO-CONTA         PIC X(7).
           03 GDA-SALDO-EDITAVEL      PIC S9(18)V99.
           03 GDA-SALDO-INICIAL       PIC -ZZZ.ZZZ.ZZZ.ZZZ.ZZ9,99.

      ******************************************************************
       PROCEDURE DIVISION.
      ******************************************************************


           MOVE "1001" TO GDA-CODIGO-CLIENTE.
           MOVE "LEANDRO DAVI" TO GDA-NOME-CLIENTE.
           MOVE "1234" TO GDA-CODIGO-AGENCIA.
           MOVE "9876564" TO GDA-NUMERO-CONTA.

           MOVE 1500 TO GDA-SALDO-EDITAVEL.
           MOVE GDA-SALDO-EDITAVEL TO GDA-SALDO-INICIAL.


           DISPLAY "=======================".
           DISPLAY "CADASTRO DE CLIENTE".
           DISPLAY "CODIGO: " GDA-CODIGO-AGENCIA.
           DISPLAY "NOME: " GDA-NOME-CLIENTE.
           DISPLAY "AGENCIA: " GDA-CODIGO-AGENCIA.
           DISPLAY "CONTA: " GDA-NUMERO-CONTA.
           DISPLAY "SALDO INICIAL: R$ " FUNCTION TRIM
           (GDA-SALDO-INICIAL).



           GOBACK.
      ******************************************************************
