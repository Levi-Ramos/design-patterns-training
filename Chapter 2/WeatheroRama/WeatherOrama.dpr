program WeatherOrama;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Subject in 'Subject.pas',
  Observeru in 'Observeru.pas',
  Display in 'Display.pas',
  WeatherData in 'WeatherData.pas';

var
	WeatherData: TWeatherData;
  CurrentConditionDisplay: TCurrentConditionDisplay;
  HeatIndexDisplay: THeatIndexDisplay;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    WeatherData := TWeatherData.Create;
    CurrentConditionDisplay := TCurrentConditionDisplay.Create(WeatherData);
    HeatIndexDisplay := THeatIndexDisplay.Create(WeatherData);
    try
    	WeatherData.SetMeasurements(80, 65, 30.4);
      Writeln;
      WeatherData.SetMeasurements(82, 70, 29.2);
      Writeln;
      WeatherData.SetMeasurements(78, 90, 29.2);
      Writeln;

      WeatherData.RemoveObserver(HeatIndexDisplay);
      WeatherData.SetMeasurements(80, 65, 30.4);
      Writeln;
      WeatherData.SetMeasurements(82, 70, 29.2);
      Writeln;
      WeatherData.SetMeasurements(78, 90, 29.2);
      Writeln;
      Readln;
    finally
    	WeatherData.Free;
      CurrentConditionDisplay.Free;
      HeatIndexDisplay.Free;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
