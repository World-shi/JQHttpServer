; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "uk"
#define MyAppVersion "1.0"
#define MyAppPublisher "hzpd, Inc."
#define MyAppURL "http://www.99cms.cn/"
#define MyAppExeName "UserKey.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{78801EF3-00A8-4817-8ECB-C70D5CB9DB57}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableDirPage=no
DisableProgramGroupPage=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=.\Output
OutputBaseFilename=uk_setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "install\UserKey.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "install\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[registry]
Root:HKCR;Subkey:hduk;ValueType:string;ValueData:URL:hduk;Flags: uninsdeletekey
Root:HKCR;Subkey:hduk;ValueType:string;ValueName:URL Protocol;Flags: uninsdeletekey
Root:HKCR;Subkey:hduk\DefaultIcon;ValueType:string;ValueData:{app}\{#MyAppExeName},2;Flags: uninsdeletekey
Root:HKCR;Subkey:hduk\shell;ValueType:none;Flags: uninsdeletekey
Root:HKCR;Subkey:hduk\shell\open\;ValueType:none;Flags: uninsdeletekey
Root:HKCR;Subkey:hduk\shell\open\command;ValueType:string;ValueData:"""{app}\{#MyAppExeName}"" ""%1""";Flags: uninsdeletekey

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
 
;[Code]
;var
; vc_redistx86: Boolean;

;function InitializeSetup(): Boolean;
;begin
;  if RegValueExists(HKCR, '\Installer\Dependencies\VC,redist.x86,x86,14.26,bundle', 'Version') // Microsoft Visual C++ 2005-2019 Redistributable X86
;then
;    begin
;        vc_redistx86 := false;
;    end
;else
;    begin
;        vc_redistx86 := true;
;    end;
;  result := true; 
;end;
;function CheckVcredistx86(): Boolean;
;begin
;  result := vc_redistx86;
;end;

;[Run]
;Filename: "{app}\vc_redist.x86.exe"; Description: "Setting VC environment variables"; Check: CheckVcredistx86


[Run]
Filename: "{app}\{#MyAppExeName}"; Parameters:"ukey"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: skipifsilent runascurrentuser
Filename: "notepad.exe"; Parameters:"{app}\ukey.txt";Description:"Check the userkey";Flags: nowait postinstall skipifsilent runascurrentuser