      ******************************************************************
      * SIGLA.....: BHC – BOOTCAMP HACKATHON COBOL
      * PROGRAMA..: BHCP0011
      * ANALISTA..: JOSE HILARIO VERAS LEITE JUNIOR
      * AUTOR.....: LEANDRO DAVI OLIVEIRA DE SOUZA
      * DATA......: 30/06/2026
      * OBJETIVO..: PROGRAMA E SUBPROGRAMA
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

       PROGRAM-ID. BHCP0011.

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
       WORKING-STORAGE SECTION.


       01  GDA-DADOS-INICIAIS. *> PEGUEI TODOS OS DADOS DA ATIVIDADE
           05  FILLER  PIC X(23) VALUE '10001JOAO      C0015000'.
           05  FILLER  PIC X(23) VALUE '10002MARIA     P0010000'.
           05  FILLER  PIC X(23) VALUE '10003PEDRO     C0008200'.
           05  FILLER  PIC X(23) VALUE '10004ANA       P0030000'.
           05  FILLER  PIC X(23) VALUE '10005LUCAS     C0009900'.
           05  FILLER  PIC X(23) VALUE '10006FERNANDA  P0004500'.
           05  FILLER  PIC X(23) VALUE '10007PAULO     C0012000'.
           05  FILLER  PIC X(23) VALUE '10008MARTA     P0010000'.
           05  FILLER  PIC X(23) VALUE '10009JULIANA   C0007800'.
           05  FILLER  PIC X(23) VALUE '10010ROBERTO   C0025000'.

       01  GDA-DADOS-INICIAIS-RED REDEFINES GDA-DADOS-INICIAIS.
           05  WS-DADO-ITEM OCCURS 10 TIMES.
               10  WS-DADO-CONTA      PIC 9(5).
               10  WS-DADO-CLIENTE    PIC X(10).
               10  WS-DADO-TIPO       PIC X(1).
               10  WS-DADO-SALDO      PIC 9(7).


       01  WS-QTD-CONTAS          PIC 9(2) VALUE 10.

       01  WS-TAB-CONTAS.
           05  WS-CONTA-ITEM OCCURS 1 TO 50 TIMES *> ARRAY DINAMICO 50
                             DEPENDING ON WS-QTD-CONTAS.
               10  WS-CONTA       PIC 9(5).
               10  WS-CLIENTE     PIC X(10).
               10  WS-TIPO        PIC X(1).
               10  WS-SALDO       PIC 9(7).

           *> usei para ajudar no relatorio
       01  WS-INDICE              PIC 9(2).
       01  WS-AUX-CONTA           PIC 9(5).
       01  WS-AUX-CLIENTE         PIC X(10).
       01  WS-AUX-TIPO            PIC X(1).
       01  WS-AUX-SALDO           PIC 9(7).

       PROCEDURE DIVISION.

       0000-INICIO.
           PERFORM 1000-EDITA-DADOS
           PERFORM 3000-CHAMAR-SUBPROGRAMA
           GOBACK.


       1000-EDITA-DADOS.
           PERFORM VARYING WS-INDICE FROM 1 BY 1
                   UNTIL WS-INDICE > WS-QTD-CONTAS
               MOVE WS-DADO-CONTA(WS-INDICE)   TO WS-CONTA(WS-INDICE)
               MOVE WS-DADO-CLIENTE(WS-INDICE) TO WS-CLIENTE(WS-INDICE)
               MOVE WS-DADO-TIPO(WS-INDICE)    TO WS-TIPO(WS-INDICE)
               MOVE WS-DADO-SALDO(WS-INDICE)   TO WS-SALDO(WS-INDICE)
           END-PERFORM.


           DISPLAY '************************************'
           DISPLAY "RELATORIO DE CLIENTE".
           DISPLAY SPACES.

       3000-CHAMAR-SUBPROGRAMA.
           CALL 'BHCS0001' USING
           WS-QTD-CONTAS
           WS-TAB-CONTAS
           END-CALL.
