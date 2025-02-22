program SimUDuck;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  IFlyBehavioru in 'IFlyBehavioru.pas',
  IQuackBehavioru in 'IQuackBehavioru.pas',
  TDucksu in 'TDucksu.pas',
  TFlyBehavior in 'TFlyBehavior.pas',
  TQuackBehavioru in 'TQuackBehavioru.pas',
  TMallardDucku in 'TMallardDucku.pas',
  TRubberDucku in 'TRubberDucku.pas',
  TDecoyDucku in 'TDecoyDucku.pas';

var
	MallarDuck, RubberDuck, DecoyDuck, ModelDuck: TDuck;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    MallarDuck := TMallardDuck.Create;
    RubberDuck := TRubberDuck.Create;
    DecoyDuck := TDuckDecoy.Create;
    ModelDuck := TModelDuck.Create;

    Writeln('presenting the mallard duck');
    MallarDuck.Display;
    MallarDuck.DoFly;
    MallarDuck.DoQuack;
    MallarDuck.Swim;
    Writeln;
    Writeln('Presenting the Rubber duck');
    RubberDuck.Display;
    RubberDuck.DoFly;
    RubberDuck.DoQuack;
    RubberDuck.Swim;
    Writeln;
    Writeln('Presenting the Decoy duck');
    DecoyDuck.Display;
    DecoyDuck.DoFly;
    DecoyDuck.DoQuack;
    DecoyDuck.Swim;

    Writeln;
    Writeln('Mini duck simulator');
    ModelDuck.DoFly;
    ModelDuck.SetFly(TFlyWithWings.Create);
    ModelDuck.DoFly;
    ModelDuck.SetFly(TFlyWithRocket.Create);
    ModelDuck.DoFly;
    Readln;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
