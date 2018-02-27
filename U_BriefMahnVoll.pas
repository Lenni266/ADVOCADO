unit U_BriefMahnVoll;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Ani;

type
  TFBriefMahnVoll = class(TForm)
    BtnBack: TButton;
    BtnPur: TButton;
    BtnVoll: TButton;
    BtnGerLose: TButton;
    BtnKlageBeruf: TButton;
    BtnKlageVergl: TButton;
    LblAdded1: TLabel;
    LblAdded2: TLabel;
    LblAdded3: TLabel;
    LblAdded4: TLabel;
    LblAdded5: TLabel;
    Ein1: TFloatAnimation;
    Ein2: TFloatAnimation;
    Ein3: TFloatAnimation;
    Ein4: TFloatAnimation;
    Ein5: TFloatAnimation;
    Aus1: TFloatAnimation;
    Aus2: TFloatAnimation;
    Aus3: TFloatAnimation;
    Aus4: TFloatAnimation;
    Aus5: TFloatAnimation;
    BtnWarenkorb: TButton;
    procedure BtnBackClick(Sender: TObject);
    procedure BtnPurClick(Sender: TObject);
    procedure BtnVollClick(Sender: TObject);
    procedure BtnGerLoseClick(Sender: TObject);
    procedure BtnKlageBerufClick(Sender: TObject);
    procedure BtnKlageVerglClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnWarenkorbClick(Sender: TObject);
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

procedure TFBriefMahnVoll.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FUebersicht.Show;
end;


procedure TFBriefMahnVoll.BtnBackClick(Sender: TObject);
begin
  FBriefMahnVoll.Hide;
  FUebersicht.show;
end;

procedure TFBriefMahnVoll.BtnWarenkorbClick(Sender: TObject);
begin
  FBriefMahnVoll.Hide;
  FWare.Show;
end;



procedure TFBriefMahnVoll.BtnPurClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(5, FWare.GrdWarenkorb);
  Ein1.Start;
  Aus1.Start;
end;

procedure TFBriefMahnVoll.BtnVollClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(6, FWare.GrdWarenkorb);
  Ein2.Start;
  Aus2.Start;
end;

procedure TFBriefMahnVoll.BtnGerLoseClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(7, FWare.GrdWarenkorb);
  Ein3.Start;
  Aus3.Start;
end;

procedure TFBriefMahnVoll.BtnKlageVerglClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(8, FWare.GrdWarenkorb);
  Ein5.Start;
  Aus5.Start;
end;

procedure TFBriefMahnVoll.BtnKlageBerufClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(9, FWare.GrdWarenkorb);
  Ein4.Start;
  Aus4.Start;
end;

end.
