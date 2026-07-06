      ******************************************************************
      * SIGLA.....: BHC – BOOTCAMP HACKATHON COBOL
      * PROGRAMA..: BHCP0000
      * ANALISTA..: JOSE HILARIO VERAS LEITE JUNIOR
      * AUTOR.....: LEANDRO DAVI OLIVEIRA DE SOUZA
      * DATA......: 03/07/2026
      * OBJETIVO..: Arquivo JSON
      * EXECUCAO..: COBOL - BATCH
      * ----------------------------------------------------------------
      * VRS DATA     RESPONSAVEL     DESCRICAO DA VERSAO
      * --- -------- --------------- ----------------------------------
      * 001 03.07.26 LEANDRO DAVI        IMPLANTACAO
      * ----------------------------------------------------------------
      ******************************************************************

      ******************************************************************
       IDENTIFICATION DIVISION.
      ******************************************************************

       PROGRAM-ID. BHCP0015.

            ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT BHCF012S
               ASSIGN TO "BHCF012S.txt"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS GDA-FS-BHCF012S.

           SELECT BHCF016J
               ASSIGN TO "BHCF016J.json"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS GDA-FS-BHCF016J.

       DATA DIVISION.
       FILE SECTION.

       FD  BHCF012S
           RECORDING MODE IS F.
       01  REG-BHCF012S                 PIC X(065).

       FD  BHCF016J.
       01  REG-BHCF016J                 PIC X(200).

              LOCAL-STORAGE SECTION.

       01  GDA-FILE-STATUS.
           03 GDA-FS-BHCF012S           PIC X(002) VALUE SPACES.
           03 GDA-FS-BHCF016J           PIC X(002) VALUE SPACES.
           03 GDA-FS-OK                 PIC X(002) VALUE '00'.

       01  WS-FIM-ARQUIVO               PIC X(001) VALUE 'N'.
           88 WS-FIM-SIM                VALUE 'S'.
           88 WS-FIM-NAO                VALUE 'N'.

       01  GDA-TOTALIZADORES.
           03 GDA-TOT-LIDOS             PIC 9(005) VALUE ZEROS.
           03 GDA-TOT-JSON              PIC 9(005) VALUE ZEROS.
           03 GDA-TOT-ERROS             PIC 9(005) VALUE ZEROS.

       01  GDA-DATA-HORA.
           03 GDA-CURRENT-DATE          PIC X(021).

       01  GDA-GR-BHCF012S.
           03 FD-CODIGO                 PIC X(005).
           03 FD-NOME                   PIC X(030).
           03 FD-UF                     PIC X(002).
           03 FD-TRILHA                 PIC X(010).
           03 FD-SITUACAO               PIC X(010).
           03 FD-DATA                   PIC X(008).

       PROCEDURE DIVISION.
           000000-ROTINA-PRINCIPAL.

           PERFORM 100000-INICIALIZAR
           PERFORM 200000-ABRIR-ARQUIVOS
           PERFORM 300000-GRAVAR-CABECALHO-JSON
           PERFORM 400000-LER-ENTRADA

           PERFORM UNTIL WS-FIM-SIM
               PERFORM 500000-PROCESSAR-ARQUIVO
           END-PERFORM

           PERFORM 800000-GRAVAR-RODAPE-JSON
           PERFORM 900000-FECHAR-ARQUIVOS
           PERFORM 910000-EXIBIR-TOTALIZADORES
           PERFORM 999999-FINALIZAR.

       100000-INICIALIZAR.
           MOVE ZEROS TO GDA-TOT-LIDOS
                         GDA-TOT-JSON
                         GDA-TOT-ERROS

           SET WS-FIM-NAO TO TRUE

           MOVE FUNCTION CURRENT-DATE TO GDA-CURRENT-DATE

           DISPLAY 'BHCP0015 - INICIO DO PROCESSAMENTO'
           DISPLAY 'DATA/HORA: ' GDA-CURRENT-DATE.

       200000-ABRIR-ARQUIVOS.
           OPEN INPUT BHCF012S

           IF GDA-FS-BHCF012S NOT = GDA-FS-OK
               DISPLAY 'ERRO OPEN INPUT BHCF012S FS='
                       GDA-FS-BHCF012S
               ADD 1 TO GDA-TOT-ERROS
               SET WS-FIM-SIM TO TRUE
           END-IF

           OPEN OUTPUT BHCF016J

           IF GDA-FS-BHCF016J NOT = GDA-FS-OK
               DISPLAY 'ERRO OPEN OUTPUT BHCF014S FS='
                       GDA-FS-BHCF016J
               ADD 1 TO GDA-TOT-ERROS
               SET WS-FIM-SIM TO TRUE
           END-IF.
               DISPLAY GDA-FS-OK.

       300000-GRAVAR-CABECALHO-JSON.
       400000-LER-ENTRADA.
       500000-PROCESSAR-ARQUIVO.
       510000-GRAVAR-OBJETO-JSON.
       800000-GRAVAR-RODAPE-JSON.
       900000-FECHAR-ARQUIVOS.
       910000-EXIBIR-TOTALIZADORES.
       999999-FINALIZAR.
