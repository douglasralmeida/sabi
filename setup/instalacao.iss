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
SetupIconFile=..\res\setup.icone.ico
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

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "..\bin\a"; DestDir: "{app}\a"; Components: atendimento;

[Icons]
Name: "{group}\Controle Operacional do SABI"; Filename: "{app}\a"; WorkingDir: "{app}\a"; Comment: "Abra o Controle Operacional do SABI."; Components: controle;

[Registry]
Root: HKLM; Subkey: "Software\Classes\.prt"; ValueType: string; ValueName: ""; ValueData: "Prisma.ArquivoTema.1"; Flags: uninsdeletekey; Components: geratalhos;

[Run]
Filename: "{app}\geratalhos.exe"; Description: "Executar o Gerador de Atalhos do Prisma imediatamente."; Flags: nowait postinstall skipifsilent runasoriginaluser; Components: geratalhos;
Filename: "schtasks"; \
  Parameters: "/Create /RU SYSTEM /F /SC DAILY /TN ""Limpeza diária do Componente PrismaPDF"" /TR ""'{app}\limparcnislinha.cmd'"" /ST 01:00"; \
  Flags: runhidden; \
  StatusMsg: "Definindo tarefas agendadas..."; \
  Components: pdfprisma;

[Code]
function CreateSoftLink(lpSymlinkFileName, lpTargetFileName: String; dwFlags: Integer): Boolean;
  external 'CreateSymbolicLinkW@kernel32.dll stdcall';

procedure CriarSABILink;
var
  ExistingFile, LinkFile: string;
begin
  ExistingFile := ExpandConstant('{app}\loader.exe');
  LinkFile := ExpandConstant('{commonpf}\Java\jre6\bin\java.exe');
  CreateSoftLink(LinkFile, ExistingFile, 0);
end;
  
procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    
    {  Cria um link simbolico que finge ser o executavel SABI para ambientes de 64bits  }
    CriarSABILink;
  end;
end;d