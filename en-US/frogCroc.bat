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
	title FrogCroc v1.0 - Receiving...
	echo FROGCROC v1.0
	echo ==================================================
	echo.
	set /p codigoCroc="Type the transfer code: "
	if "!codigoCroc!"=="" (
		echo The code can't be empty. Press any key to try again.
		pause > NUL
		cls
		goto receberArquivo
	)
	echo Receiving...
	echo.
	croc !codigoCroc!
	if ERRORLEVEL 1 (
		cls
		title FrogCroc v1.0 - Error
		echo FROGCROC v1.0
		echo ==================================================
		echo.
		echo The typed code is incorrect. Press any key to try again.
		pause > NUL
		cls
		goto receberArquivo
	)
) else (
	title FrogCroc v1.0 - Sending...
	echo FROGCROC v1.0
	echo ==================================================
	echo.
	echo Sending...
	echo.
	croc send !arquivos!
)

endlocal

title FrogCroc v1.0 - Transferência concluída
echo.
echo Pressione qualquer tecla para fechar o FrogCroc.
pause > NUL