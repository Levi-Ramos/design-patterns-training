program KingAndQueen;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  WeaponBehavior in 'WeaponBehavior.pas',
  Characters in 'Characters.pas';

var
	Queen: TQueen;
  King: TKing;
  Troll: TTroll;
  Knight: TKnight;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    Queen := TQueen.Create;
    King := TKing.Create;
    Troll := TTroll.Create;
    Knight := TKnight.Create;

    try
      Writeln('Queen''s Weapon Behavior');
      Queen.Fight;
      Writeln;
    
      Writeln('King''s Weapon Behavior');
      King.Fight;
      Writeln;

      Writeln('Troll''s Weapon Behavior');
      Troll.Fight;
      Writeln;
    
      Writeln('Knight''s Weapon Behavior');
      Knight.Fight;
      Writeln;

      Writeln('Knights can change weapons');
      Knight.Fight;
      Knight.SetWeapon(TBowAndArrowBehavior.Create);
      Knight.Fight;
      readln;
    finally
    	King.Free;
      Queen.Free;
      Knight.Free;
      Troll.Free;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
