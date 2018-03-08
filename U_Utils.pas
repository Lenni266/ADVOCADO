unit U_Utils;

{< Sammlung von praktischen Methoden. }

interface

uses FMX.Grid, FMX.Controls, System.Classes, System.SysUtils, System.UITypes;

type
  { Dynamisches Array des Typs @bold(Integer). }
  TIntArray = array of integer;

{ Löscht ein Objekt aus einem dynamischen Array des Typs @link(TIntArray), ohne das eine Lücke entsteht.
  @param AArray Ein dynamischer Array des Typs @link(TIntArray).
  @param AIndex Index des zu löschenden Elements. }
procedure DelIntArrElement(var AArray: TIntArray; const AIndex: Integer);
{ Ermöglicht das synchrone fokussieren eines @bold(TControl)-Objekts.
  @param AControl Ein @bold(TControl)-Objekt. }
procedure DelayedSetFocus(AControl : TControl);
{ Überprüft ob der übergebene @bold(String) als @bold(Float) dargestellt werden kann.
  @param s Ein @bold(String).
  @returns Falls der String als Float dargestellt werden kann @true, ansonsten @false. }
function IsStrFloatNum(s: string): Boolean;

{ Array von Chars, welche eine Zahl darstellen (0-9). }
const numKeys = ['0','1','2','3','4','5','6','7','8','9','0'];
{ Array von Virtual Keys, welche bei der Eingabe in ein Edit-Feld benötigt werden. }
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

procedure DelayedSetFocus(AControl : TControl);
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      TThread.Synchronize( nil,
         procedure
         begin
           AControl.SetFocus;
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
