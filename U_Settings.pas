unit U_Settings;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.EditBox, FMX.NumberBox, FMX.Ani;

type
  TFSettings = class(TForm)
    LblFR: TLabel;
    BtnBack: TButton;
    LblSettings: TLabel;
    NmBxFR: TNumberBox;
    BtnUpdateFR: TButton;
    ChkBxDark: TCheckBox;
    Label1: TLabel;
    Ein1: TFloatAnimation;
    Aus1: TFloatAnimation;
    procedure BtnBackClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure NmBxFRExit(Sender: TObject);
    procedure BtnUpdateFRClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FSettings: TFSettings;

implementation

{$R *.fmx}

uses U_Uebersicht;

procedure TFSettings.BtnBackClick(Sender: TObject); //Problem: bei mir schmiert dann alles ab
begin
  FSettings.Close;
  FUebersicht.Show;
end;

procedure TFSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FSettings.Close;
  FUebersicht.Show;
end;


// Update
procedure TFSettings.BtnUpdateFRClick(Sender: TObject);
begin
  if FRUpdater.HasInternet then
    FRUpdater.updateFR;

  if FRUpdater.FileExist then
    NmBxFR.Value:= FRUpdater.readFR
  else
  begin
    Ein1.Start;
    Aus1.Start;
  end;
end;


procedure TFSettings.FormActivate(Sender: TObject);
begin
  if FRUpdater.FileExist then
    NmBxFR.Value:= FRUpdater.readFR;
end;


procedure TFSettings.NmBxFRExit(Sender: TObject);
var
  newFR: real;
begin
  newFR := NmBxFR.Value;
  if FRUpdater.FR <> newFR then
  begin
    FRUpdater.FR := newFR;
    FRUpdater.writeFRToFile(newFR);
  end;
end;

end.
