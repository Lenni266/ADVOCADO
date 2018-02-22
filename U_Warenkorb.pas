unit U_Warenkorb;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox, System.Rtti, FMX.Grid, FMX.Grid.Style,
  FMX.ScrollBox;

type
  TFWare = class(TForm)
    BtnBack: TButton;
    StrGrd: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    BtnDel: TButton;
    procedure BtnBackClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ende;
  private
    { Private-Deklarationen }
  public

  end;

var
  FWare: TFWare;

implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}

uses U_Uebersicht;



procedure TFWare.BtnBackClick(Sender: TObject);
begin
  ende;
end;

procedure TFWare.ende;
begin
  FWare.Hide;
  FUebersicht.Show;
end;

procedure TFWare.BtnDelClick(Sender: TObject);
begin
  U_Uebersicht.anzahl:=0;
  StrGrd.RowCount:=1;
  StrGrd.Cells[0,0]:='';
  StrGrd.Cells[1,0]:='';
end;

procedure TFWare.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FUebersicht.Show;
end;

end.
