[Setup]
AppName=SNTL-RemoteAccess
AppVersion=1.0.0
AppPublisher=SNTL
AppPublisherURL=https://www.sntl.ma
AppSupportURL=https://www.sntl.ma
AppUpdatesURL=https://www.sntl.ma
DefaultDirName={autopf}\SNTL-RemoteAccess
DefaultGroupName=SNTL-RemoteAccess
OutputBaseFilename=SNTL-RemoteAccess-Setup
UninstallDisplayName=SNTL-RemoteAccess
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin

[Languages]
Name: "french"; MessagesFile: "compiler:Languages\French.isl"

[Tasks]
Name: "desktopicon"; Description: "Créer un raccourci bureau"; GroupDescription: "Icônes supplémentaires"

[Files]
Source: "build\windows\x64\runner\Release\SNTL-RemoteAccess.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "build\windows\x64\runner\Release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs

[Icons]
Name: "{group}\SNTL-RemoteAccess"; Filename: "{app}\SNTL-RemoteAccess.exe"
Name: "{commondesktop}\SNTL-RemoteAccess"; Filename: "{app}\SNTL-RemoteAccess.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\SNTL-RemoteAccess.exe"; Description: "Lancer SNTL-RemoteAccess"; Flags: nowait postinstall skipifsilent