unit U_Haupt;

interface

uses
  U_FRUpdater, U_RVG,

  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.EditBox, FMX.NumberBox, FMX.ListBox;

var FRUpdater: TFRUpdater;

type
  TFrmHaupt = class(TForm)
    BtnLeitzins: TButton;
    LblLeitzins: TLabel;
    LblEditStreitwert: TLabel;
    BtnRVG: TButton;
    LblRVG: TLabel;
    EdtStreitwert: TEdit;
    ComboFaelle: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure BtnLeitzinsClick(Sender: TObject);
    procedure BtnRVGClick(Sender: TObject);
  private
    function calcGebuehr:real;
  public

  end;

var
  FrmHaupt: TFrmHaupt;
  URL, FileName: string;


implementation

{$R *.fmx}

procedure TFrmHaupt.FormCreate(Sender: TObject);
begin
  URL:= 'http://sdw.ecb.europa.eu/quickviewexport.do?SERIES_KEY=143.FM.B.U2.EUR.4F.KR.MRR_FR.LEV&type=csv';
  FileName:= 'leitzins.dat';
  FRUpdater:= TFRUpdater.Create(URL, FileName);
end;

procedure TFrmHaupt.BtnRVGClick(Sender: TObject);
begin
  if EdtStreitwert.Text <> '' then
  begin
    case ComboFaelle.ItemIndex of
      0: EdtStreitwert.Text:= 'Bitte zuerst einen Fall auswählen!';
      1:  begin
            LblRVG.Text:= FloatToStr(calcBrief(StrToFloat(EdtStreitwert.Text))) + '€';
          end;
      2:  begin
            LblRVG.Text:= FloatToStr(calcBriefMahn(StrToFloat(EdtStreitwert.Text))) + '€';
          end;
      3:  begin
            LblRVG.Text:= FloatToStr(calcBriefMahnKlageGer(StrToFloat(EdtStreitwert.Text))) + '€';
          end;
      4:  begin
            LblRVG.Text:= FloatToStr(calcBriefMahnKlageGerLose(StrToFloat(EdtStreitwert.Text))) + '€';
          end;
      5:  begin

          end;
    end;
  end;

end;



procedure TFrmHaupt.BtnLeitzinsClick(Sender: TObject);
var
  FR: real;
begin
  if FRUpdater.HasInternet then
    FRUpdater.updateFR;

  if FRUpdater.FileExist then
  begin
    FR:= FRUpdater.readFR;
    LblLeitzins.Text:= 'Leitzins: ' + FloatToStr(FR) + '%';
  end
  else
    LblLeitzins.Text:= 'Keine Verbindung zur API und Leitzins nicht lokal vorhanden';
end;

function TFrmHaupt.calcGebuehr:real;
begin

end;

end.
