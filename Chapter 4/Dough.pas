unit Dough;

interface

type
	TDough = class abstract 
  protected
  	FName: string;
  public
   constructor Create; virtual; abstract;	
   function GetName: string;
  end;

  TThickCrustDough = class(TDough)
  public
     constructor Create; override;
  end;

  TThinCrustDough = class(TDough)
  public
    constructor Create; override;
  end;

implementation

{ TThickCrustDough }

constructor TThickCrustDough.Create;
begin
	FName := 'Thick Crust Dough';
end;

{ TDough }

function TDough.GetName: string;
begin
	Result := FName;
end;

{ TThinCrustDough }

constructor TThinCrustDough.Create;
begin
	FName := 'Thin Crust Dough';
end;

end.
