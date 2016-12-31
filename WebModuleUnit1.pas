unit WebModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, System.JSON, Web.HTTPApp, Datasnap.DSHTTPCommon,
  Datasnap.DSHTTPWebBroker, Datasnap.DSServer,
  Web.WebFileDispatcher, Web.HTTPProd,
  DataSnap.DSAuth,
  Datasnap.DSProxyJavaScript, IPPeerServer, Datasnap.DSMetadata,
  Datasnap.DSServerMetadata, Datasnap.DSClientMetadata, Datasnap.DSCommonServer,
  Datasnap.DSHTTP, frxDesgn, frxExportPDF, frxClass, frxDBSet, frxExportXLSX,
  frxDACComponents, frxUniDACComponents, Data.DB, MemDS, DBAccess, Uni,
  UniProvider, ODBCUniProvider, DB2UniProvider, DataSetConverter4D.Helper,
  DataSetConverter4D.Impl, DataSetConverter4D, DataSetConverter4D.Util, Inifiles,
  Datasnap.DBClient, System.DateUtils;

type
  TWebModule1 = class(TWebModule)
    DSHTTPWebDispatcher1: TDSHTTPWebDispatcher;
    DSServer1: TDSServer;
    DSServerClass1: TDSServerClass;
    ServerFunctionInvoker: TPageProducer;
    ReverseString: TPageProducer;
    DSProxyGenerator1: TDSProxyGenerator;
    DSServerMetaDataProvider1: TDSServerMetaDataProvider;
    Index: TPageProducer;
    WebFileDispatcher1: TWebFileDispatcher;
    UniConnection1: TUniConnection;
    DB2UniProvider1: TDB2UniProvider;
    UniTransaction1: TUniTransaction;
    QGet: TUniQuery;
    QPost: TUniQuery;
    frxReport1: TfrxReport;
    frxUniDACComponents1: TfrxUniDACComponents;
    frxUserDataSet1: TfrxUserDataSet;
    frxXLSXExport1: TfrxXLSXExport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxDesigner1: TfrxDesigner;
    Page404: TPageProducer;
    stk_onhand: TPageProducer;
    sale_customer: TPageProducer;
    sale_prospect: TPageProducer;
    stk_onhanddate: TPageProducer;
    stk_stockcard: TPageProducer;
    rp_receiptdaily: TPageProducer;
    login: TPageProducer;
    set_settype: TPageProducer;
    set_setmodel: TPageProducer;
    set_setbaab: TPageProducer;
    set_setgroup: TPageProducer;
    set_setcolor: TPageProducer;
    DataSource1: TDataSource;
    set_regflag: TPageProducer;
    set_optmast: TPageProducer;
    set_optmastlocat: TPageProducer;
    set_setmod: TPageProducer;
    set_modmast: TPageProducer;
    set_setfleet: TPageProducer;
    set_bookingstatus: TPageProducer;
    set_typcont: TPageProducer;
    set_typhold: TPageProducer;
    set_argroup: TPageProducer;
    set_setgrade: TPageProducer;
    set_typlost: TPageProducer;
    set_setaump: TPageProducer;
    set_setprov: TPageProducer;
    set_paytyp: TPageProducer;
    set_payfor: TPageProducer;
    set_setbank: TPageProducer;
    set_bankbook: TPageProducer;
    set_rtchq: TPageProducer;
    set_paydue: TPageProducer;
    set_setacti: TPageProducer;
    set_setreson: TPageProducer;
    set_garmast: TPageProducer;
    set_finmast: TPageProducer;
    set_apmast: TPageProducer;
    set_company: TPageProducer;
    set_invlocat: TPageProducer;
    set_invparking: TPageProducer;
    set_docconfig: TPageProducer;
    set_officer: TPageProducer;
    set_division: TPageProducer;
    QPost1: TUniQuery;
    QPost2: TUniQuery;
    QLastno: TUniQuery;
    Query1: TUniQuery;
    QCondPay: TUniQuery;
    QDBConfig: TUniQuery;
    set_vatmast: TPageProducer;
    set_table1: TPageProducer;
    set_intrmast: TPageProducer;
    set_dbconfig: TPageProducer;
    set_channelsend: TPageProducer;
    set_setfollowupcall: TPageProducer;
    set_setcompaint: TPageProducer;
    stk_receiveddms: TPageProducer;
    stk_receivestk: TPageProducer;
    stk_receiveopt: TPageProducer;
    stk_receivemod: TPageProducer;
    stk_adjuststk: TPageProducer;
    stk_movestk: TPageProducer;
    stk_movetoasset: TPageProducer;
    stk_parkingstk: TPageProducer;
    stk_onhandopt: TPageProducer;
    sale_acard: TPageProducer;
    sale_arresv: TPageProducer;
    sale_matchstrno: TPageProducer;
    sale_arcred: TPageProducer;
    sale_armast: TPageProducer;
    sale_arfinc: TPageProducer;
    sale_ar_invoi: TPageProducer;
    sale_smcostfin: TPageProducer;
    sale_arcostsale: TPageProducer;
    sale_saleordercust: TPageProducer;
    sale_saleorder: TPageProducer;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure ServerFunctionInvokerHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: string; TagParams: TStrings; var ReplaceText: string);
    procedure WebModuleDefaultAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleBeforeDispatch(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebFileDispatcher1BeforeDispatch(Sender: TObject;
      const AFileName: string; Request: TWebRequest; Response: TWebResponse;
      var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModule1getdataAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1queryallAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure UniConnection1BeforeConnect(Sender: TObject);
    procedure WebModule1sqltextAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1invlocatAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1reportAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1exportAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    procedure WebModule1checkloginAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1duplicateCheckAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveOneAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1deleteAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveAllAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    function ZeroLead(St:String;len:integer):String;
    function RunNo(HField,LField,Lvalue:String;Dvalue:TdateTime):String;
    procedure WebModule1saveModmastAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1checkrightAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1checkRundocAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
    XSchema : string;
    ms : TMemoryStream;
    ParamsReport, GetValue: TStringList;
    FServerFunctionInvokerAction: TWebActionItem;
    function AllowServerFunctionInvoker: Boolean;
    procedure QueryOneGet(Request: TWebRequest; Response: TWebResponse);
    procedure QueryAllGet(Request: TWebRequest; Response: TWebResponse);
    procedure SqlTextGet(Request: TWebRequest; Response: TWebResponse);
    procedure InvlocatGet(Request: TWebRequest; Response: TWebResponse);
    procedure ReportGet(Request: TWebRequest; Response: TWebResponse);
    procedure ExportGet(Request: TWebRequest; Response: TWebResponse);
    procedure DuplicateCheckGet(Request: TWebRequest; Response: TWebResponse);
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation


{$R *.dfm}

uses ServerMethodsUnit1, Web.WebReq, FormUnit1;

function TWebModule1.ZeroLead(St:String;len:integer):String;
var Zero,Chr1 : string;
    j,ll : integer;
begin
    Chr1  := Trim(St);
    Zero := '';
    ll   := length(Chr1);
    if len<ll Then len:=ll;

    for j:=1 to len-ll do
        Zero := Zero+'0';
    Result := Zero+Chr1;
end;

function TWebModule1.RunNo(HField,LField,Lvalue:String;Dvalue:TdateTime):String;
Var PF,HH,Lc,YY,Mm,S2,S3,Y1:String;
    LN,V1: Double;
begin
  if not QCondPay.Active then
    QCondPay.Open;
  HH := QCondPay.Fieldbyname(HField).Asstring;
  Lc := LValue;
  YY := Copy(DateTostr(DValue), 7, 4);
  Y1 := Copy(YY, 3, 2);
  MM := Copy(DateTostr(DValue), 4, 2);
  //Docno สาขา
  with Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.ADD('SELECT SHORTL FROM INVLOCAT WHERE LOCATCD=:LOCAT_A');
    Params[0].Asstring := LC;
    Open;
    if (Query1.Eof) and (Query1.Bof) then
      raise Exception.Create('äÁè¾ºÃËÑÊÊÒ¢Ò ' + LC + ' µÃÇ¨ÊÍº ÃËÑÊ¼èÒ¹ ªèÍ§»ÃÐ¨ÓÊÒ¢Ò ')
    else
      PF := COPY(Query1.FieldByname('SHORTL').Asstring, 1, 1);
  end;
  //Query Lastno Table
  with QLastno do
  begin
    Close;
    SQL.Clear;
    SQL.ADD('SELECT LOCAT,CR_YEAR,CR_MONTH,' + LField + ' FROM LASTNO ' +
            'WHERE LOCAT  = :LOCAT_A ' + ' AND CR_YEAR = :CRY ' + ' AND CR_MONTH= :CRM ');
    Params[0].Asstring := LC;
    Params[1].Asstring := YY;
    Params[2].Asstring := MM;
    Open;
    if (QLastno.Eof) and (QLastno.Bof) then
    begin
      QLastno.Insert;
      QLastno.Fieldbyname('Locat').Asstring := LC;
      QLastno.Fieldbyname('Cr_year').Asstring := YY;
      QLastno.Fieldbyname('Cr_Month').Asstring := MM;
      QLastno.Post;
    end;
    LN := QLastNo.FieldByname(LField).AsFloat;
    V1 := LN + 1;
    S2 := FloatTostr(V1);
    S3 := ZeroLead(S2, 4);
    Result := PF + HH + '-' + Y1 + MM + S3;
    //Update Lastno
    if V1 > QLastNo.Fieldbyname(LField).AsFloat then
    begin
      QLastNo.Edit;
      QLastNo.Fieldbyname(LField).AsFloat := V1;
      QLastNo.Post;
    end;
  end;
end;

procedure TWebModule1.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit1.TServerMethods1;
end;

procedure TWebModule1.DuplicateCheckGet(Request: TWebRequest;
  Response: TWebResponse);
var Return : String;
begin
  with QGet do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM '+Request.QueryFields.Values['table']+' '+
            'WHERE '+Request.QueryFields.Values['field']+' =:V1 ');
    ParamByName('V1').AsString := Request.QueryFields.Values['value'];
    Open;
  end;

  //Response Data
  try
    if QGet.IsEmpty then
    begin
      Return := 'true';
    end
    else
    begin
      Return := 'false';
    end;
  finally
    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := Return;
  end;
end;

procedure TWebModule1.ExportGet(Request: TWebRequest; Response: TWebResponse);
var ja : TJSONArray;
    jo : TJSONObject;
    I : Integer;
    frPath : string;
begin
  frPath := ExtractFilePath(paramstr(0));
  if Request.QueryFields.Count > 0 then
  begin
    ParamsReport := TStringList.Create;
    for I := 0 to Request.QueryFields.Count-1 do
    begin
      ParamsReport.AddPair(Request.QueryFields.Names[I],Request.QueryFields.ValueFromIndex[I]);
    end;
  end;

  if ParamsReport.Values['reportname'] = 'receiptdaily' then
    frxReport1.LoadFromFile(frPath+ '\Form\rp_receiptdaily.fr3');

  ms := TMemoryStream.Create;
  frxReport1.PrepareReport();
  frxXLSXExport1.Stream   := ms;
  frxReport1.Export(frxXLSXExport1);
  Response.SetCustomHeader('Content-Disposition','attachment; filename='+ParamsReport.Values['reportname']+'.xlsx');
  Response.ContentType   := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
  Response.ContentStream := ms;
end;

procedure TWebModule1.frxReport1GetValue(const VarName: string;
  var Value: Variant);
begin
  if ParamsReport.Values['reportname'] = 'receiptdaily' then
  begin
    IF Uppercase(VarName) = 'VLOCAT' then
      Value := ParamsReport.Values['locat']+'%';
    IF Uppercase(VarName) = 'VFDATE' then
      Value := StrToDate(ParamsReport.Values['fdate']);
    IF Uppercase(VarName) = 'VTDATE' then
      Value := StrToDate(ParamsReport.Values['tdate']);
    IF Uppercase(VarName) = 'VPAYFOR' then
      Value := ParamsReport.Values['payfor']+'%';
    IF Uppercase(VarName) = 'VPAYTYP' then
      Value := ParamsReport.Values['paytyp']+'%';
  end;
end;

procedure TWebModule1.InvlocatGet(Request: TWebRequest; Response: TWebResponse);
var ja : TJSONArray;
    jo : TJSONObject;
    I : Integer;
begin
  with QGet do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM INVLOCAT ORDER BY LOCATCD');
    Open;
  end;

  //Response Data
  try
    if QGet.IsEmpty then
    begin
      ja := TJSONArray.Create;
      jo := TJSONObject.Create;
    end
    else
    begin
      ja := TConverter.New.DataSet(QGet).AsJSONArray;
      jo := TConverter.New.DataSet.Source(QGet).AsJSONObject;
    end;
  finally
    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := ja.ToString;
    ja.DisposeOf;
  end;

end;

procedure TWebModule1.QueryAllGet(Request: TWebRequest;
  Response: TWebResponse);
var ja : TJSONArray;
    jo : TJSONObject;
    I : Integer;
begin
  with QGet do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM '+Request.QueryFields.Values['table']+' '+
            'WHERE '+Request.QueryFields.Values['field']+' LIKE:V1 ORDER BY '+
            Request.QueryFields.Values['field']);
    ParamByName('V1').AsString := '%'+Request.QueryFields.Values['value']+'%';
    Open;
  end;

  //Response Data
  try
    if QGet.IsEmpty then
    begin
      ja := TJSONArray.Create;
      jo := TJSONObject.Create;
    end
    else
    begin
      ja := TConverter.New.DataSet(QGet).AsJSONArray;
      jo := TConverter.New.DataSet.Source(QGet).AsJSONObject;
    end;
  finally
    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := ja.ToString;
    ja.DisposeOf;
  end;
end;

procedure TWebModule1.QueryOneGet(Request: TWebRequest; Response: TWebResponse);
var ja : TJSONArray;
    jo : TJSONObject;
    I : Integer;
begin
  with QGet do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM '+Request.QueryFields.Values['table']+' '+
            'WHERE '+Request.QueryFields.Values['field']+' =:V1 ');
    ParamByName('V1').AsString := Request.QueryFields.Values['value'];
    Open;
  end;

  //Response Data
  try
    if QGet.IsEmpty then
    begin
      ja := TJSONArray.Create;
      jo := TJSONObject.Create;
    end
    else
    begin
      ja := TConverter.New.DataSet(QGet).AsJSONArray;
      jo := TConverter.New.DataSet.Source(QGet).AsJSONObject;
    end;
  finally
    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := ja.ToString;
    ja.DisposeOf;
  end;
end;

procedure TWebModule1.ReportGet(Request: TWebRequest; Response: TWebResponse);
var ja : TJSONArray;
    jo : TJSONObject;
    I : Integer;
    frPath : string;
begin
  frPath := ExtractFilePath(paramstr(0));
  if Request.QueryFields.Count > 0 then
  begin
    ParamsReport := TStringList.Create;
    for I := 0 to Request.QueryFields.Count-1 do
    begin
      ParamsReport.AddPair(Request.QueryFields.Names[I],Request.QueryFields.ValueFromIndex[I]);
    end;
  end;

  if ParamsReport.Values['reportname'] = 'receiptdaily' then
    frxReport1.LoadFromFile(frPath+ '\Form\rp_receiptdaily.fr3');

  ms := TMemoryStream.Create;
  frxReport1.PrepareReport();
  frxPDFExport1.Stream   := ms;
  frxReport1.Export(frxPDFExport1);
  Response.SetCustomHeader('Content-Disposition','filename=setgroup.pdf');
  Response.ContentType   := 'application/pdf';
  Response.ContentStream := ms;
end;

procedure TWebModule1.ServerFunctionInvokerHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: string; TagParams: TStrings; var ReplaceText: string);
begin
  if SameText(TagString, 'urlpath') then
    ReplaceText := string(Request.InternalScriptName)
  else if SameText(TagString, 'port') then
    ReplaceText := IntToStr(Request.ServerPort)
  else if SameText(TagString, 'host') then
    ReplaceText := string(Request.Host)
  else if SameText(TagString, 'classname') then
    ReplaceText := ServerMethodsUnit1.TServerMethods1.ClassName
  else if SameText(TagString, 'loginrequired') then
    if DSHTTPWebDispatcher1.AuthenticationManager <> nil then
      ReplaceText := 'true'
    else
      ReplaceText := 'false'
  else if SameText(TagString, 'serverfunctionsjs') then
    ReplaceText := string(Request.InternalScriptName) + '/js/serverfunctions.js'
  else if SameText(TagString, 'servertime') then
    ReplaceText := DateTimeToStr(Now)
  else if SameText(TagString, 'serverfunctioninvoker') then
    if AllowServerFunctionInvoker then
      ReplaceText :=
      '<div><a href="' + string(Request.InternalScriptName) +
      '/ServerFunctionInvoker" target="_blank">Server Functions</a></div>'
    else
      ReplaceText := '';
end;

procedure TWebModule1.SqlTextGet(Request: TWebRequest; Response: TWebResponse);
var ja : TJSONArray;
    jo : TJSONObject;
    I : Integer;
begin
  with QGet do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Request.QueryFields.Values['sql']);
    Open;
  end;

  //Response Data
  try
    if QGet.IsEmpty then
    begin
      ja := TJSONArray.Create;
      jo := TJSONObject.Create;
    end
    else
    begin
      ja := TConverter.New.DataSet(QGet).AsJSONArray;
      jo := TConverter.New.DataSet.Source(QGet).AsJSONObject;
    end;
  finally
    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := ja.ToString;
    ja.DisposeOf;
  end;
end;

procedure TWebModule1.UniConnection1BeforeConnect(Sender: TObject);
var DBconfig : Tinifile;
begin
  DBconfig := Tinifile.create(ExtractFilePath(paramstr(0))+'/config.ini');
  UniConnection1.Server   := DBconfig.Readstring('DATABASE','SERVER','');
  UniConnection1.Port     := StrToInt(DBconfig.Readstring('DATABASE','PORT',''));
  UniConnection1.Database := DBconfig.Readstring('DATABASE','DBNAME','');
  UniConnection1.Username := DBconfig.Readstring('DATABASE','SCHEMA','');
  XSchema :=  DBconfig.Readstring('DATABASE','SCHEMA','');
end;

procedure TWebModule1.WebModuleDefaultAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if (Request.InternalPathInfo = '') or (Request.InternalPathInfo = '/')then
    Response.Content := login.Content
  else
    Response.SendRedirect(Request.InternalScriptName + '/');
end;

procedure TWebModule1.WebModule1checkloginAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var ja : TJSONArray;
    jo : TJSONObject;
    I : Integer;
begin
  Handled := True;
  if Request.MethodType = mtGet then
  begin
    if Request.QueryFields.Count > 0 then
    begin
      GetValue := TStringList.Create;
      for I := 0 to Request.QueryFields.Count-1 do
      begin
        GetValue.AddPair(Request.QueryFields.Names[I],Request.QueryFields.ValueFromIndex[I]);
      end;
    end;
    if (GetValue.Values['username1'] <> '') and (GetValue.Values['password1'] <> '') then
    begin
      with QGet do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT USERID, ENDCODE, ENDCODEPASS('''+GetValue.Values['username1']+''', '''+GetValue.Values['password1']+
                ''') AS PASSWORD FROM PASSWRD WHERE USERID =:V1');
        ParamByName('V1').AsString := GetValue.Values['username1'];
        Open;
      end;
      if (not QGet.IsEmpty) and (QGet.FieldByName('ENDCODE').AsString = QGet.FieldByName('PASSWORD').AsString) then
      begin
        with QGet do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ''TRUE'' AS LOGIN, USERID, CUSCOD, LOCATCD, DEPRT, LEVEL, SRHACTV, KEYDISC, BLOCK, '+
                  '       GROUP, EXPIRE, DESIGN, CHGLOC, CHGDATE, EDITGL, OVERYEAR, FLAGID, '+
                  '       BPRN, RPRN, CHGLOCAT, EDITPRN, EDITCUST, APPROVE, APPROVE_AMNT '+
                  'FROM PASSWRD WHERE USERID =:V1');
          ParamByName('V1').AsString := GetValue.Values['username1'];
          Open;
        end;
      end
      else
      begin
        with QGet do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ''FALSE'' AS LOGIN  FROM SYSIBM.SYSDUMMY1');
          Open;
        end;
      end;
      //Response Data
      try
        if QGet.IsEmpty then
        begin
          ja := TJSONArray.Create;
          jo := TJSONObject.Create;
        end
        else
        begin
          ja := TConverter.New.DataSet(QGet).AsJSONArray;
          jo := TConverter.New.DataSet.Source(QGet).AsJSONObject;
        end;
      finally
        Response.ContentType := 'application/json;charset=UTF-8';
        Response.Content := ja.ToString;
        ja.DisposeOf;
      end;
    end;
  end
  else
  begin
    Response.StatusCode := 400;
    Response.SendResponse;
  end;
end;

procedure TWebModule1.WebModule1checkrightAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var ja, LJsonArr : TJSONArray;
    jo, RequestObject : TJSONObject;
    userid, menucode :string;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    //Convert Content to JSON Array
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    RequestObject := LJsonArr.Items[0] as TJSONObject;
    userid   := RequestObject.GetValue('userid').Value;
    menucode := RequestObject.GetValue('menucode').Value;
    with QGet do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT M_ACCESS, M_EDIT, M_INSERT, M_DELETE '+
              'FROM USERMENU WHERE USERID =:V1 AND MENUCODE =:V2 ');
      ParamByName('V1').AsString := userid;
      ParamByName('V2').AsString := menucode;
      Open;
    end;
    //Response Data
    try
      if QGet.IsEmpty then
      begin
        ja := TJSONArray.Create;
        jo := TJSONObject.Create;
      end
      else
      begin
        ja := TConverter.New.DataSet(QGet).AsJSONArray;
        jo := TConverter.New.DataSet.Source(QGet).AsJSONObject;
      end;
    finally
      Response.ContentType := 'application/json;charset=UTF-8';
      Response.Content := ja.ToString;
      ja.DisposeOf;
    end;
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1checkRundocAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var ja, LJsonArr : TJSONArray;
    jo, RequestObject : TJSONObject;
    document, locat :string;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    //Convert Content to JSON Array
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    RequestObject := LJsonArr.Items[0] as TJSONObject;
    document := RequestObject.GetValue('doc').Value;
    locat := RequestObject.GetValue('locat').Value;
    with QGet do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT '+document+' AS RUNNING FROM DBCONFIG WHERE LOCATCD =:V1 ');
      ParamByName('V1').AsString := locat;
      Open;
    end;
    //Response Data
    try
      if QGet.IsEmpty then
      begin
        ja := TJSONArray.Create;
        jo := TJSONObject.Create;
      end
      else
      begin
        ja := TConverter.New.DataSet(QGet).AsJSONArray;
        jo := TConverter.New.DataSet.Source(QGet).AsJSONObject;
      end;
    finally
      Response.ContentType := 'application/json;charset=UTF-8';
      Response.Content := ja.ToString;
      ja.DisposeOf;
    end;
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1deleteAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var ja, LJsonArr : TJSONArray;
    jo, RequestObject : TJSONObject;
    table, field, key, Return :string;
    I : Integer;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    //Convert Content to JSON Array
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Loop Reading JSON Array
    Form1.Memo1.Lines.Clear;
    for I := 0 to LJsonArr.Count-1 do
    begin
      RequestObject := LJsonArr.Items[I] as TJSONObject;
      table  := RequestObject.GetValue('table').Value;
      field  := RequestObject.GetValue('field').Value;
      key    := RequestObject.GetValue('key').Value;

      with QPost do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM '+table+' WHERE '+field+' =:V1 ');
        Params.ParamByName('V1').AsString := key;
        Open;
      end;
      QPost.First;
      while not QPost.Eof do
      begin
        QPost.Delete;
      end;
      //StartTransaction
      QPost.Transaction.StartTransaction;
      try
        QPost.ApplyUpdates();
        QPost.Transaction.Commit;
      finally
        if QPost.Transaction.Active then
        begin
          Return := 'false';
          QPost.Transaction.Rollback;
        end
        else
        begin
          Return := 'true';
        end;
      end;
      if Return = 'false' then
        break;
    end;

    //Response Data
    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := Return;
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1duplicateCheckAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet: DuplicateCheckGet(Request, Response);
    else
    begin
      Response.Content := Page404.Content;
    end;
  end;
end;

procedure TWebModule1.WebModule1exportAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet: ExportGet(Request, Response);
    else
    begin
      Response.Content := Page404.Content;
    end;
  end;
end;

procedure TWebModule1.WebModule1getdataAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet: QueryOneGet(Request, Response);
    else
    begin
      Response.Content := Page404.Content;
    end;
  end;
end;

procedure TWebModule1.WebModule1invlocatAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet: InvlocatGet(Request, Response);
    else
    begin
      Response.Content := Page404.Content;
    end;
  end;
end;

procedure TWebModule1.WebModule1queryallAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet: QueryAllGet(Request, Response);
    else
    begin
      Response.Content := Page404.Content;
    end;
  end;
end;

procedure TWebModule1.WebModule1reportAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet: ReportGet(Request, Response);
    else
    begin
      Response.Content := Page404.Content;
    end;
  end;
end;

procedure TWebModule1.WebModule1saveAllAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var ja, LJsonArr : TJSONArray;
    jo, RqObjectMaster, RqObjectTran : TJSONObject;
    status, table, field, key, value, Return :string;
    I, J, K : integer;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin

    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    Form1.Memo1.Lines.Clear;
    for I := 0 to LJsonArr.Count-1 do
    begin
      RqObjectMaster := LJsonArr.Items[I] as TJSONObject;
      table  := RqObjectMaster.GetValue('table').Value;
      value  := RqObjectMaster.GetValue('value').ToJSON;
      ja     := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      if (I = 0) then
      begin
        status := RqObjectMaster.GetValue('status').Value;
        field  := RqObjectMaster.GetValue('field').Value;
        key    := RqObjectMaster.GetValue('key').Value;
        if (status = 'insert') then
        begin
          with QGet do
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT NAME FROM SYSIBM.SYSCOLUMNS WHERE TBNAME =:V1 AND TBCREATOR =:V2 AND KEYSEQ = ''1'' ');
            ParamByName('V1').AsString := table;
            ParamByName('V2').AsString := UpperCase(XSchema);
            Open;
          end;

          with QPost do
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT * FROM '+table+' WHERE '+QGet.FieldByName('NAME').AsString+' IS NULL ');
            Open;
            Insert;
          end;

          //Convert data to record
          TConverter.New.JSON.Source(ja).ToDataSet(QPost);
        end
        else
        begin
          with QPost do
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT * FROM '+table+' WHERE '+field+' =:V1 ');
            Params.ParamByName('V1').AsString := key;
            Open;
            Edit;
          end;

          //Convert data to record
          TConverter.New.JSON.Source(ja).ToRecord(QPost);
        end;
      end
      else
      begin
        with QPost2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM '+table+' WHERE '+field+' =:V1 ');
          Params.ParamValues['V1'] := key;
          Open;
        end;
        //Delete record in old data
        QPost2.First;
        while not QPost2.Eof do
        begin
          K := 0;
          for J := 0 to ja.Count-1 do
          begin
            RqObjectTran := ja.Items[J] as TJSONObject;
            if StrToInt(RqObjectTran.GetValue('IDNO').Value) = QPost2.FieldByName('IDNO').AsInteger then
            begin
              K := K+1;
              break;
            end;
          end;
          if K = 0 then
            QPost2.Delete
          else
            QPost2.Next;
        end;
        //Edit old data and Insert new data
        for J := 0 to ja.Count-1 do
        begin
          RqObjectTran := ja.Items[J] as TJSONObject;
          if QPost2.Locate('IDNO',RqObjectTran.GetValue('IDNO').Value,[loPartialKey]) then
          begin
            QPost2.Edit;
          end
          else
          begin
            QPost2.Append;
          end;
          for K := 0 to QPost2.FieldCount-1 do
          begin
            if QPost2.Fields[K].FieldName <> 'IDNO' then
            begin
              QPost2.Fields[K].Value := RqObjectTran.GetValue(QPost2.Fields[K].FieldName).Value;
            end;
          end;
        end;
      end;
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
      if QPost2.Active then
        QPost2.ApplyUpdates;
      UniConnection1.Commit;
    except
      UniConnection1.Rollback;
      Return := 'false';
      raise;
    end;
    if QPost.Active then
      QPost.CommitUpdates;
    if QPost2.Active then
      QPost2.CommitUpdates;
    Return := 'true';
    //Response Data
    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := Return;
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveModmastAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var ja, LJsonArr : TJSONArray;
    jo, RqObjectMaster, RqObjectTran : TJSONObject;
    status, table, key, value, Return, locat, HF,LF,LV,S, modno :string;
    I, J, K : integer;
    DV :TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data MODMAST
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table  := RqObjectMaster.GetValue('table').Value;
    locat  := RqObjectMaster.GetValue('locat').Value;
    value  := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key    := RqObjectMaster.GetValue('key').Value;
    if table = 'MODMAST' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;

      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM MODMAST WHERE IDNO IS NULL ');
          Open;
        end;
        HF := 'H_MODMAST';
        LF := 'L_MODMAST';
        If Not QDBConfig.Active Then
        begin
          QDBConfig.ParamByName('LOCAT').AsString := locat;
          QDbconfig.Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('MODDT').AsDateTime   := StrToDate(RqObjectTran.GetValue('MODDT').Value);
        If QDBConfig.Fieldbyname('R_MODMAST').asstring = 'Y' Then
        begin
          LV := locat;
          DV := QPost.FieldByName('MODDT').AsDateTime;
          QPost.FieldByName('MODNO').AsString := RunNo(HF,LF,LV,DV);
        end
        else
        begin
          QPost.FieldByName('MODNO').AsString := RqObjectTran.GetValue('MODNO').Value;
        end;
        QPost.FieldByName('MODELCOD').AsString  := RqObjectTran.GetValue('MODELCOD').Value;
        QPost.FieldByName('SUMQTY').AsFloat     := StrToFloat(RqObjectTran.GetValue('SUMQTY').Value);
        QPost.FieldByName('FLAG').AsString      := RqObjectTran.GetValue('FLAG').Value;
        QPost.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        QPost.FieldByName('SUMOPTPRC').AsFloat  := StrToFloat(RqObjectTran.GetValue('SUMOPTPRC').Value);
        modno := QPost.FieldByName('MODNO').AsString;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM MODMAST WHERE MODNO =:V1 ');
          Params.ParamByName('V1').AsString := key;
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('MODDT').AsDateTime   := StrToDate(RqObjectTran.GetValue('MODDT').Value);
        QPost.FieldByName('MODELCOD').AsString  := RqObjectTran.GetValue('MODELCOD').Value;
        QPost.FieldByName('SUMQTY').AsFloat     := StrToFloat(RqObjectTran.GetValue('SUMQTY').Value);
        QPost.FieldByName('FLAG').AsString      := RqObjectTran.GetValue('FLAG').Value;
        QPost.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        QPost.FieldByName('MOMO1').AsString     := RqObjectTran.GetValue('MOMO1').Value;
        QPost.FieldByName('SUMOPTPRC').AsFloat  := StrToFloat(RqObjectTran.GetValue('SUMOPTPRC').Value);
        modno := QPost.FieldByName('MODNO').AsString;
      end;
    end;
    //Get Data MODTRAN
    RqObjectMaster := LJsonArr.Items[1] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    if table = 'MODTRAN' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      with QPost2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM MODTRAN WHERE MODNO =:V1 ');
        Params.ParamValues['V1'] := key;
        Open;
      end;
      //Delete record in old data
      QPost2.First;
      while not QPost2.Eof do
      begin
        K := 0;
        for J := 0 to ja.Count-1 do
        begin
          RqObjectTran := ja.Items[J] as TJSONObject;
          if StrToInt(RqObjectTran.GetValue('IDNO').Value) = QPost2.FieldByName('IDNO').AsInteger then
          begin
            K := K+1;
            break;
          end;
        end;
        if K = 0 then
          QPost2.Delete
        else
          QPost2.Next;
      end;
      //Edit old data and Insert new data
      for I := 0 to ja.Count-1 do
      begin
        RqObjectTran := ja.Items[I] as TJSONObject;
        if QPost2.Locate('IDNO',RqObjectTran.GetValue('IDNO').Value,[loPartialKey]) then
        begin
          QPost2.Edit;
        end
        else
        begin
          QPost2.Append;
        end;
        QPost2.FieldByName('MODNO').AsString     := modno;
        QPost2.FieldByName('OPTCODE').AsString   := RqObjectTran.GetValue('OPTCODE').Value;
        QPost2.FieldByName('OPTNAME').AsString   := RqObjectTran.GetValue('OPTNAME').Value;
        QPost2.FieldByName('QTY').AsFloat        := StrToFloat(RqObjectTran.GetValue('QTY').Value);
        QPost2.FieldByName('FLAG').AsString      := RqObjectTran.GetValue('FLAG').Value;
        QPost2.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
        QPost2.FieldByName('INPUTDT').AsDateTime := Now;
        QPost2.FieldByName('OPTPRC').AsFloat     := StrToFloat(RqObjectTran.GetValue('OPTPRC').Value);
      end;
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
      if QPost2.Active then
        QPost2.ApplyUpdates;
      if QLastno.Active then
        QLastno.ApplyUpdates;
      UniConnection1.Commit;
    except
      UniConnection1.Rollback;
      Return := 'false';
      //Response Data
      Response.ContentType := 'application/json;charset=UTF-8';
      Response.Content := Return;
      raise;
    end;
    if QPost.Active then
      QPost.CommitUpdates;
    if QPost2.Active then
      QPost2.CommitUpdates;
    if QLastno.Active then
      QLastno.CommitUpdates;
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "save": '+Return+', "modno": "'+modno+'" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveOneAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var ja, LJsonArr : TJSONArray;
    jo, RequestObject : TJSONObject;
    status, table, field, key, value, Return :string;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin

    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    RequestObject := LJsonArr.Items[0] as TJSONObject;

    status := RequestObject.GetValue('status').Value;
    table  := RequestObject.GetValue('table').Value;
    field  := RequestObject.GetValue('field').Value;
    key    := RequestObject.GetValue('key').Value;
    value  := RequestObject.GetValue('value').ToJSON;
    ja     := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;

//    Form1.Memo1.Lines.Clear;
//    Form1.Memo1.Lines.Add('status : '+status);
//    Form1.Memo1.Lines.Add('table : '+table);
//    Form1.Memo1.Lines.Add('value : '+value);
//    Form1.Memo1.Lines.Add('schema : '+XSchema);

    if (status = 'insert') then
    begin
      with QGet do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT NAME FROM SYSIBM.SYSCOLUMNS WHERE TBNAME =:V1 AND TBCREATOR =:V2 AND KEYSEQ = ''1'' ');
        ParamByName('V1').AsString := table;
        ParamByName('V2').AsString := UpperCase(XSchema);
        Open;
      end;

      with QPost do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM '+table+' WHERE '+QGet.FieldByName('NAME').AsString+' IS NULL ');
        Open;
        Insert;
      end;

      //Convert data to record
      TConverter.New.JSON.Source(ja).ToDataSet(QPost);
    end
    else
    begin
      with QPost do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM '+table+' WHERE '+field+' =:V1 ');
        Params.ParamByName('V1').AsString := key;
        Open;
        Edit;
      end;

      //Convert data to record
      TConverter.New.JSON.Source(ja).ToRecord(QPost);
    end;

    //StartTransaction
    QPost.Edit;
    QPost.Transaction.StartTransaction;
    try
      QPost.Post;
      QPost.ApplyUpdates();
      QPost.Transaction.Commit;
    finally
      if QPost.Transaction.Active then
      begin
        Return := 'false';
        QPost.Transaction.Rollback;
      end
      else
      begin
        Return := 'true';
      end;
    end;

    //Response Data
    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := Return;
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1sqltextAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet: SqlTextGet(Request, Response);
    else
    begin
      Response.Content := Page404.Content;
    end;
  end;
end;

procedure TWebModule1.WebModuleBeforeDispatch(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if FServerFunctionInvokerAction <> nil then
    FServerFunctionInvokerAction.Enabled := AllowServerFunctionInvoker;
end;

function TWebModule1.AllowServerFunctionInvoker: Boolean;
begin
  Result := (Request.RemoteAddr = '127.0.0.1') or
    (Request.RemoteAddr = '0:0:0:0:0:0:0:1') or (Request.RemoteAddr = '::1');
end;

procedure TWebModule1.WebFileDispatcher1BeforeDispatch(Sender: TObject;
  const AFileName: string; Request: TWebRequest; Response: TWebResponse;
  var Handled: Boolean);
var
  D1, D2: TDateTime;
begin
  Handled := False;
  if SameFileName(ExtractFileName(AFileName), 'serverfunctions.js') then
    if not FileExists(AFileName) or (FileAge(AFileName, D1) and FileAge(WebApplicationFileName, D2) and (D1 < D2)) then
    begin
      DSProxyGenerator1.TargetDirectory := ExtractFilePath(AFileName);
      DSProxyGenerator1.TargetUnitName := ExtractFileName(AFileName);
      DSProxyGenerator1.Write;
    end;
end;

procedure TWebModule1.WebModuleCreate(Sender: TObject);
begin
  FServerFunctionInvokerAction := ActionByName('ServerFunctionInvokerAction');
end;

initialization
finalization
  Web.WebReq.FreeWebModules;

end.

