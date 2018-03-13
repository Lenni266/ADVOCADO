unit U_Handbuch;

{< Unit zur Form, in der das Handbuch dargestellt wird. }

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFHandbuch = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    BtnBack: TButton;
    procedure BtnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FHandbuch: TFHandbuch;

implementation

{$R *.fmx}

uses U_Uebersicht;

procedure TFHandbuch.BtnBackClick(Sender: TObject);
begin
  FHandbuch.Close;
  FUebersicht.Show;
end;

procedure TFHandbuch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FUebersicht.Show;
end;

end.
