unit U_Utils;

interface

uses FMX.Grid, FMX.Controls, System.Classes;

type
  TIntArray = array of integer;

procedure DelIntArrElement(var AArray: TIntArray; const AIndex: Integer);
procedure DelayedSetFocus(control : TControl);

implementation

procedure DelIntArrElement(var AArray: TIntArray; const AIndex: Integer);
begin
  if AIndex < Length(AArray) then
  begin
    Move(AArray[AIndex + 1], AArray[AIndex], SizeOf(AArray[0]) * (Length(AArray) - AIndex - 1));
    SetLength(AArray, Length(AArray) - 1);
  end;
end;

procedure DelayedSetFocus(control : TControl);
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      TThread.Synchronize( nil,
         procedure
         begin
           control.SetFocus;
         end
      );
    end
  ).Start;
end;

end.
