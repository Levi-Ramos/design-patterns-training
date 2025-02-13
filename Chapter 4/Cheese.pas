unit Cheese;

interface

type
	TCheese = class abstract
  protected
  	FName: string;
  public
  	constructor Create; virtual; abstract;
    function GetName: string;
  end;

  TMozzarellaCheese = class(TCheese)
  public
    constructor Create; override;
  end;

  TReggianoCheese = class(TCheese)
  public
    constructor Create; override;
  end;

implementation

{ TReggianoCheese }

constructor TReggianoCheese.Create;
begin
	FName := 'Reggiano Cheese';
end;

{ TMozzarellaCheese }

constructor TMozzarellaCheese.Create;
begin
	FName := 'Mozzarella Cheese';
end;

{ TCheese }

function TCheese.GetName: string;
begin
	Result := FName;
end;

end.
