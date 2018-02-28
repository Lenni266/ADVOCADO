unit U_Settings;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.EditBox, FMX.NumberBox, FMX.Ani, U_Utils;

type
  TFSettings = class(TForm)
    LblFR: TLabel;
    BtnBack: TButton;
    LblSettings: TLabel;
    NmBxFR: TNumberBox;
    BtnUpdateFR: TButton;
    ChkBxDark: TCheckBox;
    LblLoadFR: TLabel;
    Ein1: TFloatAnimation;
    Aus1: TFloatAnimation;
    BtnApply: TButton;
    LblPercent: TLabel;
    procedure BtnBackClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnUpdateFRClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnApplyClick(Sender: TObject);
    procedure NmBxFRChange(Sender: TObject);
    procedure ChkBxDarkChange(Sender: TObject);
    procedure NmBxFRKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    procedure setNewFR;
  public
    { Public-Deklarationen }
  end;

var
  FSettings: TFSettings;

implementation

{$R *.fmx}

uses U_Uebersicht;

procedure TFSettings.FormActivate(Sender: TObject);
begin
  if FRUpdater.FileExist then
    NmBxFR.Value:= FRUpdater.readFR;
end;

procedure TFSettings.BtnBackClick(Sender: TObject);
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
  Application.ProcessMessages;
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

procedure TFSettings.setNewFR;
var
  newFR: real;
begin
  newFR := NmBxFR.Value;
  if FRUpdater.FileExist then
  begin
    if FRUpdater.readFR <> newFR then
    begin
      FRUpdater.FR := newFR;
      FRUpdater.writeFRToFile(newFR);
    end;
  end
  else
  begin
    FRUpdater.FR := newFR;
    FRUpdater.writeFRToFile(newFR);
  end;
end;


// Apply-Button

procedure TFSettings.BtnApplyClick(Sender: TObject);
begin
  BtnApply.Enabled := false;
  setNewFR;
end;

procedure TFSettings.NmBxFRChange(Sender: TObject);
begin
  BtnApply.Enabled := true;
end;

procedure TFSettings.NmBxFRKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (keychar in myNum) and (key <> ord(#8)) and (key <> vkDelete) then
    BtnApply.Enabled := true;
end;

procedure TFSettings.ChkBxDarkChange(Sender: TObject);
begin
  BtnApply.Enabled := true;
end;

end.
