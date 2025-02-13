unit SeafoodTopping;

interface

type
	TSeafoodTopping = class abstract
  protected
  	FName: string;
  public
  	constructor Create; virtual; abstract;
    function GetName: string;
  end;

  TFrozenClams = class(TSeafoodTopping)
  public
    constructor Create; override;
  end;

  TFreshClams = class(TSeafoodTopping)
  public
    constructor Create; override;
  end;

implementation

{ TSeafoodTopping }

function TSeafoodTopping.GetName: string;
begin
	Result := FName;
end;

{ TFreshClams }

constructor TFreshClams.Create;
begin
	FName := 'Fresh Clams';
end;

{ TFrozenClams }

constructor TFrozenClams.Create;
begin
	FName := 'Frozen Clams';
end;

end.
