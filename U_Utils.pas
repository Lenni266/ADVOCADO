unit U_Utils;

interface

type
  TIntArray = array of integer;

procedure DelIntArrElement(var AArray: TIntArray; const AIndex: Integer);

implementation

procedure DelIntArrElement(var AArray: TIntArray; const AIndex: Integer);
begin
  if AIndex < Length(AArray) then
  begin
    Move(AArray[AIndex + 1], AArray[AIndex], SizeOf(AArray[0]) * (Length(AArray) - AIndex - 1));
    SetLength(AArray, Length(AArray) - 1);
  end;
end;

end.
