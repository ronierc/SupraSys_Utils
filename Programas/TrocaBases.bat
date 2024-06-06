echo off
cls
dir /d
color a
echo "__________________________________________________________"
set /p nomeVar=Digite a base:
REG ADD HKCU\SIC\CONEXAO /v BASE1 /t REG_SZ /d C:\SUPRASYS\SIC\Arq\%nomeVar%\ /f
REG ADD HKCU\SIC\CONEXAO /v BASE2 /t REG_SZ /d C:\SUPRASYS\SIC\Arq\%nomeVar%\Arq02\ /f
REG ADD HKCU\SIC\CONEXAO /v BASE3 /t REG_SZ /d C:\SUPRASYS\SIC\Arq\%nomeVar%\Arq03\ /f
REG ADD HKCU\SIC\CONEXAO /v BASE4 /t REG_SZ /d C:\SUPRASYS\SIC\Arq\%nomeVar%\Arq04\ /f
REG ADD HKCU\SIC\CONEXAO /v EMPRESA /t REG_SZ /d C:\SUPRASYS\SIC\Arq\%nomeVar%\ /f
cls
color b
cd C:\"Program Files"\Firebird\Firebird_3_0
echo SELECT NRO_SCRIPT AS VERSAO FROM CONTROLE; | isql.exe C:\SUPRASYS\SIC\Arq\%nomeVar%\ARQSIST.FDB -user sysdba -pas masterkey
pause