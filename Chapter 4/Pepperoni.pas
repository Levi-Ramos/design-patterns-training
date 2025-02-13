unit Pepperoni;

interface

type
	TPepperoni = class abstract
  protected
  	FName: string;
  public
  	constructor Create; virtual; abstract;
    function GetName: string;
  end;

  TCuttedPepperoni = class(TPepperoni)
  public
    constructor Create; override;
  end;

implementation

{ TCuttedPepperoni }

constructor TCuttedPepperoni.Create;
begin
	FName := 'Cutted Pepperoni';
end;

{ TPepperoni }

function TPepperoni.GetName: string;
begin
	Result := FName;
end;

end.
