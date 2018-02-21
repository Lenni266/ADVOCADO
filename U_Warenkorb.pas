unit U_Warenkorb;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox, System.Rtti, FMX.Grid,
  FMX.Objects, {FMX.Grid.Style, FMX.ScrollBox}

  U_TWarenkorb, U_Utils, FMX.Edit;

type
  TFWare = class(TForm)
    BtnBack: TButton;
    BtnDel: TButton;
    GrdWarenkorb: TGrid;
    StrClmName: TStringColumn;
    StrClmPrice: TStringColumn;
    BtnDebug: TButton;
    Edit1: TEdit;
    ImgClmDel: TImageColumn;
    ImgCtrlDel: TImageControl;
    LblHead: TLabel;
    procedure BtnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnDebugClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GrdWarenkorbGetValue(Sender: TObject; const Col, Row: Integer;
      var Value: TValue);
    procedure GrdWarenkorbSelectCell(Sender: TObject; const ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BtnDelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    Warenkorb: TWarenkorb;
  end;

var
  FWare: TFWare;

implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}

uses U_Uebersicht;


procedure TFWare.FormCreate(Sender: TObject);
begin
  Warenkorb := TWarenkorb.Create;
end;

procedure TFWare.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FUebersicht.Show;
end;



procedure TFWare.BtnBackClick(Sender: TObject);
begin
  FWare.Hide;
  FUebersicht.Show;
end;

procedure TFWare.BtnDebugClick(Sender: TObject);
begin
  Warenkorb.Add(StrToInt(Edit1.Text), GrdWarenkorb);
end;

procedure TFWare.BtnDelClick(Sender: TObject);
begin
  SetLength(Warenkorb.Content, 0);
  Warenkorb.Update(GrdWarenkorb);
end;


procedure TFWare.Button1Click(Sender: TObject);
begin
  Warenkorb.Update(GrdWarenkorb);
  ShowMessage(IntToStr(Length(Warenkorb.Content)));
end;

procedure TFWare.GrdWarenkorbGetValue(Sender: TObject; const Col, Row: Integer;
  var Value: TValue);
var
  id: integer;
begin
  id := Warenkorb.Content[Row];

  if Col = 0 then
    // gets the name of the item in Warenkorb.Content
    Value := TValue.From<String>(Warenkorb.Names[id])
  else if Col = 1 then
    //gets price of the item
    Value := TValue.From<String>(FloatToStr(Warenkorb.getPrice(id, StrToFloat(FUebersicht.EdtStreitwert.Text))) + '€')
  else if Col = 2 then
    Value := TValue.From<TBitmap>(ImgCtrlDel.Bitmap);
end;


procedure TFWare.GrdWarenkorbSelectCell(Sender: TObject; const ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if ACol = 2 then
  begin
    DelIntArrElement(Warenkorb.Content, ARow);
    Warenkorb.Update(GrdWarenkorb);
  end;
end;


end.
