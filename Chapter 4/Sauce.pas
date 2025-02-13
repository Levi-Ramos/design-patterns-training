unit Sauce;

interface

type
	TSauce = class abstract
  protected
  	FName: string;
  public
  	constructor Create; virtual; abstract;
    function GetName: string;
  end; 

  TMarinaraSauce = class(TSauce)
  public
    constructor Create; override;
  end;

  TPlumTomatoSauce = class(TSauce)
  public
  	constructor Create; override;
  end;


implementation

{ TBruschettaSauce }

constructor TPlumTomatoSauce.Create;
begin
	FName := 'Bruschetta Sauce';
end;

{ TMarinaraSauce }

constructor TMarinaraSauce.Create;
begin
	FName := 'Marinara Sauce';
end;

{ TSauce }

function TSauce.GetName: string;
begin
	Result := FName;
end;

end.
