unit U_TWarenkorb;

{< Beinhaltet die Klasse @bold(TWarenkorb), die in der Unit @link(U_Warenkorb) verwendet wird. }

interface

uses FMX.Grid, U_RVG, U_Utils;

type
  { Klasse einer Funktion, für die Berechnung eines Falls. }
  TRVGFunc = function (streitwert: real): real;

  { Klasse, welche für die Auswahl zuständig ist. }
  TWarenkorb = class
  public
    { Beinhaltet alle ausgewählten Fälle bzw. deren IDs (0-12). }
    Content: TIntArray;
    { Beinhaltet die Referenzen zu den @link(TRVGFunc)-Funktionen, zur Berechnung der Fälle. }
    Functions: array[0..12] of TRVGFunc;

    { Vergrößert das TGrid um eine Zeile und übergibt die ID des ausgewählten Falls, damit später der Name und Preis des richtigen Falls eingetragen wird. }
    procedure Add(itemId: integer; aGrid: TGrid);
    { Aktualisiert das TGrid, damit alle neu ausgewählten Fälle angezeigt werden. }
    procedure Update(aGrid: TGrid);

    { Ruft die durch den Constructor @link(Create) gespeicherte Funktion auf.
      @param itemID Die durch Knopfdruck übergebene ID des ausgewählten Falls.
      @param streitwert Der Streitwert des Falls, der an die Berechnungsfunktionen weitergegeben wird.
      @returns Den ausgegeben Preis auf zwei Nachkommastellen gerundet. }
    function getPrice(itemId: integer; streitwert: real):real;

    { Speichert die ausgewählte Berechnungsfunktion in @link(Functions), die später ausgeführt werden soll. }
    constructor Create;

    const
    { Die Namen aller möglichen Fälle. Je nach ID (0-12) wird der Name des dazugehörigen Falls im Array gespeichert, um im @bold(TGrid) angezeigt zu werden. }
      Names: array[0..12] of string = (
      {0}   ('Brief'),

      {1}   ('Brief-Mahn'),
      {2}   ('Brief-Mahn-Klage-Gericht-V.'),
      {3}   ('Brief-Mahn-Klage-Vergleich'),
      {4}   ('Brief-Mahn-Klage-Berufung'),

      {5}   ('Brief-Mahn-Vollbesch'),
      {6}   ('Brief-Mahn-VollBesch-Voll'),
      {7}   ('Brief-Mahn-VollBesch-Klage-Gericht-V.'),
      {8}   ('Brief-Mahn-VollBesch-Klage-Vergleich'),
      {9}   ('Brief-Mahn-VollBesch-Klage-Berufung'),

      {10}   ('Klage-Gericht-Verlieren'),

      {11}   ('Klage-Vergleich'),

      {12}   ('Klage-Berufung')
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
  aGrid.BeginUpdate;
  aGrid.RowCount := Length(Content);
  aGrid.EndUpdate;
end;

function TWarenkorb.getPrice(itemId: integer; streitwert: real):real;
begin
  if itemId < 13 then
    result := trunc(Functions[itemId](streitwert) * 100) / 100;
end;




end.
