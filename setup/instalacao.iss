; Script para o instalador do SABI 2020

#define AppName "SABI"
#define AppOrganization "Aplicativos do INSS"
#define AppVersion "2020"
#define AppPublisher "Instituto Nacional do Seguro Social"
#define AppURL "https://github.com/douglasralmeida/sabi"

[Setup]

AppId={{C332AE23-68EA-4054-AE8F-2AFF99274BE0}
AppName={#AppName}
AppMutex=a
AppVersion={#AppVersion}
;AppVerName={#AppName} {#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
AllowNoIcons=yes
ChangesAssociations=True
ChangesEnvironment=true
Compression=lzma
DefaultDirName={commonpf32}\{#AppName}
DefaultGroupName={#AppName}
DisableDirPage=yes
DisableProgramGroupPage=yes
DisableReadyPage=yes
DisableWelcomePage=no
MinVersion=0,6.0
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
VersionInfoVersion=1.0.0
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
Name: "atendimento"; Description: "Atendimento ao Cliente do SABI"; Types: compact custom full;
Name: "clinica"; Description: "Atendimento Médico do SABI"; Types: custom full; 
Name: "controle"; Description: "Controle Operacional do SABI"; Types: compact custom full;
Name: "manuais"; Description: "Documentação e Manuais"; Types: compact custom full; 
Name: "apoio"; Description: "Apoio do SABI"; Types: full; 
Name: "admin"; Description: "Administração da Segurança do SABI"; Types: full;
Name: "oracle92"; Description: "Cliente Oracle 9.2"; Types: compact custom full; Flags: fixed;

[Files]
Source: "..\bin\ProgramFiles\Administracao de Seguranca\*"; DestDir: "{app}\Administracao de Seguranca"; Flags: createallsubdirs recursesubdirs; Components: admin;
Source: "..\bin\ProgramFiles\Apoio\*"; DestDir: "{app}\Apoio"; Flags: createallsubdirs recursesubdirs; Components: apoio;
Source: "..\bin\ProgramFiles\Atendimento ao Cliente\*"; DestDir: "{app}\Atendimento ao Cliente"; Flags: createallsubdirs recursesubdirs; Components: atendimento;
Source: "..\bin\ProgramFiles\Atendimento Medico\*"; DestDir: "{app}\Atendimento Medico"; Flags: createallsubdirs recursesubdirs; Components: clinica;
Source: "..\bin\ProgramFiles\Controle Operacional\*"; DestDir: "{app}\Controle Operacional"; Flags: createallsubdirs recursesubdirs; Components: controle;
Source: "..\bin\ProgramFiles\Atualizador\*"; DestDir: "{app}\Atualizador"; Flags: createallsubdirs recursesubdirs; Components: admin apoio atendimento clinica controle;
Source: "..\bin\ProgramFiles\Arquivos Locais\*"; DestDir: "{app}\Arquivos Locais"; Flags: createallsubdirs recursesubdirs; Components: admin apoio atendimento clinica controle;
Source: "..\bin\Oracle92\*"; DestDir: "C:\oracle92"; Flags: createallsubdirs recursesubdirs; Components: oracle92;

[Icons]
Name: "{commondesktop}\Administração de Segurança do SABI"; Filename: "{app}\Administracao de Seguranca\Sads.exe"; WorkingDir: "{app}\Administracao de Seguranca"; Comment: "Abra a Administração de Segurança do SABI."; Components: admin;
Name: "{group}\Administração de Segurança do SABI"; Filename: "{app}\Administracao de Seguranca\Sads.exe"; WorkingDir: "{app}\Administracao de Seguranca"; Comment: "Abra a Administração de Segurança do SABI."; Components: admin;
Name: "{commondesktop}\Apoio do SABI"; Filename: "{app}\Apoio\Apoio.exe"; WorkingDir: "{app}\Apoio"; Comment: "Abra o Apoio do SABI."; Components: apoio;
Name: "{group}\Apoio do SABI"; Filename: "{app}\Apoio\Apoio.exe"; WorkingDir: "{app}\Apoio"; Comment: "Abra o Apoio do SABI."; Components: apoio;
Name: "{commondesktop}\Atendimento ao Cliente do SABI"; Filename: "{app}\Atendimento ao Cliente\Atendimento.exe"; WorkingDir: "{app}\Atendimento ao Cliente"; Comment: "Abra o Atendimento ao Cliente do SABI."; Components: atendimento;
Name: "{group}\Atendimento ao Cliente do SABI"; Filename: "{app}\Atendimento ao Cliente\Atendimento.exe"; WorkingDir: "{app}\Atendimento ao Cliente"; Comment: "Abra o Atendimento ao Cliente do SABI."; Components: atendimento;
Name: "{commondesktop}\Atendimento Médico do SABI"; Filename: "{app}\Atendimento Medico\Clinica.exe"; WorkingDir: "{app}\Atendimento Medico"; Comment: "Abra o Atendimento Médico do SABI."; Components: clinica;
Name: "{group}\Atendimento Médico do SABI"; Filename: "{app}\Atendimento Medico\Clinica.exe"; WorkingDir: "{app}\Atendimento Medico"; Comment: "Abra o Atendimento Médico do SABI."; Components: clinica;
Name: "{group}\Atualizador do SABI"; Filename: "{app}\Atualizador\Atualizador.exe"; WorkingDir: "{app}\Atualizador"; Comment: "Verifique a existência de novas versões do SABI."; Components: admin apoio atendimento clinica controle;
Name: "{commondesktop}\Controle Operacional do SABI"; Filename: "{app}\Controle Operacional\Controle.exe"; WorkingDir: "{app}\Controle Operacional"; Comment: "Abra o Controle Operacional do SABI."; Components: controle;
Name: "{group}\Controle Operacional do SABI"; Filename: "{app}\Controle Operacional\Controle.exe"; WorkingDir: "{app}\Controle Operacional"; Comment: "Abra o Controle Operacional do SABI."; Components: controle;

[Registry]
Root: HKLM; Subkey: "Software\Dataprev"; Flags: uninsdeletekeyifempty;
Root: HKLM; Subkey: "Software\Dataprev\SABI"; Flags: uninsdeletekey;
Root: HKLM; Subkey: "Software\Dataprev\SABI\Componentes";
Root: HKLM; Subkey: "Software\Dataprev\SABI\Componentes"; ValueType: dword; ValueName: "Administração"; ValueData: 1; Components: admin;
Root: HKLM; Subkey: "Software\Dataprev\SABI\Componentes"; ValueType: dword; ValueName: "Apoio"; ValueData: 1; Components: apoio;
Root: HKLM; Subkey: "Software\Dataprev\SABI\Componentes"; ValueType: dword; ValueName: "Atendimento"; ValueData: 1; Components: atendimento;
Root: HKLM; Subkey: "Software\Dataprev\SABI\Componentes"; ValueType: dword; ValueName: "Clinica"; ValueData: 1; Components: clinica;
Root: HKLM; Subkey: "Software\Dataprev\SABI\Componentes"; ValueType: dword; ValueName: "Controle"; ValueData: 1; Components: controle;

[Run]
Filename: "{app}\Atualizador\Atualizador.exe"; Description: "Verificar a existência de novas versões imediatamente."; Flags: nowait postinstall skipifsilent runasoriginaluser;

[Code]
function CreateSoftLink(lpSymlinkFileName, lpTargetFileName: String; dwFlags: Integer): Boolean; external 'CreateSymbolicLinkW@kernel32.dll stdcall';

procedure CriarSABILink;
var
  PastaSabi, PastaLink: string;
begin
  PastaSabi := ExpandConstant('{app}');
  PastaLink := ExpandConstant('{commonpf}\SABI');
  CreateSoftLink(PastaLink, PastaSabi, 1);
end;
  
procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    
    {  Cria um link simbolico que finge ser o executavel SABI para ambientes de 64bits  }
    if IsX64 then
      CriarSABILink;
  end;
end;