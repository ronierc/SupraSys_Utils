

@echo off

REM ------Conexões---------------------------------
set "nam[0]=Nome_Empresa1"
set "ids[0]=000000000"
set "pwd[0]=Senha123"
set "tip[0]=AnyDesk"
REM -----------------------------------------------
set "nam[1]=Nome_Empresa2"
set "ids[1]=000.00.000.000:1234"
set "pwd[1]=null"
set "tip[1]=MSTSC"
REM -----------------------------------------------
set "nam[2]=Nome_Empresa3"
set "ids[2]=000.000.0.000"
set "pwd[2]=null"
set "tip[2]=MSTSC"
REM -----------------------------------------------
set "nam[3]=Nome_Empresa4"
set "ids[3]=0000000000"
set "pwd[3]=Senha123"
set "tip[3]=AnyDesk"
REM -----------------------------------------------


echo Escolha uma conexao para acessar:

REM Obtém o tamanho do array "nomes"
set count=-1
for /F %%a in ('set nam[') do set /A count+=1

setlocal EnableDelayedExpansion
for /L %%i in (0,1,!count!) do (
  echo [%%i] !nam[%%i]! - !tip[%%i]!
)

REM Solicita ao usuário que selecione uma conexão
set /P id="Digite o numero correspondente a conexao que deseja acessar: "

REM Obtém a senha correspondente à conexão selecionada
set "senha=!pwd[%id%]!"

REM Obtém o tipo de conexão correspondente à conexão selecionada
set "tipo=!tip[%id%]!"

REM Defina o caminho para o AnyDesk
set "anydesk_path=C:\Program Files (x86)\AnyDesk\anydesk.exe"

REM Acessa a conexão selecionada com o comando correto
if "%tipo%"=="AnyDesk" (
	echo %senha% | "%anydesk_path%" !ids[%id%]! --with-password --plain
) else if "%tipo%"=="MSTSC" (
	mstsc -v:!ids[%id%]! /F -console
)
