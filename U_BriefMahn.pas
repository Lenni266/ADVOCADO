unit U_BriefMahn;

{< Form für die Kategorie 'Brief - Mahnbescheid'. }

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Ani;

type
  TFBriefMahn = class(TForm)
    BtnBack: TButton;
    BtnPur: TButton;
    BtnGerVer: TButton;
    BtnVgl: TButton;
    BtnBerufung: TButton;
    LblAdded1: TLabel;
    LblAdded2: TLabel;
    LblAdded3: TLabel;
    LblAdded4: TLabel;
    Ein1: TFloatAnimation;
    Aus1: TFloatAnimation;
    Ein2: TFloatAnimation;
    Aus2: TFloatAnimation;
    Ein3: TFloatAnimation;
    Aus3: TFloatAnimation;
    Ein4: TFloatAnimation;
    Aus4: TFloatAnimation;
    BtnWarenkorb: TButton;
    procedure BtnBackClick(Sender: TObject);
    procedure BtnPurClick(Sender: TObject);
    procedure BtnGerVerClick(Sender: TObject);
    procedure BtnVglClick(Sender: TObject);
    procedure BtnBerufungClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnWarenkorbClick(Sender: TObject);
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

procedure TFBriefMahn.BtnWarenkorbClick(Sender: TObject);
begin
  FBriefMahn.Hide;
  FWare.Show;
end;



procedure TFBriefMahn.BtnPurClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(1, FWare.GrdWarenkorb);
  Ein1.Start;
  Aus1.Start;
end;

procedure TFBriefMahn.BtnGerVerClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(2, FWare.GrdWarenkorb);
  Ein2.Start;
  Aus2.Start;
end;

procedure TFBriefMahn.BtnVglClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(3, FWare.GrdWarenkorb);
  Ein4.Start;
  Aus4.Start;
end;



procedure TFBriefMahn.BtnBerufungClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(4, FWare.GrdWarenkorb);
  Ein3.Start;
  Aus3.Start;
end;

end.
