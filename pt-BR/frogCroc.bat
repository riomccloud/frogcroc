@echo off
chcp 65001 > NUL
title FrogCroc v1.0
setlocal enabledelayedexpansion

set "arquivos="

for %%F in (%*) do (
	rem Verificar se é o primeiro arquivo
	if "!arquivos!"=="" (
		set "arquivos=%%F"
	) else (
		set "arquivos=!arquivos! %%F"
	)
)

rem Verificar se algum arquivo foi arrastado
if "!arquivos!"=="" (
	:receberArquivo
	title FrogCroc v1.0 - Recebendo...
	echo FROGCROC v1.0
	echo ==================================================
	echo.
	set /p codigoCroc="Digite o código da transferência: "
	if "!codigoCroc!"=="" (
		echo O código não pode estar vazio. Pressione qualquer tecla para tentar novamente.
		pause > NUL
		cls
		goto receberArquivo
	)
	echo Recebendo...
	echo.
	croc !codigoCroc!
	if ERRORLEVEL 1 (
		cls
		title FrogCroc v1.0 - Erro
		echo FROGCROC v1.0
		echo ==================================================
		echo.
		echo O código digitado está incorreto. Pressione qualquer tecla para tentar novamente.
		pause > NUL
		cls
		goto receberArquivo
	)
) else (
	title FrogCroc v1.0 - Enviando...
	echo FROGCROC v1.0
	echo ==================================================
	echo.
	echo Enviando...
	echo.
	croc send !arquivos!
)

endlocal

title FrogCroc v1.0 - Transferência concluída
echo.
echo Pressione qualquer tecla para fechar o FrogCroc.
pause > NUL