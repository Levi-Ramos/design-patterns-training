unit TDucksu;

interface

uses IFlyBehavioru, IQuackBehavioru;

type
	TDuck = class abstract
  private
  	Quack: IQuackBehavior;
    Fly: IFlyBehavior;
  public
  	procedure Swim;
    procedure DoQuack;
    procedure DoFly;
    procedure SetQuack(AQuack: IQuackBehavior);
    procedure SetFly(AFly: IFlyBehavior);
    procedure Display; virtual; abstract;
    constructor Create(AQuack: IQuackBehavior; AFly: IFlyBehavior);
  end;

type
	TModelDuck = class(TDuck)
  public
  	constructor Create;
  end;

implementation


{ TDuck }

uses TFlyBehavior, TQuackBehavioru;

constructor TDuck.Create(AQuack: IQuackBehavior; AFly: IFlyBehavior);
begin
	Quack := AQuack;
  Fly := AFly;
end;

procedure TDuck.DoFly;
begin
	Writeln(Fly.Fly);
end;

procedure TDuck.DoQuack;
begin
	Writeln(Quack.quack);
end;

procedure TDuck.SetFly(AFly: IFlyBehavior);
begin
	Fly := AFly;
end;

procedure TDuck.SetQuack(AQuack: IQuackBehavior);
begin
	Quack := AQuack;
end;

procedure TDuck.Swim;
begin
	Writeln('All ducks can swim... even the decoy ones');
end;

{ TModelDuck }

constructor TModelDuck.Create;
begin
	inherited Create(TQuack.Create, TFlyNoWay.Create);
end;

end.
