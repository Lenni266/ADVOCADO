unit U_BriefMahnVoll;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TFBriefMahnVoll = class(TForm)
    BtnBack: TButton;
    BtnKlageGericht: TButton;
    BtnKlageGerichtVerloren: TButton;
    BtnKlageVergleich: TButton;
    BtnKlageBerufung: TButton;
    BtnVollBeschVoll: TButton;
    procedure BtnBackClick(Sender: TObject);
    procedure Ware;
    procedure BtnKlageGerichtClick(Sender: TObject);
    procedure BtnKlageGerichtVerlorenClick(Sender: TObject);
    procedure BtnKlageVergleichClick(Sender: TObject);
    procedure BtnKlageBerufungClick(Sender: TObject);
    procedure BtnVollBeschVollClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FBriefMahnVoll: TFBriefMahnVoll;

implementation

{$R *.fmx}

uses U_Uebersicht;

procedure TFBriefMahnVoll.BtnBackClick(Sender: TObject);
begin
  FBriefMahnVoll.Hide;
  FUebersicht.show;
end;
procedure TFBriefMahnVoll.BtnKlageBerufungClick(Sender: TObject);
begin
Ware;
end;

procedure TFBriefMahnVoll.BtnKlageGerichtClick(Sender: TObject);
begin
Ware;
end;

procedure TFBriefMahnVoll.BtnKlageGerichtVerlorenClick(Sender: TObject);
begin
Ware;
end;

procedure TFBriefMahnVoll.BtnKlageVergleichClick(Sender: TObject);
begin
Ware;
end;

procedure TFBriefMahnVoll.BtnVollBeschVollClick(Sender: TObject);
begin
Ware;
end;

procedure TFBriefMahnVoll.Ware;
begin
 showmessage ('Dem Warenkorb erfolgreich hinzugefügt!');
end;
end.
