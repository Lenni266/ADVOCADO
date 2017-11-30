unit U_RVG;

interface

uses System.SysUtils;

{ Berechnet die Einfachgebuehr nach dem RVG
  @param streitwert Der Streitwert des Falls.
  @returns Die berechnete Einfachgebuehr als @bold(Float). }
function calcEinfach(streitwert: real): real;

function calcBrief(streitwert: real): real;
function calcMahnungBrief(streitwert: real): real;

implementation


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

function calcBrief(streitwert: real): real;
begin
  if calcEinfach(Streitwert) * 0.26 < 20 then
    result:= calcEinfach(Streitwert) * 1.26  //Überprüfungswürdig (besser gesagt: definitv falsch)
  else result:= calcEInfach(Streitwert) + 20;
end;

function calcMahnungBrief(streitwert: real): real;
begin
  result:=(calcEinfach(Streitwert) * 1.0) + (0.5 * calcBrief(Streitwert));
end;

{function calcVollstreckung(Streitwert: real):real;
begin
  result:=calcEinfach(Streitwert) *
end;

function calcAussergerichtlich(Streitwert: real):real;
begin
  result:=calcEinfach(Streitwert) *
end;

function calcGericht(Streitwert: real):real;
begin
  result:=calcEinfach(Streitwert) *
end;   }

end.
