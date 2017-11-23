unit U_Haupt;

interface

uses
  U_FRUpdater, U_RVG,

  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.EditBox, FMX.NumberBox;

type
  TFrmHaupt = class(TForm)
    BtnLeitzins: TButton;
    LblLeitzins: TLabel;
    LblEditStreitwert: TLabel;
    BtnRVG: TButton;
    LblRVG: TLabel;
    EdtStreitwert: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnLeitzinsClick(Sender: TObject);
    procedure BtnRVGClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FrmHaupt: TFrmHaupt;
  FRUpdater: TFRUpdater;
  URL, FileName: string;


implementation

{$R *.fmx}

procedure TFrmHaupt.BtnRVGClick(Sender: TObject);
begin
  if EdtStreitwert.Text <> '' then
  begin
    LblRVG.Text:= IntToStr(calcRVG(StrToInt(EdtStreitwert.Text))) + '€';
  end;
end;

procedure TFrmHaupt.FormCreate(Sender: TObject);
begin
  URL:= 'http://sdw.ecb.europa.eu/quickviewexport.do?SERIES_KEY=143.FM.B.U2.EUR.4F.KR.MRR_FR.LEV&type=csv';
  FileName:= 'leitzins.dat';
  FRUpdater:= TFRUpdater.Create(URL, FileName);
end;

procedure TFrmHaupt.BtnLeitzinsClick(Sender: TObject);
var
  FR: real;
begin
  if FRUpdater.HasInternet then    //niels ist cool
    FRUpdater.updateFR;

  if FRUpdater.FileExist then
  begin
    FR:= FRUpdater.readFR;
    LblLeitzins.Text:= 'Leitzins: ' + FloatToStr(FR) + '%';
  end
  else
    LblLeitzins.Text:= 'Keine Verbindung zur API und Leitzins nicht lokal vorhanden';
end;

end.
