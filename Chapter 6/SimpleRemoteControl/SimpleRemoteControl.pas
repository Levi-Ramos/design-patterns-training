unit SimpleRemoteControl;

interface

uses
	Commands;

type
	TSimpleRemoteControl = class
  private
    FOnCommands: TArray<ICommand>;
    FOffCommands: TArray<ICommand>;
    FUndoCommand: ICommand;
  public
  	procedure SetCommand(I: Integer; AOffCommand, AOnCommand: ICommand);
    function ToString: string;
    procedure OnButtonWasPushed(ASlot: Integer);
    procedure OffButtonWasPushed(ASlot: Integer);
    procedure UndoButtonWasPushed;
    constructor Create;
  end;

implementation

{ TSimpleRemoteControl }

uses
	System.SysUtils;

constructor TSimpleRemoteControl.Create;
var
  I: Integer;
  NoCommand: ICommand;
begin
	SetLength(FOnCommands, 7);
  SetLength(FOffCommands, 7);

  NoCommand := TNoCommand.Create;
  for I := 0 to High(FOnCommands) do
  begin
  	FOnCommands[I] := NoCommand;
    FOffCommands[I] := NoCommand;
  end;
  FUndoCommand := NoCommand;
end;
    
procedure TSimpleRemoteControl.OffButtonWasPushed(ASlot: Integer);
begin
	FOffCommands[ASlot].Execute;
  FUndoCommand := FOffCommands[ASlot];
end;

procedure TSimpleRemoteControl.OnButtonWasPushed(ASlot: Integer);
begin
	FOnCommands[ASlot].Execute;
  FUndoCommand := FOnCommands[ASlot];
end;

procedure TSimpleRemoteControl.SetCommand(I: Integer; AOffCommand, AOnCommand: ICommand);
begin
	FOnCommands[I] := AOnCommand;
  FOffCommands[I] := AOffCommand;
end;

function TSimpleRemoteControl.ToString: string;
var
	StringBuilder: TStringBuilder;
  I: Integer;
  UndoCommand, OnCommandObj, OffCommandObj: TObject;
begin
	StringBuilder := TStringBuilder.Create;
  try
    StringBuilder.Append(sLineBreak + '------ Remote Control ------' + sLineBreak);
    for I := 0 to High(FOnCommands) do
    begin
    	OnCommandObj := FOnCommands[I] as TObject;
    	OffCommandObj := FOffCommands[I] as TObject;
      
      StringBuilder.AppendFormat('[slot %d] %s     %s' + sLineBreak, [I, OnCommandObj.ClassName, OffCommandObj.ClassName]);
    end;
    UndoCommand := FUndoCommand as TObject;
    StringBuilder.Append('[undo] ' + UndoCommand.ClassName);
    Result := StringBuilder.ToString;
  finally
   StringBuilder.Free;	
  end;
end;

procedure TSimpleRemoteControl.UndoButtonWasPushed;
begin
	FUndoCommand.Undo;
end;

end.
