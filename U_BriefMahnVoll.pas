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

uses U_Uebersicht, U_RVG, U_Warenkorb;

procedure TFBriefMahnVoll.BtnBackClick(Sender: TObject);
begin
  FBriefMahnVoll.Hide;
  FUebersicht.show;
end;

procedure TFBriefMahnVoll.BtnPurClick(Sender: TObject);
begin
 FWare.Warenkorb.Add(5, FWare.GrdWarenkorb);
end;

procedure TFBriefMahnVoll.BtnVollClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(6, FWare.GrdWarenkorb);
end;

procedure TFBriefMahnVoll.BtnGerLoseClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(7, FWare.GrdWarenkorb);
end;

procedure TFBriefMahnVoll.BtnKlageVerglClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(8, FWare.GrdWarenkorb);
end;

procedure TFBriefMahnVoll.BtnKlageBerufClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(9, FWare.GrdWarenkorb);
end;




procedure TFBriefMahnVoll.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FUebersicht.Show;
end;

end.
