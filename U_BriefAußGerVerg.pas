unit U_BriefAußGerVerg;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TFBriefAussGer = class(TForm)
    BtnBack: TButton;
    BtnVorhanden: TButton;
    BtnVoll: TButton;
    procedure BtnBackClick(Sender: TObject);
    procedure BtnVorhandenClick(Sender: TObject);
    procedure Ware;
    procedure BtnVollClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FBriefAussGer: TFBriefAussGer;

implementation

{$R *.fmx}

uses U_Uebersicht;

procedure TFBriefAussGer.BtnBackClick(Sender: TObject);
begin
  FBriefAussGer.Hide;
  FUebersicht.Show;
end;

procedure TFBriefAussGer.BtnVollClick(Sender: TObject);
begin
Ware;
end;

procedure TFBriefAussGer.BtnVorhandenClick(Sender: TObject);
begin
Ware;
end;
procedure TFBriefAussGer.Ware;
begin
 showmessage ('Dem Warenkorb erfolgreich hinzugefügt!');
end;
end.
