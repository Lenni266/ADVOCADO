unit U_Uebersicht;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.ListBox, FMX.Objects, FMX.Grid,

  U_FRUpdater, U_Settings, FMX.Ani;

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
    LblAdded1: TLabel;
    Ein1: TFloatAnimation;
    Aus1: TFloatAnimation;
    procedure BtnAuswahlClick(Sender: TObject);
    procedure BtnWarenkorbClick(Sender: TObject);
    procedure BtnSettingClick(Sender: TObject);
    procedure Ware;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

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

uses U_BriefMahnVoll, U_BriefAußGerVerg, U_KlageGericht, U_BriefMahn, U_Warenkorb,
  U_RVG;

{$R *.Windows.fmx MSWINDOWS}

procedure TFUebersicht.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 FUebersicht.close;
end;

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
                Ein1.Start;
                Aus1.Start;
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
                FKlage.ShowModal;
              end;
    end;
  end;
end;

procedure TFUebersicht.BtnSettingClick(Sender: TObject);
begin
  FUebersicht.Hide;
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
  showmessage ('Dem Warenkorb erfolgreich hinzugefügt!');
end;

end.
