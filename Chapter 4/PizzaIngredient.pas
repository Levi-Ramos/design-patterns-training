unit PizzaIngredient;

interface

uses Cheese, Dough, Pepperoni, Sauce, SeafoodTopping, Veggies, System.Generics.Collections
;

type
	TPizzaIngredientFactory = interface
  	function CreateDough: TDough;
    function CreateSauce: TSauce;
    function CreateCheese: TCheese;
    function CreateVeggies: TList<TVeggies>;
    function CreatePepperoni: TPepperoni;
    function CreateSeafoodTopping: TSeafoodTopping;
  end;

  TNyPizzaIngredientFactory = class(TInterfacedObject, TPizzaIngredientFactory)
  public
    function CreateDough: TDough;
    function CreateSauce: TSauce;
    function CreateCheese: TCheese;
    function CreateVeggies: TList<TVeggies>;
    function CreatePepperoni: TPepperoni;
    function CreateSeafoodTopping: TSeafoodTopping;
  end;

  TChPizzaIngredientFactory = class(TInterfacedObject, TPizzaIngredientFactory)
  public
    function CreateDough: TDough;
    function CreateSauce: TSauce;
    function CreateCheese: TCheese;
    function CreateVeggies: TList<TVeggies>;
    function CreatePepperoni: TPepperoni;
    function CreateSeafoodTopping: TSeafoodTopping;
  end;
  

implementation


{ TNyPizzaIngredientFactory }

function TNyPizzaIngredientFactory.CreateCheese: TCheese;
begin
	Result := TReggianoCheese.Create; 
  Writeln('     ' + Result.GetName);
end;

function TNyPizzaIngredientFactory.CreateDough: TDough;
begin
	Result := TThinCrustDough.Create;
  Writeln('     ' + Result.GetName);
end;

function TNyPizzaIngredientFactory.CreatePepperoni: TPepperoni;
begin
	Result := TCuttedPepperoni.Create;
  Writeln('     ' + Result.GetName);
end;

function TNyPizzaIngredientFactory.CreateSauce: TSauce;
begin
	Result := TMarinaraSauce.Create;
  Writeln('     ' + Result.GetName);
end;

function TNyPizzaIngredientFactory.CreateSeafoodTopping: TSeafoodTopping;
begin
	Result := TFreshClams.Create;
  Writeln('     ' + Result.GetName);
end;

function TNyPizzaIngredientFactory.CreateVeggies: TList<TVeggies>;
var
	Veggies: TList<TVeggies>;
  Veggie: TVeggies;
begin
	Veggies := TList<TVeggies>.Create;
	Veggies.Add(TGarlic.Create);
  Veggies.Add(TOnion.Create);
  Veggies.Add(TMushroom.Create);
  Veggies.Add(TRedPepper.Create);

  Result := Veggies;

  for Veggie in Result do
  begin
  	Writeln('     ' + Veggie.GetName);
  end;

end;

{ TChPizzaIngredientFactory }

function TChPizzaIngredientFactory.CreateCheese: TCheese;
begin
	Result := TMozzarellaCheese.Create;	
  Writeln('     ' + Result.GetName);
end;

function TChPizzaIngredientFactory.CreateDough: TDough;
begin
	Result := TThickCrustDough.Create;
  Writeln('     ' + Result.GetName);
end;

function TChPizzaIngredientFactory.CreatePepperoni: TPepperoni;
begin
	Result := TCuttedPepperoni.Create;
  Writeln('     ' + Result.GetName);
end;

function TChPizzaIngredientFactory.CreateSauce: TSauce;
begin
	Result := TPlumTomatoSauce.Create;
  Writeln('     ' + Result.GetName);
end;

function TChPizzaIngredientFactory.CreateSeafoodTopping: TSeafoodTopping;
begin
	Result := TFrozenClams.Create;
  Writeln('     ' + Result.GetName);
end;

function TChPizzaIngredientFactory.CreateVeggies: TList<TVeggies>;
var
	Veggies: TList<TVeggies>;
  Veggie: TVeggies;
begin
	Veggies := TList<TVeggies>.Create;
	Veggies.Add(TSpinach.Create);
  Veggies.Add(TBlackOlives.Create);
  Veggies.Add(TEggplant.Create);

  Result := Veggies;

  for Veggie in Result do
  begin
  	Writeln('     ' + Veggie.GetName);
  end;
end;

end.
