unit U_Uebersicht;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.ListBox, FMX.Objects,

  U_FRUpdater, U_Settings;

type
  TFUebersicht = class(TForm)
    LblHead: TLabel;
    LblStreitwert: TLabel;
    EdtStreitwert: TEdit;
    DropdownFall: TComboBox;
    BtnAuswahl: TButton;
    BtnWarenkorb: TButton;
    BtnStreit: TButton;
    BtnSetting: TButton;
    imgsettings: TImage;
    procedure BtnAuswahlClick(Sender: TObject);
    procedure BtnWarenkorbClick(Sender: TObject);
    procedure BtnSettingClick(Sender: TObject);
    procedure Ware;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure add(Fall:string; kosten:real);
  private
    { Private-Deklarationen }
  public

  end;

var
  FUebersicht: TFUebersicht;
  URL: string;
  FileName: string;
  anzahl: integer;
  FRUpdater: TFRUpdater;

implementation

{$R *.fmx}

uses U_BriefMahnVoll, U_BriefAu�GerVerg, U_KlageGericht, U_BriefMahn, U_Warenkorb,
  U_RVG;

{$R *.Windows.fmx MSWINDOWS}

procedure TFUebersicht.FormCreate(Sender: TObject);
begin
  URL:= 'http://sdw.ecb.europa.eu/quickviewexport.do?SERIES_KEY=143.FM.B.U2.EUR.4F.KR.MRR_FR.LEV&type=csv';
  FileName:= 'leitzins.dat';
  FRUpdater:= TFRUpdater.Create(URL, FileName);

  if FRUpdater.HasInternet then
    FRUpdater.updateFR;
end;

procedure TFUebersicht.FormActivate(Sender: TObject);
begin
  if FRUpdater.FileExist then
    FSettings.NmBxFR.Value:= FRUpdater.readFR
  else
    // ERROR MESSAGE
end;



procedure TFUebersicht.BtnAuswahlClick(Sender: TObject);
begin
  if EdtStreitwert.Text = '' then
    raise exception.Create ('Bitte Streitwert eingeben')
  else
  begin
    case Dropdownfall.ItemIndex of
          1:  begin
                //Add('Brief', U_RVG.calcBrief(StrToFloat(EdtStreitwert.Text)));
                FWare.Warenkorb.Add(0, FWare.GrdWarenkorb);
              end;
          2:  begin
                  FUebersicht.hide;
                  FBriefMahn.ShowModal;
              end;
          3:  begin
                  FUebersicht.hide;
                  FBriefMahnVoll.ShowModal;
              end;
          4:  begin
                  FUebersicht.hide;
                  FBriefAussGer.ShowModal;
              end;
          5:  begin
                  FUebersicht.hide;
                  FKlage.ShowModal;
              end;


    end;
  end;
end;

procedure TFUebersicht.add(Fall:string; kosten:real);
begin
//  FWare.StrGrd.RowCount:=anzahl+1;
//  FWare.StrGrd.Cells[0,anzahl]:=Fall;
//  FWare.StrGrd.Cells[1,anzahl]:=FloatToStr(kosten);
//  inc(Anzahl);
//  Ware;
end;

procedure TFUebersicht.BtnSettingClick(Sender: TObject);
begin
  FSettings.ShowModal;
end;

procedure TFUebersicht.BtnWarenkorbClick(Sender: TObject);
var
  I: Integer;
begin
  FUebersicht.Hide;
  FWare.Show;
  //FWare.anzeige;
end;

procedure TFUebersicht.Ware;
begin
  showmessage ('Dem Warenkorb erfolgreich hinzugef�gt!');
end;

end.
