unit U_RVG;

interface

uses System.SysUtils;

function calcEinfach(streitwert: real):real;
function calcBrief(Streitwert: real):real;

implementation

// Funktion um die Einfachgebühr zu berechnen
function calcEinfach(streitwert: real):real;
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

function calcBrief(Streitwert: real):real;
begin
  result:= calcEinfach(Streitwert) * 1.3;
end;

end.
