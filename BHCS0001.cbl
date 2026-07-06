      ******************************************************************
      * SIGLA.....: BHC – BOOTCAMP HACKATHON COBOL
      * PROGRAMA..: BHCP0011
      * ANALISTA..: JOSE HILARIO VERAS LEITE JUNIOR
      * AUTOR.....: LEANDRO DAVI OLIVEIRA DE SOUZA
      * DATA......: 30/06/2026
      * OBJETIVO..: SUBPROGRAMA
      * EXECUCAO..: COBOL - BATCH
      * ----------------------------------------------------------------
      * VRS DATA     RESPONSAVEL     DESCRICAO DA VERSAO
      * --- -------- --------------- ----------------------------------
      * 001 30.06.26 LEANDRO DAVI      IMPLANTACAO
      * ----------------------------------------------------------------
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. BHCS0001.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  WS-I                   PIC 9(2).
       01  WS-TIPO-DESC           PIC X(9).
       01  WS-STATUS              PIC X(8).

       01  WS-LINHA-CLIENTE       PIC X(40).
       01  WS-LINHA-TIPO          PIC X(40).
       01  WS-LINHA-SALDO         PIC X(40).
       01  WS-LINHA-STATUS        PIC X(40).
       01  WS-SALDO-EDT           PIC ZZZZ9.

       LINKAGE SECTION.

       01  LK-QTD-CONTAS          PIC 9(2).

       01  LK-TAB-CONTAS.
           05  LK-CONTA-ITEM OCCURS 1 TO 50 TIMES
                             DEPENDING ON LK-QTD-CONTAS.
               10  LK-CONTA       PIC 9(5).
               10  LK-CLIENTE     PIC X(10).
               10  LK-TIPO        PIC X(1).
               10  LK-SALDO       PIC 9(7).

       PROCEDURE DIVISION USING
       LK-QTD-CONTAS *> DADOS RECEBIDOS DO BGCP0011
       LK-TAB-CONTAS. *> DADOS RECEBIDOS DO BGCP0011

       0000-INICIO.
           PERFORM 1000-IMPRIME-RELATORIO THRU 1000-FIM
                   VARYING WS-I FROM 1 BY 1
                   UNTIL WS-I > LK-QTD-CONTAS

           GOBACK.



       1000-IMPRIME-RELATORIO. *> PRODUZ O RELATORIO


           EVALUATE LK-TIPO(WS-I)
               WHEN 'C'
                   MOVE 'CORRENTE' TO WS-TIPO-DESC
               WHEN 'P'
                   MOVE 'POUPANCA' TO WS-TIPO-DESC
               WHEN OTHER
                   MOVE 'INVALIDO' TO WS-TIPO-DESC
           END-EVALUATE

           EVALUATE TRUE
               WHEN LK-SALDO(WS-I) > 10000
                   MOVE 'VIP'      TO WS-STATUS
               WHEN LK-SALDO(WS-I) = 10000
                   MOVE 'ESPECIAL' TO WS-STATUS
               WHEN OTHER
                   MOVE 'PADRAO'   TO WS-STATUS
           END-EVALUATE

           MOVE LK-SALDO(WS-I) TO WS-SALDO-EDT

           MOVE SPACES TO WS-LINHA-CLIENTE
           STRING 'CLIENTE : ' DELIMITED BY SIZE
                  LK-CLIENTE(WS-I) DELIMITED BY SIZE
                  INTO WS-LINHA-CLIENTE
           END-STRING

           MOVE SPACES TO WS-LINHA-TIPO
           STRING 'TIPO    : ' DELIMITED BY SIZE
                  WS-TIPO-DESC DELIMITED BY SIZE
                  INTO WS-LINHA-TIPO
           END-STRING

           MOVE SPACES TO WS-LINHA-SALDO
           STRING 'SALDO   : ' DELIMITED BY SIZE
                  FUNCTION TRIM(WS-SALDO-EDT) DELIMITED BY SIZE *> PARA NAO CONTAR OS 0 ANTES DO VALOR
                  INTO WS-LINHA-SALDO
           END-STRING

           MOVE SPACES TO WS-LINHA-STATUS
           STRING 'STATUS  : ' DELIMITED BY SIZE
                  WS-STATUS DELIMITED BY SIZE
                  INTO WS-LINHA-STATUS
           END-STRING

           DISPLAY '************************************'
           DISPLAY WS-LINHA-CLIENTE (01:23)
           DISPLAY WS-LINHA-TIPO
           DISPLAY WS-LINHA-SALDO
           DISPLAY WS-LINHA-STATUS.
       1000-FIM.
           EXIT.
