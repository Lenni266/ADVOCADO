unit U_Settings;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.EditBox, FMX.NumberBox;

type
  TFSettings = class(TForm)
    LblFR: TLabel;
    BtnBack: TButton;
    LblSettings: TLabel;
    NmBxFR: TNumberBox;
    BtnUpdateFR: TButton;
    procedure BtnBackClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure NmBxFRExit(Sender: TObject);
    procedure BtnUpdateFRClick(Sender: TObject);
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
  FSettings.Hide;
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
    // ERROR MESSAGE
end;

procedure TFSettings.FormActivate(Sender: TObject);
begin
  if FRUpdater.FileExist then
    NmBxFR.Value:= FRUpdater.readFR
  else
    //ERROR MESSAGE
end;



procedure TFSettings.NmBxFRExit(Sender: TObject);
begin
  // UPDATE FR MANUALLY
end;

end.
