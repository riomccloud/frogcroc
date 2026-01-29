@echo off
chcp 65001 > NUL
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
	set /p codigoCroc="Digite o código da transferência: "
	echo.
	croc !codigoCroc!
) else (
    croc send !arquivos!
)

endlocal