unit U_KlageGericht;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Ani;

type
  TFKlage = class(TForm)
    BtnBack: TButton;
    BtnGericht: TButton;
    BtnVgl: TButton;
    BtnBeruf: TButton;
    LblAdded1: TLabel;
    Ein1: TFloatAnimation;
    Aus1: TFloatAnimation;
    LblAdded2: TLabel;
    Ein2: TFloatAnimation;
    Aus2: TFloatAnimation;
    LblAdded3: TLabel;
    Ein3: TFloatAnimation;
    Aus3: TFloatAnimation;
    procedure BtnBackClick(Sender: TObject);
    procedure Ware;
    procedure BtnGerichtClick(Sender: TObject);
    procedure BtnVglClick(Sender: TObject);
    procedure BtnBerufClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FKlage: TFKlage;

implementation

{$R *.fmx}

uses U_Uebersicht, U_Warenkorb;

procedure TFKlage.BtnBackClick(Sender: TObject);
begin
  FKlage.Hide;
  FUebersicht.Show;
end;

procedure TFKlage.BtnGerichtClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(10, FWare.GrdWarenkorb);
  Ein1.Start;
  Aus1.Start;
end;

procedure TFKlage.BtnVglClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(11, FWare.GrdWarenkorb);
  Ein2.Start;
  Aus2.Start;
end;

procedure TFKlage.BtnBerufClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(12, FWare.GrdWarenkorb);
  Ein3.Start;
  Aus3.Start;
end;


procedure TFKlage.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 FUebersicht.Show;
end;

procedure TFKlage.Ware;
begin
 showmessage ('Dem Warenkorb erfolgreich hinzugefügt!');
end;
end.
