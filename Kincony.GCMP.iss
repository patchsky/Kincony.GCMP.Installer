﻿; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "智能房车管理系统 - GCMP"
#define MyAppVersion "1.0"
#define MyAppPublisher "Kincony"
#define MyAppURL "http://127.0.0.1:8190/Kincony.GCMP-1.0.0/"
#define MyAppExeName "{pf}\internet explorer\iexplore.exe localhost:8190/Kincony.GCMP/"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{AD582ED2-0FB1-47EA-81DD-8A83A30B604A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultGroupName={#MyAppName}
DefaultDirName={pf}\GCMP
DisableProgramGroupPage=yes
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes
DisableWelcomePage=no
ChangesEnvironment=true

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "chinesesimplified"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked


[Files]
Source: "D:\Share\InstallationBase\Install\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Registry]
Root: "HKLM"; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: string; ValueName: "JAVA_HOME"; ValueData: "{app}\JavaSDK"; Flags: deletevalue preservestringtype
Root: "HKLM"; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: string; ValueName: "CATALINA_HOME"; ValueData: "{app}\Tomcat"; Flags: deletevalue preservestringtype
;Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};%JAVA_HOME%"; Check: NeedsAddPath('%JAVA_HOME%')

[Icons]
;Name: "{group}\{#MyAppName}"; Filename: "{MyAppURL}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{#MyAppURL}"; Tasks: desktopicon

[INI]
Filename: "{app}\Metadata-MySql\My.ini"; Section: "mysqld"; Key: "basedir"; String: "{app}\Metadata-MySql";
Filename: "{app}\Metadata-MySql\My.ini"; Section: "mysqld"; Key: "datadir"; String: "{app}\Metadata-MySql\data";

[Run]
;Register Tomcat service
Filename: {app}\Tomcat\bin\service.bat; Parameters: "install Kincony.GCMP.Tomcat"; WorkingDir: {app}\Tomcat\bin; Flags: skipifdoesntexist; StatusMsg: "Tomcat service is being installed. Please wait..."

;Start Tomcat service
Filename: net.exe; Parameters: "start Kincony.GCMP.Tomcat"; WorkingDir: {sys}; Flags: skipifdoesntexist; StatusMsg: "Tomcat service is being started. Please wait..."

;Register MySql service
Filename: {app}\Metadata-MySql\bin\mysqld.exe; Parameters: "install Kincony.GCMP.MySql"; WorkingDir: {app}\Metadata-MySql\bin; Flags: skipifdoesntexist; StatusMsg: "MySql service is being installed. Please wait..."

;Start MySql service
Filename: net.exe; Parameters: "start Kincony.GCMP.MySql"; WorkingDir: {sys}; Flags: skipifdoesntexist; StatusMsg: "MySql service is being started. Please wait..."

;Start service

[UninstallRun]
Filename: net.exe; Parameters: "stop Kincony.GCMP.Tomcat"; WorkingDir: {sys}; Flags: skipifdoesntexist; StatusMsg: "Tomcat service is being uninstalled. Please wait..."
Filename: sc.exe; Parameters: "delete Kincony.GCMP.Tomcat"; WorkingDir: {sys}; Flags: skipifdoesntexist; StatusMsg: "Tomcat service is being uninstalled. Please wait..."

Filename: net.exe; Parameters: "stop Kincony.GCMP.MySql"; WorkingDir: {sys}; Flags: skipifdoesntexist; StatusMsg: "MySql service is being uninstalled. Please wait..."
Filename: sc.exe; Parameters: "delete Kincony.GCMP.MySql"; WorkingDir: {sys}; Flags: skipifdoesntexist; StatusMsg: "MySql service is being uninstalled. Please wait..."

