@echo off
cls
:menu
cls
color 0A

date /t
@CHCP 1252 >NUL
echo Computador: %computername%        Usuario: %username%
                   
echo            MENU TAREFAS
echo ========================================================================
echo * 1. Esvaziar Arq. Temp.                                               * 
echo * 2. Esvaziar Arq. Temp. Completa                                      *
echo * 3. Verificador o Windows e reparar arquivos ausentes ou corrompidos  *
echo * 4. Reiniciar                                                         *
echo * 5. Sair                                                              * 
echo ========================================================================

set /p opcao= Escolha uma opcao: 
echo ------------------------------
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% GEQ 6 goto opcao6

:opcao1
cls
IF EXIST c:\windows\temp\ DEL /f /s /q c:\windows\temp\
DEL /q /f /s  %temp%\
DEL /q /f /s  "%temp%"
DEL /q /f /s C:\Documents and settings\%username%\Config~1\tempor~1
DEL /q /f /s C:\Documents and settings\%username%\Config~1\temp
DEL /q /f /s "%temp%"
RD /q /s  %systemdrive%\$Recycle.bin
echo ==================================
echo *      Arq. Temp. Esvaziados      *
echo ==================================
pause
goto menu

:opcao2
cls
IF EXIST c:\windows\temp\ DEL /f /s /q c:\windows\temp\
DEL /q /f /s  %temp%\
DEL /q /f /s  "%temp%"
DEL /q /f /s C:\Documents and settings\%username%\Config~1\tempor~1
DEL /q /f /s C:\Documents and settings\%username%\Config~1\temp
DEL /q /f /s "%temp%"
DEL /q /f /s C:\Windows\Prefetch
RD /q /s  %systemdrive%\$Recycle.bin
echo ==================================
echo *      Arq. Temp. Esvaziados      *
echo ==================================
pause
goto menu

:opcao3
cls
sfc /scannow

Dism /Online /Cleanup-Image /ScanHealth

Dism /Online /Cleanup-Image /RestoreHealth
echo ==================================
echo *      Manutenção concluida!      *
echo ==================================
pause
goto menu

:opcao4
cls
shutdown /r /t 0 /c "Reinicio Programado" /f /d p:4:1 
pause
goto menu

:opcao5
cls
exit

:opcao6
echo ==============================================
echo * Opcao Invalida! Escolha outra opcao do menu *
echo ==============================================
pause
goto menu