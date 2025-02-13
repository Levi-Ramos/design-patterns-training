unit WeaponBehavior;

interface

type
	IWeaponBehavior = interface	
  	function UseWeapon: string;
	end;

  TKnifeBehavior = class(TInterfacedObject, IWeaponBehavior)
  	function UseWeapon: string;
  end;

  TBowAndArrowBehavior = class(TInterfacedObject, IWeaponBehavior)
  	function UseWeapon: string;
  end;

  TAxeBehavior = class(TInterfacedObject, IWeaponBehavior)
  	function UseWeapon: string;
  end;

  TSwordBehavior = class(TInterfacedObject, IWeaponBehavior)
  	function UseWeapon: string;
  end;

implementation

{ TKnifeBehavior }

function TKnifeBehavior.UseWeapon: string;
begin
	Result := 'Cutting with a knife';
end;

{ TSwordBehavior }

function TSwordBehavior.UseWeapon: string;
begin
	Result := 'Swinging a sword';
end;

{ TBowAndArrowBehavior }

function TBowAndArrowBehavior.UseWeapon: string;
begin
	Result := 'Shooting a bow and arrow';
end;

{ TAxeBehavior }

function TAxeBehavior.UseWeapon: string;
begin
	Result := 'Chopping with an axe';
end;

end.
