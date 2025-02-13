unit TMallardDucku;

interface

uses TDucksu, IFlyBehavioru, IQuackBehavioru;

type
	TMallardDuck = class(TDuck)
  public
    constructor Create;
    procedure Display;
  end;

implementation

{ TMallardDuck }

uses TFlyBehavior, TQuackBehavioru;

procedure TMallardDuck.Display;
begin
	Writeln('Im a mallard duck');
end;

{ TMallardDuck }

constructor TMallardDuck.Create;
begin
	inherited Create(TQuack.Create, TFlyWithWings.Create);
end;

end.
