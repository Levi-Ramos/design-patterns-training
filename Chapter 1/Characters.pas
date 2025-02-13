unit Characters;

interface

uses WeaponBehavior;

type

	TCharacter = class abstract
  private
  	FWeaponBehavior: IWeaponBehavior;
  public
  	Constructor create(AWeaponBehavior: IWeaponBehavior);
    procedure SetWeapon(AWeaponBehavior: IWeaponBehavior);
    procedure Fight;
  end;

  TQueen = class(TCharacter)
  public
  	constructor Create;
  end;

  TKing = class(TCharacter)
  public
  	constructor Create;
  end;

  TTroll = class(TCharacter)
  public
  	constructor Create;
  end;	

  TKnight = class(TCharacter)
  public
  	constructor Create;
  end;

implementation


{ TCharacter }

constructor TCharacter.create(AWeaponBehavior: IWeaponBehavior);
begin
	FWeaponBehavior := AWeaponBehavior;
end;

procedure TCharacter.Fight;
begin
	Writeln(FWeaponBehavior.UseWeapon);
end;

procedure TCharacter.SetWeapon(AWeaponBehavior: IWeaponBehavior);
begin
	FWeaponBehavior := AWeaponBehavior;
end;

{ TQueen }

constructor TQueen.Create;
begin
	Inherited create(TBowAndArrowBehavior.Create);
end;

{ TKing }

constructor TKing.Create;
begin
	inherited Create(TKnifeBehavior.Create);
end;

{ TTroll }

constructor TTroll.Create;
begin
	inherited Create(TAxeBehavior.Create);
end;

{ TKnight }

constructor TKnight.Create;
begin
	inherited Create(TSwordBehavior.Create);
end;

end.
