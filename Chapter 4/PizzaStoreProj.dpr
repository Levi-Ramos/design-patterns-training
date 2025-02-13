program PizzaStoreProj;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Pizza in 'Pizza.pas',
  PizzaStore in 'PizzaStore.pas',
  PizzaIngredient in 'PizzaIngredient.pas',
  Dough in 'Dough.pas',
  SeafoodTopping in 'SeafoodTopping.pas',
  Cheese in 'Cheese.pas',
  Sauce in 'Sauce.pas',
  Pepperoni in 'Pepperoni.pas',
  Veggies in 'Veggies.pas';

var
	LInput: String;
  LPizzaStore: TPizzaStore;
  LPizza: TPizza;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    try
      LPizzaStore := TNyStylePizzaStore.Create;
      LPIzza := LPizzaStore.OrderPizza(TPizzaType.CHEESE);
      Writeln('Ethan ordered a ' + LPizza.GetName);

      Writeln;

      LPizzaStore := TChStylePizzaStore.Create;
      LPizzaStore.OrderPizza(TPizzaType.PEPPERONI);
      Writeln('Joel ordered a ' + LPizza.GetName);
    finally
    	LPizzaStore.Free;
      LPizza.Free;
    end;

    Readln(LInput);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
