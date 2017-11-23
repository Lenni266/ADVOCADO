unit U_FRUpdater;

interface

uses System.Classes, System.SysUtils, IdHTTP;

type
  TFRUpdater = class
    private
      FURL: string;
      FFileName: string;

      function GetPage(aURL: string): string;
    public
      procedure updateFR;
      function readFR:real;

      function HasInternet: boolean;
      function FileExist: boolean;

      constructor Create(URL, FileName: string);

  end;




implementation

constructor TFRUpdater.Create(URL: string; FileName: string);
begin
  FURL:= URL;
  FFileName:= GetCurrentDir + '\' + FileName;
end;

// Leitzins herunterladen und in Datei in aktuellen Verzeichnis, in dem das Programm ausgeführt wird, schreiben
procedure TFRUpdater.updateFR;
var
  f: TextFile;
  FR, entry: string;
  data: TStringList;
  delimiterPos: integer;
begin
  AssignFile(f, FFileName);
  Rewrite(f);

  data:= TStringList.Create;
  data.Text:= GetPage(FURL);

  entry:= data[5];
  delimiterPos:= Pos(',', entry, 1);
  FR:= StringReplace(Copy(entry, delimiterPos + 1, Length(entry) - delimiterPos), '.', ',', [rfReplaceAll]);

  write(f, FR);
  CloseFile(f);
end;

// Leitzins aus Datei im aktuellen Verzeichnis lesen
function TFRUpdater.readFR:real;
var
  data: TStringList;
begin
  data:= TStringList.Create;
  data.LoadFromFile(FFileName);

  result:=StrToFloat(data[0]);
end;

// Überprüfen, ob Verbindung zur API besteht
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
