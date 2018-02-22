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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FBriefMahn: TFBriefMahn;

implementation

{$R *.fmx}

uses U_Uebersicht, U_RVG, U_Warenkorb;

procedure TFBriefMahn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 FUebersicht.Show;
end;


procedure TFBriefMahn.BtnBackClick(Sender: TObject);
begin
  FBriefMahn.Hide;
  FUebersicht.Show;
end;

procedure TFBriefMahn.BtnPurClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(1, FWare.GrdWarenkorb);
end;

procedure TFBriefMahn.BtnGerVerClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(2, FWare.GrdWarenkorb);
end;

procedure TFBriefMahn.BtnVglClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(3, FWare.GrdWarenkorb);
end;

procedure TFBriefMahn.BtnBerufungClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(4, FWare.GrdWarenkorb);
end;

end.
