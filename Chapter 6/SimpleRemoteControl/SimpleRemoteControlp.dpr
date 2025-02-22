program SimpleRemoteControlp;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Commands in 'Commands.pas',
  Objects in 'Objects.pas',
  SimpleRemoteControl in 'SimpleRemoteControl.pas';

var
	RemoteControl: TSimpleRemoteControl;
  LivingRoomLights: TLights;
  GarageDoor: TGarage;
  KitchenLight: TLights;
  CeilingFan: TCeilingFan;
  Stereo: TStereo;
  TV: TTV;
  Hottub: THottub;
  LivingRoomLightsOnCommand: TLightsOnCommand;
  LivingRoomLightsOffCommand: TLightsOffCommand;
  KitchenLightOnCommand: TLightsOnCommand;
  KitchenLightOffCommand: TLightsOffCommand;
  CeilingFanHighCommand: TCeilingFanHighCommand;
  CeilingFanMediumCommand: TCeilingFanMediumCommand;
  CeilingFanLowCommand: TCeilingFanLowCommand;
  CeilingFanOffCommand: TCeilingFanOffCommand;
  GarageOpenCommand: TGarageDoorOpenCommand;
  GarageCloseCommand: TGarageDoorCloseCommand;
  StereoOnCommand: TStereoOnForCDCommand;
  StereoOffCommand: TStereoOffCommand;
  PartyOnMacro: TMacroCommand;
  PartyOffMacro: TMacroCommand;
  PartyOnCommands: TArray<ICommand>;
  PartyOffCommands: TArray<ICommand>;     	
  TVOnCommand: TTVOnCommand; 
  TVOffCommand: TTVOffCommand;
  HottubOnCommand: THottubOnCommand;
  HottubOffCommand: THottubOffCommand;
begin                                    
  try
    { TODO -oUser -cConsole Main : Insert code here }
    RemoteControl := TSimpleRemoteControl.Create;

    LivingRoomLights := TLights.Create('Living Room');
    GarageDoor := TGarage.Create('');
    KitchenLight := TLights.Create('Kitchen');
    CeilingFan := TCeilingFan.Create('Living Room');
    Stereo := TStereo.Create('Living Room');
    TV := TTV.Create('Living Room');
    Hottub := THottub.Create('Bathroom');

    LivingRoomLightsOnCommand := TLightsOnCommand.Create(LivingRoomLights);
    LivingRoomLightsOffCOmmand := TLightsOffCommand.Create(LivingRoomLights);
    KitchenLightOnCommand := TLightsOnCommand.Create(KitchenLight);
    KitchenLightOffCommand := TLightsOffCommand.Create(KitchenLight);
    CeilingFanHighCommand := TCeilingFanHighCommand.Create(CeilingFan);
    CeilingFanMediumCommand := TCeilingFanMediumCommand.Create(CeilingFan);
    CeilingFanLowCommand := TCeilingFanLowCommand.Create(CeilingFan);
    CeilingFanOffCommand := TCeilingFanOffCommand.Create(CeilingFan);
    StereoOnCommand := TStereoOnForCDCommand.Create(Stereo);
    StereoOffCommand := TStereoOffCommand.Create(Stereo);
    GarageOpenCommand := TGarageDoorOpenCommand.Create(GarageDoor);
    GarageCloseCommand := TGarageDoorCloseCommand.Create(GarageDoor);
    TVOnCommand := TTVOnCommand.Create(TV);
    TVOffCommand := TTVOffCommand.Create(TV);
    HottubOnCommand := THottubOnCommand.Create(Hottub);
    HottubOffCommand := THottubOffCommand.Create(Hottub);

    SetLength(PartyOnCommands, 4);
    SetLength(PartyOffCommands, 4);

    PartyOnCommands[0] := LivingRoomLightsOnCommand;
    PartyOnCommands[1] := StereoOnCommand;
    PartyOnCommands[2] := TVOnCommand;
    PartyOnCommands[3] := HottubOnCommand;

    PartyOffCommands[0] := LivingRoomLightsOffCommand;
    PartyOffCommands[1] := StereoOffCommand;
    PartyOffCommands[2] := TVOffCommand;
    PartyOffCommands[3] := HottubOffCommand;

    PartyOnMacro := TMacroCommand.Create(PartyOnCommands);
    PartyOffMacro := TMacroCommand.Create(PartyOffCommands);
    
    RemoteControl.SetCommand(0, LivingRoomLightsOffCommand, LivingRoomLightsOnCommand);
    RemoteControl.SetCommand(1, KitchenLightOnCommand, KitchenLightOffCommand);
    RemoteControl.SetCommand(2, StereoOnCommand, StereoOffCommand);
    RemoteControl.SetCommand(3, CeilingFanHighCommand, CeilingFanOffCommand);
    RemoteControl.SetCommand(4, CeilingFanMediumCommand, CeilingFanOffCommand);
    RemoteControl.SetCommand(5, CeilingFanLowCommand, CeilingFanOffCommand);
    RemoteControl.SetCommand(6, PartyOnMacro, PartyOffMacro);

    Writeln(RemoteControl.ToString);
    
    RemoteControl.OnButtonWasPushed(0);
    RemoteControl.OffButtonWasPushed(0);
    RemoteControl.OnButtonWasPushed(1);
    RemoteControl.OffButtonWasPushed(1);
    RemoteControl.OnButtonWasPushed(2);
    RemoteControl.OffButtonWasPushed(2);
    RemoteControl.OnButtonWasPushed(3);
    RemoteControl.OffButtonWasPushed(3);

    Writeln(sLineBreak + '----------------- Undo Test -----------------' + sLineBreak);
    RemoteControl.OnButtonWasPushed(0);
    RemoteControl.OffButtonWasPushed(0);
    Writeln(RemoteControl.ToString);
    Writeln;
    RemoteControl.UndoButtonWasPushed;
    Writeln;
    RemoteControl.OffButtonWasPushed(0);
    RemoteControl.OnButtonWasPushed(0);
    Writeln(RemoteControl.ToString);
    Writeln;
    RemoteControl.UndoButtonWasPushed;


    Writeln(sLineBreak + '----------------Ceiling fan undo test-----------' + sLineBreak);
    RemoteControl.OnButtonWasPushed(3);
    RemoteControl.OffButtonWasPushed(3);
    Writeln(RemoteControl.ToString);
    Writeln;
    RemoteControl.UndoButtonWasPushed;
    Writeln;
    RemoteControl.OnButtonWasPushed(4);
    RemoteControl.OffButtonWasPushed(4);
    Writeln(RemoteControl.ToString);
    Writeln;
    RemoteControl.UndoButtonWasPushed;
    Writeln;
    RemoteControl.OnButtonWasPushed(5);
    RemoteControl.OffButtonWasPushed(5);
    Writeln(RemoteControl.ToString);
    Writeln;
    RemoteControl.UndoButtonWasPushed;

    Writeln(sLineBreak + '---------------------Macro command test-------------------------' + sLineBreak);
    Writeln(RemoteControl.ToString);
    Writeln('---------- Pushing Macro On ----------');
    RemoteControl.OnButtonWasPushed(6);
    Writeln('---------- End ----------' + sLineBreak);
    Writeln('---------- Pushing Macro Off ----------');
    RemoteControl.OffButtonWasPushed(6);
    Writeln('---------- End ----------' + sLineBreak);
    Writeln('---------- Undo ---------' + sLineBreak);
    Writeln(RemoteControl.ToString + sLineBreak);
    RemoteControl.UndoButtonWasPushed;
    Readln;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
