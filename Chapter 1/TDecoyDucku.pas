unit TDecoyDucku;

interface

uses
  TDucksu;

type
	TDuckDecoy = class(TDuck)
  public
  	constructor Create;
    procedure Display; override;
  end;

implementation

{ TDuckDecoy }

uses IQuackBehavioru, TQuackBehavioru, TFlyBehavior;

constructor TDuckDecoy.Create;
begin
	inherited Create(TMuteQuack.Create, TFlyNoWay.Create);
end;

procedure TDuckDecoy.Display;
begin
	Writeln('Im not a real duck... im a decoy');
end;

end.
