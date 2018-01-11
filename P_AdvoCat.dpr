program P_AdvoCat;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_Haupt in 'U_Haupt.pas' {FrmHaupt},
  U_FRUpdater in 'U_FRUpdater.pas',
  U_RVG in 'U_RVG.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmHaupt, FrmHaupt);
  Application.Run;
end.
