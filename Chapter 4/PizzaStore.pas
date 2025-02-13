unit PizzaStore;

interface

uses Pizza;

type
	TPizzaType = (CHEESE, PEPPERONI, VEGGIE, CLAM);
	TPizzaStore = class abstract
  protected
  	function CreatePizza(APizzaType: TPizzaType): TPizza; virtual; abstract;
  public
    function OrderPizza(APizzaType: TPizzaType): TPizza;
  end;

  TNyStylePizzaStore = class(TPizzaStore)                             
  protected
  	function CreatePizza(APizzaType: TPizzaType): TPizza; override;
  end;

  TChStylePizzaStore = class(TPizzaStore)
  protected
  	function CreatePizza(APizzaType: TPizzaType): TPizza; override;
  end;

implementation


{ TPizzaStore }

uses PizzaIngredient;

function TPizzaStore.OrderPizza(APizzaType: TPizzaType): TPizza;
var
	LPizza: TPizza;
begin
	LPizza := CreatePizza(APizzaType);
  LPizza.Prepare;
  LPizza.Bake;
  LPizza.Cut;
  LPizza.Box;
  Result := LPizza;
end;

{ TNyStylePizzaStore }

function TNyStylePizzaStore.CreatePizza(APizzaType: TPizzaType) : TPizza;
var
	LPizza: TPizza;
begin
  case APizzaType of
    CHEESE:
    begin
        LPizza := TNyStyleCheesePizza.Create;
    end;
    PEPPERONI:
    begin
        LPizza := TNyStylePepperoniPizza.Create;
    end;
  end;
  Result := LPizza;
end;

{ TChStylePizzaStore }

function TChStylePizzaStore.CreatePizza(APizzaType: TPizzaType): TPizza;
var
	LPizza: TPizza;
  LIngredientFactory: TPizzaIngredientFactory;
begin
	LIngredientFactory := TChPizzaIngredientFactory.Create;
  case APizzaType of
    CHEESE:
    begin
      LPizza := TChStyleCheesePizza.Create;
    end;
    PEPPERONI:
    begin
      LPizza := TChStylePepperoniPizza.Create;
    end;
  end;
  Result := LPizza;
end;
end.
