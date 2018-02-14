unit U_KlageGericht;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TFKlage = class(TForm)
    BtnBack: TButton;
    BtnVerl: TButton;
    BtnVgl: TButton;
    BtnBeruf: TButton;
    BtnVollbesch: TButton;
    procedure BtnBackClick(Sender: TObject);
    procedure Ware;
    procedure BtnVerlClick(Sender: TObject);
    procedure BtnVglClick(Sender: TObject);
    procedure BtnBerufClick(Sender: TObject);
    procedure BtnVollbeschClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FKlage: TFKlage;

implementation

{$R *.fmx}

uses U_Uebersicht;

procedure TFKlage.BtnBackClick(Sender: TObject);
begin
  FKlage.Hide;
  FUebersicht.Show;
end;
procedure TFKlage.BtnBerufClick(Sender: TObject);
begin
Ware;
end;

procedure TFKlage.BtnVerlClick(Sender: TObject);
begin
Ware;
end;

procedure TFKlage.BtnVglClick(Sender: TObject);
begin
Ware;
end;

procedure TFKlage.BtnVollbeschClick(Sender: TObject);
begin
Ware;
end;

procedure TFKlage.Ware;
begin
 showmessage ('Dem Warenkorb erfolgreich hinzugefügt!');
end;
end.
