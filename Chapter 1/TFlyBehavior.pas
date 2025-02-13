unit TFlyBehavior;

interface

uses IFlyBehavioru;

type
	TFlyWithWings = class(TInterfacedObject, IFlyBehavior)
  private
  public
  	function Fly: string;
  end;

type
	TFlyNoWay = class(TInterfacedObject, IFlyBehavior)
  private
  public
  	function Fly: string;
  end;

type
	TFlyWithRocket = class(TInterfacedObject, IFlyBehavior)
  private
  	function Fly: String;
  end;

implementation


{ TFlyWithWings }

function TFlyWithWings.Fly: string;
begin
	Result := 'The Duck is flying';
end;

{ TFlyNoWay }

function TFlyNoWay.Fly: string;
begin
 Result := 'can''t fly';
end;

{ TFlyWithRocket }

function TFlyWithRocket.Fly: String;
begin
	Result := 'Im flying with a rocket';
end;

end.
