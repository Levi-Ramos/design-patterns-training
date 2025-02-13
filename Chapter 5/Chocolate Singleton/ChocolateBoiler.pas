unit ChocolateBoiler;

interface

uses
  System.SysUtils, System.SyncObjs;

type
	TChocolateBoiler = class
  public
  	class function GetInstance: TChocolateBoiler; 
    procedure Fill;
    procedure Drain;
    procedure Boil;
    function isEmpty: Boolean;
    function isBoiled: Boolean;
  private
  	class var FChocolateBoiler: TChocolateBoiler;
    FEmpty: Boolean;
    FBoiled: Boolean;
  	constructor Create;
    class constructor ClassCreate;
  end;

implementation



{ TChocolateBoiler }


procedure TChocolateBoiler.Boil;
begin
	if (not isEmpty) AND (not isBoiled) then
  begin
  	FBoiled := True;
    Writeln('Boiling');
  end;
end;

class constructor TChocolateBoiler.ClassCreate;
begin
	FChocolateBoiler := TChocolateBoiler.Create;
end;

constructor TChocolateBoiler.Create;                   	
begin
	FEmpty := True;
  FBoiled := False;
end;

procedure TChocolateBoiler.Drain;
begin
	if (not isEmpty) AND isBoiled then
  begin
  	FEmpty := True;
    WRiteln('draining');
  end;
end;

procedure TChocolateBoiler.Fill;
begin
	if isEmpty then
  begin
  	FEmpty := False;
    FBoiled := False;
    Writeln('filling');
    // fill the boilder with milk/chocolate mixture
  end;
end;

class function TChocolateBoiler.GetInstance: TChocolateBoiler;
begin
//	if not Assigned(FChocolateBoiler) then
//  	FChocolateBoiler := TChocolateBoiler.Create;
// instance is eager loaded
  Result := FChocolateBoiler;
end;

function TChocolateBoiler.isBoiled: Boolean;
begin
	Result := FBoiled;
end;

function TChocolateBoiler.isEmpty: Boolean;
begin
	Result := FEmpty;
end;

end.
