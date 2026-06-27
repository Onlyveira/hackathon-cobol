      ******************************************************************
      * SIGLA.....: BHC – BOOTCAMP HACKATHON COBOL
      * PROGRAMA..: BHCP0006
      * ANALISTA..: JOSE HILARIO VERAS LEITE JUNIOR
      * AUTOR.....: LEANDRO DAVI OLIVEIRA DE SOUZA
      * DATA......: 27/06/2026
      * OBJETIVO..: OBJETIVO DO EXERCICIO
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

       PROGRAM-ID. BHCP0006.

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

       01 GDA-CADASTRO-CLIENTE.
           03 GDA-NOME-CLIENTE         PIC A(9) VALUE "ANA PAULA".
           03 GDA-SALDO-CONTA          PIC 9(3) VALUE 500.
           03 GDA-RESULTADO-FINAL      PIC X(8).

      *----------------------------------------
       LOCAL-STORAGE                   SECTION.
      *----------------------------------------

      ******************************************************************
       PROCEDURE DIVISION.
      ******************************************************************

           IF GDA-SALDO-CONTA GREATER THAN 0
               MOVE "POSITIVO" TO GDA-RESULTADO-FINAL

               ELSE
                   IF GDA-SALDO-CONTA LESS THAN 0
                       MOVE "NEGATIVO" TO GDA-RESULTADO-FINAL

                   ELSE
                       IF GDA-SALDO-CONTA EQUAL TO 0
                            MOVE "ZERADO" TO GDA-RESULTADO-FINAL
                END-IF
                 END-IF
                   END-IF.

           DISPLAY "CLIENTE: " GDA-NOME-CLIENTE.
           DISPLAY "SALDO: " GDA-SALDO-CONTA.
           DISPLAY "SITUACAO: " GDA-RESULTADO-FINAL.

           GOBACK.
      ******************************************************************
