program StarBuzz;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Beverages in 'Beverages.pas',
  Decorator in 'Decorator.pas';

var
	Espresso: TBeverage;
  HouseBlend: TBeverage;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    Espresso := TEspresso.Create;
    Writeln(Espresso.GetDescription, ' $' + Espresso.Cost.ToString);

    HouseBlend := THouseBlend.Create;
    HouseBlend := TMocha.Create(HouseBlend);
    HouseBlend := TMocha.Create(HouseBlend);
    HouseBlend := TWhip.Create(HouseBlend);
    Writeln(HouseBlend.GetDescription, ' $' + HouseBlend.Cost.ToString);
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
