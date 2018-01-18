unit U_BriefMahn;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TFBriefMahn = class(TForm)
    BtnBack: TButton;
    BtnGer: TButton;
    BtnGerVer: TButton;
    BtnVgl: TButton;
    BtnBerufung: TButton;
    procedure BtnBackClick(Sender: TObject);
    procedure Ware;
    procedure BtnGerClick(Sender: TObject);
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

uses U_Uebersicht;

procedure TFBriefMahn.BtnBackClick(Sender: TObject);
begin
  FBriefMahn.Hide;
  FUebersicht.Show;
end;
procedure TFBriefMahn.BtnBerufungClick(Sender: TObject);
begin
Ware;
end;

procedure TFBriefMahn.BtnGerClick(Sender: TObject);
begin
Ware;
end;

procedure TFBriefMahn.BtnGerVerClick(Sender: TObject);
begin
Ware;
end;

procedure TFBriefMahn.BtnVglClick(Sender: TObject);
begin
Ware;
end;

procedure TFBriefMahn.Ware;
begin
 showmessage ('Dem Warenkorb erfolgreich hinzugefügt!');
 end;
end.
