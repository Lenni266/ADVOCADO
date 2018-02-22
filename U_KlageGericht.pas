unit U_KlageGericht;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TFKlage = class(TForm)
    BtnBack: TButton;
    BtnGericht: TButton;
    BtnVgl: TButton;
    BtnBeruf: TButton;
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
end;

procedure TFKlage.BtnVglClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(11, FWare.GrdWarenkorb);
end;

procedure TFKlage.BtnBerufClick(Sender: TObject);
begin
  FWare.Warenkorb.Add(12, FWare.GrdWarenkorb);
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
