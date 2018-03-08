unit U_RVG;

{< Berechnung der Einfachgebühr, der Gerichtskosten und aller möglichen Fälle. }

interface

uses System.SysUtils;

{ Berechnet die Einfachgebühr nach dem RVG.
  @param streitwert Der Streitwert des Falls.
  @returns Die berechnete Einfachgebuehr als @bold(Float). }
  function calcEinfach(streitwert: real): real;
{ Berechnet die Gerichtskostengebühr nach dem GKG.
  @param streitwert Der Streitwert des Falls.
  @returns Die berechneten Gerichtskostengebühr als @bold(Float). }
  function calcGKG(streitwert: real): real;

{ Berechnet die Kosten eines Briefs.
  @param streitwert Der Streitwert des Falls. Die weitere Berechnung der Kosten erfolgt, nachdem dieser durch die Funktion @link(calcEinfach) in die Einfachgebühr umgerechnet wurde.
  @returns Die Gesamtkosten eines Briefs. }
  function calcBrief(streitwert: real): real;

{ Berechnet die Kosten eines Briefs mit einem Mahnbescheid.
  @param streitwert Der Streitwert des Falls. Die weitere Berechnung der Kosten erfolgt, nachdem dieser durch die Funktion @link(calcEinfach) in die Einfachgebühr umgerechnet wurde.
  @returns Die Gesamtkosten eines Briefs mit Mahnbescheid. }
  function calcBriefMahn(streitwert: real): real;
{ Berechnet die Kosten eines Briefs mit einer darauf folgenden Klage und einem Gerichtsverfahren.
  @param streitwert Der Streitwert des Falls. Die weitere Berechnung der Kosten erfolgt, nachdem dieser durch die Funktion @link(calcEinfach) in die Einfachgebühr umgerechnet wurde.
  @returns Die Gesamtkosten eines Briefs mit einer darauf folgenden Klage und einem Gerichtsverfahren. }
  function calcBriefMahnKlageGerichtVerlieren(streitwert: real): real;
{ Berechnet die Kosten eines Briefs mit einer darauf folgenden Klage und einem Vergleich.
  @param streitwert Der Streitwert des Falls. Die weitere Berechnung der Kosten erfolgt, nachdem dieser durch die Funktion @link(calcEinfach) in die Einfachgebühr umgerechnet wurde.
  @returns Die Gesamtkosten eines Briefs mit einer darauf folgenden Klage und einem Vergleich. }
  function calcBriefMahnKlageVergleich(streitwert: real): real;
{ Berechnet die Kosten eines Briefs mit einer darauf folgenden Klage und eingegangener Berufung.
  @param streitwert Der Streitwert des Falls. Die weitere Berechnung der Kosten erfolgt, nachdem dieser durch die Funktion @link(calcEinfach) in die Einfachgebühr umgerechnet wurde.
  @returns Die Gesamtkosten eines Briefs mit einer darauf folgenden Klage und eingegangener Berufung. }
  function calcBriefMahnKlageBerufung(streitwert: real): real;

{ Berechnet die Kosten eines Briefs mit einem Mahnbescheid und einem Vollstreckungsbescheid.
  @param streitwert Der Streitwert des Falls. Die weitere Berechnung der Kosten erfolgt, nachdem dieser durch die Funktion @link(calcEinfach) in die Einfachgebühr umgerechnet wurde.
  @returns Die Gesamtkosten eines Briefs mit einem Mahnbescheid und einem Vollstreckungsbescheid. }
  function calcBriefMahnvollBesch(streitwert: real): real;
{ Berechnet die Kosten eines Briefs mit einem Mahnbescheid und einem Vollstreckungsbescheid mit Vollstreckung.
  @param streitwert Der Streitwert des Falls. Die weitere Berechnung der Kosten erfolgt, nachdem dieser durch die Funktion @link(calcEinfach) in die Einfachgebühr umgerechnet wurde.
  @returns Die Gesamtkosten eines Briefs mit einem Mahnbescheid und einem Vollstreckungsbescheid mit Vollstreckung. }
  function calcBriefMahnvollBeschVoll(streitwert: real): real;

{ Berechnet die Kosten eines Briefs mit Mahnbescheid und einem Vollstreckungsbescheid mit darauf folgender Klage und einem Gerichtsverfahren.
  @param streitwert Der Streitwert des Falls. Die weitere Berechnung der Kosten erfolgt, nachdem dieser durch die Funktion @link(calcEinfach) in die Einfachgebühr umgerechnet wurde.
  @returns Die Gesamtkosten eines Briefs mit Mahnbescheid und einem Vollstreckungsbescheid mit darauf folgender Klage und einem Gerichtsverfahren. }
  function calcBriefMahnVollBeschKlageGerichtVerlieren(streitwert: real): real;
{ Berechnet die Kosten eines Briefs mit Mahnbescheid und einem Vollstreckungsbescheid mit darauf folgender Klage und einem Vergleich.
  @param streitwert Der Streitwert des Falls. Die weitere Berechnung der Kosten erfolgt, nachdem dieser durch die Funktion @link(calcEinfach) in die Einfachgebühr umgerechnet wurde.
  @returns Die Gesamtkosten eines Briefs mit Mahnbescheid und einem Vollstreckungsbescheid mit darauf folgender Klage und einem Vergleich. }
  function calcBriefMahnVollBeschKlageVergleich(streitwert: real): real;
{ Berechnet die Kosten eines Briefs mit Mahnbescheid und einem Vollstreckungsbescheid mit darauf folgender Klage und eingegangener Berufung.
  @param streitwert Der Streitwert des Falls. Die weitere Berechnung der Kosten erfolgt, nachdem dieser durch die Funktion @link(calcEinfach) in die Einfachgebühr umgerechnet wurde.
  @returns Die Gesamtkosten eines Briefs mit Mahnbescheid und einem Vollstreckungsbescheid mit darauf folgender Klage und eingegangener Berufung. }
  function calcBriefMahnVollBeschKlageBerufung(streitwert: real): real;

{ Berechnet die Kosten einer direkten Klage mit Gerichtsverfahren.
  @param streitwert Der Streitwert des Falls. Die weitere Berechnung der Kosten erfolgt, nachdem dieser durch die Funktion @link(calcEinfach) in die Einfachgebühr umgerechnet wurde.
  @returns Die Gesamtkosten einer direkten Klage mit Gerichtsverfahren. }
  function calcKlageGerichtVerlieren(streitwert: real): real;

{ Berechnet die Kosten einer direkten Klage mit Vergleich.
  @param streitwert Der Streitwert des Falls. Die weitere Berechnung der Kosten erfolgt, nachdem dieser durch die Funktion @link(calcEinfach) in die Einfachgebühr umgerechnet wurde.
  @returns Die Gesamtkosten einer direkten Klage mit Vergleich. }
  function calcKlageVergleich(streitwert: real): real;

{ Berechnet die Kosten einer direkten Klage mit eingegangener Berufung.
  @param streitwert Der Streitwert des Falls. Die weitere Berechnung der Kosten erfolgt, nachdem dieser durch die Funktion @link(calcEinfach) in die Einfachgebühr umgerechnet wurde.
  @returns Die Gesamtkosten einer direkten Klage mit eingegangener Berufung. }
  function calcKlageBerufung(streitwert: real): real;


implementation

uses U_Uebersicht;

function calcEinfach(streitwert: real): real;
var
  currentSW, ergebnis: integer;
begin
  currentSW:= 501;   // Zwischenstand: Streitwert
  ergebnis:= 45;     // Basisgebühr

  while currentSW <= streitwert do  // bis der angegebene Streitwert erreicht ist
  begin
    case currentSW of
      501..2000:
        begin
          currentSW:= currentSW + 500;
          ergebnis:= ergebnis + 35;
        end;
      2001..10000:
        begin
          currentSW:= currentSW + 1000;
          ergebnis:= ergebnis + 51;
        end;
      10001..25000:
        begin
          currentSW:= currentSW + 3000;
          ergebnis:= ergebnis + 46;
        end;
      25001..50000:
        begin
          currentSW:= currentSW + 5000;
          ergebnis:= ergebnis + 75;
        end;
      50001..200000:
        begin
          currentSW:= currentSW + 15000;
          ergebnis:= ergebnis + 85;
        end;
      200001..500000:
        begin
          currentSW:= currentSW + 30000;
          ergebnis:= ergebnis + 120;
        end;
      500001..High(Integer):
        begin
          currentSW:= currentSW + 50000;
          ergebnis:= ergebnis + 150;
        end;
    end;
  end;

  result:= ergebnis;
end;

function calcGKG(streitwert: real): real;
var
  currentSW, ergebnis: integer;
begin
  currentSW:= 501;   // Zwischenstand: Streitwert
  ergebnis:= 35;     // Basisgebühr

  while currentSW <= streitwert do  // bis der angegebene Streitwert erreicht ist
  begin
    case currentSW of
      501..2000:
        begin
          currentSW:= currentSW + 500;
          ergebnis:= ergebnis + 18;
        end;
      2001..10000:
        begin
          currentSW:= currentSW + 1000;
          ergebnis:= ergebnis + 19;
        end;
      10001..25000:
        begin
          currentSW:= currentSW + 3000;
          ergebnis:= ergebnis + 26;
        end;
      25001..50000:
        begin
          currentSW:= currentSW + 5000;
          ergebnis:= ergebnis + 35;
        end;
      50001..200000:
        begin
          currentSW:= currentSW + 15000;
          ergebnis:= ergebnis + 120;
        end;
      200001..500000:
        begin
          currentSW:= currentSW + 30000;
          ergebnis:= ergebnis + 179;
        end;
      500001..High(Integer):
        begin
          currentSW:= currentSW + 50000;
          ergebnis:= ergebnis + 180;
        end;
    end;
  end;

  result:= ergebnis;
end;

//Bei allen funktionen muss HINTERHER noch die Steuer draufgerechnet werden!!!

function calcBrief(streitwert: real): real; //Stimmt
var
  einfach: real;
begin
  einfach:= calcEinfach(Streitwert);

  if 0.2 * einfach < 20 then
    result:= einfach * 1.2
  else
    result:= einfach + 20 ;
end;

function calcBriefMahn(streitwert: real): real;
begin
  result:= 1.0 * calcEinfach(Streitwert) + 0.5 * calcBrief(Streitwert);
end;

function calcBriefMahnvollBesch(streitwert: real): real;
begin
  result := 0.3 * calceinfach(Streitwert) + 0.5 * CalcBriefMahn(Streitwert);
end;

function calcBriefMahnvollBeschVoll(streitwert: real): real;
begin
  result := 0.6 * calceinfach(Streitwert) + 0.1 * (1/1.19) * calceinfach(Streitwert);
end;

function calcBriefMahnKlageGerichtVerlieren(streitwert: real): real;
begin
  result := 2 * (2.5 * calceinfach(Streitwert) + 0.5 * calcBrief(Streitwert));
end;

function calcBriefMahnKlageVergleich(streitwert: real): real;
begin
  result := 3.5 * calceinfach(Streitwert) + 0.5 * calcBrief(Streitwert);
end;

function calcBriefMahnKlageBerufung(streitwert: real): real;
begin
  result := 5.3 * calceinfach(Streitwert) + 0.5 * calcBrief(Streitwert);
end;

function calcBriefMahnVollBeschKlageGerichtVerlieren(streitwert: real): real;
begin
  result := 2 * (2.8 * calceinfach(Streitwert) + 0.5 * calcBrief(Streitwert));
end;

function calcBriefMahnVollBeschKlageVergleich(streitwert: real): real;
begin
  result := 3.5 * calceinfach(Streitwert) + 0.5 * CalcBrief(streitwert);
end;

function calcBriefMahnVollBeschKlageBerufung(streitwert: real): real;
begin
  result := 5.6 * calceinfach(streitwert) + 0.5 * CalcBrief(streitwert);
end;

function calcKlageGerichtVerlieren(streitwert: real): real;
begin
  result := 5.0 * calceinfach(streitwert);
end;

function calcKlageVergleich(streitwert: real): real;
begin
  result := 3.5 * calceinfach(streitwert);
end;

function calcKlageBerufung(streitwert: real): real;
begin
  result := 5.3 * calceinfach(streitwert);
end;

end.
