unit Pizza;

interface

uses
	System.Generics.Collections, Cheese, Dough, Pepperoni, Sauce, SeafoodTopping, Veggies, PizzaIngredient;

type
	TPizza = class abstract
//  	procedure Prepare; virtual; abstract;
    procedure Prepare;
    procedure Bake; virtual;
    procedure Cut; virtual;
    procedure Box; virtual;
    function GetName: string;

    procedure SetName(AName: string);

    constructor Create; virtual; abstract;
//  	constructor Create(APizzaIngredientFactory: TPizzaIngredientFactory);
  protected
  	FPizzaIngredientFactory: TPizzaIngredientFactory;
  	FName: string;
    FDough: string;
    FCheese: string;
    FSauce: string;
//    FDough: TDough;
//    FSauce: TSauce;
//    FCheese: TCheese;
//    FPepperoni: TPepperoni;
//    FSeafoodTopping: TSeafoodTopping;
//    FVeggies: TList<TVeggies>;
    FToppings: TList<string>;
  end;

//  TCheesePizza = class(TPizza)
//  public
//    procedure Prepare; override;
//  end;
//
//  TClamPizza = class(TPizza)
//  public
//    procedure Prepare; override;
//  end;
//
//  TPepperoniPizza = class(TPizza)
//  public
//    procedure Prepare; override;
//  end;
//
//  TVeggiePizza = class(TPizza)
//  public
//    procedure Prepare; override;
//  end;

  TNyStyleCheesePizza = class(TPizza)
  public
    constructor Create; override;
  end;

  TNyStylePepperoniPizza = class(TPizza)
  public
    constructor Create; override;
  end;

  TChStyleCheesePizza = class(TPizza)
  public
    constructor Create; override;
  end;

  TChStylePepperoniPizza = class(TPizza)
  public
    constructor Create; override;
  end;

implementation

{ TPizza }

procedure TPizza.Bake;
begin
	Writeln('Bake for 25 minutes at 350');
end;

procedure TPizza.Box;
begin
	Writeln('Place pizza in official pizzastore box');
end;

procedure TPizza.Cut;
begin
	Writeln('Cutting hte pizza into diagonal slices');
end;

function TPizza.GetName: string;
begin
	Result := FName;
end;

procedure TPizza.Prepare;
var
  Topping: string;
begin
  Writeln('Preparing ' + FName);
  Writeln('Tossing dough...');
  Writeln('Adding sauce...');
  Writeln('Adding toppings: ');
  for Topping in FToppings do
  begin
    Writeln('     ' + Topping);
  end;

end;

procedure TPizza.SetName(AName: string);
begin
	FName := AName;
end;

{ TCheesePizza }

//procedure TCheesePizza.Prepare;
//begin
//  inherited;
//  Writeln('Preparing ' + FName);
//  Writeln('Ingredients:');
//  FDough := FPizzaIngredientFactory.CreateDough;
//  FSauce := FPizzaIngredientFactory.CreateSauce;
//  FCheese := FPizzaIngredientFactory.CreateCheese;
//end;
//
//{ TClamPizza }
//
//
//
//procedure TClamPizza.Prepare;
//begin
//  inherited;
//  Writeln('Preparing ' + FName);
//  Writeln('Ingredients:');
//  FDough := FPizzaIngredientFactory.CreateDough;
//  FSauce := FPizzaIngredientFactory.CreateSauce;
//  FCheese := FPizzaIngredientFactory.CreateCheese;
//  FSeafoodTopping := FPizzaIngredientFactory.CreateSeafoodTopping;
//end;
//
//{ TPepperoniPizza }
//
//
//procedure TPepperoniPizza.Prepare;
//begin
//  inherited;
//  Writeln('Preparing ' + FName);
//  FDough := FPizzaIngredientFactory.CreateDough;
//  FSauce := FPizzaIngredientFactory.CreateSauce;
//  FCheese := FPizzaIngredientFactory.CreateCheese;
//  FPepperoni := FPizzaIngredientFactory.CreatePepperoni;
//end;
//
//{ TVeggiePizza }
//
//
//procedure TVeggiePizza.Prepare;
//begin
//  inherited;
//  Writeln('Preparing ' + FName);
//  FDough := FPizzaIngredientFactory.CreateDough;
//  FSauce := FPizzaIngredientFactory.CreateSauce;
//  FCheese := FPizzaIngredientFactory.CreateCheese;
//  FVeggies := FPizzaIngredientFactory.CreateVeggies;
//end;

{ TNyStyleCheesePizza }

constructor TNyStyleCheesePizza.Create;
begin
  FName := 'New York Style Sauce and Cheese Pizza';
  FDough := 'Thin Crust Dough';
  FSauce := 'Marinara Sauce';

  FToppings := TList<string>.Create;
  FToppings.Add('Grated Regiano Cheese');
end;

{ TChStylePepperoniPizza }

constructor TChStylePepperoniPizza.Create;
begin
  FName := 'Chicago Style Pepperoni Pizza';
  FDough := 'Extra Thick Crust Dough';
  FSauce := 'Plum Tomato Sauce';

  FToppings := TList<string>.Create;
  FToppings.Add('Shredded Mozarella Cheese');
end;

{ TChStyleCheesePizza }

constructor TChStyleCheesePizza.Create;
begin
  FName := 'Chicago Style Cheese Pizza';
  FDough := 'Extra Thick Crust Dough';
  FSauce := 'Plum Tomato Sauce';

  FToppings := TList<string>.Create;
  FToppings.Add('Shredded Mozarella Cheese');
end;

{ TNyStylePepperoniPizza }

constructor TNyStylePepperoniPizza.Create;
begin
  FName := 'New York Style Pepperoni Pizza';
  FDough := 'Thin Crust Dough';
  FSauce := 'Marinara Sauce';

  FToppings := TList<string>.Create;
  FToppings.Add('Grated Regiano Cheese');
  FToppings.Add('Pepperoni');
end;

end.
