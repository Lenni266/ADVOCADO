program Advocat;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  U_Uebersicht in 'U_Uebersicht.pas' {FUebersicht},
  U_BriefMahnVoll in 'U_BriefMahnVoll.pas' {FBriefMahnVoll},
  U_KlageGericht in 'U_KlageGericht.pas' {FKlage},
  U_BriefMahn in 'U_BriefMahn.pas' {FBriefMahn},
  U_Warenkorb in 'U_Warenkorb.pas' {FWare},
  U_Settings in 'U_Settings.pas' {FSettings},
  U_FRUpdater in 'U_FRUpdater.pas',
  U_RVG in 'U_RVG.pas',
  U_TWarenkorb in 'U_TWarenkorb.pas',
  U_Utils in 'U_Utils.pas',
  U_Handbuch in 'U_Handbuch.pas' {FHandbuch};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFUebersicht, FUebersicht);
  Application.CreateForm(TFBriefMahnVoll, FBriefMahnVoll);
  Application.CreateForm(TFKlage, FKlage);
  Application.CreateForm(TFBriefMahn, FBriefMahn);
  Application.CreateForm(TFWare, FWare);
  Application.CreateForm(TFSettings, FSettings);
  Application.CreateForm(TFHandbuch, FHandbuch);
  Application.Run;
end.

