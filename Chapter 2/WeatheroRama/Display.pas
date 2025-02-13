unit Display;

interface

uses Observeru, Subject;

type
	{ interface }
	IDisplayElement = interface
    ['{AE7337D1-4A5E-4771-841D-28D6E4DF207B}']
    procedure Display;
  end;

  { current condition display }
  TCurrentConditionDisplay = class(TInterfacedObject, IObserver, IDisplayElement)
  private
  	FTemperature, FHumidity: Double;
    FWeatherData: ISubject;
  public
  	constructor Create(AWeatherData: ISubject);

    procedure Update(const ATemperature, AHumidity, APressure: Double);
    procedure Display;
  end;

  { heat index display }
  THeatIndexDisplay = class(TInterfacedObject, IObserver, IDisplayElement)
  private
  	FTemperature, FHumidity: Double;
    FWeatherData: ISubject;

    function GetHumidity: Double;
  public
  	constructor Create(AWeatherData: ISubject);

    procedure Update(const ATemperature, AHumidity, APressure: Double);
    procedure Display;
  end;

  { forecast display }
  TForecastDisplay = class(TInterfacedObject, IObserver, IDisplayElement)
  private
  public
  	constructor Create(AWeatherData: ISubject);

    procedure Update(const ATemperature, AHumidity, APressure: Double);
    procedure Display;
  end;

implementation

uses
  System.SysUtils;

{ TCurrentConditionDisplay }

constructor TCurrentConditionDisplay.Create(AWeatherData: ISubject);
begin
	FWeatherData := AWeatherData;
  FWeatherData.RegisterObserver(Self);
end;

procedure TCurrentConditionDisplay.Display;
begin
	Writeln('Current Conditions: ' +  FTemperature.ToString + 'F degrees');
  Writeln('Humidity: ' + FHumidity.ToString + '%');
end;

procedure TCurrentConditionDisplay.Update(const ATemperature, AHumidity,
  APressure: Double);
begin
	FTemperature := ATemperature;
  FHumidity := AHumidity;
  Display;
end;

{ THeatIndexDisplay }

constructor THeatIndexDisplay.Create(AWeatherData: ISubject);
begin
	FWeatherData := AWeatherData;
  FWeatherData.RegisterObserver(Self);
end;

procedure THeatIndexDisplay.Display;
begin
  Writeln('Heat Index: ' + GetHumidity.ToString);
end;

function THeatIndexDisplay.GetHumidity: Double;
begin
  Result :=
    -42.379 +
    2.04901523 * FTemperature +
    10.14333127 * FHumidity +
    -0.22475541 * FTemperature * FHumidity +
    -0.00683783 * Sqr(FTemperature) +
    -0.05481717 * Sqr(FHumidity) +
    0.00122874 * Sqr(FTemperature) * FHumidity +
    0.00085282 * FTemperature * Sqr(FHumidity) +
    -0.00000199 * Sqr(FTemperature) * Sqr(FHumidity);
end;

procedure THeatIndexDisplay.Update(const ATemperature, AHumidity,
  APressure: Double);
begin
	FTemperature := ATemperature;
  FHumidity := AHumidity;
  Display;
end;

{ TForecastDisplay }

constructor TForecastDisplay.Create(AWeatherData: ISubject);
begin
	AWeatherData.RegisterObserver(Self);
end;

procedure TForecastDisplay.Display;
begin
	
end;

procedure TForecastDisplay.Update(const ATemperature, AHumidity,
  APressure: Double);
begin

end;

end.
