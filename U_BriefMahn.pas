unit U_BriefMahn;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TFBriefMahn = class(TForm)
    BtnBack: TButton;
    BtnPur: TButton;
    BtnGerVer: TButton;
    BtnVgl: TButton;
    BtnBerufung: TButton;
    procedure BtnBackClick(Sender: TObject);
    procedure BtnPurClick(Sender: TObject);
    procedure BtnGerVerClick(Sender: TObject);
    procedure BtnVglClick(Sender: TObject);
    procedure BtnBerufungClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FBriefMahn: TFBriefMahn;

implementation

{$R *.fmx}

uses U_Uebersicht, U_RVG;

procedure TFBriefMahn.BtnBackClick(Sender: TObject);
begin
  FBriefMahn.Hide;
  FUebersicht.Show;
end;

procedure TFBriefMahn.BtnPurClick(Sender: TObject);
begin
  FUebersicht.add('Brief-Mahnbescheid',U_RVG.calcBriefMahn(StrToInt(FUebersicht.EdtStreitwert.Text)));
end;

procedure TFBriefMahn.BtnGerVerClick(Sender: TObject);
begin
  FUebersicht.add('Brief-Mahnbescheid-Gericht',U_RVG.calcBriefMahnKlageGerichtVerlieren(StrToInt(FUebersicht.EdtStreitwert.Text)));
end;

procedure TFBriefMahn.BtnVglClick(Sender: TObject);
begin
  FUebersicht.add('Brief-Mahnbescheid-Klage-Vergleich',U_RVG.calcBriefMahnKlageVergleich(StrToInt(FUebersicht.EdtStreitwert.Text)));
end;

procedure TFBriefMahn.BtnBerufungClick(Sender: TObject);
begin
  FUebersicht.add('Brief-Mahnbescheid-Klage-Berufung',U_RVG.calcBriefMahnKlageBerufung(StrToInt(FUebersicht.EdtStreitwert.Text)));
end;


end.
