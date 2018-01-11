unit U_RVG;

interface

uses System.SysUtils;

{ Berechnet die Einfachgebuehr nach dem RVG
  @param streitwert Der Streitwert des Falls.
  @returns Die berechnete Einfachgebuehr als @bold(Float). }
function calcEinfach(streitwert: real): real;
function calcGKG(streitwert: real): real;

function calcBrief(streitwert: real): real;
function calcBriefMahn(streitwert: real): real;
function calcBriefMahnKlageGer(streitwert: real): real;
function calcBriefMahnKlageGerLose(streitwert: real): real;
function calcBriefMahnKlageVergl(streitwert: real): real;
function calcBriefMahnKlageBeruf(streitwert: real): real;

function calcBriefMahnKlageVollb(streitwert: real): real;
function calcBriefMahnKlageVollbKlageGer(streitwert: real): real;
function calcBriefMahnKlageVollbKlageGerLose(streitwert: real): real;
function calcBriefMahnKlageVollbKlageVergl(streitwert: real): real;
function calcBriefMahnKlageVollbKlageBeruf(streitwert: real): real;
function calcBriefMahnKlageVollbVoll(streitwert: real): real;

function calcBriefAusGerVerg(streitwert: real): real;
function calcBriefAusGerVergVollb(streitwert: real): real;
function calcBriefAusGerVergVollbVoll(streitwert: real): real;

function calcKlageGer(streitwert: real): real;
function calcKlageGerLose(streitwert: real): real;
function calcKlageVergl(streitwert: real): real;
function calcKlageBeruf(streitwert: real): real;
function calcKlageGerVollb(streitwert: real): real;
function calcKlageGerVollbVoll(streitwert: real): real;

implementation

uses U_Haupt;

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

function calcBrief(streitwert: real): real;
var
  einfach: real;
begin
  einfach:= calcEinfach(Streitwert);

  if 0.2 * einfach < 20 then
    result:= einfach * 1.2
  else
    result:= (einfach + 20) * 1.19;       //Steuern
end;

function calcBriefMahn(streitwert: real): real;
begin
  result:= 1.0 * calcEinfach(Streitwert) + 0.5 * calcBrief(Streitwert)
end;

function calcBriefMahnKlageGer(streitwert: real): real;
var
klagekosten, gerichtskosten: real;
begin
  //fragen, was genau noch gezahlt werden muss bei Gewinn (alternative ist Lose-Fall)
  result:=0;
end;

function calcBriefMahnKlageGerLose(streitwert: real): real;//nach Unterschied zwischen dem und normal Gericht fragen
var
klagekosten, gerichtskosten: real;
begin
  klagekosten:= 2.5 * calcEinfach(streitwert);
  gerichtskosten:= 3.0 * calcGKG(streitwert);
  result:= (calcBriefMahn(streitwert) + (2*klagekosten)) * 1.19 + gerichtskosten;//Wegen genauer Lose-Unterschied fragen
  end;

function calcBriefMahnKlageVergl(streitwert: real): real;
begin

end;

function calcBriefMahnKlageBeruf(streitwert: real): real;
begin

end;

function calcBriefMahnKlageVollb(streitwert: real): real;
begin

end;

function calcBriefMahnKlageVollbKlageGer(streitwert: real): real;
begin

end;

function calcBriefMahnKlageVollbKlageGerLose(streitwert: real): real;
begin

end;

function calcBriefMahnKlageVollbKlageVergl(streitwert: real): real;
begin

end;

function calcBriefMahnKlageVollbKlageBeruf(streitwert: real): real;
begin

end;

function calcBriefMahnKlageVollbVoll(streitwert: real): real;
begin

end;


function calcBriefAusGerVerg(streitwert: real): real;
begin
  result:= (calcBrief(streitwert) + 1.5 * calcEinfach(Streitwert)) * 1.19;
end;

function calcBriefAusGerVergVollb(streitwert: real): real;
var
vollb: real;
begin
  vollb:= 0.3 * calcEinfach(streitwert) * 1.19;
  result:= calcBriefAusGerVerg(streitwert) + vollb; //beide Grundwerte sind schon versteuert
end;

function calcBriefAusGerVergVollbVoll(streitwert: real): real;
var
  VollKosten: real;   //UNBEDINGT 40% Streitwert oder 40% Einfachgebühr???????????
begin                 //wirklich ezb-zins + 5%? oder purer zins? sind zinskosten auf richtige Stellen bezogen?
  VollKosten:= (0.3 * calcEinfach(streitwert) * 1.19 + 0.1 * calcEinfach(streitwert)) * (1 + (FRUpdater.FR / 100));
  result := calcBriefAusGerVerg(streitwert) + VollKosten; //no steuern, weil die in beidem schon drin sind
end;

function calcKlageGer(streitwert: real): real;
begin
     //wie BriefMahnKlageGer (je nachdem, wie das zwischen Lose und Win oben geklärt wurde
end;

function calcKlageGerLose(streitwert: real): real;
begin
    //wie BriefMahnKlageGerLose (je nachdem, wie das zwischen Lose und Win oben geklärt wurde
end;

function calcKlageVergl(streitwert: real): real;
begin
  //result:= 3.5 *
end;

function calcKlageBeruf(streitwert: real): real;
begin

end;

function calcKlageGerVollb(streitwert: real): real;
begin

end;

function calcKlageGerVollbVoll(streitwert: real): real;
begin

end;

end.
