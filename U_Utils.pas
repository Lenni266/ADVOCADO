unit U_Utils;

interface

uses FMX.Grid, FMX.Controls, System.Classes, System.SysUtils, System.UITypes;

type
  TIntArray = array of integer;

procedure DelIntArrElement(var AArray: TIntArray; const AIndex: Integer);
procedure DelayedSetFocus(control : TControl);
function IsStrFloatNum(s: string): Boolean;

const myNum = ['0','1','2','3','4','5','6','7','8','9','0'];
const navKeys = [vkDelete, vkBack, vkLeft, vkRight];

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


function IsStrFloatNum(s: string): Boolean;
begin
  try
    StrToFloat(s);
    Result := True;
  except
    Result := False;
  end;
end;

end.
