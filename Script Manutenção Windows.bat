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
echo * 3. Esvaziar Spooler de Impress�o.                                    *
echo * 4. Verificador o Windows e reparar arquivos ausentes ou corrompidos  *
echo * 5. Reiniciar                                                         *
echo * 6. Desligar                                                          *
echo * 7. Sair                                                              * 
echo ========================================================================

set /p opcao= Escolha uma op��o: 
echo ------------------------------
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6
if %opcao% GEQ 7 goto opcao7

:opcao1
cls
IF EXIST c:\windows\temp\ DEL /f /s /q c:\windows\temp\*.*
DEL /q /f /s  %temp%
DEL /q /f /s  "%temp%"
DEL /q /f /s C:\Documents and settings\%username%\Config~1\tempor~1
DEL /q /f /s C:\Documents and settings\%username%\Config~1\temp
DEL /q /f /s "%temp%"
RD /q /s  %systemdrive%\$Recycle.bin
echo ==================================
echo *      Arq. Temp. Esvaziados      *
echo ==================================
timeout /t 5
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

del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
cls
echo ==================================
echo *      Arq. Temp. Esvaziados      *
echo ==================================
timeout /t 5
goto menu

:opcao3
cls
net stop spooler
timeout /t 5
del %windir%\system32\spool\printers\*.* /s /f /q
net start spooler
cls
echo ==================================
echo * Spooler de Impress�o Esvaziados *
echo ==================================
timeout /t 5
goto menu

:opcao4
cls
sfc /scannow

Dism /Online /Cleanup-Image /ScanHealth

Dism /Online /Cleanup-Image /RestoreHealth
echo ==================================
echo *      Manuten��o concluida!      *
echo ==================================
timeout /t 5
goto menu

:opcao5
cls
shutdown /r /t 0 /c "Reinicio Programado" /f /d p:4:1 
timeout /t 5
goto menu

:opcao6
cls
shutdown /s /t 0 /c "Desligamento Programado" /f /d p:4:1 
timeout /t 5
goto menu

:opcao7
cls
exit

:opcao8
echo ==============================================
echo * Opcao Invalida! Escolha outra opcao do menu *
echo ==============================================
pause
goto menu