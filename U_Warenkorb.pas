unit U_Warenkorb;

{< Unit für die Anzeige der Auswahl. }

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox, System.Rtti, FMX.Grid,
  FMX.Objects, FMX.Grid.Style, FMX.ScrollBox, FMX.DialogService,

  U_TWarenkorb, U_Utils, FMX.Edit, FMX.Ani;

type
  TFWare = class(TForm)
    BtnBack: TButton;
    BtnDel: TButton;
    GrdWarenkorb: TGrid;
    StrClmName: TStringColumn;
    StrClmPrice: TStringColumn;
    ImgClmDel: TImageColumn;
    LblHead: TLabel;
    ImgCtrlDel: TImageControl;
    procedure BtnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure GrdWarenkorbGetValue(Sender: TObject; const Col, Row: Integer;
      var Value: TValue);
    procedure BtnDelClick(Sender: TObject);
    procedure GrdWarenkorbCellClick(const Column: TColumn; const Row: Integer);
    procedure FormActivate(Sender: TObject);
  public
    { Das zuständige @link(U_TWarenkorb.TWarenkorb)-Objekt. }
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

procedure TFWare.FormActivate(Sender: TObject);
begin
  if Length(Warenkorb.Content) > 0
    then BtnDel.Enabled := true
    else BtnDel.Enabled := false;
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

procedure TFWare.BtnDelClick(Sender: TObject);
begin
  TDialogService.PreferredMode:=TDialogService.TPreferredMode.Platform;
  TDialogService.MessageDialog('Liste wirklich leeren?', TMsgDlgType.mtWarning,
    FMX.Dialogs.mbYesNo, TMsgDlgBtn.mbNo, 0,
    procedure(const AResult: TModalResult)
    begin
      case AResult of
        mrYes: begin
                 SetLength(Warenkorb.Content, 0);
                 Warenkorb.Update(GrdWarenkorb);
                 if Length(Warenkorb.Content) > 0
                   then BtnDel.Enabled := true
                   else BtnDel.Enabled := false;
               end;
      end;
    end);
end;


procedure TFWare.GrdWarenkorbCellClick(const Column: TColumn;
  const Row: Integer);
begin
  if Column.Index = 2 then
  begin
    DelIntArrElement(Warenkorb.Content, Row);
    BtnBack.SetFocus;
    DelayedSetFocus(GrdWarenkorb);
    Warenkorb.Update(GrdWarenkorb);

    if Length(Warenkorb.Content) > 0
       then BtnDel.Enabled := true
       else BtnDel.Enabled := false;
  end;
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
  begin
    Value := TValue.From<TBitmap>(ImgCtrlDel.Bitmap);
    GrdWarenkorb.Columns[2].Width := 35;
  end;
end;

end.
