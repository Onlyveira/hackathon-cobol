******************************************************************
      * SIGLA.....: BHC – BOOTCAMP HACKATHON COBOL
      * PROGRAMA..: BHCP0003
      * ANALISTA..: JOSE HILARIO VERAS LEITE JUNIOR
      * AUTOR.....: LEANDRO DAVI OLIVEIRA DE SOUZA
      * DATA......: 26/06/2026
      * OBJETIVO..: MOVIMENTACAO SIMPLES
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

       PROGRAM-ID. BCHP0003.

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
       01 GDA-CADASTRO-ALUNO.
           03 GDA-ALUNO           PIC X(30).
           03 GDA-CURSO           PIC X(40).

      *----------------------------------------
       LOCAL-STORAGE                   SECTION.
      *----------------------------------------

      ******************************************************************
       PROCEDURE DIVISION.
      ******************************************************************
           MOVE "LEANDRO DAVI OLIVEIRA DE SOUZA" TO GDA-ALUNO.
           MOVE "ANALISE E DESENVOLVIMENTO DE SISTEMAS" TO GDA-CURSO.

           DISPLAY "CADASTRO DO ALUNO".
           DISPLAY "=======================".
           DISPLAY "NOME: " GDA-ALUNO.
           DISPLAY "NOME DO CURSO: " GDA-CURSO.
           DISPLAY "Meu Programa COBOL."

           GOBACK.
      ******************************************************************
