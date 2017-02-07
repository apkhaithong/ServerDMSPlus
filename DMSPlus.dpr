program DMSPlus;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  MidasLib,
  FormUnit1 in 'FormUnit1.pas' {Form1},
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas',
  WebModuleUnit1 in 'WebModuleUnit1.pas' {WebModule1: TWebModule},
  DataSetConverter4D.Helper in 'DataSetConverter4D.Helper.pas',
  DataSetConverter4D.Impl in 'DataSetConverter4D.Impl.pas',
  DataSetConverter4D in 'DataSetConverter4D.pas',
  DataSetConverter4D.Util in 'DataSetConverter4D.Util.pas',
  Functn01 in 'Functn01.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
