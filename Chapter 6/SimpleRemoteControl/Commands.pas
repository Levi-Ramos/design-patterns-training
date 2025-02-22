unit Commands;

interface

uses Objects;

type
	ICommand = interface
  ['{481BD072-EA54-43A4-816E-2F3C822EBBDF}']
  	procedure Execute;
    procedure Undo;
  end;

  TNoCommand = class(TInterfacedObject, ICommand)
  public
  	procedure Execute;
    procedure Undo;
  end;

  TMacroCommand = class(TInterfacedObject, ICommand)
  private
  	FCommands: TArray<ICommand>;
  public
    procedure Execute;
    constructor Create(ACommands: TArray<ICommand>);
    procedure Undo;
  end;

  TLightsOnCommand = class(TInterfacedObject, ICommand)
  private
  	FLights: TLights;
  public
  	procedure Execute;
    procedure Undo;
    constructor Create(ALights: TLights);
  end;

  TLightsOffCommand = class(TInterfacedObject, ICommand)
  private
  	FLights: TLights;
  public
  	procedure Execute;
    procedure Undo;
    constructor Create(ALights: TLights);
  end;

  TGarageDoorOpenCommand = class(TInterfacedObject, ICommand)
  private
  	FGarage: TGarage;
  public
    procedure Execute;
    procedure Undo;
    constructor Create(AGarage: TGarage);
  end;

  TGarageDoorCloseCommand = class(TInterfacedObject, ICommand)
  private
  	FGarage: TGarage;
  public
    procedure Execute;
    procedure Undo;
    constructor Create(AGarage: TGarage);
  end;
  
  TCeilingFanHighCommand = class(TInterfacedObject, ICommand)
  private
  	FCeilingFan: TCeilingFan;
    FPrevSpeed: Integer;
  public
    procedure Execute;
    procedure Undo;
    constructor Create(ACeilingFan: TCeilingFan);
  end;

  TCeilingFanMediumCommand = class(TInterfacedObject, ICommand)
  private
  	FCeilingFan: TCeilingFan;
    FPrevSpeed: Integer;
  public
    procedure Execute;
    procedure Undo;
    constructor Create(ACeilingFan: TCeilingFan);
  end;  

  TCeilingFanLowCommand = class(TInterfacedObject, ICommand)
  private
  	FCeilingFan: TCeilingFan;
    FPrevSpeed: Integer;
  public
    procedure Execute;
    procedure Undo;
    constructor Create(ACeilingFan: TCeilingFan);
  end;

  TCeilingFanOffCommand = class(TInterfacedObject, ICommand)
  private
  	FCeilingFan: TCeilingFan;
  public
    procedure Execute;
    procedure Undo;
    constructor Create(ACeilingFan: TCeilingFan);
  end;

  TStereoOnForCDCommand = class(TInterfacedObject, ICommand)
  private
  	FStereo: TStereo;
  public
    procedure Execute;
    procedure Undo;
    constructor Create(AStereo: TStereo);
  end;

  TStereoOffCommand = class(TInterfacedObject, ICommand)
  private
  	FStereo: TStereo;
  public
    procedure Execute;
    procedure Undo;
    constructor Create(AStereo: TStereo);
  end;

  TTVOnCommand = class(TInterfacedObject, ICommand)
  private
  	FTV: TTV;
  public
  	procedure Execute;
    procedure Undo;
    constructor Create(ATV: TTV);
  end;

  TTVOffCommand = class(TInterfacedObject, ICommand)
  private
  	FTV: TTV;
  public
  	procedure Execute;
    procedure Undo;
    constructor Create(ATV: TTV);
  end;

  THottubOnCommand = class(TInterfacedObject, ICommand)
  private
  	FHottub: THottub;
  public
  	procedure Execute;
    procedure Undo;
    constructor Create(AHottub: THottub);
  end;

  THottubOffCommand = class(TInterfacedObject, ICommand)
  private
  	FHottub: THottub;
  public
  	procedure Execute;
    procedure Undo;
    constructor Create(AHottub: THottub);
  end;

implementation

{ TLightsOnCommand }

procedure UndoCeilingFan(ACeilingFan: TCeilingFan);
begin
	if ACeilingFan.CeilingGetSpeed = TCeilingFan.HIGH then
  	ACeilingFan.CeilingHigh
  else if ACeilingFan.CeilingGetSpeed = TCeilingFan.MEDIUM then
  	ACeilingFan.CeilingMedium
  else if ACeilingFan.CeilingGetSpeed = TCeilingFan.LOW then
  	ACeilingFan.CeilingLow
  else
  	ACeilingFan.CeilingOff;
end;

constructor TLightsOnCommand.Create(ALights: TLights);
begin
	FLights := ALights;
end;

procedure TLightsOnCommand.Execute;
begin
	FLights.OnLights;
end;

procedure TLightsOnCommand.Undo;
begin
 FLights.OffLights;	
end;

{ TGarageDoorOpenCommand }

constructor TGarageDoorOpenCommand.Create(AGarage: TGarage);
begin
	FGarage := AGarage;
end;

procedure TGarageDoorOpenCommand.Execute;
begin
	FGarage.OpenGarage;
end;

procedure TGarageDoorOpenCommand.Undo;
begin
	FGarage.CloseGarage;
end;

{ TLightsOffCommand }

constructor TLightsOffCommand.Create(ALights: TLights);
begin
	FLights := ALights;
end;

procedure TLightsOffCommand.Execute;
begin
	FLights.OffLights;
end;

procedure TLightsOffCommand.Undo;
begin
	FLights.OnLights;
end;

{ TGarageDoorCloseCommand }

constructor TGarageDoorCloseCommand.Create(AGarage: TGarage);
begin
	FGarage := AGarage;
end;

procedure TGarageDoorCloseCommand.Execute;
begin
	FGarage.CloseGarage;
end;

procedure TGarageDoorCloseCommand.Undo;
begin
	FGarage.OpenGarage;
end;

{ TCeilingFanHigh }

constructor TCeilingFanHighCommand.Create(ACeilingFan: TCeilingFan);
begin
	FCeilingFan := ACeilingFan;
end;

procedure TCeilingFanHighCommand.Execute;
begin
	FPrevSpeed := FCeilingFan.CeilingGetSpeed;
	FCeilingFan.CeilingHigh;
end;

procedure TCeilingFanHighCommand.Undo;
begin
	UndoCeilingFan(FCeilingFan);
end;

{ TCeilingFanOff }

constructor TCeilingFanOffCommand.Create(ACeilingFan: TCeilingFan);
begin
	FCeilingFan := ACeilingFan;
end;

procedure TCeilingFanOffCommand.Execute;
begin
	FCeilingFan.CeilingOff;
end;

procedure TCeilingFanOffCommand.Undo;
begin
	UndoCeilingFan(FCeilingFan);
end;

{ TStereoOnForCD }

constructor TStereoOnForCDCommand.Create(AStereo: TStereo);
begin
	FStereo := AStereo;
end;

procedure TStereoOnForCDCommand.Execute;
begin
	FStereo.StereoOnForCd;
  FStereo.StereoSetCD;       
  FStereo.StereoSetVolume(11);
end;

procedure TStereoOnForCDCommand.Undo;
begin
	FStereo.StereoOff;
end;

{ TNoCommand }

procedure TNoCommand.Execute;
begin
	Writeln('no command');
end;

procedure TNoCommand.Undo;
begin
	{ not implemented } 
end;

{ TStereoOffCommand }

constructor TStereoOffCommand.Create(AStereo: TStereo);
begin
	FStereo := AStereo;
end;

procedure TStereoOffCommand.Execute;
begin
	FStereo.StereoOff;
end;

procedure TStereoOffCommand.Undo;
begin
	FStereo.StereoOnForCd;
  FSTereo.StereoSetCD;
  FStereo.StereoSetVolume(11);
end;

{ TCeilingFanMediumCommand }

constructor TCeilingFanMediumCommand.Create(ACeilingFan: TCeilingFan);
begin
	FCeilingFan := ACeilingFan
end;

procedure TCeilingFanMediumCommand.Execute;
begin
	FPrevSpeed := FCeilingFan.CeilingGetSpeed;
  FCeilingFan.CeilingMedium;
end;

procedure TCeilingFanMediumCommand.Undo;
begin
	UndoCeilingFan(FCeilingFan);
end;

{ TCeilingFanLowCommand }

constructor TCeilingFanLowCommand.Create(ACeilingFan: TCeilingFan);
begin
	FCeilingFan := ACeilingFan;
end;

procedure TCeilingFanLowCommand.Execute;
begin
	FPrevSpeed := FCeilingFan.CeilingGetSpeed;
  FCeilingFan.CeilingLow;
end;

procedure TCeilingFanLowCommand.Undo;
begin
	 UndoCeilingFan(FCeilingFan);
end;


{ TMacroCommand }

constructor TMacroCommand.Create(ACommands: TArray<ICommand>);
begin
	FCommands := ACommands;
end;

procedure TMacroCommand.Execute;
var
  I: Integer;
begin
	for I := 0 to High(FCommands) do
  	FCommands[I].Execute;
end;

procedure TMacroCommand.Undo;
var
  I: Integer;
begin
  for I := 0 to High(FCommands) do
    FCommands[I].Undo;
end;

{ TTVOnCommand }

constructor TTVOnCommand.Create(ATV: TTV);
begin
	FTV := ATV
end;

procedure TTVOnCommand.Execute;
begin
	FTV.TVOn;
end;

procedure TTVOnCommand.Undo;
begin
	FTV.TVOff;
end;

{ TTVOffCommand }

constructor TTVOffCommand.Create(ATV: TTV);
begin
	FTV := ATV;
end;

procedure TTVOffCommand.Execute;
begin
	FTV.TVOff;
end;

procedure TTVOffCommand.Undo;
begin
	FTV.TVOn;
end;

{ THottubOnCommand }

constructor THottubOnCommand.Create(AHottub: THottub);
begin
	FHottub := AHottub;
end;

procedure THottubOnCommand.Execute;
begin
	FHottub.HottubOn;
end;

procedure THottubOnCommand.Undo;
begin
	FHottub.HottubOff;
end;

{ THottubOffCommand }

constructor THottubOffCommand.Create(AHottub: THottub);
begin
	FHottub := AHottub;
end;

procedure THottubOffCommand.Execute;
begin
	FHottub.HottubOff;
end;

procedure THottubOffCommand.Undo;
begin
	FHottub.HottubOn;
end;

end.
