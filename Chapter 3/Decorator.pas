unit Decorator;

interface

uses Beverages;

type
	TCondimentDecorator = class abstract(TBeverage) 
  	FBeverage: TBeverage;
  	function GetDescription: string; override;
    constructor Create(ABeverage: TBeverage); virtual;
  end; 

  TMocha = class(TCondimentDecorator)
    function GetDescription: string; override;
    function Cost: Double; override;
  end;

  TWhip = class(TCondimentDecorator)
    function GetDescription: string; override;
    function Cost: Double; override;
  end;

implementation

uses
  System.SysUtils;

{ TMocha }

function TMocha.Cost: Double;
begin
  case FBeverage.GetSize of
  	TALL: Result := FBeverage.Cost + 3.99;
    GRANDE: Result := FBeverage.Cost + 5.99;
    VENTI: Result := FBeverage.Cost + 8.99  
  end;
end;

function TMocha.GetDescription: string;
begin
	Result := FBeverage.GetDescription + ', Mocha';
end;

{ TCondimentDecorator }

constructor TCondimentDecorator.Create(ABeverage: TBeverage);
begin
	inherited Create;
	FBeverage := ABeverage;
end;

function TCondimentDecorator.GetDescription: string;
begin
	Result := FBeverage.GetDescription + ', Unkown Decorator';
end;

{ TWhip }

function TWhip.Cost: Double;
begin
  case FBeverage.GetSize of
  	TALL: Result := FBeverage.Cost + 5;
    GRANDE: Result := FBeverage.Cost + 10;
    VENTI: Result := FBeverage.Cost + 15;  
  end;
end;

function TWhip.GetDescription: string;
begin
	Result := FBeverage.GetDescription + ', Whip';
end;

end.
