# Scripts-Manuten-o-PC
Scripts Manutenção Windows.

Esse script server para as seguintes opções:

1. Apagar Arquivos Temporários do Windows

  Nesta opção as seguintes pasta são esvaziadas: 
  C:\windows\temp\
  C:\Documents and settings\%username%\Config~1\tempor~1
  C:\Documents and settings\%username%\Config~1\temp  
  Arquivos da Lixeira do Windows
  
2. Apagar Arquivos Temporários do Windows Completa

  Nesta opção as seguintes pasta são esvaziadas: 
  C:\windows\temp\
  C:\Documents and settings\%username%\Config~1\tempor~1
  C:\Documents and settings\%username%\Config~1\temp  
  Arquivos da Lixeira do Windows
  C:\Windows\Prefetch  
  
3. Esvaziar Spooler de Impressão.

4. Apagar Arq. Pasta Downloads

5. Verificador do Windows, repara arquivos ausentes ou corrompidos

  Nesta opção os seguintes comandos são utilizados: 
    sfc /scannow
    Dism /Online /Cleanup-Image /ScanHealth
    Dism /Online /Cleanup-Image /RestoreHealth
    
6. Reiniciar

7. Desligar
