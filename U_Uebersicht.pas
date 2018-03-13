unit U_Uebersicht;

{< Form, die beim Start der Anwendung angezeigt wird, und dazugehörige Prozeduren. }

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.ListBox, FMX.Objects, FMX.Grid,
  FMX.Ani, FMX.Styles,

  U_FRUpdater, U_Settings, U_Utils;

type
  TFUebersicht = class(TForm)
    LblHead: TLabel;
    LblStreitwert: TLabel;
    EdtStreitwert: TEdit;
    DropdownFall: TComboBox;
    BtnAdd: TButton;
    BtnWarenkorb: TButton;
    BtnStreit: TButton;
    BtnSetting: TButton;
    ImgSettings: TImage;
    LblAdded1: TLabel;
    Ein1: TFloatAnimation;
    Aus1: TFloatAnimation;
    ImgLogo: TImage;
    StBkDark: TStyleBook;
    BtnHelp: TButton;
    procedure BtnAddClick(Sender: TObject);
    procedure BtnWarenkorbClick(Sender: TObject);
    procedure BtnSettingClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtStreitwertKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure ImgLogoClick(Sender: TObject);
    procedure BtnHelpClick(Sender: TObject);
  end;

var
  FUebersicht: TFUebersicht;
  { Der Updater für den Leitzins. }
  FRUpdater: TFRUpdater;
  { Gibt an, ob das dunkle Theme aktiviert ist. }
  DarkFlag: boolean;

implementation

{$R *.fmx}

uses U_BriefMahnVoll, U_KlageGericht, U_BriefMahn, U_Warenkorb,
  U_RVG, U_Handbuch;

{$R *.Windows.fmx MSWINDOWS}

procedure TFUebersicht.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FUebersicht.close;
end;

procedure TFUebersicht.FormCreate(Sender: TObject);
var
  URL, FileName: string;
begin
  URL:= 'http://sdw.ecb.europa.eu/quickviewexport.do?SERIES_KEY=143.FM.B.U2.EUR.4F.KR.MRR_FR.LEV&type=csv';
  FileName:= 'leitzins.dat';
  FRUpdater:= TFRUpdater.Create(URL, FileName);

  if FRUpdater.HasInternet then
    FRUpdater.updateFR;

  DarkFlag := false;
end;

procedure TFUebersicht.ImgLogoClick(Sender: TObject);
var
  style: TFMXObject;
begin
  style := TStyleStreaming.LoadFromResource(HInstance, 'Dark', RT_RCDATA);

  if DarkFlag then
  begin
    TStyleManager.SetStyle(nil);
    DarkFlag := false;
  end
  else
  begin
    TStyleManager.SetStyle(style);
    DarkFlag := true;
  end;
end;

procedure TFUebersicht.FormActivate(Sender: TObject);
begin
  if FRUpdater.FileExist then
    FSettings.NmBxFR.Value:= FRUpdater.readFR;
end;


procedure TFUebersicht.BtnAddClick(Sender: TObject);
begin
  if EdtStreitwert.Text = '' then
  begin
    LblAdded1.Text := 'Bitte zuerst Streitwert eingeben!';
    LblAdded1.FontColor := TAlphaColorRec.Red;
    Ein1.Start;
    Aus1.Start;
  end
  else
  begin
    case Dropdownfall.ItemIndex of
          0:  begin
                LblAdded1.Text := 'Bitte zuerst einen Fall auswählen!';
                LblAdded1.FontColor := TAlphaColorRec.Red;
                Ein1.Start;
                Aus1.Start;
              end;
          1:  begin
                FWare.Warenkorb.Add(0, FWare.GrdWarenkorb);
                LblAdded1.Text := 'Der Auswahl hinzugefügt!';
                LblAdded1.FontColor := TAlphaColorRec.Black;
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

procedure TFUebersicht.BtnHelpClick(Sender: TObject);
begin
  FHandbuch.Show;
end;

procedure TFUebersicht.BtnSettingClick(Sender: TObject);
begin
  FSettings.ShowModal;
end;

procedure TFUebersicht.BtnWarenkorbClick(Sender: TObject);
begin
  FUebersicht.Hide;
  FWare.Show;
end;

procedure TFUebersicht.EdtStreitwertKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if not (keychar in numKeys) and (key <> ord(#8))
  and (key <> vkDelete) and (key <> vkRight) and (key <> vkLeft) then
  begin
    keychar := char(0);
    key := 0;

    LblAdded1.Text := 'Bitte nur Zahlen eingeben';
    LblAdded1.FontColor := TAlphaColorRec.Red;
    Ein1.Start;
    Aus1.Start;
  end;
end;

end.
