program Advocat;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_Uebersicht in 'U_Uebersicht.pas' {FUebersicht},
  U_BriefAuﬂGerVerg in 'U_BriefAuﬂGerVerg.pas' {FBriefAussGer},
  U_BriefMahnVoll in 'U_BriefMahnVoll.pas' {FBriefMahnVoll},
  U_KlageGericht in 'U_KlageGericht.pas' {FKlage},
  U_BriefMahn in 'U_BriefMahn.pas' {FBriefMahn},
  U_Warenkorb in 'U_Warenkorb.pas' {FWare},
  U_Settings in 'U_Settings.pas' {FSettings},
  U_FRUpdater in 'U_FRUpdater.pas',
  U_RVG in 'U_RVG.pas',
  U_TWarenkorb in 'U_TWarenkorb.pas',
  U_Utils in 'U_Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFUebersicht, FUebersicht);
  Application.CreateForm(TFBriefAussGer, FBriefAussGer);
  Application.CreateForm(TFBriefMahnVoll, FBriefMahnVoll);
  Application.CreateForm(TFKlage, FKlage);
  Application.CreateForm(TFBriefMahn, FBriefMahn);
  Application.CreateForm(TFWare, FWare);
  Application.CreateForm(TFSettings, FSettings);
  Application.Run;
end.
