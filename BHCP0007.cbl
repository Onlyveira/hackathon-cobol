      ******************************************************************
<<<<<<< HEAD
      * SIGLA.....: BHC – BOOTCAMP HACKATHON COBOL
=======
      * SIGLA.....: BHC â€“ BOOTCAMP HACKATHON COBOL
>>>>>>> 4d433008ba937c9a03c6cdd7ec786d81f096529a
      * PROGRAMA..: BHCP0007
      * ANALISTA..: JOSE HILARIO VERAS LEITE JUNIOR
      * AUTOR.....: LEANDRO DAVI OLIVEIRA DE SOUZA
      * DATA......: 27/06/2026
<<<<<<< HEAD
      * OBJETIVO..: CONTA COM EVALUATE
=======
<<<<<<< HEAD
      * OBJETIVO..: EVALUATE CONTA
=======
      * OBJETIVO..: EVALUATE
>>>>>>> 9c365afe87faee65e20d180a23aaf73fbe3f1e23
>>>>>>> 4d433008ba937c9a03c6cdd7ec786d81f096529a
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
<<<<<<< HEAD

       77 GDA-CODIGO-CONTA         PIC 9(1) VALUE 2.
       77 GDA-TIPO-CONTA           PIC X(20).
=======
       77 GDA-CD-CONTA               PIC 9(2) VALUE 2.
       77 GDA-TIPO-CONTA                 PIC X(20).

>>>>>>> 4d433008ba937c9a03c6cdd7ec786d81f096529a
      *----------------------------------------
       LOCAL-STORAGE                   SECTION.
      *----------------------------------------

      ******************************************************************
       PROCEDURE DIVISION.
      ******************************************************************

<<<<<<< HEAD
           EVALUATE GDA-CODIGO-CONTA
=======
           EVALUATE GDA-CD-CONTA
>>>>>>> 4d433008ba937c9a03c6cdd7ec786d81f096529a
               WHEN 1
                   MOVE "CONTA CORRENTE" TO GDA-TIPO-CONTA

               WHEN 2
                   MOVE "CONTA POUPANCA" TO GDA-TIPO-CONTA

               WHEN 3
                   MOVE "CONTA SALARIO" TO GDA-TIPO-CONTA

               WHEN 4
<<<<<<< HEAD
                   MOVE  "CONTA EMPRESARIAL" TO GDA-TIPO-CONTA

                   WHEN OTHER
                       MOVE "TIPO INVALIDO" TO GDA-TIPO-CONTA

               END-EVALUATE.


           DISPLAY "CODIGO DO TIPO: " GDA-CODIGO-CONTA.
           DISPLAY "DESCRICAO: " GDA-TIPO-CONTA.


            GOBACK.
=======
                   MOVE "CONTA EMPRESARIAL" TO GDA-TIPO-CONTA

               WHEN OTHER
                   MOVE "TIPO INVALIDO" TO GDA-TIPO-CONTA
           END-EVALUATE.

           DISPLAY "CODIGO DO TIPO: " GDA-CD-CONTA.
           DISPLAY "DESCRICAO: " GDA-TIPO-CONTA.

           GOBACK.
>>>>>>> 4d433008ba937c9a03c6cdd7ec786d81f096529a
      ******************************************************************
