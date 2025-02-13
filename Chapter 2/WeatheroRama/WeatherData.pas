unit WeatherData;

interface

uses Subject, Observeru, System.Generics.Collections;

type
	TWeatherData = class(TInterfacedObject, ISubject)
  private
  	FObservers: TList<IObserver>;
    FTemperature: Double;
    FHumidity: Double;
    FPressure: Double;
  public
  	constructor Create;
    procedure RegisterObserver(AObserver: IObserver);
    procedure RemoveObserver(AObserver: IObserver);
    procedure NotifyObervers;

    procedure MeasurementsChanged;
    procedure SetMeasurements(ATemperature, AHumidity, APressure: Double);

    function GetTemperature: Double;
    function GetHumidity: Double;
    function GetPressure: Double;
  end;

implementation


{ TWeatherData }

constructor TWeatherData.Create;
begin
	FObservers := TList<IObserver>.Create;
end;

function TWeatherData.GetHumidity: Double;
begin
	Result := FHumidity;
end;

function TWeatherData.GetPressure: Double;
begin
	Result := FPressure;
end;

function TWeatherData.GetTemperature: Double;
begin
	Result := FTemperature;
end;

procedure TWeatherData.MeasurementsChanged;
begin
	NotifyObervers;
end;

procedure TWeatherData.NotifyObervers;
var
	Observer: IObserver;
begin
  for Observer in FObservers do
  	Observer.Update(FTemperature, FHumidity, FPressure);
end;

procedure TWeatherData.RegisterObserver(AObserver: IObserver);
begin
	FObservers.Add(AObserver);
end;

procedure TWeatherData.RemoveObserver(AObserver: IObserver);
var
	ObserverIndex: Integer;
begin
	ObserverIndex := FObservers.IndexOf(AObserver);
  if ObserverIndex >= 0 then
  	FObservers.Delete(ObserverIndex);
end;

procedure TWeatherData.SetMeasurements(ATemperature, AHumidity,
  APressure: Double);
begin
	FTemperature := ATemperature;
  FHumidity := AHumidity;
  APressure := APressure;
  MeasurementsChanged;
end;

end.
