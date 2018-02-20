unit U_TWarenkorb;

interface

uses FMX.Grid, U_RVG, U_Utils;

type
  TRVGFunc = function (streitwert: real): real;

  TWarenkorb = class
  public
    Content: TIntArray;
    Functions: array[0..12] of TRVGFunc;

    procedure Add(itemId: integer; aGrid: TGrid);
    procedure Update(aGrid: TGrid);

    function getPrice(itemId: integer; streitwert: real):real;

    constructor Create;

    const
      Names: array[0..12] of string = (
            ('Brief'),

            ('Brief-Mahn'),
            ('Brief-Mahn-Klage-Gericht-Verlieren'),
            ('Brief-Mahn-Klage-Vergleich'),
            ('Brief-Mahn-Klage-Berufung'),

            ('Brief-Mahn-Vollbesch'),
            ('Brief-Mahn-VollBesch-Voll'),
            ('Brief-Mahn-VollBesch-Klage-Gericht-Verlieren'),
            ('Brief-Mahn-VollBesch-Klage-Vergleich'),
            ('Brief-Mahn-VollBesch-Klage-Berufung'),

            ('Klage-Gericht-Verlieren'),

            ('Klage-Vergleich'),

            ('Klage-Berufung')
      );
end;

implementation


constructor TWarenkorb.Create;
begin
  SetLength(Content, 0);

  Functions[0] := @U_RVG.calcBrief;

  Functions[1] := @U_RVG.calcBriefMahn;
  Functions[2] := @U_RVG.calcBriefMahnKlageGerichtVerlieren;
  Functions[3] := @U_RVG.calcBriefMahnKlageVergleich;
  Functions[4] := @U_RVG.calcBriefMahnKlageBerufung;

  Functions[5] := @U_RVG.calcBriefMahnvollBesch;
  Functions[6] := @U_RVG.calcBriefMahnvollBeschVoll;

  Functions[7] := @U_RVG.calcBriefMahnVollBeschKlageGerichtVerlieren;
  Functions[8] := @U_RVG.calcBriefMahnVollBeschKlageVergleich;
  Functions[9] := @U_RVG.calcBriefMahnVollBeschKlageBerufung;

  Functions[10] := @U_RVG.calcKlageGerichtVerlieren;

  Functions[11] := @U_RVG.calcKlageVergleich;

  Functions[12] := @U_RVG.calcKlageBerufung;
end;

procedure TWarenkorb.Add(itemId: integer; aGrid: TGrid);
begin
  if itemId < 13 then
  begin
    SetLength(Content, Length(Content) + 1);
    Content[High(Content)] := itemId;
    Update(aGrid);
  end;
end;

procedure TWarenkorb.Update(aGrid: TGrid);
begin
  aGrid.RowCount := Length(Content);
end;

function TWarenkorb.getPrice(itemId: integer; streitwert: real):real;
begin
  if itemId < 13 then
    result := trunc(Functions[itemId](streitwert) * 100) / 100;
end;




end.
