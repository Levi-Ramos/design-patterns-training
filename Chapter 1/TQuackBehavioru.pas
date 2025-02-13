unit TQuackBehavioru;

interface

uses IQuackBehavioru;

type
	TQuack = class(TInterfacedObject, IQuackBehavior)
  public
  	function Quack: string;
  end;

type
	TSqueak = class(TInterfacedObject, IQuackBehavior)
  public
   function Quack: string;	
  end;

type
	TMuteQuack = class(TInterfacedObject, IQuackBehavior)
  public
  	function Quack: string;
  end;

implementation


{ TSqueak }

function TSqueak.Quack: string;
begin
	Result := 'Squeak';
end;

{ TQuack }

function TQuack.Quack: string;
begin
	Result := 'Quack';
end;

{ TMuteQuack }

function TMuteQuack.Quack: string;
begin
	Result := '...';
end;

end.
