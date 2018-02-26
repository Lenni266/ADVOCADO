unit U_FRUpdater;

{< Abrufen und Auslesen des Leitzinses. }

interface

uses System.Classes, System.SysUtils, IdHTTP, U_Utils;

type
  { @abstract(Ruft den aktuellen Leitzins ab und liest ihn aus einer lokaler Datei.)
    Diese Klasse ermöglicht das Abrufen des aktuellen EZB-Leitzinses aus dem Internet über die API des @italic(Statistical Data Warehouse) der EZB.
    Außerdem enthält sie einige Funktionen, die bei der Abfrage helfen. }
  TFRUpdater = class
    private
      { In der Klasse abgespeicherte URL. }
      FURL: string;
      { @abstract(Absoluter Pfad zur Datei, welche den Leitzins enthält.)
        Absoluter Absoluter Pfad zur Datei, welche den Leitzins enthält.
        Wird generiert durch den in @link(Create) angegebenen Dateinamen und das aktuelle Verzeichnis. }
      FFileName: string;
      { Gibt eine Internetseite als String aus.
        @param aURL Die URL der Seite als @bold(String).
        @returns Der Inhalt der Seite als @bold(String). }
      function GetPage(aURL: string): string;
    public
      { Ruft den den aktuellen EZB-Leitzins aus dem Internet über die API des @italic(Statistical Data Warehouse) der EZB ab.
        Dieser wird in die durch @link(FFileName) spezifizierte Datei als Float (z.B. @code(0,000)) abgespeichert. }
      procedure updateFR;
      { Liest den EZB-Leitzins aus der in @link(Create) angegebenen Datei aus.
        Die Datei muss sich im aktuellen Verzeichnis befinden.
        @returns Der Leitzins als @bold(Float). }
      function readFR: real;

      var FR: real;

      procedure writeFRToFile(FR: real);
      { Überprüft ob Verbindung zu @link(FURL) besteht.
        @returns Falls Verbindung besteht: @true, ansonsten @false. }
      function HasInternet: boolean;
      { Überprüft ob die Datei an @link(FFileName) existiert.
        @returns Falls sie existiert: @true, ansonsten @false.}
      function FileExist: boolean;

      { Constructor der Klasse.
        @param URL URL der Anfrage an die API als @bold(String).
        @param(FileName Name der zu erstellenden bzw. schon existierenden Datei als @bold(String).
               Lediglich der Name, kein absoluter/relativer Pfad.) }
      constructor Create(URL, FileName: string);

  end;




implementation

constructor TFRUpdater.Create(URL: string; FileName: string);
begin
  FURL:= URL;
  FFileName:= GetCurrentDir + '\' + FileName;

end;

// Leitzins herunterladen und in Datei in aktuellen Verzeichnis, in dem das Programm ausgefuehrt wird, schreiben
procedure TFRUpdater.updateFR;
var
  FR, entry: string;
  data: TStringList;
  delimiterPos: integer;
const myNum = ['0','1','2','3','4','5','6','7','8','9','0'];
begin
  data:= TStringList.Create;
  data.Text:= GetPage(FURL);

  entry:= data[5];
  delimiterPos:= Pos(',', entry, 1);
  FR:= StringReplace(Copy(entry, delimiterPos + 1, Length(entry) - delimiterPos), '.', ',', [rfReplaceAll]);

  if IsStrFloatNum(FR) then
  begin
    writeFRToFile(StrToFloat(FR));
  end;
end;

// Leitzins aus Datei im aktuellen Verzeichnis lesen
function TFRUpdater.readFR:real;
var
  data: TStringList;
  output: real;
begin
  data:= TStringList.Create;
  data.LoadFromFile(FFileName);

  output:=StrToFloat(data[0]);
  FR:=output;
  result:=output;
end;

procedure TFRUpdater.writeFRToFile(FR: real);
var
  f: TextFile;
begin
  AssignFile(f, FFileName);
  Rewrite(f);
  write(f, FloatToStr(FR));
  CloseFile(f);
end;


// ueberpruefen, ob Verbindung zur API besteht
function TFRUpdater.HasInternet: boolean;
var
  HTTP: TIdHTTP;
begin
  try
    HTTP:= TIdHTTP.Create(nil);
    try
      HTTP.HandleRedirects := True;
      Result := HTTP.Get(FURL) <> '';
    except
      Result := false;
    end;
  finally
    HTTP.free;
  end;
end;

// Überprüfen, ob der Leitzins schon im aktuellen Verzeichnis gespeichert ist
function TFRUpdater.FileExist: boolean;
begin
  result:= FileExists(FFileName);
end;

function TFRUpdater.GetPage(aURL: string): string;
var
  Response: TStringStream;
  HTTP: TIdHTTP;
begin
  Result := '';
  Response := TStringStream.Create('');
  try
    HTTP := TIdHTTP.Create(nil);
    try
      HTTP.Get(aURL, Response);
      if HTTP.ResponseCode = 200 then begin
        Result := Response.DataString;
      end else begin
        // Nothing returned or error
      end;
    finally
      HTTP.Free;
    end;
  finally
    Response.Free;
  end;
end;

end.
