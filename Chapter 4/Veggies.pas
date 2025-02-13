unit Veggies;

interface

type
	TVeggies = class abstract
  protected
  	FName: string;
  public
  	constructor Create; virtual; abstract;
		function GetName: string;
  end;

  TGarlic = class(TVeggies)
    constructor Create; override;
  end;

  TOnion = class(TVeggies)
    constructor Create; override;
  end;

  TMushroom = class(TVeggies)
    constructor Create; override;
  end;

  TRedPepper = class(TVeggies)
    constructor Create; override;
  end;

  TSpinach = class(TVeggies)
    constructor Create; override;
  end;

  TBlackOlives = class(TVeggies)
    constructor Create; override;
  end;

  TEggplant = class(TVeggies)
    constructor Create; override;
  end;


implementation

{ TGarlic }

constructor TGarlic.Create;
begin
	FName := 'Garlic';
end;

{ TOnion }

constructor TOnion.Create;
begin
	FName := 'Onion';
end;

{ TMushroom }

constructor TMushroom.Create;
begin
	FName := 'Mushroom';
end;

{ TRedPepper }

constructor TRedPepper.Create;
begin
	FName := 'Red Pepper';
end;

{ TVeggies }

function TVeggies.GetName: string;
begin                                 
	Result := FName;
end;

{ TEggplant }

constructor TEggplant.Create;
begin
	FName := 'Eggplant';
end;

{ TBlackOlives }

constructor TBlackOlives.Create;
begin
	FName := 'Black Olives';
end;

{ TSpinach }

constructor TSpinach.Create;
begin
	FName := 'Spinach';
end;

end.
