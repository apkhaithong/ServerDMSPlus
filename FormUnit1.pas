unit FormUnit1;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp, frxCross,
  frxRich, frxOLE, frxBarcode, frxDesgn, frxClass, frxChart, frxDMPExport,
  frxChBox, frxGradient, Data.DB, Vcl.Grids, Vcl.DBGrids, Inifiles,
  frxDACComponents, frxUniDACComponents, UniProvider, ODBCUniProvider,
  DB2UniProvider, DBAccess, Uni;

type
  TForm1 = class(TForm)
    ButtonStart: TButton;
    ButtonStop: TButton;
    EditPort: TEdit;
    Label1: TLabel;
    ApplicationEvents1: TApplicationEvents;
    ButtonOpenBrowser: TButton;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    frxGradientObject1: TfrxGradientObject;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    ApplicationEvents2: TApplicationEvents;
    frxDotMatrixExport1: TfrxDotMatrixExport;
    frxChartObject1: TfrxChartObject;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxOLEObject1: TfrxOLEObject;
    frxRichObject1: TfrxRichObject;
    frxCrossObject1: TfrxCrossObject;
    Memo1: TMemo;
    UniConnection1: TUniConnection;
    DB2UniProvider1: TDB2UniProvider;
    frxUniDACComponents1: TfrxUniDACComponents;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ButtonOpenBrowserClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure UniConnection1BeforeConnect(Sender: TObject);
  private
    XSchema : string;
    FServer: TIdHTTPWebBrokerBridge;
    procedure StartServer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  WinApi.Windows, Winapi.ShellApi, Datasnap.DSSession;

procedure TForm1.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  ButtonStart.Enabled := not FServer.Active;
  ButtonStop.Enabled := FServer.Active;
  EditPort.Enabled := not FServer.Active;
end;

procedure TForm1.Button1Click(Sender: TObject);
var frPath : string;
begin
  frPath := ExtractFilePath(paramstr(0));
  frxReport1.LoadFromFile(frPath+ '\Form\'+ComboBox1.Text);
  frxReport1.DesignReport ;
end;

procedure TForm1.ButtonOpenBrowserClick(Sender: TObject);
var
  LURL: string;
begin
  StartServer;
  LURL := Format('http://localhost:%s', [EditPort.Text]);
  ShellExecute(0,
        nil,
        PChar(LURL), nil, nil, SW_SHOWNOACTIVATE);
end;

procedure TForm1.ButtonStartClick(Sender: TObject);
begin
  StartServer;
end;

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure TForm1.ButtonStopClick(Sender: TObject);
begin
  TerminateThreads;
  FServer.Active := False;
  FServer.Bindings.Clear;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FServer := TIdHTTPWebBrokerBridge.Create(Self);
end;

procedure TForm1.FormShow(Sender: TObject);
var SR: TSearchRec;
    frPath :string;
begin
  frPath := ExtractFilePath(Application.ExeName)+'Form\';
  //ShowMessage(frPath);
  try
      ComboBox1.Clear;

      FindFirst(frPath+'*.*', faAnyFile, SR);
      try
          repeat
            if (SR.Name <> '.') and (SR.Name <> '..') then
              ComboBox1.Items.Add(SR.Name);

          until (FindNext(SR) <> 0);
      finally
         // FindClose(SR);
      end;
  finally
      ComboBox1.ItemIndex := 0;
  end;
  //ButtonOpenBrowser.Click;
end;

procedure TForm1.StartServer;
begin
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;
    FServer.DefaultPort := StrToInt(EditPort.Text);
    FServer.Active := True;
  end;
end;

procedure TForm1.UniConnection1BeforeConnect(Sender: TObject);
var DBconfig : Tinifile;
begin
  DBconfig := Tinifile.create(ExtractFilePath(paramstr(0))+'/config.ini');
  UniConnection1.Server   := DBconfig.Readstring('DATABASE','SERVER','');
  UniConnection1.Port     := StrToInt(DBconfig.Readstring('DATABASE','PORT',''));
  UniConnection1.Database := DBconfig.Readstring('DATABASE','DBNAME','');
  UniConnection1.Username := DBconfig.Readstring('DATABASE','SCHEMA','');
  XSchema :=  DBconfig.Readstring('DATABASE','SCHEMA','');
end;

end.
