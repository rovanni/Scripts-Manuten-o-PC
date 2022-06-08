@echo off
cls
:menu
cls
color 0A

date /t
@CHCP 1252 >NUL
echo.
echo Bem vindo ao programa de Manutencao
echo.
echo Computador: %computername%        Usuario: %username%
echo.
                   
echo            MENU TAREFAS
echo ========================================================================
echo *  1. Apagar Arq. Temp.                                                * 
echo *  2. Apagar Arq. Temp. Completa                                       *  
echo *  3. Esvaziar Spooler de Impressão                                    *
echo *  4. Esvaziar Pasta Downloads                                         *
echo *  5. Instalar programas utilizando winget                             *   
echo *  6. Verificador do Windows, repara arquivos ausentes ou corrompidos  *
echo *  7. Reiniciar                                                        *
echo *  8. Desligar                                                         *
echo *  9. Sair                                                             * 
echo ========================================================================

set /p opcao= Escolha uma opção: 
echo ------------------------------
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6
if %opcao% equ 7 goto opcao7
if %opcao% equ 8 goto opcao8
if %opcao% equ 9 goto opcao9
if %opcao% GEQ 10 goto opcao10

:opcao1
cls
echo.
echo ======================================================
echo *              Apagando Arquivos Temp.               *
echo ======================================================
echo.
IF EXIST C:\windows\temp\ DEL /f /s /q C:\windows\temp\*.*
DEL /f /s /q  %temp%
DEL /f /s /q  "%temp%"
DEL /f /s /q C:\Documents and settings\%username%\Config~1\tempor~1
DEL /f /s /q C:\Documents and settings\%username%\Config~1\temp
DEL /f /s /q "%temp%"
RD /q /s  %systemdrive%\$Recycle.bin
echo.
echo ======================================================
echo *     Limpando cache e renovando dados Internet      *
echo ======================================================
echo.
timeout /t 3
ipconfig /flushdns
timeout /t 3
ipconfig /registerdns
timeout /t 3
ipconfig /release
timeout /t 3
ipconfig /renew
timeout /t 3
netsh winsock reset
timeout /t 3
echo.
echo ======================================================
echo *                Arq. Temp. apagados                 *
echo ======================================================
echo.
timeout /t 3
goto menu

:opcao2
cls
echo.
echo ======================================================
echo *              Apagando Arquivos Temp.               *
echo ======================================================
echo.
IF EXIST c:\windows\temp\ DEL /f /s /q c:\windows\temp\
DEL /f /s /q  %temp%\
del /s /f /q %temp%\*.*
DEL /f /s /q  "%temp%"
del /f /s /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
rd /s /q %temp%
md %temp%
DEL /f /s /q C:\Documents and settings\%username%\Config~1\tempor~1
DEL /f /s /q C:\Documents and settings\%username%\Config~1\temp
DEL /f /s /q C:\Windows\Prefetch
RD /q /s  %systemdrive%\$Recycle.bin
echo.
echo ======================================================
echo *         Limpando a Área de Transferência           *
echo ======================================================
echo.
%windir%\System32\cmd /c echo off | clip
echo.
echo ======================================================
echo *     Limpando cache e renovando dados Internet      *
echo ======================================================
echo.
timeout /t 3
ipconfig /flushdns
timeout /t 3
ipconfig /registerdns
timeout /t 3
ipconfig /release
timeout /t 3
ipconfig /renew
timeout /t 3
netsh winsock reset
timeout /t 3
echo.
echo ======================================================
echo *                Arq. Temp. apagados                 *
echo ======================================================
echo.
timeout /t 3
goto menu

:opcao3
cls
net stop spooler
timeout /t 5
del %windir%\system32\spool\printers\*.* /s /f /q
net start spooler
cls
echo.
echo ===================================
echo * Spooler de Impressão Esvaziados *
echo ===================================
echo.
timeout /t 5
goto menu

:opcao4
cls
rd /q /s C:\Users\lucia\Downloads
md C:\Users\lucia\Downloads
echo.
echo ===================================
echo *   Pasta Downloads Esvaziada     *
echo ===================================
echo.
timeout /t 5
goto menu


:opcao5
cls
winget install Google.Chrome
winget install Mozilla.Firefox
winget install 7zip.7zip
winget install Foxit.FoxitReader
winget install CodecGuide.K-LiteCodecPackMega
winget install IObit.DriverBooster9
winget install RevoUninstaller.RevoUninstaller
winget install Piriform.CCleaner
winget install Notepad++.Notepad++
winget install Spotify.Spotify
winget install WhatsApp.WhatsApp
echo.
echo ===================================
echo *      Instalações concluidas!      *
echo ===================================
echo.
timeout /t 5
goto menu

:opcao6
cls
sfc /scannow

Dism /Online /Cleanup-Image /ScanHealth

Dism /Online /Cleanup-Image /RestoreHealth
echo.
echo ===================================
echo *      Manutenção concluida!      *
echo ===================================
echo.
timeout /t 5
cls
echo Computador será desligado em 10 segundos      
timeout /t 10
shutdown /s /t 0 /c "Desligamento Programado" /f /d p:4:1 
goto menu

:opcao7
cls
shutdown /r /t 0 /c "Reinicio Programado" /f /d p:4:1 
timeout /t 5
goto menu

:opcao8
cls
shutdown /s /t 0 /c "Desligamento Programado" /f /d p:4:1 
timeout /t 5
goto menu

:opcao9
cls
exit

:opcao10
echo ===============================================
echo * Opcao Invalida! Escolha outra opcao do menu *
echo ===============================================
pause
goto menu