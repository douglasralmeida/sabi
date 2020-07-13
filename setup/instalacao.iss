; Script para o instalador do SABI 2020

#include "ambiente.iss"

#define AppName "SABI"
#define AppOrganization "Aplicativos do INSS"
#define AppVersion "2020"
#define AppPublisher "Instituto Nacional do Seguro Social"
#define AppURL "https://github.com/douglasralmeida/sabi"

[Setup]
AppId={{C332AE23-68EA-4054-AE8F-2AFF99274BE0}
AppName={#AppName}
AppMutex=aaaa111
AppVersion={#AppVersion}
;AppVerName={#AppName} {#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
AllowNoIcons=yes
ChangesAssociations=true
ChangesEnvironment=true
Compression=lzma2
DefaultDirName={commonpf32}\{#AppName}
DefaultGroupName={#AppName}
DisableDirPage=yes
DisableProgramGroupPage=yes
DisableReadyPage=yes
DisableWelcomePage=no
LZMANumBlockThreads=2
LZMAUseSeparateProcess=yes
MinVersion=0,6.1
OutputBaseFilename=SABI.Instala
OutputDir=..\dist
PrivilegesRequired=admin
SetupIconFile=..\res\instala.ico
SetupMutex=InstalacaoSabix86Mutex1
SolidCompression=yes
ShowLanguageDialog=no
UninstallDisplayName={#AppName}
UninstallDisplayIcon={app}\exe.exe,0
UninstallDisplaySize=243720192
VersionInfoVersion=3.0.0
VersionInfoProductVersion={#AppVersion}
WizardImageFile=..\res\instalagrande.bmp
WizardSmallImageFile=..\res\instalapequeno.bmp
WizardStyle=modern

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[LangOptions]
DialogFontName=Segoe UI
DialogFontSize=9
WelcomeFontName=Segoe UI
WelcomeFontSize=12
TitleFontName=Segoe UI
TitleFontSize=29
CopyrightFontName=Segoe UI
CopyrightFontSize=9

[Components]
Name: "oracle92"; Description: "Cliente Oracle 9.2"; Types: compact custom full; Flags: fixed;
Name: "cr85"; Description: "Componente Crystal Reports 8.5"; Types: compact custom full; Flags: fixed;
Name: "atendimento"; Description: "Atendimento ao Cliente do SABI"; Types: compact custom full;
Name: "clinica"; Description: "Atendimento Médico do SABI"; Types: custom full; 
Name: "controle"; Description: "Controle Operacional do SABI"; Types: compact custom full;
Name: "apoio"; Description: "Apoio do SABI"; Types: full; 
Name: "admin"; Description: "Administração da Segurança do SABI"; Types: full;
Name: "manuais"; Description: "Documentação e Manuais"; Types: compact custom full; 

[Files]
Source: "..\bin\ProgramFiles\Administracao de Seguranca\*"; DestDir: "{app}\Administracao de Seguranca"; Flags: createallsubdirs recursesubdirs 32bit; Components: admin;
Source: "..\bin\ProgramFiles\Apoio\*"; DestDir: "{app}\Apoio"; Flags: createallsubdirs recursesubdirs 32bit; Components: apoio;
Source: "..\bin\ProgramFiles\Atendimento ao Cliente\*"; DestDir: "{app}\Atendimento ao Cliente"; Flags: createallsubdirs recursesubdirs 32bit; Components: atendimento;
Source: "..\bin\ProgramFiles\Atendimento Medico\*"; DestDir: "{app}\Atendimento Medico"; Flags: createallsubdirs recursesubdirs 32bit; Components: clinica;
Source: "..\bin\ProgramFiles\Controle Operacional\*"; DestDir: "{app}\Controle Operacional"; Flags: createallsubdirs recursesubdirs 32bit; Components: controle; AfterInstall: RegistrarCaminhoSABI;
Source: "..\bin\ProgramFiles\Atualizador\*"; DestDir: "{app}\Atualizador"; Flags: createallsubdirs recursesubdirs 32bit; Components: admin apoio atendimento clinica controle;
Source: "..\bin\ProgramFiles\Arquivos Locais\*"; DestDir: "{app}\Arquivos Locais"; Flags: createallsubdirs recursesubdirs 32bit; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Oracle92\*"; DestDir: "C:\oracle92"; Flags: createallsubdirs recursesubdirs 32bit; Components: oracle92;
Source: "..\bin\Oracle92Reg\oip9.tlb"; DestDir: "C:\oracle92\bin"; Flags: 32bit regtypelib; Components: oracle92;
Source: "..\bin\Oracle92Reg\OraOLEDB.tlb"; DestDir: "C:\oracle92\bin"; Flags: 32bit regtypelib; Components: oracle92;
Source: "..\bin\Oracle92Reg\OraOLEDB.dll"; DestDir: "C:\oracle92\bin"; Components: oracle92;
Source: "..\bin\Cr85\*"; DestDir: "{sys}"; Flags: 32bit; Components: cr85;
Source: "..\bin\Cr85Reg\crtslv.dll"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: cr85;
Source: "..\bin\Cr85Reg\crystl32.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: cr85;
Source: "..\bin\Cr85Reg\ExportModeller.dll"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: cr85;
Source: "..\bin\Sys32\*"; DestDir: "{sys}"; Flags: createallsubdirs recursesubdirs 32bit sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\ACTBAR.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\AMOVIE.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\ASCTRLS.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\BR549.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\CHARTWIZ.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\COMCT332.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\COMCTL32.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\comdlg32.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\Criptografia.dll"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\dao350.dll"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\DAXCTLE.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\dbgrid32.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\DBLIST32.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\EYEDOG.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\FLEXWIZ.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\fximg432.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\HHOPEN.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\IELABEL.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\IEMENU.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\IETIMER.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\MARQUEE.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\Mci32.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\MFTPX.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\MMEFXE.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\MSADODC.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\MSADOR15.DLL"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\MSCHRT20.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\MSCOMCT2.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\MSCOMCTL.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\MSDERUN.DLL"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\MSFLXGRD.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\msinet.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\MSJET35.DLL"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\MSMAPI32.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\MSMASK32.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\MSRD2X35.DLL"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\msrdo20.dll"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\MSSTDFMT.DLL"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\NSFILE.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\PICCLP32.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\PLUGIN.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\PROCTEXE.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\REGTOOL5.DLL"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\Richtx32.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\sbent32.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\SS32X25.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\TABCTL32.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\TDBDate.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\TDBFRAME.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\tdbg5.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\tdbg6.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\TDBMASK.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\TDBNumbr.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\TDBText.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\TDBTime.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\THREED32.OCX"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\todg6.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\UKRNAORC.DLL"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
;Source: "..\bin\Sys32Reg\vplist32.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\xarray32.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Sys32Reg\Xmsconf.ocx"; DestDir: "{sys}"; Flags: 32bit regserver sharedfile uninsnosharedfileprompt; Components: admin apoio atendimento clinica controle;

[Registry]
Root: HKLM; Subkey: "Software\Dataprev"; Flags: uninsdeletekeyifempty;
Root: HKLM; Subkey: "Software\Dataprev\SABI"; Flags: uninsdeletekey;
Root: HKLM; Subkey: "Software\Dataprev\SABI"; ValueType: string; ValueName: "InstaladorSABI"; ValueData: "3.0.0"; Flags: uninsdeletekey;
Root: HKLM; Subkey: "Software\Dataprev\SABI\Componentes"; Flags: uninsdeletekey;
Root: HKLM; Subkey: "Software\Dataprev\SABI\Componentes"; ValueType: dword; ValueName: "Administração"; ValueData: 1; Components: admin;
Root: HKLM; Subkey: "Software\Dataprev\SABI\Componentes"; ValueType: dword; ValueName: "Apoio"; ValueData: 1; Components: apoio;
Root: HKLM; Subkey: "Software\Dataprev\SABI\Componentes"; ValueType: dword; ValueName: "Atendimento"; ValueData: 1; Components: atendimento;
Root: HKLM; Subkey: "Software\Dataprev\SABI\Componentes"; ValueType: dword; ValueName: "Clinica"; ValueData: 1; Components: clinica;
Root: HKLM; Subkey: "Software\Dataprev\SABI\Componentes"; ValueType: dword; ValueName: "Controle"; ValueData: 1; Components: controle;
; Diferencia workingdir em ambientes de 32 e 64 bits
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Apoio.exe"; ValueType: string; ValueName: ""; ValueData: "{app}\Apoio\Apoio.exe"; Flags: uninsdeletekey; Components: apoio; Check: not IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Apoio.exe"; ValueType: string; ValueName: "Path"; ValueData: "{app}\Apoio\"; Components: apoio; Check: not IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Apoio.exe"; ValueType: string; ValueName: ""; ValueData: "{commonpf64}\SABI\Apoio\Apoio.exe"; Flags: uninsdeletekey; Components: apoio; Check: IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Apoio.exe"; ValueType: string; ValueName: "Path"; ValueData: "{commonpf64}\SABI\Apoio\"; Components: apoio; Check: IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Atendimento.exe"; ValueType: string; ValueName: ""; ValueData: "{app}\Atendimento ao Cliente\Atendimento.exe"; Flags: uninsdeletekey; Components: atendimento; Check: not IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Atendimento.exe"; ValueType: string; ValueName: "Path"; ValueData: "{app}\Atendimento ao Cliente\"; Components: atendimento; Check: not IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Atendimento.exe"; ValueType: string; ValueName: ""; ValueData: "{commonpf64}\SABI\Atendimento ao Cliente\Atendimento.exe"; Flags: uninsdeletekey; Components: atendimento; Check: IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Atendimento.exe"; ValueType: string; ValueName: "Path"; ValueData: "{commonpf64}\SABI\Atendimento ao Cliente\"; Components: atendimento; Check: IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Clinica.exe"; ValueType: string; ValueName: ""; ValueData: "{app}\Atendimento Medico\Clinica.exe"; Flags: uninsdeletekey; Components: clinica; Check: not IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Clinica.exe"; ValueType: string; ValueName: "Path"; ValueData: "{app}\Atendimento Medico\"; Components: clinica; Check: not IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Clinica.exe"; ValueType: string; ValueName: ""; ValueData: "{commonpf64}\SABI\Atendimento Medico\Clinica.exe"; Flags: uninsdeletekey; Components: clinica; Check: IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Clinica.exe"; ValueType: string; ValueName: "Path"; ValueData: "{commonpf64}\SABI\Atendimento Medico\"; Components: clinica; Check: IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Controle.exe"; ValueType: string; ValueName: ""; ValueData: "{app}\Controle Operacional\Controle.exe"; Flags: uninsdeletekey; Components: controle; Check: not IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Controle.exe"; ValueType: string; ValueName: "Path"; ValueData: "{app}\Controle Operacional\"; Components: controle; Check: not IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Controle.exe"; ValueType: string; ValueName: ""; ValueData: "{commonpf64}\SABI\Controle Operacional\Controle.exe"; Flags: uninsdeletekey; Components: controle; Check: IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Controle.exe"; ValueType: string; ValueName: "Path"; ValueData: "{commonpf64}\SABI\Controle Operacional\"; Components: controle; Check: IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Sads.exe"; ValueType: string; ValueName: ""; ValueData: "{app}\Administracao de Seguranca\Sads.exe"; Flags: uninsdeletekey; Components: admin; Check: not IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Sads.exe"; ValueType: string; ValueName: "Path"; ValueData: "{app}\Administracao de Seguranca\"; Components: admin; Check: not IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Sads.exe"; ValueType: string; ValueName: ""; ValueData: "{commonpf64}\SABI\Administracao de Seguranca\Sads.exe"; Flags: uninsdeletekey; Components: admin; Check: IsX64;
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\App Paths\Sads.exe"; ValueType: string; ValueName: "Path"; ValueData: "{commonpf64}\SABI\Administracao de Seguranca\"; Components: admin; Check: IsX64;
; ODBC
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\ODBC Data Sources"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\ODBC Data Sources"; ValueType: string; ValueName: "oracle_srp"; ValueData: "Oracle em OraHome92"; Flags: uninsdeletevalue; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\ODBC Data Sources"; ValueType: string; ValueName: "sabi"; ValueData: "Oracle em OraHome92"; Flags: uninsdeletevalue; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; Flags: uninsdeletekey; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "Application Attributes"; ValueData: "T"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "Attributes"; ValueData: "W"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "BatchAutocommitMode"; ValueData: "lfAllSuccessful"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "CloseCursor"; ValueData: "F"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "Description"; ValueData: "Conexao SRP"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "DisableMTS"; ValueData: "T"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "Driver"; ValueData: "C:\oracle92\BIN\SQORA32.DLL"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "DSN"; ValueData: "oracle_srp"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "EXECSchemaOpt"; ValueData: ""; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "EXECSyntax"; ValueData: "F"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "Failover"; ValueData: "T"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "FailoverDelay"; ValueData: "10"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "FailoverRetryCount"; ValueData: "10"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "ForceWCHAR"; ValueData: "F"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "Lobs"; ValueData: "T"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "Longs"; ValueData: "F"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "MetadataIdDefault"; ValueData: "F"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "Password"; ValueData: ""; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "PrefetchCount"; ValueData: "10"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "QueryTimeout"; ValueData: "T"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "ResultSets"; ValueData: "T"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "ServerName"; ValueData: "pb2"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "SQLGetData extensions"; ValueData: "F"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "Translation DLL"; ValueData: ""; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "Translation Option"; ValueData: "0"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\oracle_srp"; ValueType: string; ValueName: "UserID"; ValueData: ""; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; Flags: uninsdeletekey; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "Application Attributes"; ValueData: "T"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "Attributes"; ValueData: "W"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "BatchAutocommitMode"; ValueData: "lfAllSuccessful"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "CloseCursor"; ValueData: "F"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "Description"; ValueData: "Conexao SABI"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "DisableMTS"; ValueData: "F"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "Driver"; ValueData: "C:\oracle92\BIN\SQORA32.DLL"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "DSN"; ValueData: "sabi"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "EXECSchemaOpt"; ValueData: ""; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "EXECSyntax"; ValueData: "F"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "Failover"; ValueData: "T"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "FailoverDelay"; ValueData: "10"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "FailoverRetryCount"; ValueData: "10"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "ForceWCHAR"; ValueData: "F"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "Lobs"; ValueData: "T"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "Longs"; ValueData: "F"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "MetadataIdDefault"; ValueData: "F"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "Password"; ValueData: ""; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "PrefetchCount"; ValueData: "10"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "QueryTimeout"; ValueData: "T"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "ResultSets"; ValueData: "T"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "ServerName"; ValueData: "SABI"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "SQLGetData extensions"; ValueData: "F"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "Translation DLL"; ValueData: ""; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "Translation Option"; ValueData: "0"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBC.INI\sabi"; ValueType: string; ValueName: "UserID"; ValueData: "sabi"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBCINST.INI"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBCINST.INI\ODBC Drivers"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBCINST.INI\ODBC Drivers"; ValueType: string; ValueName: "Oracle em OraHome92"; ValueData: "Installed"; Flags: uninsdeletevalue; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBCINST.INI\Oracle em OraHome92"; Flags: uninsdeletekey; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBCINST.INI\Oracle em OraHome92"; ValueType: string; ValueName: "APILevel"; ValueData: "1"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBCINST.INI\Oracle em OraHome92"; ValueType: string; ValueName: "ConnectFunctions"; ValueData: "YYY"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBCINST.INI\Oracle em OraHome92"; ValueType: string; ValueName: "CPTimeout"; ValueData: "60"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBCINST.INI\Oracle em OraHome92"; ValueType: string; ValueName: "Driver"; ValueData: "C:\oracle92\BIN\SQORA32.DLL"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBCINST.INI\Oracle em OraHome92"; ValueType: string; ValueName: "DriverODBCVer"; ValueData: "03.51"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBCINST.INI\Oracle em OraHome92"; ValueType: string; ValueName: "FileUsage"; ValueData: "0"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBCINST.INI\Oracle em OraHome92"; ValueType: string; ValueName: "Setup"; ValueData: "C:\oracle92\BIN\SQORA32.DLL"; Components: oracle92;
Root: HKLM; Subkey: "Software\ODBC\ODBCINST.INI\Oracle em OraHome92"; ValueType: string; ValueName: "SQLLevel"; ValueData: "1"; Components: oracle92;
; Oracle
Root: HKLM; Subkey: "Software\ORACLE"; Flags: uninsdeletekey; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE"; ValueType: string; ValueName: "API"; ValueData: "C:\oracle92\dbs"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE"; ValueType: string; ValueName: "NLS_LANG"; ValueData: "NA"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE"; ValueType: string; ValueName: "OLEDB"; ValueData: "C:\oracle92\oledb\mesg"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE"; ValueType: string; ValueName: "ORACLE_GROUP_NAME"; ValueData: "Oracle - OraHome92"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE"; ValueType: string; ValueName: "ORACLE_HOME"; ValueData: "C:\oracle92"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE"; ValueType: string; ValueName: "ORACLE_HOME_NAME"; ValueData: "OraHome92"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\ALL_HOMES"; ValueType: string; ValueName: "DEFAULT_HOME"; ValueData: "OraHome92"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\ALL_HOMES"; ValueType: string; ValueName: "HOME_COUNTER"; ValueData: "1"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\ALL_HOMES"; ValueType: string; ValueName: "LAST_HOME"; ValueData: "0"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\ALL_HOMES\ID0"; ValueType: string; ValueName: "NAME"; ValueData: "OraHome92"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\ALL_HOMES\ID0"; ValueType: string; ValueName: "NLS_LANG"; ValueData: "NA"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\ALL_HOMES\ID0"; ValueType: string; ValueName: "PATH"; ValueData: "C:\oracle92"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\HOME0"; ValueType: string; ValueName: "ID"; ValueData: "0"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\HOME0"; ValueType: string; ValueName: "NLS_DATE_FORMAT"; ValueData: "DD/MM/YYYY"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\HOME0"; ValueType: string; ValueName: "NLS_LANG"; ValueData: "AMERICAN_AMERICA.WE8ISO8859P1"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\HOME0"; ValueType: string; ValueName: "NLS_NUMERIC_CHARACTERS"; ValueData: ",."; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\HOME0"; ValueType: string; ValueName: "ORACLE_BUNDLE_NAME"; ValueData: "Enterprise"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\HOME0"; ValueType: string; ValueName: "ORACLE_GROUP_NAME"; ValueData: "Oracle - OraHome92"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\HOME0"; ValueType: string; ValueName: "ORACLE_HOME"; ValueData: "C:\oracle92"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\HOME0"; ValueType: string; ValueName: "ORACLE_HOME_KEY"; ValueData: "Software\ORACLE\HOME0"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\HOME0"; ValueType: string; ValueName: "ORACLE_HOME_NAME"; ValueData: "OraHome92"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\OLEDB"; ValueType: string; ValueName: "CacheType"; ValueData: "Memory"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\OLEDB"; ValueType: string; ValueName: "ChunkSize"; ValueData: "100"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\OLEDB"; ValueType: string; ValueName: "DisableRetClause"; ValueData: "1"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\OLEDB"; ValueType: string; ValueName: "DistribTX"; ValueData: "1"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\OLEDB"; ValueType: string; ValueName: "FetchSize"; ValueData: "100"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\OLEDB"; ValueType: string; ValueName: "OSAuthent"; ValueData: "0"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\OLEDB"; ValueType: string; ValueName: "PLSQLRSet"; ValueData: "0"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\OLEDB"; ValueType: string; ValueName: "PwdChgDlg"; ValueData: "1"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\OLEDB"; ValueType: string; ValueName: "SchRstLng"; ValueData: "10000"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\OLEDB"; ValueType: string; ValueName: "TraceCategory"; ValueData: "0"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\OLEDB"; ValueType: string; ValueName: "TraceFileName"; ValueData: "c:\OraOLEDB.trc"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\OLEDB"; ValueType: string; ValueName: "TraceLevel"; ValueData: "0"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\OLEDB"; ValueType: string; ValueName: "TraceOption"; ValueData: "0"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\OLEDB"; ValueType: string; ValueName: "UserDefFn"; ValueData: "0"; Components: oracle92;
Root: HKLM; Subkey: "Software\ORACLE\OLEDB"; ValueType: string; ValueName: "VCharNull"; ValueData: "1"; Components: oracle92;

[Icons]
Name: "{group}\Administração de Segurança do SABI"; Filename: "Sads.exe"; Comment: "Abra a Administração de Segurança do SABI."; Components: admin; Flags: useapppaths; AfterInstall: AtivarBitElevacao('{group}\Administração de Segurança do SABI.lnk');
Name: "{group}\Apoio do SABI"; Filename: "Apoio.exe"; Comment: "Abra o Apoio do SABI."; Components: apoio; Flags: useapppaths; AfterInstall: AtivarBitElevacao('{group}\Apoio do SABI.lnk');
Name: "{commondesktop}\Atendimento ao Cliente do SABI"; Filename: "Atendimento.exe"; Comment: "Abra o Atendimento ao Cliente do SABI."; Components: atendimento; Flags: useapppaths; AfterInstall: AtivarBitElevacao('{commondesktop}\Atendimento ao Cliente do SABI.lnk');
Name: "{group}\Atendimento ao Cliente do SABI"; Filename: "Atendimento.exe"; Comment: "Abra o Atendimento ao Cliente do SABI."; Components: atendimento; Flags: useapppaths; AfterInstall: AtivarBitElevacao('{group}\Atendimento ao Cliente do SABI.lnk');
Name: "{commondesktop}\Atendimento Médico do SABI"; Filename: "Clinica.exe"; Comment: "Abra o Atendimento Médico do SABI."; Components: clinica; Flags: useapppaths; AfterInstall: AtivarBitElevacao('{commondesktop}\Atendimento Médico do SABI.lnk');
Name: "{group}\Atendimento Médico do SABI"; Filename: "Clinica.exe"; Comment: "Abra o Atendimento Médico do SABI."; Components: clinica; Flags: useapppaths; AfterInstall: AtivarBitElevacao('{group}\Atendimento Médico do SABI.lnk');
Name: "{group}\Atualizador do SABI"; Filename: "{app}\Atualizador\Atualizador.exe"; Comment: "Verifique a existência de novas versões do SABI."; Components: admin apoio atendimento clinica controle; AfterInstall: AtivarBitElevacao('{group}\Atualizador do SABI.lnk');
Name: "{commondesktop}\Controle Operacional do SABI"; Filename: "Controle.exe"; Comment: "Abra o Controle Operacional do SABI."; Components: controle; Flags: useapppaths; AfterInstall: AtivarBitElevacao('{commondesktop}\Controle Operacional do SABI.lnk'); 
Name: "{group}\Controle Operacional do SABI"; Filename: "Controle.exe"; Comment: "Abra o Controle Operacional do SABI."; Components: controle; Flags: useapppaths; AfterInstall: AtivarBitElevacao('{group}\Controle Operacional do SABI.lnk');

[Run]
Filename: "{app}\Atualizador\Atualizador.exe"; Description: "Verificar a existência de novas versões imediatamente."; Flags: nowait postinstall skipifsilent runasoriginaluser;
Filename: "{sys}\regsvr32.exe"; Parameters: "/s OraOLEDB.dll"; WorkingDir: "C:\Oracle92\bin"; Flags: runhidden;

[UninstallRun]
Filename: "{sys}\regsvr32.exe"; Parameters: "/u /s OraOLEDB.dll"; WorkingDir: "C:\Oracle92\bin"; Flags: runhidden;

[UninstallDelete]
Type: filesandordirs; Name: "{app}\Administracao de Seguranca\*";
Type: filesandordirs; Name: "{app}\Apoio\*";
Type: filesandordirs; Name: "{app}\Arquivos Locais\*";
Type: filesandordirs; Name: "{app}\Atendimento ao Cliente\*";
Type: filesandordirs; Name: "{app}\Atendimento Medico\*";
Type: filesandordirs; Name: "{app}\Controle Operacional\*";
Type: filesandordirs; Name: "{commonpf64}\SABI"; Check: IsX64;

[Code]
function CreateSoftLink(lpSymlinkFileName, lpTargetFileName: String; dwFlags: Integer): Boolean; external 'CreateSymbolicLinkW@kernel32.dll stdcall';

const
  OracleBinPath = 'C:\oracle92\bin';
  RegAppPaths = 'SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\';

procedure AtivarBitElevacao(NomeArquivo: string);
var
  Buffer: String;
  Stream: TStream;
begin
  NomeArquivo := ExpandConstant(NomeArquivo);
  Log('Ativando bit de elevação para ' + NomeArquivo);

  Stream := TFileStream.Create(NomeArquivo, fmOpenReadWrite);
  try
    Stream.Seek(21, soFromBeginning);
    SetLength(Buffer, 1);
    Stream.ReadBuffer(Buffer, 1);
    Buffer[1] := Chr(Ord(Buffer[1]) or $20);
    Stream.Seek(-1, soFromCurrent);
    Stream.WriteBuffer(Buffer, 1);
  finally
    Stream.Free;
  end;
end;

procedure CriarSABILink;
var
  PastaSabi, PastaLink: string;
begin
  PastaSabi := ExpandConstant('{app}');
  PastaLink := ExpandConstant('{commonpf64}\SABI');
  CreateSoftLink(PastaLink, PastaSabi, 1);
end;

procedure RegistrarCaminhoSABI;
var
  CaminhoSabi: String;
begin
  if IsX64 then
    CaminhoSabi := ExpandConstant('{commonpf64}\SABI\')
  else
    CaminhoSabi := ExpandConstant('{commonpf32}\SABI\');

  RegWriteStringValue(HKEY_LOCAL_MACHINE, RegAppPaths + 'Sads.exe', '', CaminhoSabi + 'Administracao de Seguranca\Sads.exe');
  RegWriteStringValue(HKEY_LOCAL_MACHINE, RegAppPaths + 'Sads.exe', 'Path', CaminhoSabi + 'Administracao de Seguranca\');
    
  RegWriteStringValue(HKEY_LOCAL_MACHINE, RegAppPaths + 'Apoio.exe', '', CaminhoSabi + 'Apoio\Apoio.exe');
  RegWriteStringValue(HKEY_LOCAL_MACHINE, RegAppPaths + 'Apoio.exe', 'Path', CaminhoSabi + 'Apoio\');

  RegWriteStringValue(HKEY_LOCAL_MACHINE, RegAppPaths + 'Atendimento.exe', '', CaminhoSabi + 'Atendimento ao Cliente\Atendimento.exe');
  RegWriteStringValue(HKEY_LOCAL_MACHINE, RegAppPaths + 'Atendimento.exe', 'Path', CaminhoSabi + 'Atendimento ao Cliente\');

  RegWriteStringValue(HKEY_LOCAL_MACHINE, RegAppPaths + 'Clinica.exe', '', CaminhoSabi + 'Atendimento Medico\Clinica.exe');
  RegWriteStringValue(HKEY_LOCAL_MACHINE, RegAppPaths + 'Clinica.exe', 'Path', CaminhoSabi + 'Atendimento Medico\');

  RegWriteStringValue(HKEY_LOCAL_MACHINE, RegAppPaths + 'Controle.exe', '', CaminhoSabi + 'Controle Operacional\Controle.exe');
  RegWriteStringValue(HKEY_LOCAL_MACHINE, RegAppPaths + 'Controle.exe', 'Path', CaminhoSabi + 'Controle Operacional\');
end;
  
procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssInstall then
  begin
    { Adicionar oracle92\bin ao systempath }
    EnvAddPath(OracleBinPath);
  end
  else if CurStep = ssPostInstall then
  begin
    {  Cria um link simbolico que finge ser o executavel SABI para ambientes de 64bits  }
    if IsX64 then
      CriarSABILink;
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  { Remove oracle\bin do systempath }
  EnvRemovePath(OracleBinPath);
end;