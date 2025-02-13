unit Beverages;

interface

type
	ESize = (TALL, GRANDE, VENTI);
  
	TBeverage = class abstract
  	FDescription: string;
    FSize: ESize;
  	function GetDescription: string; virtual;
    function GetSize: ESize;
    procedure SetSize(ASize: ESize);
    function Cost: Double; virtual; abstract;
    constructor Create; virtual; 
  end;

  TEspresso = class(TBeverage)
  	constructor Create; override;
    function Cost: Double; override;
  end;                       	

  THouseBlend = class(TBeverage)
  	constructor Create; override;
    function Cost: Double; override;
  end;

implementation

{ TBeverage }

constructor TBeverage.Create;
begin
	FDescription := 'Unknown Beverage';
  FSize := TALL;
end;

function TBeverage.GetDescription: string;
begin
	Result := FDescription;
end;

function TBeverage.GetSize: ESize;
begin
	Result := FSize;
end;

procedure TBeverage.SetSize(ASize: ESize);
begin
	FSize := ASize;
end;

function TEspresso.cost: Double;
begin
	case FSize of
  	TALL: Result := 5.25;
    GRANDE: Result := 8.25;
    VENTI: Result := 10.25;
  end;
end;

constructor TEspresso.Create;
begin
	FDescription := 'Espresso';
end;

{ THouseBlend }

function THouseBlend.Cost: DOuble;
begin
		case FSize of
  	TALL: Result := 3.5;
    GRANDE: Result := 5;
    VENTI: Result := 7.5;
  end;
end;

constructor THouseBlend.Create;
begin
	FDescription := 'House Blend Coffee';
end;

end.
