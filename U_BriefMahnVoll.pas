unit U_BriefMahnVoll;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TFBriefMahnVoll = class(TForm)
    BtnBack: TButton;
    BtnPur: TButton;
    BtnVoll: TButton;
    BtnGerLose: TButton;
    BtnKlageBeruf: TButton;
    BtnKlageVergl: TButton;
    procedure BtnBackClick(Sender: TObject);
    procedure BtnPurClick(Sender: TObject);
    procedure BtnVollClick(Sender: TObject);
    procedure BtnGerLoseClick(Sender: TObject);
    procedure BtnKlageBerufClick(Sender: TObject);
    procedure BtnKlageVerglClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FBriefMahnVoll: TFBriefMahnVoll;

implementation

{$R *.fmx}

uses U_Uebersicht, U_RVG;

procedure TFBriefMahnVoll.BtnBackClick(Sender: TObject);
begin
  FBriefMahnVoll.Hide;
  FUebersicht.show;
end;

procedure TFBriefMahnVoll.BtnPurClick(Sender: TObject);
begin
  FUebersicht.add('Voll.-bescheid',U_RVG.calcBriefMahnVollbesch(StrToInt(FUebersicht.EdtStreitwert.Text)));
end;

procedure TFBriefMahnVoll.BtnVollClick(Sender: TObject);
begin
  FUebersicht.add('Voll.-bescheid-Vollstreckung',U_RVG.calcBriefMahnVollbeschVoll(StrToInt(FUebersicht.EdtStreitwert.Text)));
end;

procedure TFBriefMahnVoll.BtnGerLoseClick(Sender: TObject);
begin
  FUebersicht.add('Voll.-bescheid-Gericht',U_RVG.calcBriefMahnVollbeschKlageGerichtVerlieren(StrToInt(FUebersicht.EdtStreitwert.Text)));
end;

procedure TFBriefMahnVoll.BtnKlageBerufClick(Sender: TObject);
begin
  FUebersicht.add('Voll.-bescheid-Klage-Berufung',U_RVG.calcBriefMahnVollbeschKlageBerufung(StrToInt(FUebersicht.EdtStreitwert.Text)));
end;

procedure TFBriefMahnVoll.BtnKlageVerglClick(Sender: TObject);
begin
  FUebersicht.add('Brief-Mahnbescheid-Klage-Vergleich',U_RVG.calcBriefMahnVollbeschKlageVergleich(StrToInt(FUebersicht.EdtStreitwert.Text)));
end;


procedure TFBriefMahnVoll.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FUebersicht.Show;
end;

end.
