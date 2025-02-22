unit Objects;

interface

uses
	System.SysUtils;
type
	TLights = class
  private
  	FRoom: string;
  public
  	procedure OnLights;
    procedure OffLights;
    constructor Create(ARoom: string);
  end;

  TGarage = class
  	procedure OpenGarage;
    procedure CloseGarage;
    procedure Stop;
    procedure LightOn;
    procedure LightOff;
    constructor Create(ARoom: string);
  private
  	FRoom: string;
  end;

  TCeilingFan = class
		procedure CeilingHigh;
    procedure CeilingMedium;
    procedure CeilingLow;
    function CeilingGetSpeed: Integer;
    procedure CeilingOff;
    constructor Create(ARoom: string);
    class var HIGH: Integer;  
    class var MEDIUM: Integer;
    class var LOW: Integer;
    class var OFF: Integer;
  private

    FSpeed: Integer;
    FRoom: string;
  end;

  TStereo= class
  	procedure StereoOnForCd;
    procedure StereoOff;
    procedure StereoSetCD;
    procedure StereoSetVolume(AVolume: Integer);
    constructor Create(ARoom: string);
  private
  	FRoom: string;
  end;

  TTV = class
  	procedure TVOn;
    procedure TVOff;
    procedure SetInputChannel(AChannel: Integer);
    procedure SetVolume(AVolume: Integer);
    function GetVolume: Integer;
    constructor Create(ARoom: string);
  private
  	FChannel: Integer;
    FVolume: Integer;
    FRoom: string;
  end;

  THottub = class
  	procedure HottubOn;
    procedure HottubOff;
    procedure Circulate;
    procedure JetsOn;
    procedure JetsOff;
    procedure SetTemperature(ATemperature: Integer);
    function GetTemperature: Integer;
    constructor Create(ARoom: string);
  private
  	FTemperature: Integer;
    FRoom: string;
  end;

implementation

{ TLights }

constructor TLights.Create(ARoom: string);
begin
 FRoom := ARoom;	
end;

procedure TLights.OffLights;
begin
	Writeln(FRoom + ' Light is turned off');
end;

procedure TLights.OnLights;
begin
	Writeln(FRoom + ' Light is turned on');
end;

{ TGarage }

procedure TGarage.CloseGarage;
begin
	Writeln(FRoom + ' Garage Close');
end;

constructor TGarage.Create(ARoom: string);
begin
	FRoom := ARoom;
end;

procedure TGarage.LightOff;
begin
	Writeln(FRoom + ' Garage lights off');
end;

procedure TGarage.LightOn;
begin
	Writeln(FRoom + ' Garage lights on');
end;

procedure TGarage.OpenGarage;
begin
	Writeln(FRoom + ' Garage Open');
end;

procedure TGarage.Stop;
begin
	Writeln(FRoom + ' Garage stopped');
end;

{ TCeilingFan }

function TCeilingFan.CeilingGetSpeed: Integer;
begin
	Result := FSpeed;
end;

procedure TCeilingFan.CeilingHigh;
begin
	FSpeed := HIGH;
  Writeln(FRoom + ' Ceiling fan at HIGH');
end;

procedure TCeilingFan.CeilingLow;
begin
	FSpeed := LOW;
  Writeln(FRoom + ' Ceiling fan at LOW');
end;

procedure TCeilingFan.CeilingMedium;
begin
	FSpeed := MEDIUM;
  Writeln(FRoom + ' Ceiling fan at MEDIUM');
end;

procedure TCeilingFan.CeilingOff;
begin
	Writeln(FRoom + ' Ceiling fan off');
end;

constructor TCeilingFan.Create(ARoom: string);
begin
	FRoom := ARoom;
  HIGH := 3;
  MEDIUM := 2;
  LOW := 1;
  OFF := 0;
end;

{ TStereo }

constructor TStereo.Create(ARoom: string);
begin
	FRoom := ARoom;
end;

procedure TStereo.StereoOff;
begin
	Writeln(FRoom + ' Stereo off');
end;

procedure TStereo.StereoOnForCd;
begin
	Writeln(FRoom + ' Stereo on for cd');
end;

procedure TStereo.StereoSetCD;
begin
	Writeln(FRoom + ' setting cd');
end;

procedure TStereo.StereoSetVolume(AVolume: Integer);
begin
	Writeln(FRoom + ' Stereo Set Volume to ' + AVolume.ToString);
end;

{ TItems }

{ TTV }

constructor TTV.Create(ARoom: string);
begin
	FRoom := ARoom;
end;

function TTV.GetVolume: Integer;
begin
	Result := FVolume;
end;

procedure TTV.SetInputChannel(AChannel: Integer);
begin
	FChannel := AChannel;
end;

procedure TTV.SetVolume(AVolume: Integer);
begin
	FVolume := AVolume;
end;

procedure TTV.TVOff;
begin
	Writeln(FRoom + ' tv is turned off');
end;

procedure TTV.TVOn;
begin
	Writeln(FRoom + ' tv is turned on');
end;

{ THottub }

procedure THottub.Circulate;
begin
	Writeln(FRoom + ' Hottub is circulating');
end;

constructor THottub.Create(ARoom: string);
begin
	FRoom := ARoom;
end;

function THottub.GetTemperature: Integer;
begin
	Result := FTemperature
end;

procedure THottub.HottubOff;
begin
	Writeln(FRoom + ' hottub is turned off');
end;

procedure THottub.HottubOn;
begin
	Writeln(FRoom + ' hottub is turned on');
end;

procedure THottub.JetsOff;
begin
	Writeln(FRoom + ' hottubs jets is turned off');
end;

procedure THottub.JetsOn;
begin
	Writeln(FRoom + ' hottubs jets is turned on');
end;

procedure THottub.SetTemperature(ATemperature: Integer);
begin
	FTemperature := ATemperature;
end;

end.
