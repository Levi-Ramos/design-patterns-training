unit TRubberDucku;

interface

uses
	TDucksu; 

type
	TRubberDuck = class(TDuck)
  public
  	constructor Create;
    procedure Display; override;
  end;

implementation

{ TRubberDuck }

uses IFlyBehavioru, IQuackBehavioru, TFlyBehavior, TQuackBehavioru;

constructor TRubberDuck.Create;
begin
	inherited Create(TSqueak.Create, TFlyNoWay.Create);
end;

procedure TRubberDuck.Display;
begin
	Writeln('im a rubber ducky');
end;

end.
