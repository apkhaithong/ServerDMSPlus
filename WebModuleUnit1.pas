﻿unit WebModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, System.JSON, Web.HTTPApp, Datasnap.DSHTTPCommon, Datasnap.DSHTTPWebBroker, Datasnap.DSServer, Web.WebFileDispatcher, Web.HTTPProd, DataSnap.DSAuth, Datasnap.DSProxyJavaScript, IPPeerServer, Datasnap.DSMetadata, Datasnap.DSServerMetadata, Datasnap.DSClientMetadata, Datasnap.DSCommonServer, Datasnap.DSHTTP, frxDesgn, frxExportPDF, frxClass, frxDBSet, frxExportXLSX, frxDACComponents, frxUniDACComponents, Data.DB, MemDS, DBAccess, Uni, UniProvider, ODBCUniProvider,
  DB2UniProvider, DataSetConverter4D.Helper, DataSetConverter4D.Impl, DataSetConverter4D, DataSetConverter4D.Util, Inifiles, Datasnap.DBClient, System.DateUtils;

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
    QPost3: TUniQuery;
    fin_chqmas: TPageProducer;
    QPost4: TUniQuery;
    fin_chqstat: TPageProducer;
    fin_chqpayin: TPageProducer;
    fin_chqpass: TPageProducer;
    fin_chqreturn: TPageProducer;
    fin_billfinance: TPageProducer;
    fin_unknownmoney: TPageProducer;
    fin_billother: TPageProducer;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    procedure ServerFunctionInvokerHTMLTag(Sender: TObject; Tag: TTag; const TagString: string; TagParams: TStrings; var ReplaceText: string);
    procedure WebModuleDefaultAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebFileDispatcher1BeforeDispatch(Sender: TObject; const AFileName: string; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
    procedure WebModule1getdataAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1queryallAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure UniConnection1BeforeConnect(Sender: TObject);
    procedure WebModule1sqltextAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1invlocatAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1reportAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1exportAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    procedure WebModule1checkloginAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1duplicateCheckAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveOneAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1deleteAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveAllAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    function ZeroLead(St: string; len: integer): string;
    function RunNo(HField, LField, Lvalue: string; Dvalue: TdateTime): string;
    procedure WebModule1saveModmastAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1checkrightAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1checkRundocAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveInvinvoAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1duplicateStrnoAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveArcredAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1cancelArcredAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveCustmastAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveChqmasAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1cancelChqmasAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveOptinvoiAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveMcmastAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveAdjstkAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveInvmovmAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveCompAssetAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1cancelCompAssetAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveLocatparkingAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveChqstatAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveChqpayinAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveChqpassAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveChqreturnAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1savePaymenttranferAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveChqanotherAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveOfficerAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveVatmastAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1getDbconfigAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveDbconfigAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1getDocconfigAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveDocconfigAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveAcardAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1cancelAcardAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveMathstrnoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1cancelMacthstrnoAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveArfincAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1cancelArfincAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1saveAr_invoiAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1cancelAr_invoiAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
    XSchema: string;
    ms: TMemoryStream;
    ParamsReport, GetValue: TStringList;
    FServerFunctionInvokerAction: TWebActionItem;
    function AllowServerFunctionInvoker: Boolean;
    function RunCusCod(locat: string): string;
    procedure QueryOneGet(Request: TWebRequest; Response: TWebResponse);
    procedure QueryAllGet(Request: TWebRequest; Response: TWebResponse);
    procedure SqlTextGet(Request: TWebRequest; Response: TWebResponse);
    procedure InvlocatGet(Request: TWebRequest; Response: TWebResponse);
    procedure ReportGet(Request: TWebRequest; Response: TWebResponse);
    procedure ExportGet(Request: TWebRequest; Response: TWebResponse);
    procedure DuplicateCheckGet(Request: TWebRequest; Response: TWebResponse);
    procedure DuplicateStrnoGet(Request: TWebRequest; Response: TWebResponse);
    procedure DbconfigGet(Request: TWebRequest; Response: TWebResponse);
    procedure DocconfigGet(Request: TWebRequest; Response: TWebResponse);
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation


{$R *.dfm}

uses
  ServerMethodsUnit1, Web.WebReq, FormUnit1, Functn01;

function TWebModule1.ZeroLead(St: string; len: integer): string;
var
  Zero, Chr1: string;
  j, ll: integer;
begin
  Chr1 := Trim(St);
  Zero := '';
  ll := length(Chr1);
  if len < ll then
    len := ll;

  for j := 1 to len - ll do
    Zero := Zero + '0';
  Result := Zero + Chr1;
end;

function TWebModule1.RunCusCod(locat: string): string;
var
  LC, H, L, R, Lno: string;
  I, C: Integer;
begin
  if not Qcondpay.Active then
    QCondPay.Open;
  if not QDBConfig.Active then
  begin
    QDBConfig.ParamByName('LOCAT').AsString := locat;
    QDbconfig.Open;
  end;
  if QDBConfig.FieldByName('R_CUSCOD').AsString = 'Y' then
  begin
    with Query1 do
    begin
      Close;
      Sql.Clear;
      SQl.Add('SELECT LOCATCD,SHORTL,AUMPCOD,PROVCOD,POSTCOD FROM INVLOCAT WHERE LOCATCD=:V0');
      Params[0].Asstring := locat;
      Open;
      if not (Bof and Eof) then
        LC := COPY(FieldByName('SHORTL').Asstring, 1, 1);
    end;
    H := LC + Qcondpay.Fieldbyname('H_Cuscod').Asstring;
    with Query1 do
    begin
      Close;
      Sql.Clear;
      SQl.Add('SELECT MAX(CUSCOD) AS MAXNO FROM CUSTMAST WHERE SUBSTR(CUSCOD,1,5)=:V0');
      Params[0].Asstring := H;
      Open;
      if not (Bof and Eof) then
      begin
        L := Copy(Query1.Fieldbyname('Maxno').Asstring, 6, 7);
        Val(L, I, C);
        I := I + 1;
        R := ZeroLead(Inttostr(I), 7);
        Result := H + R;
        Lno := Result;
      end
      else
      begin
        R := ZeroLead(Inttostr(1), 7);
        Result := H + R;
        Lno := Result;
      end;
    end;
  end;
end;

function TWebModule1.RunNo(HField, LField, Lvalue: string; Dvalue: TdateTime): string;
var
  PF, HH, Lc, YY, Mm, S2, S3, Y1: string;
  LN, V1: Double;
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
  if not QLastno.Active then
  begin
    with QLastno do
    begin
      Close;
      SQL.Clear;
      SQL.ADD('SELECT * FROM LASTNO ' + 'WHERE LOCAT  = :LOCAT_A ' + ' AND CR_YEAR = :CRY ' + ' AND CR_MONTH= :CRM ');
      Params[0].Asstring := LC;
      Params[1].Asstring := YY;
      Params[2].Asstring := MM;
      Open;
    end;
  end;
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

procedure TWebModule1.DSServerClass1GetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethodsUnit1.TServerMethods1;
end;

procedure TWebModule1.DuplicateCheckGet(Request: TWebRequest; Response: TWebResponse);
var
  Return: string;
begin
  with QGet do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + Request.QueryFields.Values['table'] + ' ' + 'WHERE ' + Request.QueryFields.Values['field'] + ' =:V1 ');
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

procedure TWebModule1.DuplicateStrnoGet(Request: TWebRequest; Response: TWebResponse);
var
  Return: string;
begin
  with QGet do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM INVTRAN WHERE STRNO =:V1 and RECVNO <>:V2 ');
    ParamByName('V1').AsString := Request.QueryFields.Values['value1'];
    ParamByName('V2').AsString := Request.QueryFields.Values['value2'];
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
var
  ja: TJSONArray;
  jo: TJSONObject;
  I: Integer;
  frPath: string;
begin
  frPath := ExtractFilePath(paramstr(0));
  if Request.QueryFields.Count > 0 then
  begin
    ParamsReport := TStringList.Create;
    for I := 0 to Request.QueryFields.Count - 1 do
    begin
      ParamsReport.AddPair(Request.QueryFields.Names[I], Request.QueryFields.ValueFromIndex[I]);
    end;
  end;

  if ParamsReport.Values['reportname'] = 'receiptdaily' then
    frxReport1.LoadFromFile(frPath + '\Form\rp_receiptdaily.fr3');

  ms := TMemoryStream.Create;
  frxReport1.PrepareReport();
  frxXLSXExport1.Stream := ms;
  frxReport1.Export(frxXLSXExport1);
  Response.SetCustomHeader('Content-Disposition', 'attachment; filename=' + ParamsReport.Values['reportname'] + '.xlsx');
  Response.ContentType := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
  Response.ContentStream := ms;
end;

procedure TWebModule1.frxReport1GetValue(const VarName: string; var Value: Variant);
begin
  if ParamsReport.Values['reportname'] = 'receiptdaily' then
  begin
    if Uppercase(VarName) = 'VLOCAT' then
      Value := ParamsReport.Values['locat'] + '%';
    if Uppercase(VarName) = 'VFDATE' then
      Value := StrToDate(ParamsReport.Values['fdate']);
    if Uppercase(VarName) = 'VTDATE' then
      Value := StrToDate(ParamsReport.Values['tdate']);
    if Uppercase(VarName) = 'VPAYFOR' then
      Value := ParamsReport.Values['payfor'] + '%';
    if Uppercase(VarName) = 'VPAYTYP' then
      Value := ParamsReport.Values['paytyp'] + '%';
  end
  else
  begin
    if Uppercase(VarName) = 'VDOCNO' then
      Value := ParamsReport.Values['vdocno'];
  end;
end;

procedure TWebModule1.InvlocatGet(Request: TWebRequest; Response: TWebResponse);
var
  ja: TJSONArray;
  jo: TJSONObject;
  I: Integer;
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

procedure TWebModule1.QueryAllGet(Request: TWebRequest; Response: TWebResponse);
var
  ja: TJSONArray;
  jo: TJSONObject;
  I: Integer;
begin
  with QGet do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + Request.QueryFields.Values['table'] + ' ' + 'WHERE ' + Request.QueryFields.Values['field'] + ' LIKE:V1 ORDER BY ' + Request.QueryFields.Values['field']);
    ParamByName('V1').AsString := '%' + Request.QueryFields.Values['value'] + '%';
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
var
  ja: TJSONArray;
  jo: TJSONObject;
  I: Integer;
begin
  with QGet do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM ' + Request.QueryFields.Values['table'] + ' ' + 'WHERE ' + Request.QueryFields.Values['field'] + ' =:V1 ');
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
var
  ja: TJSONArray;
  jo: TJSONObject;
  I: Integer;
  frPath: string;
begin
  frPath := ExtractFilePath(paramstr(0));
  if Request.QueryFields.Count > 0 then
  begin
    ParamsReport := TStringList.Create;
    for I := 0 to Request.QueryFields.Count - 1 do
    begin
      ParamsReport.AddPair(Request.QueryFields.Names[I], Request.QueryFields.ValueFromIndex[I]);
    end;
  end;

//  if ParamsReport.Values['reportname'] = 'receiptdaily' then
//    frxReport1.LoadFromFile(frPath+ '\Form\rp_receiptdaily.fr3');
//  if ParamsReport.Values['reportname'] = 'fr_receivestk' then
  frxReport1.LoadFromFile(frPath + '\Form\' + ParamsReport.Values['reportname'] + '.fr3');

  ms := TMemoryStream.Create;
  frxReport1.PrepareReport();
  frxPDFExport1.Stream := ms;
  frxReport1.Export(frxPDFExport1);
  Response.SetCustomHeader('Content-Disposition', 'filename=setgroup.pdf');
  Response.ContentType := 'application/pdf';
  Response.ContentStream := ms;
end;

procedure TWebModule1.ServerFunctionInvokerHTMLTag(Sender: TObject; Tag: TTag; const TagString: string; TagParams: TStrings; var ReplaceText: string);
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
      ReplaceText := '<div><a href="' + string(Request.InternalScriptName) + '/ServerFunctionInvoker" target="_blank">Server Functions</a></div>'
    else
      ReplaceText := '';
end;

procedure TWebModule1.SqlTextGet(Request: TWebRequest; Response: TWebResponse);
var
  ja: TJSONArray;
  jo: TJSONObject;
  I: Integer;
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

procedure TWebModule1.DbconfigGet(Request: TWebRequest; Response: TWebResponse);
var
  ja: TJSONArray;
  jo: TJSONObject;
  I: Integer;
begin
  with QGet do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT 1 AS IDNO, ''R_RECVCR'' AS DOCCODE, ''เลขที่ใบรับสินค้ารถเข้าสต็อก'' AS DOCNAME, R_RECVCR AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 2 AS IDNO, ''R_RESV'' AS DOCCODE, ''เลขที่ใบจองสินค้ารถ'' AS DOCNAME, R_RESV AS RUNING  '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 3 AS IDNO, ''R_CASHNO'' AS DOCCODE, ''เลขที่ใบขายสินค้าเงินสด'' AS DOCNAME, R_CASHNO AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 4 AS IDNO, ''R_FINCNO'' AS DOCCODE, ''เลขที่ใบขายส่งไฟแนนท์'' AS DOCNAME, R_FINCNO AS RUNING  '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 5 AS IDNO, ''R_TMPBILL'' AS DOCCODE, ''เลขที่ใบรับเงิน'' AS DOCNAME, R_TMPBILL AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 6 AS IDNO, ''R_BILLNO'' AS DOCCODE, ''เลขที่ใบเสร็จ'' AS DOCNAME, R_BILLNO AS RUNING  '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 7 AS IDNO, ''R_TXCASH'' AS DOCCODE, ''เลขที่ใบกำกับภาษีขายเงินสด'' AS DOCNAME, R_TXCASH AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 8 AS IDNO, ''R_TXFINC'' AS DOCCODE, ''เลขที่ใบกำกับขายส่งไฟแนนท์'' AS DOCNAME, R_TXFINC AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 9 AS IDNO, ''R_TXOTHR'' AS DOCCODE, ''เลขที่ใบกำกับอื่น ๆ'' AS DOCNAME, R_TXOTHR AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 10 AS IDNO, ''R_TFCAR'' AS DOCCODE, ''เลขที่ใบโอนย้ายสินค้ารถ'' AS DOCNAME, R_TFCAR AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 11 AS IDNO, ''R_CUSCOD'' AS DOCCODE, ''รหัสลูกค้า'' AS DOCNAME, R_CUSCOD AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 12 AS IDNO, ''R_AROTH'' AS DOCCODE, ''เลขที่ลูกหนี้อื่น ๆ'' AS DOCNAME, R_AROTH AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 13 AS IDNO, ''R_AGENNO'' AS DOCCODE, ''เลขที่ขายส่งเอเยนต์'' AS DOCNAME, R_AGENNO AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 14 AS IDNO, ''R_RECVOP'' AS DOCCODE, ''เลขที่เอกสารรับอุปกรณ์เสิรม'' AS DOCNAME, R_RECVOP AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 15 AS IDNO, ''R_TCSALE'' AS DOCCODE, ''เลขที่เอกสารลดหนี้ภาษีขาย'' AS DOCNAME, R_TCSALE AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 16 AS IDNO, ''R_TFOPT'' AS DOCCODE, ''เลขที่เอกสารการโอนย้ายอุปกรณ์เสริม'' AS DOCNAME, R_TFOPT AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 17 AS IDNO, ''R_TXAGEN'' AS DOCCODE, ''เลขที่เอกสารภาษีขายส่งเอเยนต์'' AS DOCNAME, R_TXAGEN AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 18 AS IDNO, ''R_TXOPT'' AS DOCCODE, ''เลขที่เอกสารขายอุปกรณ์'' AS DOCNAME, R_TXOPT AS RUNING  '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 19 AS IDNO, ''R_TXRESV'' AS DOCCODE, ''เลขที่เอกสารจองสินค้า'' AS DOCNAME, R_TXRESV AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 20 AS IDNO, ''R_OPTCNO'' AS DOCCODE, ''เลขที่สัญญาการขายอุปกรณ์เสริม'' AS DOCNAME, R_OPTCNO AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 21 AS IDNO, ''R_MODMAST'' AS DOCCODE, ''เลขที่เอกสารชุดแต่ง'' AS DOCNAME, R_MODMAST AS RUNING  '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 22 AS IDNO, ''R_MCMAST'' AS DOCCODE, ''เลขที่เอกสาร Macth ชุดแต่ง'' AS DOCNAME, R_MCMAST AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 23 AS IDNO, ''R_PAYMENTTRANFER'' AS DOCCODE, ''เงินโอนไม่ทราบที่มา'' AS DOCNAME, R_PAYMENTTRANFER AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 24 AS IDNO, ''R_LOCATPARK'' AS DOCCODE, ''บันทึกสถานที่จอดรถ'' AS DOCNAME, R_LOCATPARK AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'UNION ALL '+
            'SELECT 25 AS IDNO, ''R_TOSALE'' AS DOCCODE, ''ใบลดหนี้ภาษีอื่นๆ'' AS DOCNAME, R_TOSALE AS RUNING '+
            'FROM DBCONFIG '+
            'WHERE LOCATCD = :XLOCAT '+
            'ORDER BY IDNO');
    ParamByName('XLOCAT').AsString := Request.QueryFields.Values['locat'];
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

procedure TWebModule1.DocconfigGet(Request: TWebRequest; Response: TWebResponse);
var
  ja: TJSONArray;
  jo: TJSONObject;
  I: Integer;
begin
  with QGet do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT 1 AS IDNO, ''H_RECVCR'' AS DOCCODE, ''หมวดเอกสารใบรับสินค้าเข้าสต็อก'' AS DOCNAME, COALESCE(H_RECVCR ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 2 AS IDNO, ''H_RESV'' AS DOCCODE, ''หมวดเอกสารใบรับจองสินค้า'' AS DOCNAME, COALESCE(H_RESV ,'''') AS HD  '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 3 AS IDNO, ''H_CASHNO'' AS DOCCODE, ''หมวดเอกสารขายสินค้าเป็นเงินสด'' AS DOCNAME, COALESCE(H_CASHNO ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 4 AS IDNO, ''H_FINCNO'' AS DOCCODE, ''หมวดเอกสารขายส่งไฟแนนท์'' AS DOCNAME, COALESCE(H_FINCNO ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 5 AS IDNO, ''H_AGENNO'' AS DOCCODE, ''หมวดเอกสารขายส่งเอเยนต์'' AS DOCNAME, COALESCE(H_AGENNO ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 6 AS IDNO, ''H_TMPBILL'' AS DOCCODE, ''หมวดเอกสารใบรับเงินจากลูกหนี้'' AS DOCNAME, COALESCE(H_TMPBILL ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 7 AS IDNO, ''H_TXRESV'' AS DOCCODE, ''หมวดเอกสารใบกำกับจองสินค้า'' AS DOCNAME, COALESCE(H_TXRESV ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 8 AS IDNO, ''H_TXCASH'' AS DOCCODE, ''หมวดเอกสารใบกำกับขายสินค้าเงินสด'' AS DOCNAME, COALESCE(H_TXCASH ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 9 AS IDNO, ''H_TXFINC'' AS DOCCODE, ''หมวดเอกสารใบกำกับขายส่งไฟแนนท์'' AS DOCNAME, COALESCE(H_TXFINC ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 10 AS IDNO, ''H_TXAGEN'' AS DOCCODE, ''หมวดเอกสารใบกำกับขายส่งเอเยนต์'' AS DOCNAME, COALESCE(H_TXAGEN ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 11 AS IDNO, ''H_TXOTHR'' AS DOCCODE, ''หมวดเอกสารใบกำกับหมวดทั่วไป'' AS DOCNAME, COALESCE(H_TXOTHR ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 12 AS IDNO, ''H_TCSALE'' AS DOCCODE, ''หมวดเอกสารใบลดหนี้ภาษีขายสินค้า'' AS DOCNAME, COALESCE(H_TCSALE ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 13 AS IDNO, ''H_TFCAR'' AS DOCCODE, ''หมวดเอกสารใบโอนย้ายสินค้า'' AS DOCNAME, COALESCE(H_TFCAR ,'''') AS HD  '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 14 AS IDNO, ''H_BILLCSH'' AS DOCCODE, ''หมวดเอกสารใบเสร็จรับเงินค่าขายสินค้าเงินสด'' AS DOCNAME, COALESCE(H_BILLCSH ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 15 AS IDNO, ''H_BILLAGEN'' AS DOCCODE, ''หมวดเอกสารใบเสร็จรับเงินค่าขายส่งเอเยนต์'' AS DOCNAME, COALESCE(H_BILLAGEN ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 16 AS IDNO, ''H_BILLRESV'' AS DOCCODE, ''หมวดเอกสารใบเสร็จรับเงินค่าจองสินค้า'' AS DOCNAME, COALESCE(H_BILLRESV ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 17 AS IDNO, ''H_BILLFINDWN'' AS DOCCODE, ''หมวดเอกสารใบเสร็จรับเงินค่าเงินดาวน์ไฟแนนท์'' AS DOCNAME, COALESCE(H_BILLFINDWN ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 18 AS IDNO, ''H_BILLFIN'' AS DOCCODE, ''หมวดเอกสารใบเสร็จรับเงินค่าขายสินค้าเงินสด'' AS DOCNAME, COALESCE(H_BILLFIN ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 19 AS IDNO, ''H_BILLINT'' AS DOCCODE, ''หมวดเอกสารใบเสร็จรับเงินค่าลูกหนี้อื่นๆ '' AS DOCNAME, COALESCE(H_BILLINT ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 20 AS IDNO, ''H_BILLTX'' AS DOCCODE, ''เอกสารใบเสร็จอื่นมีภาษี'' AS DOCNAME, COALESCE(H_BILLTX ,'''') AS HD  '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 21 AS IDNO, ''H_BILLFINF'' AS DOCCODE, ''เอกสารใบเสร็จขายไฟแนนท์'' AS DOCNAME, COALESCE(H_BILLFINF ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 22 AS IDNO, ''H_CUSCOD'' AS DOCCODE, ''รหัสนำหน้าประวัติลูกค้า'' AS DOCNAME, COALESCE(H_CUSCOD ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 23 AS IDNO, ''H_AROTH'' AS DOCCODE, ''หมวดเอกสารบันทึกลูกหนี้อื่น ๆ'' AS DOCNAME, COALESCE(H_AROTH ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 24 AS IDNO, ''H_RECVOP'' AS DOCCODE, ''เลขที่เอกสารรับอุปกรณ์เสริมเข้าสต๊อก'' AS DOCNAME, COALESCE(H_RECVOP ,'''') AS HD  '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 25 AS IDNO, ''H_TFOPT'' AS DOCCODE, ''เลขที่เอกสารโอนอุปกรณ์เสริม'' AS DOCNAME, COALESCE(H_TFOPT ,'''') AS HD  '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 26 AS IDNO, ''H_OPTCNO'' AS DOCCODE, ''เลขที่สัญญาการขายอุปกรณ์เสริม'' AS DOCNAME, COALESCE(H_OPTCNO ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 27 AS IDNO, ''H_TXOPT'' AS DOCCODE, ''เลขที่ใบกำกับอุปกรณ์เสริม'' AS DOCNAME, COALESCE(H_TXOPT ,'''') AS HD  '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 28 AS IDNO, ''H_MODMAST'' AS DOCCODE, ''เลขที่เอกสารชุดแต่ง'' AS DOCNAME, COALESCE(H_MODMAST ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 29 AS IDNO, ''H_MCMAST'' AS DOCCODE, ''เลขที่เอกสาร Macht ชุดแต่ง'' AS DOCNAME, COALESCE(H_MCMAST ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 30 AS IDNO, ''H_PAYMENTTRANFER'' AS DOCCODE, ''เงินโอนไม่ทราบที่มา'' AS DOCNAME, COALESCE(H_PAYMENTTRANFER ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 31 AS IDNO, ''H_LOCATPARK'' AS DOCCODE, ''บันทึกสถานที่จอดรถ'' AS DOCNAME, COALESCE(H_LOCATPARK ,'''') AS HD '+
            'FROM CONDPAY '+
            'UNION ALL '+
            'SELECT 32 AS IDNO, ''H_TOSALE'' AS DOCCODE, ''ใบลดหนี้ภาษีอื่นๆ'' AS DOCNAME, COALESCE(H_TOSALE ,'''') AS HD '+
            'FROM CONDPAY '+
            'ORDER BY IDNO');
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
var
  DBconfig: Tinifile;
begin
  DBconfig := Tinifile.create(ExtractFilePath(paramstr(0)) + '/config.ini');
  UniConnection1.Server := DBconfig.Readstring('DATABASE', 'SERVER', '');
  UniConnection1.Port := StrToInt(DBconfig.Readstring('DATABASE', 'PORT', ''));
  UniConnection1.Database := DBconfig.Readstring('DATABASE', 'DBNAME', '');
  UniConnection1.Username := DBconfig.Readstring('DATABASE', 'SCHEMA', '');
  XSchema := DBconfig.Readstring('DATABASE', 'SCHEMA', '');
end;

procedure TWebModule1.WebModuleDefaultAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if (Request.InternalPathInfo = '') or (Request.InternalPathInfo = '/') then
    Response.Content := login.Content
  else
    Response.SendRedirect(Request.InternalScriptName + '/');
end;

procedure TWebModule1.WebModule1cancelAcardAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  userid, flag, table, key, value, Return, field, HF, LF, LV, S, docno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Cancel ARCRED
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    field := RqObjectMaster.GetValue('field').Value;
    key := RqObjectMaster.GetValue('key').Value;
    userid := RqObjectMaster.GetValue('userid').Value;
    flag := RqObjectMaster.GetValue('flag').Value;

    with QPost do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + table + ' WHERE ' + field + ' =:V1 ');
      Params.ParamByName('V1').AsString := key;
      Open;
    end;

    QPost.Edit;
    QPost.FieldByName('FLAG').AsString := flag;
    QPost.FieldByName('CANUSERID').AsString := userid;
    QPost.FieldByName('CANDT').AsDateTime := now;
    docno := QPost.FieldByName('ACARDNO').AsString;

    with QPost2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ACARDTRAN WHERE ACARDNO =:V1 ');
      Params.ParamByName('V1').AsString := QPost.FieldByName('ACARDNO').AsString;
      Open;
    end;

    QPost2.Edit;
    QPost2.FieldByName('FLAG').AsString := flag;

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
      //Response Data
      Response.ContentType := 'application/json;charset=UTF-8';
      Response.Content := Return;
      raise;
    end;
    if QPost.Active then
      QPost.CommitUpdates;
    if QPost2.Active then
      QPost2.CommitUpdates;
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "cancel": ' + Return + ', "acardno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1cancelArcredAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  userid, flag, table, key, value, Return, field, HF, LF, LV, S, docno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Cancel ARCRED
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    field := RqObjectMaster.GetValue('field').Value;
    key := RqObjectMaster.GetValue('key').Value;
    userid := RqObjectMaster.GetValue('userid').Value;
    flag := RqObjectMaster.GetValue('flag').Value;

    with QPost do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + table + ' WHERE ' + field + ' =:V1 ');
      Params.ParamByName('V1').AsString := key;
      Open;
    end;

    QPost.Edit;
    QPost.FieldByName('FLAG').AsString := flag;
    QPost.FieldByName('USERDEL').AsString := userid;
    QPost.FieldByName('CANDT').AsDateTime := now;
    docno := QPost.FieldByName('CONTNO').AsString;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
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
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "cancel": ' + Return + ', "contno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1cancelArfincAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  userid, flag, table, key, value, Return, field, HF, LF, LV, S, docno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Cancel ARCRED
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    field := RqObjectMaster.GetValue('field').Value;
    key := RqObjectMaster.GetValue('key').Value;
    userid := RqObjectMaster.GetValue('userid').Value;
    flag := RqObjectMaster.GetValue('flag').Value;

    with QPost do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + table + ' WHERE ' + field + ' =:V1 ');
      Params.ParamByName('V1').AsString := key;
      Open;
    end;

    QPost.Edit;
    QPost.FieldByName('FLAG').AsString := flag;
    QPost.FieldByName('USERDEL').AsString := userid;
    QPost.FieldByName('CANDT').AsDateTime := now;
    docno := QPost.FieldByName('CONTNO').AsString;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
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
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "cancel": ' + Return + ', "contno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1cancelAr_invoiAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  userid, flag, table, key, value, Return, field, HF, LF, LV, S, docno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Cancel ARCRED
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    field := RqObjectMaster.GetValue('field').Value;
    key := RqObjectMaster.GetValue('key').Value;
    userid := RqObjectMaster.GetValue('userid').Value;
    flag := RqObjectMaster.GetValue('flag').Value;

    with QPost do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + table + ' WHERE ' + field + ' =:V1 ');
      Params.ParamByName('V1').AsString := key;
      Open;
    end;

    QPost.Edit;
    QPost.FieldByName('FLAG').AsString := flag;
    QPost.FieldByName('USERDEL').AsString := userid;
    QPost.FieldByName('CANDT').AsDateTime := now;
    docno := QPost.FieldByName('CONTNO').AsString;

    with QPost2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM AR_TRANS WHERE CONTNO =:V1 ');
      Params.ParamByName('V1').AsString := QPost.FieldByName('CONTNO').AsString;
      Open;
    end;
    if not QPost2.IsEmpty then
    begin
      QPost2.First;
      while not QPost2.Eof do
      begin
        QPost2.Edit;
        QPost2.FieldByName('FLAG').AsString := flag;
        QPost2.Next;
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
      //Response Data
      Response.ContentType := 'application/json;charset=UTF-8';
      Response.Content := Return;
      raise;
    end;
    if QPost.Active then
      QPost.CommitUpdates;
    if QPost2.Active then
      QPost2.CommitUpdates;
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "cancel": ' + Return + ', "contno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1cancelChqmasAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  userid, flag, table, key, value, Return, field, HF, LF, LV, S, docno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Cancel ARCRED
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    field := RqObjectMaster.GetValue('field').Value;
    key := RqObjectMaster.GetValue('key').Value;
    userid := RqObjectMaster.GetValue('userid').Value;
    flag := RqObjectMaster.GetValue('flag').Value;

    with QPost do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + table + ' WHERE ' + field + ' =:V1 ');
      Params.ParamByName('V1').AsString := key;
      Open;
    end;

    QPost.Edit;
    QPost.FieldByName('FLAG').AsString := flag;
    QPost.FieldByName('CANUSERID').AsString := userid;
    QPost.FieldByName('CANDT').AsDateTime := now;
    docno := QPost.FieldByName('TMBILL').AsString;

    with QPost2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM CHQTRAN WHERE CHQMASID =:V1 ');
      Params.ParamByName('V1').AsInteger := QPost.FieldByName('IDNO').AsInteger;
      Open;
    end;

    QPost2.Edit;
    QPost2.FieldByName('FLAG').AsString := flag;
    QPost2.FieldByName('CANUSERID').AsString := userid;
    QPost2.FieldByName('CANDT').AsDateTime := now;

    with QPost3 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM CHQTYPE WHERE CHQMASID =:V1 ');
      Params.ParamByName('V1').AsInteger := QPost.FieldByName('IDNO').AsInteger;
      Open;
    end;

    QPost3.Edit;
    QPost3.FieldByName('FLAG').AsString := flag;
    QPost3.FieldByName('CANUSERID').AsString := userid;
    QPost3.FieldByName('CANDT').AsDateTime := now;

    with QPost4 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM TAXTRAN WHERE TAXNO =:V1 ');
      Params.ParamByName('V1').AsString := QPost.FieldByName('TAXNO').AsString;
      Open;
    end;
    if not QPost4.IsEmpty then
    begin
      QPost4.Edit;
      QPost4.FieldByName('FLAG').AsString := flag;
      QPost4.FieldByName('CANDT').AsDateTime := now;
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
      if QPost2.Active then
        QPost2.ApplyUpdates;
      if QPost3.Active then
        QPost3.ApplyUpdates;
      if QPost4.Active then
        QPost4.ApplyUpdates;
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
    if QPost3.Active then
      QPost3.CommitUpdates;
    if QPost4.Active then
      QPost4.CommitUpdates;
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "cancel": ' + Return + ', "contno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1cancelCompAssetAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  userid, flag, table, key, value, Return, field, docno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Cancel ARCRED
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table  := RqObjectMaster.GetValue('table').Value;
    field  := RqObjectMaster.GetValue('field').Value;
    key    := RqObjectMaster.GetValue('key').Value;
    userid := RqObjectMaster.GetValue('userid').Value;
    flag   := RqObjectMaster.GetValue('flag').Value;

    with QPost do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + table + ' WHERE ' + field + ' =:V1 ');
      Params.ParamByName('V1').AsString := key;
      Open;
    end;

    QPost.Edit;
    QPost.FieldByName('FLAG').AsString := flag;
    QPost.FieldByName('USERDEL').AsString := userid;
    QPost.FieldByName('CANDT').AsDateTime := now;
    docno := QPost.FieldByName('CONTNO').AsString;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
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
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "cancel": ' + Return + ', "contno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1cancelMacthstrnoAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  userid, flag, table, key, value, Return, field, docno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Cancel ARCRED
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table  := RqObjectMaster.GetValue('table').Value;
    field  := RqObjectMaster.GetValue('field').Value;
    key    := RqObjectMaster.GetValue('key').Value;
    userid := RqObjectMaster.GetValue('userid').Value;
    flag   := RqObjectMaster.GetValue('flag').Value;

    with QPost do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM ' + table + ' WHERE ' + field + ' =:V1 ');
      Params.ParamByName('V1').AsString := key;
      Open;
    end;

    QPost.Edit;
    QPost.FieldByName('FLAG').AsString := flag;
    QPost.FieldByName('CANUSER').AsString := userid;
    QPost.FieldByName('CANDT').AsDateTime := now;
    docno := QPost.FieldByName('IDNO').AsString;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
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
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "cancel": ' + Return + ', "idno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1checkloginAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja: TJSONArray;
  jo: TJSONObject;
  I: Integer;
begin
  Handled := True;
  if Request.MethodType = mtGet then
  begin
    if Request.QueryFields.Count > 0 then
    begin
      GetValue := TStringList.Create;
      for I := 0 to Request.QueryFields.Count - 1 do
      begin
        GetValue.AddPair(Request.QueryFields.Names[I], Request.QueryFields.ValueFromIndex[I]);
      end;
    end;
    if (GetValue.Values['username1'] <> '') and (GetValue.Values['password1'] <> '') then
    begin
      with QGet do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT USERID, ENDCODE, ENDCODEPASS(''' + GetValue.Values['username1'] + ''', ''' + GetValue.Values['password1'] + ''') AS PASSWORD FROM PASSWRD WHERE USERID =:V1');
        ParamByName('V1').AsString := GetValue.Values['username1'];
        Open;
      end;
      if (not QGet.IsEmpty) and (QGet.FieldByName('ENDCODE').AsString = QGet.FieldByName('PASSWORD').AsString) then
      begin
        with QGet do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT ''TRUE'' AS LOGIN, USERID, CUSCOD, LOCATCD, DEPRT, LEVEL, SRHACTV, KEYDISC, BLOCK, ' + '       GROUP, EXPIRE, DESIGN, CHGLOC, CHGDATE, EDITGL, OVERYEAR, FLAGID, ' + '       BPRN, RPRN, CHGLOCAT, EDITPRN, EDITCUST, APPROVE, APPROVE_AMNT ' + 'FROM PASSWRD WHERE USERID =:V1');
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

procedure TWebModule1.WebModule1checkrightAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RequestObject: TJSONObject;
  userid, menucode: string;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    //Convert Content to JSON Array
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    RequestObject := LJsonArr.Items[0] as TJSONObject;
    userid := RequestObject.GetValue('userid').Value;
    menucode := RequestObject.GetValue('menucode').Value;
    with QGet do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT M_ACCESS, M_EDIT, M_INSERT, M_DELETE ' + 'FROM USERMENU WHERE USERID =:V1 AND MENUCODE =:V2 ');
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

procedure TWebModule1.WebModule1checkRundocAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RequestObject: TJSONObject;
  document, locat: string;
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
      SQL.Add('SELECT ' + document + ' AS RUNNING FROM DBCONFIG WHERE LOCATCD =:V1 ');
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

procedure TWebModule1.WebModule1deleteAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RequestObject: TJSONObject;
  table, field, key, Return: string;
  I: Integer;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    //Convert Content to JSON Array
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Loop Reading JSON Array
    Form1.Memo1.Lines.Clear;
    for I := 0 to LJsonArr.Count - 1 do
    begin
      RequestObject := LJsonArr.Items[I] as TJSONObject;
      table := RequestObject.GetValue('table').Value;
      field := RequestObject.GetValue('field').Value;
      key := RequestObject.GetValue('key').Value;

      with QPost do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ' + table + ' WHERE ' + field + ' =:V1 ');
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

procedure TWebModule1.WebModule1duplicateCheckAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet:
      DuplicateCheckGet(Request, Response);
  else
    begin
      Response.Content := Page404.Content;
    end;
  end;
end;

procedure TWebModule1.WebModule1duplicateStrnoAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet:
      DuplicateStrnoGet(Request, Response);
  else
    begin
      Response.Content := Page404.Content;
    end;
  end;
end;

procedure TWebModule1.WebModule1exportAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet:
      ExportGet(Request, Response);
  else
    begin
      Response.Content := Page404.Content;
    end;
  end;
end;

procedure TWebModule1.WebModule1getdataAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet:
      QueryOneGet(Request, Response);
  else
    begin
      Response.Content := Page404.Content;
    end;
  end;
end;

procedure TWebModule1.WebModule1getDbconfigAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet:
      DbconfigGet(Request, Response);
  else
    begin
      Response.Content := Page404.Content;
    end;
  end;
end;

procedure TWebModule1.WebModule1getDocconfigAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet:
      DocconfigGet(Request, Response);
  else
    begin
      Response.Content := Page404.Content;
    end;
  end;
end;

procedure TWebModule1.WebModule1invlocatAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet:
      InvlocatGet(Request, Response);
  else
    begin
      Response.Content := Page404.Content;
    end;
  end;
end;

procedure TWebModule1.WebModule1queryallAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet:
      QueryAllGet(Request, Response);
  else
    begin
      Response.Content := Page404.Content;
    end;
  end;
end;

procedure TWebModule1.WebModule1reportAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet:
      ReportGet(Request, Response);
  else
    begin
      Response.Content := Page404.Content;
    end;
  end;
end;

procedure TWebModule1.WebModule1saveAcardAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, HF, LF, LV, S, docno, apcode: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data ACARD
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    locat := RqObjectMaster.GetValue('locat').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key := RqObjectMaster.GetValue('key').Value;
    if table = 'ACARD' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;

      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM ACARD WHERE IDNO IS NULL ');
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('ACARDDT').AsDateTime := StrToDate(RqObjectTran.GetValue('ACARDDT').Value);
        QPost.FieldByName('ACARDNO').AsString   := RqObjectTran.GetValue('ACARDNO').Value;
        QPost.FieldByName('LOCAT').AsString     := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('CUSCOD').AsString    := RqObjectTran.GetValue('CUSCOD').Value;
        QPost.FieldByName('SALCOD').AsString    := RqObjectTran.GetValue('SALCOD').Value;
        QPost.FieldByName('CUSTTYP').AsString   := RqObjectTran.GetValue('CUSTTYP').Value;
        QPost.FieldByName('CARTYP').AsString    := RqObjectTran.GetValue('CARTYP').Value;
        QPost.FieldByName('CARDESC').AsString   := RqObjectTran.GetValue('CARDESC').Value;
        QPost.FieldByName('MODELCOD').AsString  := RqObjectTran.GetValue('MODELCOD').Value;
        QPost.FieldByName('COLORCOD').AsString  := RqObjectTran.GetValue('COLORCOD').Value;
        QPost.FieldByName('BAABCOD').AsString   := RqObjectTran.GetValue('BAABCOD').Value;
        QPost.FieldByName('MANUYR').AsFloat     := StrToFloat(RqObjectTran.GetValue('MANUYR').Value);
        QPost.FieldByName('CC').AsFloat         := StrToFloat(RqObjectTran.GetValue('CC').Value);
        QPost.FieldByName('MANUYR').AsFloat     := StrToFloat(RqObjectTran.GetValue('MANUYR').Value);
        QPost.FieldByName('CC').AsFloat         := StrToFloat(RqObjectTran.GetValue('CC').Value);
        QPost.FieldByName('PRICE').AsFloat      := StrToFloat(RqObjectTran.GetValue('PRICE').Value);
        QPost.FieldByName('DISCT').AsFloat      := StrToFloat(RqObjectTran.GetValue('DISCT').Value);
        QPost.FieldByName('SALTYP').AsString    := RqObjectTran.GetValue('SALTYP').Value;
        QPost.FieldByName('DAWN').AsFloat       := StrToFloat(RqObjectTran.GetValue('DAWN').Value);
        QPost.FieldByName('KEYINUPAY').AsFloat  := StrToFloat(RqObjectTran.GetValue('KEYINUPAY').Value);
        QPost.FieldByName('T_NOPAY').AsFloat    := StrToFloat(RqObjectTran.GetValue('T_NOPAY').Value);
        QPost.FieldByName('REGNO').AsString     := RqObjectTran.GetValue('REGNO').Value;
        QPost.FieldByName('INSURE3').AsString   := RqObjectTran.GetValue('INSURE3').Value;
        QPost.FieldByName('INSURE1').AsString   := RqObjectTran.GetValue('INSURE1').Value;
        QPost.FieldByName('INSURE3PRC').AsFloat := StrToFloat(RqObjectTran.GetValue('INSURE3PRC').Value);
        QPost.FieldByName('INSURE1PRC').AsFloat := StrToFloat(RqObjectTran.GetValue('INSURE1PRC').Value);
        QPost.FieldByName('SUMQTY').AsFloat     := StrToFloat(RqObjectTran.GetValue('SUMQTY').Value);
        QPost.FieldByName('SUMOPTPRC').AsFloat  := StrToFloat(RqObjectTran.GetValue('SUMOPTPRC').Value);
        QPost.FieldByName('MEMO1').AsString     := RqObjectTran.GetValue('MEMO1').Value;
        QPost.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        docno  := QPost.FieldByName('ACARDNO').AsString;
        docdt  := QPost.FieldByName('ACARDDT').AsDateTime;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM ACARD WHERE ACARDNO =:V1 ');
          Params.ParamByName('V1').AsString := key;
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('ACARDDT').AsDateTime := StrToDate(RqObjectTran.GetValue('ACARDDT').Value);
        QPost.FieldByName('ACARDNO').AsString   := RqObjectTran.GetValue('ACARDNO').Value;
        QPost.FieldByName('LOCAT').AsString     := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('CUSCOD').AsString    := RqObjectTran.GetValue('CUSCOD').Value;
        QPost.FieldByName('SALCOD').AsString    := RqObjectTran.GetValue('SALCOD').Value;
        QPost.FieldByName('CUSTTYP').AsString   := RqObjectTran.GetValue('CUSTTYP').Value;
        QPost.FieldByName('CARTYP').AsString    := RqObjectTran.GetValue('CARTYP').Value;
        QPost.FieldByName('CARDESC').AsString   := RqObjectTran.GetValue('CARDESC').Value;
        QPost.FieldByName('MODELCOD').AsString  := RqObjectTran.GetValue('MODELCOD').Value;
        QPost.FieldByName('COLORCOD').AsString  := RqObjectTran.GetValue('COLORCOD').Value;
        QPost.FieldByName('BAABCOD').AsString   := RqObjectTran.GetValue('BAABCOD').Value;
        QPost.FieldByName('MANUYR').AsFloat     := StrToFloat(RqObjectTran.GetValue('MANUYR').Value);
        QPost.FieldByName('CC').AsFloat         := StrToFloat(RqObjectTran.GetValue('CC').Value);
        QPost.FieldByName('MANUYR').AsFloat     := StrToFloat(RqObjectTran.GetValue('MANUYR').Value);
        QPost.FieldByName('CC').AsFloat         := StrToFloat(RqObjectTran.GetValue('CC').Value);
        QPost.FieldByName('PRICE').AsFloat      := StrToFloat(RqObjectTran.GetValue('PRICE').Value);
        QPost.FieldByName('DISCT').AsFloat      := StrToFloat(RqObjectTran.GetValue('DISCT').Value);
        QPost.FieldByName('SALTYP').AsString    := RqObjectTran.GetValue('SALTYP').Value;
        QPost.FieldByName('DAWN').AsFloat       := StrToFloat(RqObjectTran.GetValue('DAWN').Value);
        QPost.FieldByName('KEYINUPAY').AsFloat  := StrToFloat(RqObjectTran.GetValue('KEYINUPAY').Value);
        QPost.FieldByName('T_NOPAY').AsFloat    := StrToFloat(RqObjectTran.GetValue('T_NOPAY').Value);
        QPost.FieldByName('REGNO').AsString     := RqObjectTran.GetValue('REGNO').Value;
        QPost.FieldByName('INSURE3').AsString   := RqObjectTran.GetValue('INSURE3').Value;
        QPost.FieldByName('INSURE1').AsString   := RqObjectTran.GetValue('INSURE1').Value;
        QPost.FieldByName('INSURE3PRC').AsFloat := StrToFloat(RqObjectTran.GetValue('INSURE3PRC').Value);
        QPost.FieldByName('INSURE1PRC').AsFloat := StrToFloat(RqObjectTran.GetValue('INSURE1PRC').Value);
        QPost.FieldByName('SUMQTY').AsFloat     := StrToFloat(RqObjectTran.GetValue('SUMQTY').Value);
        QPost.FieldByName('SUMOPTPRC').AsFloat  := StrToFloat(RqObjectTran.GetValue('SUMOPTPRC').Value);
        QPost.FieldByName('MEMO1').AsString     := RqObjectTran.GetValue('MEMO1').Value;
        docno  := QPost.FieldByName('ACARDNO').AsString;
        docdt  := QPost.FieldByName('ACARDDT').AsDateTime;
      end;
    end;
    //Get Data ACARDTRAN
    RqObjectMaster := LJsonArr.Items[1] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    if table = 'ACARDTRAN' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      with QPost2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ACARDTRAN WHERE ACARDNO =:V1 ');
        Params.ParamValues['V1'] := key;
        Open;
      end;
      //Delete record in old data
      QPost2.First;
      while not QPost2.Eof do
      begin
        K := 0;
        for J := 0 to ja.Count - 1 do
        begin
          RqObjectTran := ja.Items[J] as TJSONObject;
          if StrToInt(RqObjectTran.GetValue('IDNO').Value) = QPost2.FieldByName('IDNO').AsInteger then
          begin
            K := K + 1;
            break;
          end;
        end;
        if K = 0 then
          QPost2.Delete
        else
          QPost2.Next;
      end;
      //Edit old data and Insert new data
      for I := 0 to ja.Count - 1 do
      begin
        RqObjectTran := ja.Items[I] as TJSONObject;
        if QPost2.Locate('IDNO', RqObjectTran.GetValue('IDNO').Value, [loPartialKey]) then
        begin
          QPost2.Edit;
        end
        else
        begin
          QPost2.Append;
        end;
        QPost2.FieldByName('ACARDNO').AsString   := docno;
        QPost2.FieldByName('ACARDDT').AsDateTime := docdt;
        QPost2.FieldByName('LOCAT').AsString     := RqObjectTran.GetValue('LOCAT').Value;
        QPost2.FieldByName('OPTCODE').AsString   := RqObjectTran.GetValue('OPTCODE').Value;
        QPost2.FieldByName('OPTNAME').AsString   := RqObjectTran.GetValue('OPTNAME').Value;
        QPost2.FieldByName('QTY').AsFloat        := StrToFloat(RqObjectTran.GetValue('QTY').Value);
        QPost2.FieldByName('FLSTAT').AsString    := RqObjectTran.GetValue('FLSTAT').Value;
        QPost2.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
        QPost2.FieldByName('INPUTDT').AsDateTime := Now;
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
    Response.Content := '[{ "save": ' + Return + ', "acardno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveAdjstkAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, HF, LF, LV, S, docno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data ADJSTK
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    locat := RqObjectMaster.GetValue('locat').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key := RqObjectMaster.GetValue('key').Value;
    if table = 'ADJSTK' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM ADJSTK WHERE IDNO IS NULL ');
          Open;
        end;
        HF := 'H_ARLET';
        LF := 'L_ARET';
        if not QDBConfig.Active then
        begin
          QDBConfig.ParamByName('LOCAT').AsString := locat;
          QDbconfig.Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('ADJDT').AsDateTime := StrToDate(RqObjectTran.GetValue('ADJDT').Value);
        if QDBConfig.Fieldbyname('R_ARLET').asstring = 'Y' then
        begin
          LV := locat;
          DV := QPost.FieldByName('ADJDT').AsDateTime;
          QPost.FieldByName('ADJNO').AsString := RunNo(HF, LF, LV, DV);
        end
        else
        begin
          QPost.FieldByName('ADJNO').AsString := RqObjectTran.GetValue('ADJNO').Value;
        end;
        QPost.FieldByName('LOCAT').AsString     := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('STRNO').AsString     := RqObjectTran.GetValue('STRNO').Value;
        QPost.FieldByName('NETCOST').AsFloat    := StrToFloat(RqObjectTran.GetValue('NETCOST').Value);
        QPost.FieldByName('CRVAT').AsFloat      := StrToFloat(RqObjectTran.GetValue('CRVAT').Value);
        QPost.FieldByName('TOTCOST').AsFloat    := StrToFloat(RqObjectTran.GetValue('TOTCOST').Value);
        QPost.FieldByName('STDPRC').AsFloat     := StrToFloat(RqObjectTran.GetValue('STDPRC').Value);
        QPost.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        QPost.FieldByName('APCODE').AsString    := RqObjectTran.GetValue('APCODE').Value;
        QPost.FieldByName('VATRT').AsFloat      := StrToFloat(RqObjectTran.GetValue('VATRT').Value);
        QPost.FieldByName('STAT').AsString      := RqObjectTran.GetValue('STAT').Value;
        docno := QPost.FieldByName('ADJNO').AsString;
        docdt := QPost.FieldByName('ADJDT').AsDateTime;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM ADJSTK WHERE ADJNO = :V1 ');
          Params.ParamByName('V1').AsString := key;
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('ADJDT').AsDateTime   := StrToDate(RqObjectTran.GetValue('ADJDT').Value);
        QPost.FieldByName('LOCAT').AsString     := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('STRNO').AsString     := RqObjectTran.GetValue('STRNO').Value;
        QPost.FieldByName('NETCOST').AsFloat    := StrToFloat(RqObjectTran.GetValue('NETCOST').Value);
        QPost.FieldByName('CRVAT').AsFloat      := StrToFloat(RqObjectTran.GetValue('CRVAT').Value);
        QPost.FieldByName('TOTCOST').AsFloat    := StrToFloat(RqObjectTran.GetValue('TOTCOST').Value);
        QPost.FieldByName('STDPRC').AsFloat     := StrToFloat(RqObjectTran.GetValue('STDPRC').Value);
        QPost.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('APCODE').AsString    := RqObjectTran.GetValue('APCODE').Value;
        QPost.FieldByName('VATRT').AsFloat      := StrToFloat(RqObjectTran.GetValue('VATRT').Value);
        QPost.FieldByName('STAT').AsString      := RqObjectTran.GetValue('STAT').Value;
        docno := QPost.FieldByName('ADJNO').AsString;
        docdt := QPost.FieldByName('ADJDT').AsDateTime;
      end;
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
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
    if QLastno.Active then
      QLastno.CommitUpdates;
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "save": ' + Return + ', "adjno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveAllAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, field, key, value, Return: string;
  I, J, K: integer;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin

    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    Form1.Memo1.Lines.Clear;
    for I := 0 to LJsonArr.Count - 1 do
    begin
      RqObjectMaster := LJsonArr.Items[I] as TJSONObject;
      table := RqObjectMaster.GetValue('table').Value;
      value := RqObjectMaster.GetValue('value').ToJSON;
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      if (I = 0) then
      begin
        status := RqObjectMaster.GetValue('status').Value;
        field := RqObjectMaster.GetValue('field').Value;
        key := RqObjectMaster.GetValue('key').Value;
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
            SQL.Add('SELECT * FROM ' + table + ' WHERE ' + QGet.FieldByName('NAME').AsString + ' IS NULL ');
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
            SQL.Add('SELECT * FROM ' + table + ' WHERE ' + field + ' =:V1 ');
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
          SQL.Add('SELECT * FROM ' + table + ' WHERE ' + field + ' =:V1 ');
          Params.ParamValues['V1'] := key;
          Open;
        end;
        //Delete record in old data
        QPost2.First;
        while not QPost2.Eof do
        begin
          K := 0;
          for J := 0 to ja.Count - 1 do
          begin
            RqObjectTran := ja.Items[J] as TJSONObject;
            if StrToInt(RqObjectTran.GetValue('IDNO').Value) = QPost2.FieldByName('IDNO').AsInteger then
            begin
              K := K + 1;
              break;
            end;
          end;
          if K = 0 then
            QPost2.Delete
          else
            QPost2.Next;
        end;
        //Edit old data and Insert new data
        for J := 0 to ja.Count - 1 do
        begin
          RqObjectTran := ja.Items[J] as TJSONObject;
          if QPost2.Locate('IDNO', RqObjectTran.GetValue('IDNO').Value, [loPartialKey]) then
          begin
            QPost2.Edit;
          end
          else
          begin
            QPost2.Append;
          end;
          for K := 0 to QPost2.FieldCount - 1 do
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

procedure TWebModule1.WebModule1saveArcredAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, HF, LF, LV, S, docno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data ARCRED
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    locat := RqObjectMaster.GetValue('locat').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key := RqObjectMaster.GetValue('key').Value;
    if table = 'ARCRED' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM ARCRED WHERE IDNO IS NULL ');
          Open;
        end;
        HF := 'H_CASHNO';
        LF := 'L_CASHNO';
        if not QDBConfig.Active then
        begin
          QDBConfig.ParamByName('LOCAT').AsString := locat;
          QDbconfig.Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('SDATE').AsDateTime := StrToDate(RqObjectTran.GetValue('SDATE').Value);
        if QDBConfig.Fieldbyname('R_CASHNO').asstring = 'Y' then
        begin
          LV := locat;
          DV := QPost.FieldByName('SDATE').AsDateTime;
          QPost.FieldByName('CONTNO').AsString := RunNo(HF, LF, LV, DV);
        end
        else
        begin
          QPost.FieldByName('CONTNO').AsString := RqObjectTran.GetValue('CONTNO').Value;
        end;
        QPost.FieldByName('LOCAT').AsString := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('RESVNO').AsString := RqObjectTran.GetValue('RESVNO').Value;
        QPost.FieldByName('CUSCOD').AsString := RqObjectTran.GetValue('CUSCOD').Value;
        QPost.FieldByName('STRNO').AsString := RqObjectTran.GetValue('STRNO').Value;
        QPost.FieldByName('VATRT').AsFloat := StrToFloat(RqObjectTran.GetValue('VATRT').Value);
        QPost.FieldByName('STDPRC').AsFloat := StrToFloat(RqObjectTran.GetValue('STDPRC').Value);
        QPost.FieldByName('DISCT').AsFloat := StrToFloat(RqObjectTran.GetValue('DISCT').Value);
        QPost.FieldByName('KEYINPRC').AsFloat := StrToFloat(RqObjectTran.GetValue('KEYINPRC').Value);
        if QPost.FieldByName('RESVNO').AsString <> '' then
        begin
          with Query1 do
          begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ARRESV WHERE RESVNO =:0 ');
            Params[0].AsString := QPost.FieldByName('RESVNO').AsString;
            Open;
          end;
          QPost.FieldByName('PAYRES').AsFloat := Query1.FieldByName('RESPAY').AsFloat;
        end;
        if QPost.FieldByName('STRNO').AsString <> '' then
        begin
          with Query1 do
          begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM STKCARD WHERE STRNO =:0 AND FLAG = ''D'' ');
            Params[0].AsString := QPost.FieldByName('STRNO').AsString;
            Open;
          end;
          QPost.FieldByName('REFNO').AsInteger := Query1.FieldByName('IDNO').AsInteger;
        end;
        QPost.FieldByName('CREDIT').AsFloat := StrToFloat(RqObjectTran.GetValue('CREDIT').Value);
        QPost.FieldByName('DUEDT').AsDateTime := StrToDate(RqObjectTran.GetValue('DUEDT').Value);
        QPost.FieldByName('SALCOD').AsString := RqObjectTran.GetValue('SALCOD').Value;
        QPost.FieldByName('ISSUENO').AsString := RqObjectTran.GetValue('ISSUENO').Value;
        QPost.FieldByName('ISSUDT').AsDateTime := StrToDate(RqObjectTran.GetValue('ISSUDT').Value);
        QPost.FieldByName('COMEXT').AsFloat := StrToFloat(RqObjectTran.GetValue('COMEXT').Value);
        QPost.FieldByName('COMINT').AsFloat := StrToFloat(RqObjectTran.GetValue('COMINT').Value);
        QPost.FieldByName('OTHPAY').AsFloat := StrToFloat(RqObjectTran.GetValue('OTHPAY').Value);
        HF := 'H_TXCASH';
        LF := 'L_TXCASH';
        LV := locat;
        DV := QPost.FieldByName('SDATE').AsDateTime;
        QPost.FieldByName('TAXNO').AsString := RunNo(HF, LF, LV, DV);
        QPost.FieldByName('TAXDT').AsDateTime := QPost.FieldByName('SDATE').AsDateTime;
        QPost.FieldByName('MEMO1').AsString := RqObjectTran.GetValue('MEMO1').Value;
        QPost.FieldByName('USERID').AsString := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        QPost.FieldByName('ACTICOD').AsString := RqObjectTran.GetValue('ACTICOD').Value;
        QPost.FieldByName('PAYTYP').AsString := RqObjectTran.GetValue('PAYTYP').Value;
        QPost.FieldByName('LOCSALE').AsString := RqObjectTran.GetValue('LOCSALE').Value;
        QPost.FieldByName('FLAG').AsString := 'A';
        docno := QPost.FieldByName('CONTNO').AsString;
        docdt := QPost.FieldByName('SDATE').AsDateTime;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM ARCRED WHERE CONTNO =:V1 ');
          Params.ParamByName('V1').AsString := key;
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('SDATE').AsDateTime := StrToDate(RqObjectTran.GetValue('SDATE').Value);
        QPost.FieldByName('LOCAT').AsString := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('RESVNO').AsString := RqObjectTran.GetValue('RESVNO').Value;
        QPost.FieldByName('CUSCOD').AsString := RqObjectTran.GetValue('CUSCOD').Value;
        QPost.FieldByName('STRNO').AsString := RqObjectTran.GetValue('STRNO').Value;
        QPost.FieldByName('VATRT').AsFloat := StrToFloat(RqObjectTran.GetValue('VATRT').Value);
        QPost.FieldByName('STDPRC').AsFloat := StrToFloat(RqObjectTran.GetValue('STDPRC').Value);
        QPost.FieldByName('DISCT').AsFloat := StrToFloat(RqObjectTran.GetValue('DISCT').Value);
        QPost.FieldByName('KEYINPRC').AsFloat := StrToFloat(RqObjectTran.GetValue('KEYINPRC').Value);
        if QPost.FieldByName('RESVNO').AsString <> '' then
        begin
          with Query1 do
          begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM ARRESV WHERE RESVNO =:0 ');
            Params[0].AsString := QPost.FieldByName('RESVNO').AsString;
            Open;
          end;
          QPost.FieldByName('PAYRES').AsFloat := Query1.FieldByName('RESPAY').AsFloat;
        end;
        QPost.FieldByName('CREDIT').AsFloat := StrToFloat(RqObjectTran.GetValue('CREDIT').Value);
        QPost.FieldByName('DUEDT').AsDateTime := StrToDate(RqObjectTran.GetValue('DUEDT').Value);
        QPost.FieldByName('SALCOD').AsString := RqObjectTran.GetValue('SALCOD').Value;
        QPost.FieldByName('ISSUENO').AsString := RqObjectTran.GetValue('ISSUENO').Value;
        QPost.FieldByName('ISSUDT').AsDateTime := StrToDate(RqObjectTran.GetValue('ISSUDT').Value);
        QPost.FieldByName('COMEXT').AsFloat := StrToFloat(RqObjectTran.GetValue('COMEXT').Value);
        QPost.FieldByName('COMINT').AsFloat := StrToFloat(RqObjectTran.GetValue('COMINT').Value);
        QPost.FieldByName('OTHPAY').AsFloat := StrToFloat(RqObjectTran.GetValue('OTHPAY').Value);
        QPost.FieldByName('MEMO1').AsString := RqObjectTran.GetValue('MEMO1').Value;
        QPost.FieldByName('USERID').AsString := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('ACTICOD').AsString := RqObjectTran.GetValue('ACTICOD').Value;
        QPost.FieldByName('PAYTYP').AsString := RqObjectTran.GetValue('PAYTYP').Value;
        QPost.FieldByName('LOCSALE').AsString := RqObjectTran.GetValue('LOCSALE').Value;
        QPost.FieldByName('FLAG').AsString := 'A';
        docno := QPost.FieldByName('CONTNO').AsString;
        docdt := QPost.FieldByName('SDATE').AsDateTime;
      end;
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
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
    if QLastno.Active then
      QLastno.CommitUpdates;
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "save": ' + Return + ', "contno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveArfincAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, docno, apcode, LV, HF, LF: string;
  I, J, K, ChqstatId: integer;
  docdt, DV: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data CHQSTAT
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    locat := RqObjectMaster.GetValue('locat').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key := RqObjectMaster.GetValue('key').Value;
    if table = 'ARFINC' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;

      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM ARFINC WHERE IDNO IS NULL ');
          Open;
        end;
        HF := 'H_FINCNO';
        LF := 'L_FINCNO';
        if not QDBConfig.Active then
        begin
          QDBConfig.ParamByName('LOCAT').AsString := locat;
          QDbconfig.Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('LOCAT').AsString   := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('SDATE').AsDateTime := StrToDate(RqObjectTran.GetValue('SDATE').Value);
        if QDBConfig.Fieldbyname('R_FINCNO').asstring = 'Y' then
        begin
          LV := locat;
          DV := QPost.FieldByName('SDATE').AsDateTime;
          QPost.FieldByName('CONTNO').AsString := RunNo(HF, LF, LV, DV);
        end
        else
        begin
          QPost.FieldByName('CONTNO').AsString := RqObjectTran.GetValue('CONTNO').Value;
        end;
        QPost.FieldByName('RESVNO').AsString   := RqObjectTran.GetValue('RESVNO').Value;
        QPost.FieldByName('CUSCOD').AsString   := RqObjectTran.GetValue('CUSCOD').Value;
        QPost.FieldByName('STRNO').AsString    := RqObjectTran.GetValue('STRNO').Value;
        QPost.FieldByName('VATRT').AsFloat     := StrToFloat(RqObjectTran.GetValue('VATRT').Value);
        QPost.FieldByName('ADDRNO').AsInteger  := StrToInt(RqObjectTran.GetValue('ADDRNO').Value);
        QPost.FieldByName('LOCSALE').AsString  := RqObjectTran.GetValue('LOCSALE').Value;
        QPost.FieldByName('FINCOD').AsString   := RqObjectTran.GetValue('FINCOD').Value;
        QPost.FieldByName('STDPRC').AsFloat    := StrToFloat(RqObjectTran.GetValue('STDPRC').Value);
        QPost.FieldByName('DISCT').AsFloat     := StrToFloat(RqObjectTran.GetValue('DISCT').Value);
        QPost.FieldByName('KEYINPRC').AsFloat  := StrToFloat(RqObjectTran.GetValue('KEYINPRC').Value);
        QPost.FieldByName('TKANG').AsFloat     := StrToFloat(RqObjectTran.GetValue('TKANG').Value);
        QPost.FieldByName('COMFIN').AsFloat    := StrToFloat(RqObjectTran.GetValue('COMFIN').Value);
        QPost.FieldByName('ISSUENO').AsString  := RqObjectTran.GetValue('ISSUENO').Value;
        QPost.FieldByName('ISSUDT').AsDateTime := StrToDate(RqObjectTran.GetValue('ISSUDT').Value);
        QPost.FieldByName('REFNO').AsInteger   := StrToInt(RqObjectTran.GetValue('REFNO').Value);
        HF := 'H_TXFINC';
        LF := 'L_TXFINC';
        LV := locat;
        DV := QPost.FieldByName('SDATE').AsDateTime;
        QPost.FieldByName('TAXNO').AsString     := RunNo(HF, LF, LV, DV);
        QPost.FieldByName('TAXDT').AsDateTime   := QPost.FieldByName('SDATE').AsDateTime;
        QPost.FieldByName('ACTICOD').AsString   := RqObjectTran.GetValue('ACTICOD').Value;
        QPost.FieldByName('PAYTYP').AsString    := RqObjectTran.GetValue('PAYTYP').Value;
        QPost.FieldByName('T_NOPAY').AsFloat    := StrToFloat(RqObjectTran.GetValue('T_NOPAY').Value);
        QPost.FieldByName('SALCOD').AsString    := RqObjectTran.GetValue('SALCOD').Value;
        QPost.FieldByName('KEYINUPAY').AsFloat  := StrToFloat(RqObjectTran.GetValue('KEYINUPAY').Value);
        QPost.FieldByName('FLAGTX').AsString    := RqObjectTran.GetValue('FLAGTX').Value;
        QPost.FieldByName('FDATE').AsDateTime   := StrToDate(RqObjectTran.GetValue('FDATE').Value);
        QPost.FieldByName('TPYSALE').AsString   := RqObjectTran.GetValue('TPYSALE').Value;
        QPost.FieldByName('EFRATE').AsFloat     := StrToFloat(RqObjectTran.GetValue('EFRATE').Value);
        QPost.FieldByName('MEMO1').AsString     := RqObjectTran.GetValue('MEMO1').Value;
        QPost.FieldByName('FLAG').AsString      := RqObjectTran.GetValue('FLAG').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        QPost.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
        docno     := QPost.FieldByName('CONTNO').AsString;
        ChqstatId := 0;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM ARFINC WHERE CONTNO =:V1 ');
          Params.ParamByName('V1').AsString := key;
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('RESVNO').AsString   := RqObjectTran.GetValue('RESVNO').Value;
        QPost.FieldByName('CUSCOD').AsString   := RqObjectTran.GetValue('CUSCOD').Value;
        QPost.FieldByName('STRNO').AsString    := RqObjectTran.GetValue('STRNO').Value;
        QPost.FieldByName('VATRT').AsFloat     := StrToFloat(RqObjectTran.GetValue('VATRT').Value);
        QPost.FieldByName('ADDRNO').AsInteger  := StrToInt(RqObjectTran.GetValue('ADDRNO').Value);
        QPost.FieldByName('LOCSALE').AsString  := RqObjectTran.GetValue('LOCSALE').Value;
        QPost.FieldByName('FINCOD').AsString   := RqObjectTran.GetValue('FINCOD').Value;
        QPost.FieldByName('STDPRC').AsFloat    := StrToFloat(RqObjectTran.GetValue('STDPRC').Value);
        QPost.FieldByName('DISCT').AsFloat     := StrToFloat(RqObjectTran.GetValue('DISCT').Value);
        QPost.FieldByName('KEYINPRC').AsFloat  := StrToFloat(RqObjectTran.GetValue('KEYINPRC').Value);
        QPost.FieldByName('TKANG').AsFloat     := StrToFloat(RqObjectTran.GetValue('TKANG').Value);
        QPost.FieldByName('COMFIN').AsFloat    := StrToFloat(RqObjectTran.GetValue('COMFIN').Value);
        QPost.FieldByName('ISSUENO').AsString  := RqObjectTran.GetValue('ISSUENO').Value;
        QPost.FieldByName('ISSUDT').AsDateTime := StrToDate(RqObjectTran.GetValue('ISSUDT').Value);
        QPost.FieldByName('REFNO').AsInteger   := StrToInt(RqObjectTran.GetValue('REFNO').Value);
        QPost.FieldByName('TAXDT').AsDateTime  := QPost.FieldByName('SDATE').AsDateTime;
        QPost.FieldByName('ACTICOD').AsString  := RqObjectTran.GetValue('ACTICOD').Value;
        QPost.FieldByName('PAYTYP').AsString   := RqObjectTran.GetValue('PAYTYP').Value;
        QPost.FieldByName('T_NOPAY').AsFloat   := StrToFloat(RqObjectTran.GetValue('T_NOPAY').Value);
        QPost.FieldByName('SALCOD').AsString   := RqObjectTran.GetValue('SALCOD').Value;
        QPost.FieldByName('KEYINUPAY').AsFloat := StrToFloat(RqObjectTran.GetValue('KEYINUPAY').Value);
        QPost.FieldByName('FLAGTX').AsString   := RqObjectTran.GetValue('FLAGTX').Value;
        QPost.FieldByName('FDATE').AsDateTime  := StrToDate(RqObjectTran.GetValue('FDATE').Value);
        QPost.FieldByName('TPYSALE').AsString  := RqObjectTran.GetValue('TPYSALE').Value;
        QPost.FieldByName('EFRATE').AsFloat    := StrToFloat(RqObjectTran.GetValue('EFRATE').Value);
        QPost.FieldByName('MEMO1').AsString    := RqObjectTran.GetValue('MEMO1').Value;
        docno     := QPost.FieldByName('CONTNO').AsString;
        ChqstatId := QPost.FieldByName('IDNO').AsInteger
      end;
    end;
    //Get Data ARMGAR
    RqObjectMaster := LJsonArr.Items[1] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    if table = 'ARMGAR' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      with QPost2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ARMGAR WHERE CONTID =:V1 ');
        Params.ParamValues['V1'] := ChqstatId;
        Open;
      end;
      //Delete record in old data
      QPost2.First;
      while not QPost2.Eof do
      begin
        K := 0;
        for J := 0 to ja.Count - 1 do
        begin
          RqObjectTran := ja.Items[J] as TJSONObject;
          if StrToInt(RqObjectTran.GetValue('IDNO').Value) = QPost2.FieldByName('IDNO').AsInteger then
          begin
            K := K + 1;
            break;
          end;
        end;
        if K = 0 then
          QPost2.Delete
        else
          QPost2.Next;
      end;
      //Edit old data and Insert new data
      for I := 0 to ja.Count - 1 do
      begin
        RqObjectTran := ja.Items[I] as TJSONObject;
        if QPost2.Locate('IDNO', RqObjectTran.GetValue('IDNO').Value, [loPartialKey]) then
        begin
          QPost2.Edit;
        end
        else
        begin
          QPost2.Append;
        end;
        QPost2.FieldByName('CONTID').AsInteger  := ChqstatId;
        QPost2.FieldByName('CUSCOD').AsString   := RqObjectTran.GetValue('CUSCOD').Value;
        QPost2.FieldByName('RELATION').AsString := RqObjectTran.GetValue('RELATION').Value;
        QPost2.FieldByName('GARNO').AsInteger   := StrToInt(RqObjectTran.GetValue('GARNO').Value);
        QPost2.FieldByName('TSALE').AsString    := RqObjectTran.GetValue('TSALE').Value;
      end;
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
      with Query1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ARFINC WHERE CONTNO =:V1 ');
        Params.ParamByName('V1').AsString := docno;
        Open;
      end;
      ChqstatId := Query1.FieldByName('IDNO').AsInteger;
      QPost2.First;
      while not QPost2.Eof  do
      begin
        QPost2.Edit;
        QPost2.FieldByName('CONTID').AsInteger := ChqstatId;
        QPost2.Next;
      end;
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
    Response.Content := '[{ "save": ' + Return + ', "contno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveAr_invoiAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, docno, apcode, LV, HF, LF: string;
  I, J, K, ChqstatId: integer;
  vatrt : Double;
  docdt, DV: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data AR_INVOI
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    locat := RqObjectMaster.GetValue('locat').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key := RqObjectMaster.GetValue('key').Value;
    if table = 'AR_INVOI' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;

      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM AR_INVOI WHERE IDNO IS NULL ');
          Open;
        end;
        HF := 'H_AGENNO';
        LF := 'L_AGENNO';
        if not QDBConfig.Active then
        begin
          QDBConfig.ParamByName('LOCAT').AsString := locat;
          QDbconfig.Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('LOCAT').AsString   := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('SDATE').AsDateTime := StrToDate(RqObjectTran.GetValue('SDATE').Value);
        if QDBConfig.Fieldbyname('R_AGENNO').asstring = 'Y' then
        begin
          LV := locat;
          DV := QPost.FieldByName('SDATE').AsDateTime;
          QPost.FieldByName('CONTNO').AsString := RunNo(HF, LF, LV, DV);
        end
        else
        begin
          QPost.FieldByName('CONTNO').AsString := RqObjectTran.GetValue('CONTNO').Value;
        end;
        QPost.FieldByName('VATRT').AsFloat      := StrToFloat(RqObjectTran.GetValue('VATRT').Value);
        QPost.FieldByName('ADDRNO').AsInteger   := StrToInt(RqObjectTran.GetValue('ADDRNO').Value);
        QPost.FieldByName('CUSCOD').AsString    := RqObjectTran.GetValue('CUSCOD').Value;
        QPost.FieldByName('CREDTM').AsFloat     := StrToFloat(RqObjectTran.GetValue('CREDTM').Value);
        QPost.FieldByName('DUEDATE').AsDateTime := StrToDate(RqObjectTran.GetValue('DUEDATE').Value);
        QPost.FieldByName('SALCOD').AsString    := RqObjectTran.GetValue('SALCOD').Value;
        QPost.FieldByName('ISSUNO').AsString    := RqObjectTran.GetValue('ISSUNO').Value;
        QPost.FieldByName('ISSUDT').AsDateTime  := StrToDate(RqObjectTran.GetValue('ISSUDT').Value);
        QPost.FieldByName('LPAYD').AsDateTime   := StrToDate(RqObjectTran.GetValue('LPAYD').Value);
        QPost.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        QPost.FieldByName('PAYTYP').AsString    := RqObjectTran.GetValue('PAYTYP').Value;
        QPost.FieldByName('ACTICOD').AsString   := RqObjectTran.GetValue('ACTICOD').Value;
        QPost.FieldByName('TSALE').AsString     := 'A';
        QPost.FieldByName('CREDAMT').AsFloat    := StrToFloat(RqObjectTran.GetValue('CREDAMT').Value);
        QPost.FieldByName('KEYINPRC').AsFloat   := StrToFloat(RqObjectTran.GetValue('KEYINPRC').Value);
        QPost.FieldByName('NPRICE').AsFloat     := StrToFloat(RqObjectTran.GetValue('NPRICE').Value);
        QPost.FieldByName('VATPRC').AsFloat     := StrToFloat(RqObjectTran.GetValue('VATPRC').Value);
        QPost.FieldByName('TOTPRC').AsFloat     := StrToFloat(RqObjectTran.GetValue('TOTPRC').Value);
        QPost.FieldByName('NETPRC').AsFloat     := StrToFloat(RqObjectTran.GetValue('NETPRC').Value);
        QPost.FieldByName('NETVAT').AsFloat     := StrToFloat(RqObjectTran.GetValue('NETVAT').Value);
        QPost.FieldByName('FLAG').AsString      := RqObjectTran.GetValue('FLAG').Value;
        HF := 'H_TXAGEN';
        LF := 'L_TXAGEN';
        LV := locat;
        DV := QPost.FieldByName('SDATE').AsDateTime;
        QPost.FieldByName('TAXNO').AsString     := RunNo(HF, LF, LV, DV);
        QPost.FieldByName('TAXDT').AsDateTime   := QPost.FieldByName('SDATE').AsDateTime;
        QPost.FieldByName('MEMO1').AsString     := RqObjectTran.GetValue('MEMO1').Value;
        QPost.FieldByName('LOCSALE').AsString   := RqObjectTran.GetValue('LOCSALE').Value;
        docno     := QPost.FieldByName('CONTNO').AsString;
        docdt     := QPost.FieldByName('SDATE').AsDateTime;
        ChqstatId := 0;
        vatrt     := QPost.FieldByName('VATRT').AsFloat;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM AR_INVOI WHERE CONTNO =:V1 ');
          Params.ParamByName('V1').AsString := key;
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('VATRT').AsFloat      := StrToFloat(RqObjectTran.GetValue('VATRT').Value);
        QPost.FieldByName('ADDRNO').AsInteger   := StrToInt(RqObjectTran.GetValue('ADDRNO').Value);
        QPost.FieldByName('CUSCOD').AsString    := RqObjectTran.GetValue('CUSCOD').Value;
        QPost.FieldByName('CREDTM').AsFloat     := StrToFloat(RqObjectTran.GetValue('CREDTM').Value);
        QPost.FieldByName('DUEDATE').AsDateTime := StrToDate(RqObjectTran.GetValue('DUEDATE').Value);
        QPost.FieldByName('SALCOD').AsString    := RqObjectTran.GetValue('SALCOD').Value;
        QPost.FieldByName('ISSUNO').AsString    := RqObjectTran.GetValue('ISSUNO').Value;
        QPost.FieldByName('ISSUDT').AsDateTime  := StrToDate(RqObjectTran.GetValue('ISSUDT').Value);
        QPost.FieldByName('LPAYD').AsDateTime   := StrToDate(RqObjectTran.GetValue('LPAYD').Value);
        QPost.FieldByName('PAYTYP').AsString    := RqObjectTran.GetValue('PAYTYP').Value;
        QPost.FieldByName('ACTICOD').AsString   := RqObjectTran.GetValue('ACTICOD').Value;
        QPost.FieldByName('TSALE').AsString     := 'A';
        QPost.FieldByName('CREDAMT').AsFloat    := StrToFloat(RqObjectTran.GetValue('CREDAMT').Value);
        QPost.FieldByName('KEYINPRC').AsFloat   := StrToFloat(RqObjectTran.GetValue('KEYINPRC').Value);
        QPost.FieldByName('NPRICE').AsFloat     := StrToFloat(RqObjectTran.GetValue('NPRICE').Value);
        QPost.FieldByName('VATPRC').AsFloat     := StrToFloat(RqObjectTran.GetValue('VATPRC').Value);
        QPost.FieldByName('TOTPRC').AsFloat     := StrToFloat(RqObjectTran.GetValue('TOTPRC').Value);
        QPost.FieldByName('NETPRC').AsFloat     := StrToFloat(RqObjectTran.GetValue('NETPRC').Value);
        QPost.FieldByName('NETVAT').AsFloat     := StrToFloat(RqObjectTran.GetValue('NETVAT').Value);
        QPost.FieldByName('FLAG').AsString      := RqObjectTran.GetValue('FLAG').Value;
        QPost.FieldByName('TAXDT').AsDateTime   := QPost.FieldByName('SDATE').AsDateTime;
        QPost.FieldByName('MEMO1').AsString     := RqObjectTran.GetValue('MEMO1').Value;
        QPost.FieldByName('LOCSALE').AsString   := RqObjectTran.GetValue('LOCSALE').Value;
        docno     := QPost.FieldByName('CONTNO').AsString;
        docdt     := QPost.FieldByName('SDATE').AsDateTime;
        ChqstatId := QPost.FieldByName('IDNO').AsInteger;
        vatrt     := QPost.FieldByName('VATRT').AsFloat;
      end;
    end;
    //Get Data AR_TRANS
    RqObjectMaster := LJsonArr.Items[1] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    if table = 'AR_TRANS' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      with QPost2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM AR_TRANS WHERE CONTID =:V1 ');
        Params.ParamValues['V1'] := ChqstatId;
        Open;
      end;
      //Delete record in old data
      QPost2.First;
      while not QPost2.Eof do
      begin
        K := 0;
        for J := 0 to ja.Count - 1 do
        begin
          RqObjectTran := ja.Items[J] as TJSONObject;
          if StrToInt(RqObjectTran.GetValue('IDNO').Value) = QPost2.FieldByName('IDNO').AsInteger then
          begin
            K := K + 1;
            break;
          end;
        end;
        if K = 0 then
          QPost2.Delete
        else
          QPost2.Next;
      end;
      //Edit old data and Insert new data
      for I := 0 to ja.Count - 1 do
      begin
        RqObjectTran := ja.Items[I] as TJSONObject;
        if QPost2.Locate('IDNO', RqObjectTran.GetValue('IDNO').Value, [loPartialKey]) then
        begin
          QPost2.Edit;
        end
        else
        begin
          QPost2.Append;
        end;
        QPost2.FieldByName('CONTID').AsInteger  := ChqstatId;
        QPost2.FieldByName('CONTNO').AsString   := docno;
        QPost2.FieldByName('STRNO').AsString    := RqObjectTran.GetValue('STRNO').Value;
        QPost2.FieldByName('LOCAT').AsString    := locat;
        QPost2.FieldByName('VATRT').AsFloat     := vatrt;
        QPost2.FieldByName('SDATE').AsDateTime  := docdt;
        QPost2.FieldByName('STDPRC').AsFloat    := StrToFloat(RqObjectTran.GetValue('STDPRC').Value);
        QPost2.FieldByName('KEYIN').AsFloat     := StrToFloat(RqObjectTran.GetValue('KEYIN').Value);
        QPost2.FieldByName('NKEYIN').AsFloat    := StrToFloat(RqObjectTran.GetValue('NKEYIN').Value);
        QPost2.FieldByName('VKEYIN').AsFloat    := StrToFloat(RqObjectTran.GetValue('VKEYIN').Value);
        QPost2.FieldByName('TOTPRC').AsFloat    := StrToFloat(RqObjectTran.GetValue('TOTPRC').Value);
        QPost2.FieldByName('NETPRC').AsFloat    := StrToFloat(RqObjectTran.GetValue('NETPRC').Value);
        QPost2.FieldByName('NETVAT').AsFloat    := StrToFloat(RqObjectTran.GetValue('NETVAT').Value);
        QPost2.FieldByName('CRDAMT').AsFloat    := StrToFloat(RqObjectTran.GetValue('CRDAMT').Value);
        QPost2.FieldByName('CRDNO').AsString    := RqObjectTran.GetValue('CRDNO').Value;
        QPost2.FieldByName('FLAG').AsString     := RqObjectTran.GetValue('FLAG').Value;
        QPost2.FieldByName('REFNO').AsInteger   := StrToInt(RqObjectTran.GetValue('REFNO').Value);
        QPost2.FieldByName('LOCSALE').AsString  := RqObjectTran.GetValue('LOCSALE').Value;
      end;
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
      with Query1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM AR_INVOI WHERE CONTNO =:V1 ');
        Params.ParamByName('V1').AsString := docno;
        Open;
      end;
      ChqstatId := Query1.FieldByName('IDNO').AsInteger;
      QPost2.First;
      while not QPost2.Eof  do
      begin
        QPost2.Edit;
        QPost2.FieldByName('CONTID').AsInteger := ChqstatId;
        QPost2.Next;
      end;
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
    Response.Content := '[{ "save": ' + Return + ', "contno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveChqanotherAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, HF, LF, LV, S, docno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data CHQANOTHER
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    locat := RqObjectMaster.GetValue('locat').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key := RqObjectMaster.GetValue('key').Value;
    if table = 'CHQANOTHER' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM CHQANOTHER WHERE IDNO IS NULL ');
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('CUSCOD').AsString     := RqObjectTran.GetValue('CUSCOD').Value;
        QPost.FieldByName('OFFCOD').AsString     := RqObjectTran.GetValue('OFFCOD').Value;
        QPost.FieldByName('PAYCODE').AsString    := RqObjectTran.GetValue('PAYCODE').Value;
        QPost.FieldByName('FORCODE').AsString    := RqObjectTran.GetValue('FORCODE').Value;
        QPost.FieldByName('TMBILL').AsString     := RqObjectTran.GetValue('TMBILL').Value;
        QPost.FieldByName('LOCAT').AsString      := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('TMBILDT').AsDateTime  := StrToDate(RqObjectTran.GetValue('TMBILDT').Value);
        QPost.FieldByName('CHQNO').AsString      := RqObjectTran.GetValue('CHQNO').Value;
        QPost.FieldByName('CHQBANK').AsString    := RqObjectTran.GetValue('CHQBANK').Value;
        QPost.FieldByName('CHQLOCAT').AsString   := RqObjectTran.GetValue('CHQLOCAT').Value;
        QPost.FieldByName('PAYAMT').AsFloat      := StrToFloat(RqObjectTran.GetValue('PAYAMT').Value);
        QPost.FieldByName('FLAG').AsString       := RqObjectTran.GetValue('FLAG').Value;
        QPost.FieldByName('USERID').AsString     := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime  := Now;
        QPost.FieldByName('MEMO1').AsString      := RqObjectTran.GetValue('MEMO1').Value;
        docno := QPost.FieldByName('TMBILL').AsString;
        docdt := QPost.FieldByName('TMBILDT').AsDateTime;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM CHQANOTHER WHERE TMBILL = :V1 ');
          Params.ParamByName('V1').AsString := key;
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('FLAG').AsString        := RqObjectTran.GetValue('FLAG').Value;
        if RqObjectTran.GetValue('FLAG').Value = 'C' then
        begin
          QPost.FieldByName('CANDT').AsDateTime   := Now;
          QPost.FieldByName('CANUSERID').AsString := RqObjectTran.GetValue('USERID').Value;
        end
        else
        begin
          QPost.FieldByName('CUSCOD').AsString     := RqObjectTran.GetValue('CUSCOD').Value;
          QPost.FieldByName('OFFCOD').AsString     := RqObjectTran.GetValue('OFFCOD').Value;
          QPost.FieldByName('PAYCODE').AsString    := RqObjectTran.GetValue('PAYCODE').Value;
          QPost.FieldByName('FORCODE').AsString    := RqObjectTran.GetValue('FORCODE').Value;
          QPost.FieldByName('LOCAT').AsString      := RqObjectTran.GetValue('LOCAT').Value;
          QPost.FieldByName('TMBILDT').AsDateTime  := StrToDate(RqObjectTran.GetValue('TMBILDT').Value);
          QPost.FieldByName('CHQNO').AsString      := RqObjectTran.GetValue('CHQNO').Value;
          QPost.FieldByName('CHQBANK').AsString    := RqObjectTran.GetValue('CHQBANK').Value;
          QPost.FieldByName('CHQLOCAT').AsString   := RqObjectTran.GetValue('CHQLOCAT').Value;
          QPost.FieldByName('PAYAMT').AsFloat      := StrToFloat(RqObjectTran.GetValue('PAYAMT').Value);
          QPost.FieldByName('MEMO1').AsString      := RqObjectTran.GetValue('MEMO1').Value;
        end;
        docno := QPost.FieldByName('TMBILL').AsString;
        docdt := QPost.FieldByName('TMBILDT').AsDateTime;
      end;
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
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
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "save": ' + Return + ', "tmbill": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveChqmasAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, docno, apcode, HF, LF, LV,
  THF, TLF, Taxfl, Cuscode, Locatpay, Taxdesc : string;
  I, J, K, Contid, Chqmasid: integer;
  docdt, DV: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data CHQMAS
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    locat := RqObjectMaster.GetValue('locat').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key := RqObjectMaster.GetValue('key').Value;
    if table = 'CHQMAS' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;

      with QPost do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM CHQMAS WHERE IDNO IS NULL ');
        Open;
      end;
      if not QDBConfig.Active then
      begin
        QDBConfig.ParamByName('LOCAT').AsString := locat;
        QDbconfig.Open;
      end;
      RqObjectTran := ja.Items[0] as TJSONObject;
      //TAXFL
      with Query1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM PAYFOR WHERE FORCODE =:0 ');
        Params[0].AsString := RqObjectTran.GetValue('PAYFOR').Value;
        Open;
      end;
      Taxfl   := Query1.FieldByName('TAXFL').AsString;
      Taxdesc := Query1.FieldByName('FORDESC').AsString;
      //CUSCOD and CONTID
      if RqObjectTran.GetValue('TSALE').Value = 'T' then
      begin
        with Query1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT IDNO, CUSCOD FROM CUSTMAST WHERE CUSCOD =:0 ');
          Params[0].AsString := RqObjectTran.GetValue('CONTNO').Value;
          Open;
        end;
        Cuscode  := Query1.FieldByName('CUSCOD').AsString;
        Contid   := Query1.FieldByName('IDNO').AsInteger;
        Locatpay := locat;
      end
      else if (RqObjectTran.GetValue('TSALE').Value = 'X') then
      begin
        with Query1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT IDNO, CUSCOD, LOCAT FROM AROTHSALE WHERE ARCONT =:0 ');
          Params[0].AsString := RqObjectTran.GetValue('CONTNO').Value;
          Open;
        end;
        Cuscode  := Query1.FieldByName('CUSCOD').AsString;
        Contid   := Query1.FieldByName('IDNO').AsInteger;
        Locatpay := Query1.FieldByName('LOCAT').AsString;
      end
      else if (RqObjectTran.GetValue('TSALE').Value = 'R') then
      begin
        with Query1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT IDNO, CUSCOD, LOCAT FROM ARRESV WHERE RESVNO =:0 ');
          Params[0].AsString := RqObjectTran.GetValue('CONTNO').Value;
          Open;
        end;
        Cuscode  := Query1.FieldByName('CUSCOD').AsString;
        Contid   := Query1.FieldByName('IDNO').AsInteger;
        Locatpay := Query1.FieldByName('LOCAT').AsString;
      end
      else
      begin
        with Query1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT IDNO, CUSCOD, LOCAT  FROM VWSALE WHERE CONTNO =:0 ');
          Params[0].AsString := RqObjectTran.GetValue('CONTNO').Value;
          Open;
        end;
        Cuscode  := Query1.FieldByName('CUSCOD').AsString;
        Contid   := Query1.FieldByName('IDNO').AsInteger;
        Locatpay := Query1.FieldByName('LOCAT').AsString;
      end;
      //Convert data to record
      QPost.Append;
      QPost.FieldByName('TMBILDT').AsDateTime := StrToDate(RqObjectTran.GetValue('TMBILDT').Value);
      //Running TMBILL and BILLNO
      if QDBConfig.Fieldbyname('R_TMPBILL').asstring = 'Y' then
      begin
        HF := 'H_TMPBILL';
        LF := 'L_TMPBILL';
        LV := locat;
        DV := QPost.FieldByName('TMBILDT').AsDateTime;
        QPost.FieldByName('TMBILL').AsString := RunNo(HF, LF, LV, DV);
      end
      else
      begin
        QPost.FieldByName('TMBILL').AsString := RqObjectTran.GetValue('TMBILL').Value;
      end;
      if QDBConfig.Fieldbyname('R_BILLNO').asstring = 'Y' then
      begin
        if RqObjectTran.GetValue('PAYFOR').Value = '001' then
        begin
          THF := 'H_BILLCSH';
          TLF := 'L_BILLCSH';
        end
        else if RqObjectTran.GetValue('PAYFOR').Value = '002' then
        begin
          THF := 'H_BILLDAWN';
          TLF := 'L_BILLDAWN';
        end
        else if RqObjectTran.GetValue('PAYFOR').Value = '003' then
        begin
          THF := 'H_BILLFINDWN';
          TLF := 'L_BILLFIN';
        end
        else if RqObjectTran.GetValue('PAYFOR').Value = '004' then
        begin
          THF := 'H_BILLFIN';
          TLF := 'L_BILLFINF';
        end
        else if (RqObjectTran.GetValue('PAYFOR').Value = '006') or
                (RqObjectTran.GetValue('PAYFOR').Value = '007') then
        begin
          THF := 'H_BILLPAY';
          TLF := 'L_BILLPAY';
        end
        else if RqObjectTran.GetValue('PAYFOR').Value = '008' then
        begin
          THF := 'H_BILLRESV';
          TLF := 'L_BILLRESV';
        end
        else if RqObjectTran.GetValue('PAYFOR').Value = '009' then
        begin
          THF := 'H_BILLAGEN';
          TLF := 'L_BILLAGEN';
        end
        else if RqObjectTran.GetValue('PAYFOR').Value = '901' then
        begin
          THF := 'H_BILLOTH';
          TLF := 'L_BILLOTH';
        end
        else if ((copy(RqObjectTran.GetValue('PAYFOR').Value, 1, 1) <> '0') or
                 (copy(RqObjectTran.GetValue('PAYFOR').Value, 1, 1) <> '9') or
                 (RqObjectTran.GetValue('PAYFOR').Value = '011') or
                 (RqObjectTran.GetValue('PAYFOR').Value = '017')) and
                 (Taxfl = 'Y') then
        begin
          THF := 'H_BILLTX';
          TLF := 'L_BILLTX';
        end
        else
        begin
          THF := 'H_BILLINT';
          TLF := 'L_BILLINT';
        end;
        LV := locat;
        DV := QPost.FieldByName('TMBILDT').AsDateTime;
        QPost.FieldByName('BILLNO').AsString := RunNo(THF, TLF, LV, DV);
      end
      else
      begin
        QPost.FieldByName('BILLNO').AsString := RqObjectTran.GetValue('BILLNO').Value;
      end;
      QPost.FieldByName('VATRT').AsFloat      := StrToFloat(RqObjectTran.GetValue('VATRT').Value);
      QPost.FieldByName('LOCATRECV').AsString := RqObjectTran.GetValue('LOCATRECV').Value;
      QPost.FieldByName('CUSCOD').AsString    := Cuscode;
      QPost.FieldByName('CONTNO').AsString    := RqObjectTran.GetValue('CONTNO').Value;
      QPost.FieldByName('TSALE').AsString     := RqObjectTran.GetValue('TSALE').Value;
      QPost.FieldByName('TPAYAMT').AsFloat    := StrToFloat(RqObjectTran.GetValue('TPAYAMT').Value);
      QPost.FieldByName('TPAYAMT_V').AsFloat  := FRound((QPost.FieldByName('TPAYAMT').AsFloat*QPost.FieldByName('VATRT').AsFloat)/(100+QPost.FieldByName('VATRT').AsFloat),2);
      QPost.FieldByName('TPAYAMT_N').AsFloat  := QPost.FieldByName('TPAYAMT').AsFloat-QPost.FieldByName('TPAYAMT_V').AsFloat;
      QPost.FieldByName('TAXFL').AsString     := Taxfl;
      if ((Taxfl = 'Y') and
         ((Copy(RqObjectTran.GetValue('PAYFOR').Value,1,1)<>'0' ) or
         (RqObjectTran.GetValue('PAYFOR').Value = '007') or
         (RqObjectTran.GetValue('PAYFOR').Value = '003') or
         (RqObjectTran.GetValue('PAYFOR').Value = '011') or
         (RqObjectTran.GetValue('PAYFOR').Value = '017') or
         (RqObjectTran.GetValue('PAYFOR').Value = '015'))) then
      begin
        with QPost4 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM TAXTRAN WHERE IDNO IS NULL ');
          Open;
        end;
        QPost4.Insert;
        QPost4.Fieldbyname('LOCAT').Asstring   := Locatpay;
        QPost4.fieldbyname('TAXDT').asdatetime := Now;
        if (RqObjectTran.GetValue('PAYFOR').Value = '011') or
           (RqObjectTran.GetValue('PAYFOR').Value = '017') or
           (RqObjectTran.GetValue('PAYFOR').Value = '015') or
           (RqObjectTran.GetValue('PAYFOR').Value = '003') then
        begin
          QPost4.Fieldbyname('Tsale').Asstring  := 'F';
          QPost4.Fieldbyname('Taxtyp').Asstring := 'O';
          QPost4.Fieldbyname('Vatrt').Asfloat   := QPost.Fieldbyname('Vatrt').Asfloat;
        end
        else
        begin
          QPost4.Fieldbyname('Tsale').Asstring  := 'O';
          QPost4.Fieldbyname('Taxtyp').Asstring := 'O';
          QPost4.Fieldbyname('Vatrt').Asfloat   := QPost.Fieldbyname('Vatrt').Asfloat;
        end;
        if ((Copy(RqObjectTran.GetValue('PAYFOR').Value, 1, 1) <> '0') or
            (RqObjectTran.GetValue('PAYFOR').Value = '015') or
            (RqObjectTran.GetValue('PAYFOR').Value = '003')) and
            (RqObjectTran.GetValue('PAYFOR').Value <> '200') and
            (RqObjectTran.GetValue('PAYFOR').Value <> '011') and
            (RqObjectTran.GetValue('PAYFOR').Value <> '017') then
        begin
          HF := 'H_TXOTHR';
          LF := 'L_TXOTHR';
        end
        else if (RqObjectTran.GetValue('PAYFOR').Value = '007') then
        begin
          HF := 'H_TXPAY';
          LF := 'L_TXPAY';
        end
        else if (RqObjectTran.GetValue('PAYFOR').Value = '200') then
        begin
          HF := 'H_TXV';
          LF := 'L_TXV';
        end
        else if (RqObjectTran.GetValue('PAYFOR').Value = '011') or
                (RqObjectTran.GetValue('PAYFOR').Value = '017') then
        begin
          HF := 'H_TXE';
          LF := 'L_TXE';
        end;
        LV := QPost4.Fieldbyname('LOCAT').Asstring;
        DV := QPost4.FieldByName('TAXDT').AsDateTime;
        QPost4.FieldByName('TAXNO').AsString     := RunNo(HF, LF, LV, DV);
        QPost.FieldByName('TAXNO').AsString      := QPost4.FieldByName('TAXNO').AsString;
        QPost4.Fieldbyname('TMBILLID').AsInteger := 0;
        QPost4.Fieldbyname('Contno').AsString    := QPost.Fieldbyname('Contno').AsString;
        QPost4.Fieldbyname('Cuscod').AsString    := QPost.Fieldbyname('Cuscod').AsString;
        QPost4.Fieldbyname('Descp').Asstring     := Taxdesc;
        QPost4.Fieldbyname('Totamt').Asfloat     := QPost.FieldByName('TPAYAMT').AsFloat;
        QPost4.Fieldbyname('Vatamt').Asfloat     := QPost.FieldByName('TPAYAMT_V').AsFloat;
        QPost4.Fieldbyname('Netamt').Asfloat     := QPost.FieldByName('TPAYAMT_N').AsFloat;
        QPost4.Fieldbyname('TAXFLG').Asstring    := 'N';
        QPost4.Fieldbyname('InPutDt').AsDateTime := Now;
        QPost4.Fieldbyname('USERID').Asstring    := RqObjectTran.GetValue('USERID').Value;
      end;
      QPost.FieldByName('MEMO1').AsString     := RqObjectTran.GetValue('MEMO1').Value;
      QPost.FieldByName('INPUTDT').AsDateTime := Now;
      QPost.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
      docno := QPost.FieldByName('TMBILL').AsString;
    end;
    QPost.First;
    //Get Data CHQTRAN
    RqObjectMaster := LJsonArr.Items[1] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    if table = 'CHQTRAN' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      with QPost2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM CHQTRAN WHERE IDNO IS NULL ');
        Open;
      end;

      //Edit old data and Insert new data
      for I := 0 to ja.Count - 1 do
      begin
        RqObjectTran := ja.Items[I] as TJSONObject;
        QPost2.Append;
        QPost2.FieldByName('LOCATRECV').AsString := RqObjectTran.GetValue('LOCATRECV').Value;
        QPost2.FieldByName('TMBILDT').AsDateTime := StrToDate(RqObjectTran.GetValue('TMBILDT').Value);
        QPost2.FieldByName('CHQMASID').AsInteger := 0;
        QPost2.FieldByName('CONTID').AsInteger   := Contid;
        QPost2.FieldByName('CONTNO').AsString    := QPost.FieldByName('CONTNO').AsString;
        If RqObjectTran.GetValue('PAYFOR').Value = '001' Then QPost2.FieldByName('TSALE').Asstring := 'C' Else
        If RqObjectTran.GetValue('PAYFOR').Value = '002' Then QPost2.FieldByName('TSALE').Asstring := 'H' Else
        If RqObjectTran.GetValue('PAYFOR').Value = '003' Then QPost2.FieldByName('TSALE').Asstring := 'F' Else
        If RqObjectTran.GetValue('PAYFOR').Value = '004' Then QPost2.FieldByName('TSALE').Asstring := 'F' Else
        If RqObjectTran.GetValue('PAYFOR').Value = '005' Then QPost2.FieldByName('TSALE').Asstring := 'O' Else
        If RqObjectTran.GetValue('PAYFOR').Value = '901' Then QPost2.FieldByName('TSALE').Asstring := 'H' Else
        If RqObjectTran.GetValue('PAYFOR').Value = '006' Then QPost2.FieldByName('TSALE').Asstring := 'H' Else
        If RqObjectTran.GetValue('PAYFOR').Value = '007' Then QPost2.FieldByName('TSALE').Asstring := 'H' Else
        If RqObjectTran.GetValue('PAYFOR').Value = '012' Then QPost2.FieldByName('TSALE').Asstring := 'H' Else
        If RqObjectTran.GetValue('PAYFOR').Value = '013' Then QPost2.FieldByName('TSALE').Asstring := 'H' Else
        If RqObjectTran.GetValue('PAYFOR').Value = '008' Then QPost2.FieldByName('TSALE').Asstring := 'R' Else
        If RqObjectTran.GetValue('PAYFOR').Value = '009' Then QPost2.FieldByName('TSALE').Asstring := 'A' Else
        If RqObjectTran.GetValue('PAYFOR').Value = '015' Then QPost2.FieldByName('TSALE').Asstring := 'F' Else
        If RqObjectTran.GetValue('PAYFOR').Value = '011' Then QPost2.FieldByName('TSALE').Asstring := 'F' Else
        If RqObjectTran.GetValue('PAYFOR').Value = '017' Then QPost2.FieldByName('TSALE').Asstring := 'F' Else
        begin
          QPost2.FieldByName('TSALE').AsString := QPost.FieldByName('TSALE').AsString;
        end;
        QPost2.FieldByName('PAYFOR').AsString    := RqObjectTran.GetValue('PAYFOR').Value;
        QPost2.FieldByName('VATRT').AsFloat      := QPost.FieldByName('VATRT').AsFloat;
        QPost2.FieldByName('PAYAMT').AsFloat     := StrToFloat(RqObjectTran.GetValue('PAYAMT').Value);
        QPost2.FieldByName('DISCT').AsFloat      := StrToFloat(RqObjectTran.GetValue('DISCT').Value);
        QPost2.FieldByName('NETPAY').AsFloat     := StrToFloat(RqObjectTran.GetValue('NETPAY').Value);
        QPost2.FieldByName('LOCATPAY').AsString  := Locatpay;
        QPost2.FieldByName('TAXNO').AsString     := QPost.FieldByName('TAXNO').AsString;
        QPost2.FieldByName('TAXFL').AsString     := Taxfl;
        QPost2.FieldByName('INPUTDT').AsDateTime := Now;
        QPost2.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
      end;
    end;
    //Get Data CHQTYPE
    RqObjectMaster := LJsonArr.Items[2] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    if table = 'CHQTYPE' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      with QPost3 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM CHQTYPE WHERE IDNO IS NULL ');
        Open;
      end;
      //Edit old data and Insert new data
      for I := 0 to ja.Count - 1 do
      begin
        RqObjectTran := ja.Items[I] as TJSONObject;
        QPost3.Append;
        QPost3.FieldByName('CHQMASID').AsInteger := 0;
        QPost3.FieldByName('PAYCODE').AsString   := RqObjectTran.GetValue('PAYCODE').Value;
        QPost3.FieldByName('REFNO').AsString     := RqObjectTran.GetValue('REFNO').Value;
        QPost3.FieldByName('AMOUNT').AsFloat     := StrToFloat(RqObjectTran.GetValue('AMOUNT').Value);
        QPost3.FieldByName('INPUTDT').AsDateTime := Now;
        QPost3.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
      end;
    end;
    QPost3.First;
    QPost.Edit;
    QPost.FieldByName('PAYTYP').AsString := QPost3.FieldByName('PAYCODE').AsString;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
      with Query1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM CHQMAS WHERE TMBILL =:V1 ');
        Params.ParamByName('V1').AsString := docno;
        Open;
      end;
      Chqmasid := Query1.FieldByName('IDNO').AsInteger;
      QPost2.First;
      while not QPost2.Eof  do
      begin
        QPost2.Edit;
        QPost2.FieldByName('CHQMASID').AsInteger := Chqmasid;
        QPost2.Next;
      end;
      QPost3.First;
      while not QPost3.Eof  do
      begin
        QPost3.Edit;
        QPost3.FieldByName('CHQMASID').AsInteger := Chqmasid;
        QPost3.Next;
      end;
      if QPost4.Active then
      begin
        QPost4.First;
        while not QPost4.Eof  do
        begin
          QPost4.Edit;
          QPost4.FieldByName('TMBILLID').AsInteger := Chqmasid;
          QPost4.Next;
        end;
      end;
      if QPost2.Active then
        QPost2.ApplyUpdates;
      if QPost3.Active then
        QPost3.ApplyUpdates;
      if QPost4.Active then
        QPost4.ApplyUpdates;
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
    if QPost3.Active then
      QPost3.CommitUpdates;
    if QPost4.Active then
      QPost4.CommitUpdates;
    if QLastno.Active then
      QLastno.CommitUpdates;
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "save": ' + Return + ', "tmbill": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveChqpassAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  table, value, Return, docno: string;
  J : Integer;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data CHQSTATTRAN
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    docno := '';
    if table = 'CHQSTAT' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      for J := 0 to ja.Count - 1 do
      begin
        RqObjectTran := ja.Items[J] as TJSONObject;
        if RqObjectTran.GetValue('CHQSTAT').Value = 'B' then
        begin
          with Query1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('UPDATE CHQSTAT SET CHQSTAT = :V1, BOOK = '''', FREE = 0, CHQSTATDT = null WHERE CHQNO = :V2 ');
            Params.ParamByName('V1').AsString := RqObjectTran.GetValue('CHQSTAT').Value;
            Params.ParamByName('V2').AsString := RqObjectTran.GetValue('CHQNO').Value;
            ExecSQL;
          end;
        end
        else
        begin
          with Query1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('UPDATE CHQSTAT SET CHQSTAT = :V1, BOOK = :V2, FREE = :V3, CHQSTATDT = :V4 WHERE CHQNO = :V5 ');
            Params.ParamByName('V1').AsString   := RqObjectTran.GetValue('CHQSTAT').Value;
            Params.ParamByName('V2').AsString   := RqObjectTran.GetValue('BOOK').Value;
            Params.ParamByName('V3').AsFloat    := StrToFloat(RqObjectTran.GetValue('FREE').Value);
            Params.ParamByName('V4').AsDateTime := StrToDate(RqObjectTran.GetValue('CHQSTATDT').Value);
            Params.ParamByName('V5').AsString   := RqObjectTran.GetValue('CHQNO').Value;
            ExecSQL;
          end;
        end;
      end;
    end;

    Return := 'true';
    //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "save": ' + Return + ', "rvchqno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveChqpayinAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  table, value, Return, docno: string;
  J : Integer;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data CHQSTATTRAN
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    docno := '';
    if table = 'CHQSTAT' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      for J := 0 to ja.Count - 1 do
      begin
        RqObjectTran := ja.Items[J] as TJSONObject;
        with Query1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE CHQSTAT SET CHQSTAT = :V1 WHERE CHQNO = :V2 ');
          Params.ParamByName('V1').AsString := RqObjectTran.GetValue('CHQSTAT').Value;
          Params.ParamByName('V2').AsString := RqObjectTran.GetValue('CHQNO').Value;
          ExecSQL;
        end;
      end;
    end;

    Return := 'true';
    //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "save": ' + Return + ', "rvchqno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveChqreturnAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  table, value, Return, docno: string;
  J : Integer;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data CHQSTATTRAN
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    docno := '';
    if table = 'CHQSTAT' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      for J := 0 to ja.Count - 1 do
      begin
        RqObjectTran := ja.Items[J] as TJSONObject;
        if RqObjectTran.GetValue('CHQSTAT').Value = 'B' then
        begin
          with Query1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('UPDATE CHQSTAT SET CHQSTAT = :V1, CHQSTATDT = null WHERE CHQNO = :V2 ');
            Params.ParamByName('V1').AsString := RqObjectTran.GetValue('CHQSTAT').Value;
            Params.ParamByName('V2').AsString := RqObjectTran.GetValue('CHQNO').Value;
            ExecSQL;
          end;
        end
        else
        begin
          with Query1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('UPDATE CHQSTAT SET CHQSTAT = :V1, CHQSTATDT = :V2 WHERE CHQNO = :V3 ');
            Params.ParamByName('V1').AsString   := RqObjectTran.GetValue('CHQSTAT').Value;
            Params.ParamByName('V2').AsDateTime := StrToDate(RqObjectTran.GetValue('CHQSTATDT').Value);
            Params.ParamByName('V3').AsString   := RqObjectTran.GetValue('CHQNO').Value;
            ExecSQL;
          end;
        end;
      end;
    end;

    Return := 'true';
    //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "save": ' + Return + ', "rvchqno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveChqstatAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, docno, apcode, LV, HF, LF: string;
  I, J, K, ChqstatId: integer;
  docdt, DV: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data CHQSTAT
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    locat := RqObjectMaster.GetValue('locat').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key := RqObjectMaster.GetValue('key').Value;
    if table = 'CHQSTAT' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;

      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM CHQSTAT WHERE IDNO IS NULL ');
          Open;
        end;
        HF := 'H_RVCHQ';
        LF := 'L_RVCHQ';
        if not QDBConfig.Active then
        begin
          QDBConfig.ParamByName('LOCAT').AsString := locat;
          QDbconfig.Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('LOCAT').AsString     := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('RVCHQDT').AsDateTime := StrToDate(RqObjectTran.GetValue('RVCHQDT').Value);
        if QDBConfig.Fieldbyname('R_ASSNO').asstring = 'Y' then
        begin
          LV := locat;
          DV := QPost.FieldByName('RVCHQDT').AsDateTime;
          QPost.FieldByName('RVCHQNO').AsString := RunNo(HF, LF, LV, DV);
        end
        else
        begin
          QPost.FieldByName('RVCHQNO').AsString := RqObjectTran.GetValue('RVCHQNO').Value;
        end;
        QPost.FieldByName('CUSCOD').AsString    := RqObjectTran.GetValue('CUSCOD').Value;
        QPost.FieldByName('CHQNO').AsString     := RqObjectTran.GetValue('CHQNO').Value;
        QPost.FieldByName('CHQDT').AsDateTime   := StrToDate(RqObjectTran.GetValue('CHQDT').Value);
        QPost.FieldByName('CHQDESC').AsString   := RqObjectTran.GetValue('CHQDESC').Value;
        QPost.FieldByName('CHQBK').AsString     := RqObjectTran.GetValue('CHQBK').Value;
        QPost.FieldByName('CHQAMT').AsFloat     := StrToFloat(RqObjectTran.GetValue('CHQAMT').Value);
        QPost.FieldByName('CHQSTAT').AsString   := RqObjectTran.GetValue('CHQSTAT').Value;
        QPost.FieldByName('RVCHQ').AsString     := RqObjectTran.GetValue('RVCHQ').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        QPost.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
        docno     := QPost.FieldByName('RVCHQNO').AsString;
        ChqstatId := 0;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM CHQSTAT WHERE RVCHQNO =:V1 ');
          Params.ParamByName('V1').AsString := key;
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('LOCAT').AsString     := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('RVCHQDT').AsDateTime := StrToDate(RqObjectTran.GetValue('RVCHQDT').Value);
        QPost.FieldByName('CUSCOD').AsString    := RqObjectTran.GetValue('CUSCOD').Value;
        QPost.FieldByName('CHQNO').AsString     := RqObjectTran.GetValue('CHQNO').Value;
        QPost.FieldByName('CHQDT').AsDateTime   := StrToDate(RqObjectTran.GetValue('CHQDT').Value);
        QPost.FieldByName('CHQDESC').AsString   := RqObjectTran.GetValue('CHQDESC').Value;
        QPost.FieldByName('CHQBK').AsString     := RqObjectTran.GetValue('CHQBK').Value;
        QPost.FieldByName('CHQAMT').AsFloat     := StrToFloat(RqObjectTran.GetValue('CHQAMT').Value);
        QPost.FieldByName('CHQSTAT').AsString   := RqObjectTran.GetValue('CHQSTAT').Value;
        QPost.FieldByName('RVCHQ').AsString     := RqObjectTran.GetValue('RVCHQ').Value;
        docno     := QPost.FieldByName('RVCHQNO').AsString;
        ChqstatId := QPost.FieldByName('IDNO').AsInteger
      end;
    end;
    //Get Data CHQSTATTRAN
    RqObjectMaster := LJsonArr.Items[1] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    if table = 'CHQSTATTRAN' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      with QPost2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM CHQSTATTRAN WHERE CHQSTATID =:V1 ');
        Params.ParamValues['V1'] := ChqstatId;
        Open;
      end;
      //Delete record in old data
      QPost2.First;
      while not QPost2.Eof do
      begin
        K := 0;
        for J := 0 to ja.Count - 1 do
        begin
          RqObjectTran := ja.Items[J] as TJSONObject;
          if StrToInt(RqObjectTran.GetValue('IDNO').Value) = QPost2.FieldByName('IDNO').AsInteger then
          begin
            K := K + 1;
            break;
          end;
        end;
        if K = 0 then
          QPost2.Delete
        else
          QPost2.Next;
      end;
      //Edit old data and Insert new data
      for I := 0 to ja.Count - 1 do
      begin
        RqObjectTran := ja.Items[I] as TJSONObject;
        if QPost2.Locate('IDNO', RqObjectTran.GetValue('IDNO').Value, [loPartialKey]) then
        begin
          QPost2.Edit;
        end
        else
        begin
          QPost2.Append;
        end;
        QPost2.FieldByName('CHQSTATID').AsInteger := ChqstatId;
        QPost2.FieldByName('CHQNO').AsString      := RqObjectTran.GetValue('CHQNO').Value;
        QPost2.FieldByName('CHQDT').AsDateTime    := StrToDate(RqObjectTran.GetValue('CHQDT').Value);
        QPost2.FieldByName('TSALE').AsString      := RqObjectTran.GetValue('TSALE').Value;
        QPost2.FieldByName('CONTNO').AsString     := RqObjectTran.GetValue('CONTNO').Value;
        if QPost2.FieldByName('TSALE').AsString = 'A' then
        begin
          with Query1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT IDNO FROM AR_INVOI WHERE CONTNO = :V1 ');
            Params.ParamByName('V1').AsString := QPost2.FieldByName('CONTNO').AsString ;
            Open;
          end;
          QPost2.FieldByName('CONTID').AsInteger := Query1.FieldByName('IDNO').AsInteger;
        end
        else if QPost2.FieldByName('TSALE').AsString = 'C' then
        begin
          with Query1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT IDNO FROM ARCRED WHERE CONTNO = :V1 ');
            Params.ParamByName('V1').AsString := QPost2.FieldByName('CONTNO').AsString ;
            Open;
          end;
          QPost2.FieldByName('CONTID').AsInteger := Query1.FieldByName('IDNO').AsInteger;
        end
        else if QPost2.FieldByName('TSALE').AsString = 'F' then
        begin
          with Query1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT IDNO FROM ARFINC WHERE CONTNO = :V1 ');
            Params.ParamByName('V1').AsString := QPost2.FieldByName('CONTNO').AsString ;
            Open;
          end;
          QPost2.FieldByName('CONTID').AsInteger := Query1.FieldByName('IDNO').AsInteger;
        end
        else if QPost2.FieldByName('TSALE').AsString = 'R' then
        begin
          with Query1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT IDNO FROM ARRESV WHERE RESVNO = :V1 ');
            Params.ParamByName('V1').AsString := QPost2.FieldByName('CONTNO').AsString ;
            Open;
          end;
          QPost2.FieldByName('CONTID').AsInteger := Query1.FieldByName('IDNO').AsInteger;
        end
        else if QPost2.FieldByName('TSALE').AsString = 'T' then
        begin
          with Query1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT IDNO FROM CUSTMAST WHERE CUSCOD = :V1 ');
            Params.ParamByName('V1').AsString := QPost2.FieldByName('CONTNO').AsString ;
            Open;
          end;
          QPost2.FieldByName('CONTID').AsInteger := Query1.FieldByName('IDNO').AsInteger;
        end
        else if QPost2.FieldByName('TSALE').AsString = 'X' then
        begin
          with Query1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT IDNO FROM AROTHSALE WHERE ARCONT = :V1 ');
            Params.ParamByName('V1').AsString := QPost2.FieldByName('CONTNO').AsString ;
            Open;
          end;
          QPost2.FieldByName('CONTID').AsInteger := Query1.FieldByName('IDNO').AsInteger;
        end;
        QPost2.FieldByName('CHQPAYAMT').AsFloat := StrToFloat(RqObjectTran.GetValue('CHQPAYAMT').Value);
      end;
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
      with Query1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM CHQSTAT WHERE RVCHQNO =:V1 ');
        Params.ParamByName('V1').AsString := docno;
        Open;
      end;
      ChqstatId := Query1.FieldByName('IDNO').AsInteger;
      QPost2.First;
      while not QPost2.Eof  do
      begin
        QPost2.Edit;
        QPost2.FieldByName('CHQSTATID').AsInteger := ChqstatId;
        QPost2.Next;
      end;
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
    Response.Content := '[{ "save": ' + Return + ', "rvchqno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveCompAssetAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, HF, LF, LV, S, docno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data ARCRED
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table  := RqObjectMaster.GetValue('table').Value;
    locat  := RqObjectMaster.GetValue('locat').Value;
    value  := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key    := RqObjectMaster.GetValue('key').Value;
    if table = 'COMP_ASSET' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM COMP_ASSET WHERE IDNO IS NULL ');
          Open;
        end;
        HF := 'H_ASSNO';
        LF := 'L_ASSNO';
        if not QDBConfig.Active then
        begin
          QDBConfig.ParamByName('LOCAT').AsString := locat;
          QDbconfig.Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('SDATE').AsDateTime := StrToDate(RqObjectTran.GetValue('SDATE').Value);
        if QDBConfig.Fieldbyname('R_ASSNO').asstring = 'Y' then
        begin
          LV := locat;
          DV := QPost.FieldByName('SDATE').AsDateTime;
          QPost.FieldByName('CONTNO').AsString := RunNo(HF, LF, LV, DV);
        end
        else
        begin
          QPost.FieldByName('CONTNO').AsString := RqObjectTran.GetValue('CONTNO').Value;
        end;
        QPost.FieldByName('LOCAT').AsString   := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('CUSCOD').AsString  := RqObjectTran.GetValue('CUSCOD').Value;
        QPost.FieldByName('STRNO').AsString   := RqObjectTran.GetValue('STRNO').Value;
        QPost.FieldByName('VATRT').AsFloat    := StrToFloat(RqObjectTran.GetValue('VATRT').Value);
        QPost.FieldByName('STDPRC').AsFloat   := StrToFloat(RqObjectTran.GetValue('STDPRC').Value);
        QPost.FieldByName('DISCT').AsFloat    := StrToFloat(RqObjectTran.GetValue('DISCT').Value);
        QPost.FieldByName('KEYINPRC').AsFloat := StrToFloat(RqObjectTran.GetValue('KEYINPRC').Value);
        QPost.FieldByName('PAYRES').AsFloat   := 0;
        if QPost.FieldByName('STRNO').AsString <> '' then
        begin
          with Query1 do
          begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM STKCARD WHERE STRNO =:0 AND FLAG = ''D'' ');
            Params[0].AsString := QPost.FieldByName('STRNO').AsString;
            Open;
          end;
          QPost.FieldByName('REFNO').AsInteger := Query1.FieldByName('IDNO').AsInteger;
        end;
        QPost.FieldByName('CREDIT').AsFloat     := StrToFloat(RqObjectTran.GetValue('CREDIT').Value);
        QPost.FieldByName('DUEDT').AsDateTime   := StrToDate(RqObjectTran.GetValue('DUEDT').Value);
        QPost.FieldByName('SALCOD').AsString    := RqObjectTran.GetValue('SALCOD').Value;
        QPost.FieldByName('COMEXT').AsFloat     := StrToFloat(RqObjectTran.GetValue('COMEXT').Value);
        QPost.FieldByName('COMINT').AsFloat     := StrToFloat(RqObjectTran.GetValue('COMINT').Value);
        QPost.FieldByName('OTHPAY').AsFloat     := StrToFloat(RqObjectTran.GetValue('OTHPAY').Value);
        QPost.FieldByName('MEMO1').AsString     := RqObjectTran.GetValue('MEMO1').Value;
        QPost.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        QPost.FieldByName('LOCSALE').AsString   := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('FLAG').AsString      := 'A';
        docno := QPost.FieldByName('CONTNO').AsString;
        docdt := QPost.FieldByName('SDATE').AsDateTime;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM COMP_ASSET WHERE CONTNO =:V1 ');
          Params.ParamByName('V1').AsString := key;
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('SDATE').AsDateTime := StrToDate(RqObjectTran.GetValue('SDATE').Value);
        QPost.FieldByName('LOCAT').AsString   := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('CUSCOD').AsString  := RqObjectTran.GetValue('CUSCOD').Value;
        QPost.FieldByName('STRNO').AsString   := RqObjectTran.GetValue('STRNO').Value;
        QPost.FieldByName('VATRT').AsFloat    := StrToFloat(RqObjectTran.GetValue('VATRT').Value);
        QPost.FieldByName('STDPRC').AsFloat   := StrToFloat(RqObjectTran.GetValue('STDPRC').Value);
        QPost.FieldByName('DISCT').AsFloat    := StrToFloat(RqObjectTran.GetValue('DISCT').Value);
        QPost.FieldByName('KEYINPRC').AsFloat := StrToFloat(RqObjectTran.GetValue('KEYINPRC').Value);
        QPost.FieldByName('PAYRES').AsFloat   := 0;
        QPost.FieldByName('CREDIT').AsFloat   := StrToFloat(RqObjectTran.GetValue('CREDIT').Value);
        QPost.FieldByName('DUEDT').AsDateTime := StrToDate(RqObjectTran.GetValue('DUEDT').Value);
        QPost.FieldByName('SALCOD').AsString  := RqObjectTran.GetValue('SALCOD').Value;
        QPost.FieldByName('COMEXT').AsFloat   := StrToFloat(RqObjectTran.GetValue('COMEXT').Value);
        QPost.FieldByName('COMINT').AsFloat   := StrToFloat(RqObjectTran.GetValue('COMINT').Value);
        QPost.FieldByName('OTHPAY').AsFloat   := StrToFloat(RqObjectTran.GetValue('OTHPAY').Value);
        QPost.FieldByName('MEMO1').AsString   := RqObjectTran.GetValue('MEMO1').Value;
        QPost.FieldByName('USERID').AsString  := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('LOCSALE').AsString := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('FLAG').AsString    := 'A';
        docno := QPost.FieldByName('CONTNO').AsString;
        docdt := QPost.FieldByName('SDATE').AsDateTime;
      end;
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
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
    if QLastno.Active then
      QLastno.CommitUpdates;
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "save": ' + Return + ', "contno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveCustmastAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, docno, apcode: string;
  I, J, K, GenIdno: integer;
  docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data CUSTMAST
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    locat := RqObjectMaster.GetValue('locat').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key := RqObjectMaster.GetValue('key').Value;
    if table = 'CUSTMAST' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;

      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM CUSTMAST WHERE IDNO IS NULL ');
          Open;
        end;
        if not QDBConfig.Active then
        begin
          QDBConfig.ParamByName('LOCAT').AsString := locat;
          QDbconfig.Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Append;
        if QDBConfig.Fieldbyname('R_CUSCOD').asstring = 'Y' then
        begin
          QPost.FieldByName('CUSCOD').AsString := RunCusCod(locat);
        end
        else
        begin
          QPost.FieldByName('CUSCOD').AsString := RqObjectTran.GetValue('CUSCOD').Value;
        end;
        QPost.FieldByName('GROUP1').AsString := RqObjectTran.GetValue('GROUP1').Value;
        QPost.FieldByName('SNAM').AsString := RqObjectTran.GetValue('SNAM').Value;
        QPost.FieldByName('NAME1').AsString := RqObjectTran.GetValue('NAME1').Value;
        QPost.FieldByName('NAME2').AsString := RqObjectTran.GetValue('NAME2').Value;
        QPost.FieldByName('NICKNM').AsString := RqObjectTran.GetValue('NICKNM').Value;
        QPost.FieldByName('BIRTHDT').AsDateTime := StrToDate(RqObjectTran.GetValue('BIRTHDT').Value);
        QPost.FieldByName('ADDRNO').AsFloat := StrToFloat(RqObjectTran.GetValue('ADDRNO').Value);
        QPost.FieldByName('IDCARD').AsString := RqObjectTran.GetValue('IDCARD').Value;
        QPost.FieldByName('NOCARD').AsString := RqObjectTran.GetValue('NOCARD').Value;
        QPost.FieldByName('ISSUBY').AsString := RqObjectTran.GetValue('ISSUBY').Value;
        QPost.FieldByName('ISSUDT').AsDateTime := StrToDate(RqObjectTran.GetValue('ISSUDT').Value);
        QPost.FieldByName('EXPDT').AsDateTime := StrToDate(RqObjectTran.GetValue('EXPDT').Value);
        QPost.FieldByName('AGE').AsFloat := StrToFloat(RqObjectTran.GetValue('AGE').Value);
        QPost.FieldByName('NATION').AsString := RqObjectTran.GetValue('NATION').Value;
        QPost.FieldByName('OCCUP').AsString := RqObjectTran.GetValue('OCCUP').Value;
        QPost.FieldByName('OFFIC').AsString := RqObjectTran.GetValue('OFFIC').Value;
        QPost.FieldByName('BOSSNM').AsString := RqObjectTran.GetValue('BOSSNM').Value;
        QPost.FieldByName('TELP').AsString := RqObjectTran.GetValue('TELP').Value;
        QPost.FieldByName('GRADE').AsString := RqObjectTran.GetValue('GRADE').Value;
        QPost.FieldByName('MEMO1').AsString := RqObjectTran.GetValue('MEMO1').Value;
        QPost.FieldByName('USERID').AsString := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('MREVENU').AsFloat := StrToFloat(RqObjectTran.GetValue('MREVENU').Value);
        QPost.FieldByName('ACC_CODE').AsString := RqObjectTran.GetValue('ACC_CODE').Value;
        QPost.FieldByName('TELP1').AsString := RqObjectTran.GetValue('TELP1').Value;
        QPost.FieldByName('TELP2').AsString := RqObjectTran.GetValue('TELP2').Value;
        QPost.FieldByName('TELP3').AsString := RqObjectTran.GetValue('TELP3').Value;
        QPost.FieldByName('EMAIL').AsString := RqObjectTran.GetValue('EMAIL').Value;
        QPost.FieldByName('CUSLIKE').AsString := RqObjectTran.GetValue('CUSLIKE').Value;
        QPost.FieldByName('CUSNOLIKE').AsString := RqObjectTran.GetValue('CUSNOLIKE').Value;
        QPost.FieldByName('LOCTYP').AsString := RqObjectTran.GetValue('LOCTYP').Value;
        QPost.FieldByName('LOCTNO').AsString := RqObjectTran.GetValue('LOCTNO').Value;
        docno := QPost.FieldByName('CUSCOD').AsString;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM CUSTMAST WHERE CUSCOD =:V1 ');
          Params.ParamByName('V1').AsString := key;
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('GROUP1').AsString := RqObjectTran.GetValue('GROUP1').Value;
        QPost.FieldByName('SNAM').AsString := RqObjectTran.GetValue('SNAM').Value;
        QPost.FieldByName('NAME1').AsString := RqObjectTran.GetValue('NAME1').Value;
        QPost.FieldByName('NAME2').AsString := RqObjectTran.GetValue('NAME2').Value;
        QPost.FieldByName('NICKNM').AsString := RqObjectTran.GetValue('NICKNM').Value;
        QPost.FieldByName('BIRTHDT').AsDateTime := StrToDate(RqObjectTran.GetValue('BIRTHDT').Value);
        QPost.FieldByName('ADDRNO').AsFloat := StrToFloat(RqObjectTran.GetValue('ADDRNO').Value);
        QPost.FieldByName('IDCARD').AsString := RqObjectTran.GetValue('IDCARD').Value;
        QPost.FieldByName('NOCARD').AsString := RqObjectTran.GetValue('NOCARD').Value;
        QPost.FieldByName('ISSUBY').AsString := RqObjectTran.GetValue('ISSUBY').Value;
        QPost.FieldByName('ISSUDT').AsDateTime := StrToDate(RqObjectTran.GetValue('ISSUDT').Value);
        QPost.FieldByName('EXPDT').AsDateTime := StrToDate(RqObjectTran.GetValue('EXPDT').Value);
        QPost.FieldByName('AGE').AsFloat := StrToFloat(RqObjectTran.GetValue('AGE').Value);
        QPost.FieldByName('NATION').AsString := RqObjectTran.GetValue('NATION').Value;
        QPost.FieldByName('OCCUP').AsString := RqObjectTran.GetValue('OCCUP').Value;
        QPost.FieldByName('OFFIC').AsString := RqObjectTran.GetValue('OFFIC').Value;
        QPost.FieldByName('BOSSNM').AsString := RqObjectTran.GetValue('BOSSNM').Value;
        QPost.FieldByName('TELP').AsString := RqObjectTran.GetValue('TELP').Value;
        QPost.FieldByName('GRADE').AsString := RqObjectTran.GetValue('GRADE').Value;
        QPost.FieldByName('MEMO1').AsString := RqObjectTran.GetValue('MEMO1').Value;
        QPost.FieldByName('MREVENU').AsFloat := StrToFloat(RqObjectTran.GetValue('MREVENU').Value);
        QPost.FieldByName('ACC_CODE').AsString := RqObjectTran.GetValue('ACC_CODE').Value;
        QPost.FieldByName('TELP1').AsString := RqObjectTran.GetValue('TELP1').Value;
        QPost.FieldByName('TELP2').AsString := RqObjectTran.GetValue('TELP2').Value;
        QPost.FieldByName('TELP3').AsString := RqObjectTran.GetValue('TELP3').Value;
        QPost.FieldByName('EMAIL').AsString := RqObjectTran.GetValue('EMAIL').Value;
        QPost.FieldByName('CUSLIKE').AsString := RqObjectTran.GetValue('CUSLIKE').Value;
        QPost.FieldByName('CUSNOLIKE').AsString := RqObjectTran.GetValue('CUSNOLIKE').Value;
        QPost.FieldByName('LOCTYP').AsString := RqObjectTran.GetValue('LOCTYP').Value;
        QPost.FieldByName('LOCTNO').AsString := RqObjectTran.GetValue('LOCTNO').Value;
        docno := QPost.FieldByName('CUSCOD').AsString;
      end;
    end;
    //Get Data CUSTADDR
    RqObjectMaster := LJsonArr.Items[1] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    if table = 'CUSTADDR' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      with QPost2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM CUSTADDR WHERE GENIDNO =:V1 ');
        Params.ParamValues['V1'] := GenIdno;
        Open;
      end;
      //Delete record in old data
      QPost2.First;
      while not QPost2.Eof do
      begin
        K := 0;
        for J := 0 to ja.Count - 1 do
        begin
          RqObjectTran := ja.Items[J] as TJSONObject;
          if StrToInt(RqObjectTran.GetValue('IDNO').Value) = QPost2.FieldByName('IDNO').AsInteger then
          begin
            K := K + 1;
            break;
          end;
        end;
        if K = 0 then
          QPost2.Delete
        else
          QPost2.Next;
      end;
      //Edit old data and Insert new data
      for I := 0 to ja.Count - 1 do
      begin
        RqObjectTran := ja.Items[I] as TJSONObject;
        if QPost2.Locate('IDNO', RqObjectTran.GetValue('IDNO').Value, [loPartialKey]) then
        begin
          QPost2.Edit;
        end
        else
        begin
          QPost2.Append;
        end;
        QPost2.FieldByName('GENIDNO').AsInteger := 0;
        QPost2.FieldByName('ADDRNO').AsInteger  := StrToInt(RqObjectTran.GetValue('ADDRNO').Value);
        QPost2.FieldByName('ADDR1').AsString    := RqObjectTran.GetValue('ADDR1').Value;
        QPost2.FieldByName('ADDR2').AsString    := RqObjectTran.GetValue('ADDR2').Value;
        QPost2.FieldByName('TUMB').AsString     := RqObjectTran.GetValue('TUMB').Value;
        QPost2.FieldByName('AUMPCOD').AsString  := RqObjectTran.GetValue('AUMPCOD').Value;
        QPost2.FieldByName('PROVCOD').AsString  := RqObjectTran.GetValue('PROVCOD').Value;
        QPost2.FieldByName('ZIP').AsString      := RqObjectTran.GetValue('ZIP').Value;
        QPost2.FieldByName('TELP').AsString     := RqObjectTran.GetValue('TELP').Value;
      end;
    end;
    //Get Data CUSCHANNELSEND
    RqObjectMaster := LJsonArr.Items[2] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    if table = 'CUSCHANNELSEND' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      with QPost3 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM CUSCHANNELSEND WHERE CUSCOD =:V1 ');
        Params.ParamValues['V1'] := key;
        Open;
      end;
      //Delete record in old data
      QPost3.First;
      while not QPost3.Eof do
      begin
        K := 0;
        for J := 0 to ja.Count - 1 do
        begin
          RqObjectTran := ja.Items[J] as TJSONObject;
          if StrToInt(RqObjectTran.GetValue('IDNO').Value) = QPost3.FieldByName('IDNO').AsInteger then
          begin
            K := K + 1;
            break;
          end;
        end;
        if K = 0 then
          QPost3.Delete
        else
          QPost3.Next;
      end;
      //Edit old data and Insert new data
      for I := 0 to ja.Count - 1 do
      begin
        RqObjectTran := ja.Items[I] as TJSONObject;
        if QPost3.Locate('IDNO', RqObjectTran.GetValue('IDNO').Value, [loPartialKey]) then
        begin
          QPost3.Edit;
        end
        else
        begin
          QPost3.Append;
        end;
        QPost3.FieldByName('CUSCOD').AsString := docno;
        QPost3.FieldByName('CSCODE').AsString := RqObjectTran.GetValue('CSCODE').Value;
        QPost3.FieldByName('CSDESC').AsString := RqObjectTran.GetValue('CSDESC').Value;
        if RqObjectTran.GetValue('CSSTAT').Value = 'true' then
          QPost3.FieldByName('CSSTAT').AsString := 'Y'
        else
          QPost3.FieldByName('CSSTAT').AsString := 'N';
      end;
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
      with Query1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM CUSTMAST WHERE CUSCOD =:V1 ');
        Params.ParamByName('V1').AsString := docno;
        Open;
      end;
      GenIdno := Query1.FieldByName('IDNO').AsInteger;
      QPost2.First;
      while not QPost2.Eof  do
      begin
        QPost2.Edit;
        QPost2.FieldByName('GENIDNO').AsInteger := GenIdno;
        QPost2.Next;
      end;
      if QPost2.Active then
        QPost2.ApplyUpdates;
      if QPost3.Active then
        QPost3.ApplyUpdates;
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
    if QPost3.Active then
      QPost3.CommitUpdates;
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "save": ' + Return + ', "cuscod": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveDbconfigAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, value, key, Return, HF, LF, LV, S, docno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data DBCONFIG
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    key := RqObjectMaster.GetValue('key').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    if table = 'DBCONFIG' then
    begin
      with QPost do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM DBCONFIG WHERE LOCATCD = :0 ');
        Params[0].AsString := key;
        Open;
      end;
      if not QPost.IsEmpty then
      begin
        ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
        for I := 0 to ja.Count - 1 do
        begin
          RqObjectTran := ja.Items[I] as TJSONObject;
          QPost.Edit;
          QPost.FieldByName(RqObjectTran.GetValue('DOCCODE').Value).AsString := RqObjectTran.GetValue('RUNING').Value;
        end;
      end
      else
      begin
        QPost.Insert;
        QPost.FieldByName('LOCATCD').AsString := key;
      end;
      docno := key;
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
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
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "save": ' + Return + ', "locatcd": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveDocconfigAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, value, Return, HF, LF, LV, S, docno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data DBCONFIG
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    if table = 'CONDPAY' then
    begin
      with QPost do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM CONDPAY ');
        Open;
      end;
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      for I := 0 to ja.Count - 1 do
      begin
        RqObjectTran := ja.Items[I] as TJSONObject;
        QPost.Edit;
        QPost.FieldByName(RqObjectTran.GetValue('DOCCODE').Value).AsString := RqObjectTran.GetValue('HD').Value;
      end;
      docno := '';
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
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
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "save": ' + Return + ', "locatcd": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveInvinvoAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, HF, LF, LV, S, docno, apcode: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data INVINVO
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    locat := RqObjectMaster.GetValue('locat').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key := RqObjectMaster.GetValue('key').Value;
    if table = 'INVINVO' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;

      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM INVINVO WHERE IDNO IS NULL ');
          Open;
        end;
        HF := 'H_RECVCR';
        LF := 'L_RECVCR';
        if not QDBConfig.Active then
        begin
          QDBConfig.ParamByName('LOCAT').AsString := locat;
          QDbconfig.Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('RECVDT').AsDateTime := StrToDate(RqObjectTran.GetValue('RECVDT').Value);
        if QDBConfig.Fieldbyname('R_RECVCR').asstring = 'Y' then
        begin
          LV := locat;
          DV := QPost.FieldByName('RECVDT').AsDateTime;
          QPost.FieldByName('RECVNO').AsString := RunNo(HF, LF, LV, DV);
        end
        else
        begin
          QPost.FieldByName('RECVNO').AsString := RqObjectTran.GetValue('RECVNO').Value;
        end;
        QPost.FieldByName('LOCAT').AsString := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('INVNO').AsString := RqObjectTran.GetValue('INVNO').Value;
        QPost.FieldByName('INVDT').AsDateTime := StrToDate(RqObjectTran.GetValue('INVDT').Value);
        QPost.FieldByName('RVCODE').AsString := RqObjectTran.GetValue('RVCODE').Value;
        QPost.FieldByName('APCODE').AsString := RqObjectTran.GetValue('APCODE').Value;
        QPost.FieldByName('VATRT').AsFloat := StrToFloat(RqObjectTran.GetValue('VATRT').Value);
        QPost.FieldByName('NETCST').AsFloat := StrToFloat(RqObjectTran.GetValue('NETCST').Value);
        QPost.FieldByName('NETVAT').AsFloat := StrToFloat(RqObjectTran.GetValue('NETVAT').Value);
        QPost.FieldByName('NETTOT').AsFloat := StrToFloat(RqObjectTran.GetValue('NETTOT').Value);
        QPost.FieldByName('DESCP').AsString := RqObjectTran.GetValue('DESCP').Value;
        QPost.FieldByName('CREDTM').AsFloat := StrToFloat(RqObjectTran.GetValue('CREDTM').Value);
        QPost.FieldByName('DUEDATE').AsDateTime := StrToDate(RqObjectTran.GetValue('DUEDATE').Value);
        QPost.FieldByName('USERID').AsString := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        QPost.FieldByName('APFLAG').AsString := RqObjectTran.GetValue('APFLAG').Value;
        docno := QPost.FieldByName('RECVNO').AsString;
        docdt := QPost.FieldByName('RECVDT').AsDateTime;
        apcode := QPost.FieldByName('APCODE').AsString;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM INVINVO WHERE RECVNO =:V1 ');
          Params.ParamByName('V1').AsString := key;
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('RECVDT').AsDateTime := StrToDate(RqObjectTran.GetValue('RECVDT').Value);
        QPost.FieldByName('LOCAT').AsString := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('INVNO').AsString := RqObjectTran.GetValue('INVNO').Value;
        QPost.FieldByName('INVDT').AsDateTime := StrToDate(RqObjectTran.GetValue('INVDT').Value);
        QPost.FieldByName('RVCODE').AsString := RqObjectTran.GetValue('RVCODE').Value;
        QPost.FieldByName('APCODE').AsString := RqObjectTran.GetValue('APCODE').Value;
        QPost.FieldByName('VATRT').AsFloat := StrToFloat(RqObjectTran.GetValue('VATRT').Value);
        QPost.FieldByName('NETCST').AsFloat := StrToFloat(RqObjectTran.GetValue('NETCST').Value);
        QPost.FieldByName('NETVAT').AsFloat := StrToFloat(RqObjectTran.GetValue('NETVAT').Value);
        QPost.FieldByName('NETTOT').AsFloat := StrToFloat(RqObjectTran.GetValue('NETTOT').Value);
        QPost.FieldByName('DESCP').AsString := RqObjectTran.GetValue('DESCP').Value;
        QPost.FieldByName('CREDTM').AsFloat := StrToFloat(RqObjectTran.GetValue('CREDTM').Value);
        QPost.FieldByName('DUEDATE').AsDateTime := StrToDate(RqObjectTran.GetValue('DUEDATE').Value);
        QPost.FieldByName('APFLAG').AsString := RqObjectTran.GetValue('APFLAG').Value;
        docno := QPost.FieldByName('RECVNO').AsString;
        docdt := QPost.FieldByName('RECVDT').AsDateTime;
        apcode := QPost.FieldByName('APCODE').AsString;
      end;
    end;
    //Get Data INVTRAN
    RqObjectMaster := LJsonArr.Items[1] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    if table = 'INVTRAN' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      with QPost2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM INVTRAN WHERE RECVNO =:V1 ');
        Params.ParamValues['V1'] := key;
        Open;
      end;
      //Delete record in old data
      QPost2.First;
      while not QPost2.Eof do
      begin
        K := 0;
        for J := 0 to ja.Count - 1 do
        begin
          RqObjectTran := ja.Items[J] as TJSONObject;
          if StrToInt(RqObjectTran.GetValue('IDNO').Value) = QPost2.FieldByName('IDNO').AsInteger then
          begin
            K := K + 1;
            break;
          end;
        end;
        if K = 0 then
          QPost2.Delete
        else
          QPost2.Next;
      end;
      //Edit old data and Insert new data
      for I := 0 to ja.Count - 1 do
      begin
        RqObjectTran := ja.Items[I] as TJSONObject;
        if QPost2.Locate('IDNO', RqObjectTran.GetValue('IDNO').Value, [loPartialKey]) then
        begin
          QPost2.Edit;
        end
        else
        begin
          QPost2.Append;
        end;
        QPost2.FieldByName('RECVNO').AsString := docno;
        QPost2.FieldByName('RECVDT').AsDateTime := docdt;
        QPost2.FieldByName('CRLOCAT').AsString := RqObjectTran.GetValue('CRLOCAT').Value;
        QPost2.FieldByName('GCODE').AsString := RqObjectTran.GetValue('GCODE').Value;
        QPost2.FieldByName('TYPECOD').AsString := RqObjectTran.GetValue('TYPECOD').Value;
        QPost2.FieldByName('MODELCOD').AsString := RqObjectTran.GetValue('MODELCOD').Value;
        QPost2.FieldByName('BAABCOD').AsString := RqObjectTran.GetValue('BAABCOD').Value;
        QPost2.FieldByName('COLORCOD').AsString := RqObjectTran.GetValue('COLORCOD').Value;
        QPost2.FieldByName('CC').AsFloat := StrToFloat(RqObjectTran.GetValue('CC').Value);
        QPost2.FieldByName('STAT').AsString := RqObjectTran.GetValue('STAT').Value;
        QPost2.FieldByName('STRNO').AsString := RqObjectTran.GetValue('STRNO').Value;
        QPost2.FieldByName('ENGNO').AsString := RqObjectTran.GetValue('ENGNO').Value;
        QPost2.FieldByName('REGNO').AsString := RqObjectTran.GetValue('REGNO').Value;
        QPost2.FieldByName('KEYNO').AsString := RqObjectTran.GetValue('KEYNO').Value;
        QPost2.FieldByName('MILERT').AsFloat := StrToFloat(RqObjectTran.GetValue('MILERT').Value);
        QPost2.FieldByName('CRCOST').AsFloat := StrToFloat(RqObjectTran.GetValue('CRCOST').Value);
        QPost2.FieldByName('DISCT').AsFloat := StrToFloat(RqObjectTran.GetValue('DISCT').Value);
        QPost2.FieldByName('NETCOST').AsFloat := StrToFloat(RqObjectTran.GetValue('NETCOST').Value);
        QPost2.FieldByName('CRVAT').AsFloat := StrToFloat(RqObjectTran.GetValue('CRVAT').Value);
        QPost2.FieldByName('TOTCOST').AsFloat := StrToFloat(RqObjectTran.GetValue('TOTCOST').Value);
        QPost2.FieldByName('STDPRC').AsFloat := StrToFloat(RqObjectTran.GetValue('STDPRC').Value);
        QPost2.FieldByName('MANUYR').AsString := RqObjectTran.GetValue('MANUYR').Value;
        QPost2.FieldByName('INPUTDT').AsDateTime := Now;
        QPost2.FieldByName('USERID').AsString := RqObjectTran.GetValue('USERID').Value;
        QPost2.FieldByName('TAXNO').AsString := RqObjectTran.GetValue('TAXNO').Value;
        QPost2.FieldByName('APCODE').AsString := apcode;
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
    Response.Content := '[{ "save": ' + Return + ', "recvno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveInvmovmAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, HF, LF, LV, S, moveno: string;
  I, J, K: integer;
  DV, movedt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data INVMOVM
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    locat := RqObjectMaster.GetValue('locat').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key := RqObjectMaster.GetValue('key').Value;
    if table = 'INVMOVM' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;

      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM INVMOVM WHERE IDNO IS NULL ');
          Open;
        end;
        HF := 'H_TFCAR';
        LF := 'L_TFCAR';
        RqObjectTran := ja.Items[0] as TJSONObject;
        if not QDBConfig.Active then
        begin
          QDBConfig.ParamByName('LOCAT').AsString := locat;
          QDbconfig.Open;
        end;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('MOVENM').AsString := RqObjectTran.GetValue('MOVENM').Value;
        QPost.FieldByName('MOVERV').AsString := RqObjectTran.GetValue('MOVERV').Value;
        QPost.FieldByName('MOVEFM').AsString := RqObjectTran.GetValue('MOVEFM').Value;
        QPost.FieldByName('MOVETO').AsString := RqObjectTran.GetValue('MOVETO').Value;
        QPost.FieldByName('MOVEDT').AsDateTime := StrToDate(RqObjectTran.GetValue('MOVEDT').Value);
        if QDBConfig.Fieldbyname('R_TFCAR').asstring = 'Y' then
        begin
          LV := QPost.FieldByName('MOVEFM').AsString;
          DV := QPost.FieldByName('MOVEDT').AsDateTime;
          QPost.FieldByName('MOVENO').AsString := RunNo(HF, LF, LV, DV);
        end
        else
        begin
          QPost.FieldByName('MOVENO').AsString := RqObjectTran.GetValue('MOVENO').Value;
        end;
        QPost.FieldByName('MEMO1').AsString := RqObjectTran.GetValue('MEMO1').Value;
        moveno := QPost.FieldByName('MOVENO').AsString;
        movedt := QPost.FieldByName('MOVEDT').AsDateTime;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM INVMOVM WHERE MOVENO =:V1 ');
          Params.ParamByName('V1').AsString := key;
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('MOVENM').AsString := RqObjectTran.GetValue('MOVENM').Value;
        QPost.FieldByName('MOVERV').AsString := RqObjectTran.GetValue('MOVERV').Value;
        QPost.FieldByName('MOVEFM').AsString := RqObjectTran.GetValue('MOVEFM').Value;
        QPost.FieldByName('MOVETO').AsString := RqObjectTran.GetValue('MOVETO').Value;
        QPost.FieldByName('MOVEDT').AsDateTime := StrToDate(RqObjectTran.GetValue('MOVEDT').Value);
        QPost.FieldByName('MEMO1').AsString := RqObjectTran.GetValue('MEMO1').Value;
        moveno := QPost.FieldByName('MOVENO').AsString;
        movedt := QPost.FieldByName('MOVEDT').AsDateTime;
      end;
    end;
    //Get Data INVMOVT
    RqObjectMaster := LJsonArr.Items[1] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    if table = 'INVMOVT' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      with QPost2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM INVMOVT WHERE MOVENO =:V1 ');
        Params.ParamValues['V1'] := key;
        Open;
      end;
      //Delete record in old data
      QPost2.First;
      while not QPost2.Eof do
      begin
        K := 0;
        for J := 0 to ja.Count - 1 do
        begin
          RqObjectTran := ja.Items[J] as TJSONObject;
          if StrToInt(RqObjectTran.GetValue('IDNO').Value) = QPost2.FieldByName('IDNO').AsInteger then
          begin
            K := K + 1;
            break;
          end;
        end;
        if K = 0 then
          QPost2.Delete
        else
          QPost2.Next;
      end;
      //Edit old data and Insert new data
      for I := 0 to ja.Count - 1 do
      begin
        RqObjectTran := ja.Items[I] as TJSONObject;
        if QPost2.Locate('IDNO', RqObjectTran.GetValue('IDNO').Value, [loPartialKey]) then
        begin
          QPost2.Edit;
        end
        else
        begin
          QPost2.Append;
        end;
        QPost2.FieldByName('MOVENO').AsString   := moveno;
        QPost2.FieldByName('STRNO').AsString    := RqObjectTran.GetValue('STRNO').Value;
        QPost2.FieldByName('MOVEDT').AsDateTime := movedt;
        QPost2.FieldByName('MOVEFM').AsString   := RqObjectTran.GetValue('MOVEFM').Value;
        QPost2.FieldByName('MOVETO').AsString   := RqObjectTran.GetValue('MOVETO').Value;
        QPost2.FieldByName('CRCOST').AsFloat    := StrToFloat(RqObjectTran.GetValue('CRCOST').Value);
        QPost2.FieldByName('DISCT').AsFloat     := StrToFloat(RqObjectTran.GetValue('DISCT').Value);
        QPost2.FieldByName('NETCOST').AsFloat   := StrToFloat(RqObjectTran.GetValue('NETCOST').Value);
        QPost2.FieldByName('CRVAT').AsFloat     := StrToFloat(RqObjectTran.GetValue('CRVAT').Value);
        QPost2.FieldByName('TOTCOST').AsFloat   := StrToFloat(RqObjectTran.GetValue('TOTCOST').Value);
        QPost2.FieldByName('STDPRC').AsFloat    := StrToFloat(RqObjectTran.GetValue('STDPRC').Value);
        QPost2.FieldByName('REFNO').AsInteger   := StrToInt(RqObjectTran.GetValue('REFNO').Value);
        QPost2.FieldByName('STAT').AsString     := RqObjectTran.GetValue('STAT').Value;
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
    Response.Content := '[{ "save": ' + Return + ', "moveno": "' + moveno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveLocatparkingAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, HF, LF, LV, S, docno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data ADJSTK
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table  := RqObjectMaster.GetValue('table').Value;
    locat  := RqObjectMaster.GetValue('locat').Value;
    value  := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key    := RqObjectMaster.GetValue('key').Value;
    if table = 'LOCATPARKING' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM LOCATPARKING WHERE IDNO IS NULL ');
          Open;
        end;
        HF := 'H_LOCATPARK';
        LF := 'L_LOCATPARK';
        if not QDBConfig.Active then
        begin
          QDBConfig.ParamByName('LOCAT').AsString := locat;
          QDbconfig.Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('REFDTIN').AsDateTime := StrToDate(RqObjectTran.GetValue('REFDTIN').Value);
        if QDBConfig.Fieldbyname('R_LOCATPARK').asstring = 'Y' then
        begin
          LV := locat;
          DV := QPost.FieldByName('REFDTIN').AsDateTime;
          QPost.FieldByName('REFNOIN').AsString := RunNo(HF, LF, LV, DV);
        end
        else
        begin
          QPost.FieldByName('REFNOIN').AsString := RqObjectTran.GetValue('REFNOIN').Value;
        end;
        QPost.FieldByName('LOCAT').AsString     := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('LOCATPARK').AsString := RqObjectTran.GetValue('LOCATPARK').Value;
        QPost.FieldByName('STRNO').AsString     := RqObjectTran.GetValue('STRNO').Value;
        if (QPost.FieldByName('STRNO').AsString <> '') then
        begin
          with Query1 do
          begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM STKCARD WHERE STRNO =:0 AND FLAG = ''D'' ');
            Params[0].AsString := QPost.FieldByName('STRNO').AsString;
            Open;
          end;
          QPost.FieldByName('REFNO').AsInteger := Query1.FieldByName('IDNO').AsInteger;
        end;
        QPost.FieldByName('OFFCOD').AsString    := RqObjectTran.GetValue('OFFCOD').Value;
        QPost.FieldByName('MEMO1').AsString     := RqObjectTran.GetValue('MEMO1').Value;
        QPost.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        docno := QPost.FieldByName('REFNOIN').AsString;
        docdt := QPost.FieldByName('REFDTIN').AsDateTime;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM LOCATPARKING WHERE REFNOIN = :V1 ');
          Params.ParamByName('V1').AsString := key;
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('REFDTIN').AsDateTime := StrToDate(RqObjectTran.GetValue('REFDTIN').Value);
        QPost.FieldByName('LOCAT').AsString     := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('LOCATPARK').AsString := RqObjectTran.GetValue('LOCATPARK').Value;
        QPost.FieldByName('STRNO').AsString     := RqObjectTran.GetValue('STRNO').Value;
        if (QPost.FieldByName('STRNO').AsString <> '') then
        begin
          with Query1 do
          begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT * FROM STKCARD WHERE STRNO =:0 AND FLAG = ''D'' ');
            Params[0].AsString := QPost.FieldByName('STRNO').AsString;
            Open;
          end;
          QPost.FieldByName('REFNO').AsInteger := Query1.FieldByName('IDNO').AsInteger;
        end;
        QPost.FieldByName('OFFCOD').AsString    := RqObjectTran.GetValue('OFFCOD').Value;
        QPost.FieldByName('MEMO1').AsString     := RqObjectTran.GetValue('MEMO1').Value;
        QPost.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        docno := QPost.FieldByName('REFNOIN').AsString;
        docdt := QPost.FieldByName('REFDTIN').AsDateTime;
      end;
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
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
    if QLastno.Active then
      QLastno.CommitUpdates;
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "save": ' + Return + ', "refnoin": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveMathstrnoAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, HF, LF, LV, S, docno, strno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data ARCRED
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table  := RqObjectMaster.GetValue('table').Value;
    locat  := RqObjectMaster.GetValue('locat').Value;
    value  := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key    := RqObjectMaster.GetValue('key').Value;
    if table = 'MATCHSTRNO' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM MATCHSTRNO WHERE IDNO IS NULL ');
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('MATCHDT').AsDateTime := StrToDate(RqObjectTran.GetValue('MATCHDT').Value);
        QPost.FieldByName('RESVNO').AsString    := RqObjectTran.GetValue('RESVNO').Value;
        QPost.FieldByName('LOCAT').AsString     := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('STRNO').AsString     := RqObjectTran.GetValue('STRNO').Value;
        QPost.FieldByName('FLAG').AsString      := RqObjectTran.GetValue('FLAG').Value;
        QPost.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        docno := QPost.FieldByName('RESVNO').AsString;
        strno := QPost.FieldByName('STRNO').AsString;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM MATCHSTRNO WHERE IDNO =:V1 ');
          Params.ParamByName('V1').AsInteger := StrToInt(key);
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('MATCHDT').AsDateTime := StrToDate(RqObjectTran.GetValue('MATCHDT').Value);
        QPost.FieldByName('RESVNO').AsString    := RqObjectTran.GetValue('RESVNO').Value;
        QPost.FieldByName('LOCAT').AsString     := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('STRNO').AsString     := RqObjectTran.GetValue('STRNO').Value;
        QPost.FieldByName('FLAG').AsString      := RqObjectTran.GetValue('FLAG').Value;
        docno := QPost.FieldByName('RESVNO').AsString;
        strno := QPost.FieldByName('STRNO').AsString;
      end;
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
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

    with Query1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM MATCHSTRNO WHERE RESVNO = :V1 AND STRNO = :V2 ');
      Params.ParamByName('V1').AsString := docno;
      Params.ParamByName('V2').AsString := strno;
      Open;
    end;
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "save": ' + Return + ', "idno": "' + Query1.FieldByName('IDNO').AsString + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveMcmastAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, HF, LF, LV, S, mcno: string;
  I, J, K: integer;
  DV: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data MCMAST
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    locat := RqObjectMaster.GetValue('locat').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key := RqObjectMaster.GetValue('key').Value;
    if table = 'MCMAST' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;

      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM MCMAST WHERE IDNO IS NULL ');
          Open;
        end;
        HF := 'H_MCMAST';
        LF := 'L_MCMAST';
        RqObjectTran := ja.Items[0] as TJSONObject;
        if not QDBConfig.Active then
        begin
          QDBConfig.ParamByName('LOCAT').AsString := locat;
          QDbconfig.Open;
        end;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('LOCAT').AsString := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('MCDT').AsDateTime := StrToDate(RqObjectTran.GetValue('MCDT').Value);
        if QDBConfig.Fieldbyname('R_MCMAST').asstring = 'Y' then
        begin
          LV := QPost.FieldByName('LOCAT').AsString;
          DV := QPost.FieldByName('MCDT').AsDateTime;
          QPost.FieldByName('MCNO').AsString := RunNo(HF, LF, LV, DV);
        end
        else
        begin
          QPost.FieldByName('MCNO').AsString := RqObjectTran.GetValue('MCNO').Value;
        end;
        QPost.FieldByName('STRNO').AsString := RqObjectTran.GetValue('STRNO').Value;
        QPost.FieldByName('SUMQTY').AsFloat := StrToFloat(RqObjectTran.GetValue('SUMQTY').Value);
        QPost.FieldByName('FLAG').AsString := RqObjectTran.GetValue('FLAG').Value;
        QPost.FieldByName('USERID').AsString := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        QPost.FieldByName('SUMOPTPRC').AsFloat := StrToFloat(RqObjectTran.GetValue('SUMOPTPRC').Value);
        mcno := QPost.FieldByName('MCNO').AsString;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM MCMAST WHERE MCNO =:V1 ');
          Params.ParamByName('V1').AsString := key;
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('MCDT').AsDateTime := StrToDate(RqObjectTran.GetValue('MCDT').Value);
        QPost.FieldByName('STRNO').AsString := RqObjectTran.GetValue('STRNO').Value;
        QPost.FieldByName('SUMQTY').AsFloat := StrToFloat(RqObjectTran.GetValue('SUMQTY').Value);
        QPost.FieldByName('FLAG').AsString := RqObjectTran.GetValue('FLAG').Value;
        QPost.FieldByName('USERID').AsString := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        QPost.FieldByName('MOMO1').AsString := RqObjectTran.GetValue('MOMO1').Value;
        QPost.FieldByName('SUMOPTPRC').AsFloat := StrToFloat(RqObjectTran.GetValue('SUMOPTPRC').Value);
        mcno := QPost.FieldByName('MCNO').AsString;
      end;
    end;
    //Get Data MCTRAN
    RqObjectMaster := LJsonArr.Items[1] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    if table = 'MCTRAN' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      with QPost2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM MCTRAN WHERE MCNO =:V1 ');
        Params.ParamValues['V1'] := key;
        Open;
      end;
      //Delete record in old data
      QPost2.First;
      while not QPost2.Eof do
      begin
        K := 0;
        for J := 0 to ja.Count - 1 do
        begin
          RqObjectTran := ja.Items[J] as TJSONObject;
          if StrToInt(RqObjectTran.GetValue('IDNO').Value) = QPost2.FieldByName('IDNO').AsInteger then
          begin
            K := K + 1;
            break;
          end;
        end;
        if K = 0 then
          QPost2.Delete
        else
          QPost2.Next;
      end;
      //Edit old data and Insert new data
      for I := 0 to ja.Count - 1 do
      begin
        RqObjectTran := ja.Items[I] as TJSONObject;
        if QPost2.Locate('IDNO', RqObjectTran.GetValue('IDNO').Value, [loPartialKey]) then
        begin
          QPost2.Edit;
        end
        else
        begin
          QPost2.Append;
        end;
        QPost2.FieldByName('MCNO').AsString := mcno;
        QPost2.FieldByName('OPTCODE').AsString := RqObjectTran.GetValue('OPTCODE').Value;
        QPost2.FieldByName('OPTNAME').AsString := RqObjectTran.GetValue('OPTNAME').Value;
        QPost2.FieldByName('QTY').AsFloat := StrToFloat(RqObjectTran.GetValue('QTY').Value);
        QPost2.FieldByName('FLAG').AsString := RqObjectTran.GetValue('FLAG').Value;
        QPost2.FieldByName('USERID').AsString := RqObjectTran.GetValue('USERID').Value;
        QPost2.FieldByName('INPUTDT').AsDateTime := Now;
        QPost2.FieldByName('OPTPRC').AsFloat := StrToFloat(RqObjectTran.GetValue('OPTPRC').Value);
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
    Response.Content := '[{ "save": ' + Return + ', "mcno": "' + mcno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveModmastAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, HF, LF, LV, S, modno: string;
  I, J, K: integer;
  DV: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data MODMAST
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    locat := RqObjectMaster.GetValue('locat').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key := RqObjectMaster.GetValue('key').Value;
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
        if not QDBConfig.Active then
        begin
          QDBConfig.ParamByName('LOCAT').AsString := locat;
          QDbconfig.Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('MODDT').AsDateTime := StrToDate(RqObjectTran.GetValue('MODDT').Value);
        if QDBConfig.Fieldbyname('R_MODMAST').asstring = 'Y' then
        begin
          LV := locat;
          DV := QPost.FieldByName('MODDT').AsDateTime;
          QPost.FieldByName('MODNO').AsString := RunNo(HF, LF, LV, DV);
        end
        else
        begin
          QPost.FieldByName('MODNO').AsString := RqObjectTran.GetValue('MODNO').Value;
        end;
        QPost.FieldByName('MODELCOD').AsString := RqObjectTran.GetValue('MODELCOD').Value;
        QPost.FieldByName('SUMQTY').AsFloat := StrToFloat(RqObjectTran.GetValue('SUMQTY').Value);
        QPost.FieldByName('FLAG').AsString := RqObjectTran.GetValue('FLAG').Value;
        QPost.FieldByName('USERID').AsString := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        QPost.FieldByName('SUMOPTPRC').AsFloat := StrToFloat(RqObjectTran.GetValue('SUMOPTPRC').Value);
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
        QPost.FieldByName('MODDT').AsDateTime := StrToDate(RqObjectTran.GetValue('MODDT').Value);
        QPost.FieldByName('MODELCOD').AsString := RqObjectTran.GetValue('MODELCOD').Value;
        QPost.FieldByName('SUMQTY').AsFloat := StrToFloat(RqObjectTran.GetValue('SUMQTY').Value);
        QPost.FieldByName('FLAG').AsString := RqObjectTran.GetValue('FLAG').Value;
        QPost.FieldByName('USERID').AsString := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        QPost.FieldByName('MOMO1').AsString := RqObjectTran.GetValue('MOMO1').Value;
        QPost.FieldByName('SUMOPTPRC').AsFloat := StrToFloat(RqObjectTran.GetValue('SUMOPTPRC').Value);
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
        for J := 0 to ja.Count - 1 do
        begin
          RqObjectTran := ja.Items[J] as TJSONObject;
          if StrToInt(RqObjectTran.GetValue('IDNO').Value) = QPost2.FieldByName('IDNO').AsInteger then
          begin
            K := K + 1;
            break;
          end;
        end;
        if K = 0 then
          QPost2.Delete
        else
          QPost2.Next;
      end;
      //Edit old data and Insert new data
      for I := 0 to ja.Count - 1 do
      begin
        RqObjectTran := ja.Items[I] as TJSONObject;
        if QPost2.Locate('IDNO', RqObjectTran.GetValue('IDNO').Value, [loPartialKey]) then
        begin
          QPost2.Edit;
        end
        else
        begin
          QPost2.Append;
        end;
        QPost2.FieldByName('MODNO').AsString := modno;
        QPost2.FieldByName('OPTCODE').AsString := RqObjectTran.GetValue('OPTCODE').Value;
        QPost2.FieldByName('OPTNAME').AsString := RqObjectTran.GetValue('OPTNAME').Value;
        QPost2.FieldByName('QTY').AsFloat := StrToFloat(RqObjectTran.GetValue('QTY').Value);
        QPost2.FieldByName('FLAG').AsString := RqObjectTran.GetValue('FLAG').Value;
        QPost2.FieldByName('USERID').AsString := RqObjectTran.GetValue('USERID').Value;
        QPost2.FieldByName('INPUTDT').AsDateTime := Now;
        QPost2.FieldByName('OPTPRC').AsFloat := StrToFloat(RqObjectTran.GetValue('OPTPRC').Value);
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
    Response.Content := '[{ "save": ' + Return + ', "modno": "' + modno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveOfficerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, HF, LF, LV, S, docno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data OFFICER
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key := RqObjectMaster.GetValue('key').Value;
    if table = 'OFFICER' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM OFFICER WHERE CODE IS NULL ');
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('CODE').AsString     := RqObjectTran.GetValue('CODE').Value;
        QPost.FieldByName('NAME').AsString     := RqObjectTran.GetValue('NAME').Value;
        QPost.FieldByName('SURNAME').AsString  := RqObjectTran.GetValue('SURNAME').Value;
        QPost.FieldByName('ADDR').AsString     := RqObjectTran.GetValue('ADDR').Value;
        QPost.FieldByName('TELP').AsString     := RqObjectTran.GetValue('TELP').Value;
        QPost.FieldByName('WORKDT').AsDateTime := StrToDate(RqObjectTran.GetValue('WORKDT').Value);
        if RqObjectTran.GetValue('EXPIRE').Value = 'null' then
          QPost.FieldByName('EXPIRE').AsString := ''
        else
          QPost.FieldByName('EXPIRE').AsDateTime := StrToDate(RqObjectTran.GetValue('EXPIRE').Value);
        QPost.FieldByName('STATUS').AsString   := RqObjectTran.GetValue('STATUS').Value;
        QPost.FieldByName('STATSALE').AsString := RqObjectTran.GetValue('STATSALE').Value;
        docno := QPost.FieldByName('CODE').AsString;
        docdt := QPost.FieldByName('WORKDT').AsDateTime;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM OFFICER WHERE CODE = :V1 ');
          Params.ParamByName('V1').AsString := key;
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('NAME').AsString     := RqObjectTran.GetValue('NAME').Value;
        QPost.FieldByName('SURNAME').AsString  := RqObjectTran.GetValue('SURNAME').Value;
        QPost.FieldByName('ADDR').AsString     := RqObjectTran.GetValue('ADDR').Value;
        QPost.FieldByName('TELP').AsString     := RqObjectTran.GetValue('TELP').Value;
        QPost.FieldByName('WORKDT').AsDateTime := StrToDate(RqObjectTran.GetValue('WORKDT').Value);
        if RqObjectTran.GetValue('EXPIRE').Value = 'null' then
          QPost.FieldByName('EXPIRE').AsString := ''
        else
          QPost.FieldByName('EXPIRE').AsDateTime := StrToDate(RqObjectTran.GetValue('EXPIRE').Value);
        QPost.FieldByName('STATUS').AsString   := RqObjectTran.GetValue('STATUS').Value;
        QPost.FieldByName('STATSALE').AsString := RqObjectTran.GetValue('STATSALE').Value;
        docno := QPost.FieldByName('CODE').AsString;
        docdt := QPost.FieldByName('WORKDT').AsDateTime;
      end;
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
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
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "save": ' + Return + ', "code": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveOneAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RequestObject: TJSONObject;
  status, table, field, key, value, Return: string;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin

    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    RequestObject := LJsonArr.Items[0] as TJSONObject;

    status := RequestObject.GetValue('status').Value;
    table := RequestObject.GetValue('table').Value;
    field := RequestObject.GetValue('field').Value;
    key := RequestObject.GetValue('key').Value;
    value := RequestObject.GetValue('value').ToJSON;
    ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;

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
        SQL.Add('SELECT * FROM ' + table + ' WHERE ' + QGet.FieldByName('NAME').AsString + ' IS NULL ');
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
        SQL.Add('SELECT * FROM ' + table + ' WHERE ' + field + ' =:V1 ');
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

procedure TWebModule1.WebModule1saveOptinvoiAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, HF, LF, LV, S, docno, apcode: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data OPTINVOI
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    locat := RqObjectMaster.GetValue('locat').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key := RqObjectMaster.GetValue('key').Value;
    if table = 'OPTINVOI' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;

      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM OPTINVOI WHERE IDNO IS NULL ');
          Open;
        end;
        HF := 'H_RECVOP';
        LF := 'L_RECVOP';
        if not QDBConfig.Active then
        begin
          QDBConfig.ParamByName('LOCAT').AsString := locat;
          QDbconfig.Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('RECVDT').AsDateTime := StrToDate(RqObjectTran.GetValue('RECVDT').Value);
        if QDBConfig.Fieldbyname('R_RECVOP').asstring = 'Y' then
        begin
          LV := locat;
          DV := QPost.FieldByName('RECVDT').AsDateTime;
          QPost.FieldByName('RECVNO').AsString := RunNo(HF, LF, LV, DV);
        end
        else
        begin
          QPost.FieldByName('RECVNO').AsString := RqObjectTran.GetValue('RECVNO').Value;
        end;
        QPost.FieldByName('LOCAT').AsString       := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('INVNO').AsString       := RqObjectTran.GetValue('INVNO').Value;
        QPost.FieldByName('INVDT').AsDateTime     := StrToDate(RqObjectTran.GetValue('INVDT').Value);
        QPost.FieldByName('RVCODE').AsString      := RqObjectTran.GetValue('RVCODE').Value;
        QPost.FieldByName('APCODE').AsString      := RqObjectTran.GetValue('APCODE').Value;
        QPost.FieldByName('CREDTM').AsFloat       := StrToFloat(RqObjectTran.GetValue('CREDTM').Value);
        QPost.FieldByName('DUEDT').AsDateTime     := StrToDate(RqObjectTran.GetValue('DUEDT').Value);
        QPost.FieldByName('VATRT').AsFloat        := StrToFloat(RqObjectTran.GetValue('VATRT').Value);
        QPost.FieldByName('VATTYP').AsString      := RqObjectTran.GetValue('VATTYP').Value;
        QPost.FieldByName('TOTNETCOST').AsFloat   := StrToFloat(RqObjectTran.GetValue('TOTNETCOST').Value);
        QPost.FieldByName('TOTNETVAT').AsFloat    := StrToFloat(RqObjectTran.GetValue('TOTNETVAT').Value);
        QPost.FieldByName('TOTTOTALCOST').AsFloat := StrToFloat(RqObjectTran.GetValue('TOTTOTALCOST').Value);
        QPost.FieldByName('MEMO1').AsString       := RqObjectTran.GetValue('MEMO1').Value;
        QPost.FieldByName('TDISCT').AsFloat       := StrToFloat(RqObjectTran.GetValue('TDISCT').Value);
        QPost.FieldByName('TRANDISCT').AsFloat    := StrToFloat(RqObjectTran.GetValue('TRANDISCT').Value);
        QPost.FieldByName('SUMDISCT').AsFloat     := StrToFloat(RqObjectTran.GetValue('SUMDISCT').Value);
        QPost.FieldByName('RUN_IDNO').AsFloat     := StrToInt(RqObjectTran.GetValue('RUN_IDNO').Value);
        QPost.FieldByName('USERID').AsString      := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime   := Now;
        docno  := QPost.FieldByName('RECVNO').AsString;
        docdt  := QPost.FieldByName('RECVDT').AsDateTime;
        apcode := QPost.FieldByName('APCODE').AsString;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM OPTINVOI WHERE RECVNO =:V1 ');
          Params.ParamByName('V1').AsString := key;
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('RECVDT').AsDateTime    := StrToDate(RqObjectTran.GetValue('RECVDT').Value);
        QPost.FieldByName('LOCAT').AsString       := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('INVNO').AsString       := RqObjectTran.GetValue('INVNO').Value;
        QPost.FieldByName('INVDT').AsDateTime     := StrToDate(RqObjectTran.GetValue('INVDT').Value);
        QPost.FieldByName('RVCODE').AsString      := RqObjectTran.GetValue('RVCODE').Value;
        QPost.FieldByName('APCODE').AsString      := RqObjectTran.GetValue('APCODE').Value;
        QPost.FieldByName('CREDTM').AsFloat       := StrToFloat(RqObjectTran.GetValue('CREDTM').Value);
        QPost.FieldByName('DUEDT').AsDateTime     := StrToDate(RqObjectTran.GetValue('DUEDT').Value);
        QPost.FieldByName('VATRT').AsFloat        := StrToFloat(RqObjectTran.GetValue('VATRT').Value);
        QPost.FieldByName('VATTYP').AsString      := RqObjectTran.GetValue('VATTYP').Value;
        QPost.FieldByName('TOTNETCOST').AsFloat   := StrToFloat(RqObjectTran.GetValue('NETCST').Value);
        QPost.FieldByName('TOTNETVAT').AsFloat    := StrToFloat(RqObjectTran.GetValue('NETVAT').Value);
        QPost.FieldByName('TOTTOTALCOST').AsFloat := StrToFloat(RqObjectTran.GetValue('NETTOT').Value);
        QPost.FieldByName('MEMO1').AsString       := RqObjectTran.GetValue('MEMO1').Value;
        QPost.FieldByName('TDISCT').AsFloat       := StrToFloat(RqObjectTran.GetValue('TDISCT').Value);
        QPost.FieldByName('TRANDISCT').AsFloat    := StrToFloat(RqObjectTran.GetValue('TRANDISCT').Value);
        QPost.FieldByName('SUMDISCT').AsFloat     := StrToFloat(RqObjectTran.GetValue('SUMDISCT').Value);
        QPost.FieldByName('RUN_IDNO').AsFloat     := StrToInt(RqObjectTran.GetValue('RUN_IDNO').Value);
        docno  := QPost.FieldByName('RECVNO').AsString;
        docdt  := QPost.FieldByName('RECVDT').AsDateTime;
        apcode := QPost.FieldByName('APCODE').AsString;
      end;
    end;
    //Get Data OPTINVTRAN
    RqObjectMaster := LJsonArr.Items[1] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    if table = 'OPTINVTRAN' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      with QPost2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM OPTINVTRAN WHERE RECVNO =:V1 ');
        Params.ParamValues['V1'] := key;
        Open;
      end;
      //Delete record in old data
      QPost2.First;
      while not QPost2.Eof do
      begin
        K := 0;
        for J := 0 to ja.Count - 1 do
        begin
          RqObjectTran := ja.Items[J] as TJSONObject;
          if StrToInt(RqObjectTran.GetValue('IDNO').Value) = QPost2.FieldByName('IDNO').AsInteger then
          begin
            K := K + 1;
            break;
          end;
        end;
        if K = 0 then
          QPost2.Delete
        else
          QPost2.Next;
      end;
      //Edit old data and Insert new data
      for I := 0 to ja.Count - 1 do
      begin
        RqObjectTran := ja.Items[I] as TJSONObject;
        if QPost2.Locate('IDNO', RqObjectTran.GetValue('IDNO').Value, [loPartialKey]) then
        begin
          QPost2.Edit;
        end
        else
        begin
          QPost2.Append;
          QPost2.FieldByName('INPUTDT').AsDateTime := Now;
        end;
        QPost2.FieldByName('RECVNO').AsString    := docno;
        QPost2.FieldByName('RECVDT').AsDateTime  := docdt;
        QPost2.FieldByName('LOCAT').AsString     := RqObjectTran.GetValue('LOCAT').Value;
        QPost2.FieldByName('LOCATPART').AsString := RqObjectTran.GetValue('LOCATPART').Value;
        QPost2.FieldByName('OPTCODE').AsString   := RqObjectTran.GetValue('OPTCODE').Value;
        QPost2.FieldByName('QTY').AsFloat        := StrToFloat(RqObjectTran.GetValue('QTY').Value);
        QPost2.FieldByName('UCODE').AsString     := RqObjectTran.GetValue('UCODE').Value;
        QPost2.FieldByName('COSTQTY').AsFloat    := StrToFloat(RqObjectTran.GetValue('COSTQTY').Value);
        with Query1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM OPTMAST WHERE OPTCODE =:0 ');
          Params[0].AsString := RqObjectTran.GetValue('OPTCODE').Value;
          Open;
        end;
        QPost2.FieldByName('PRCQTY').AsFloat    := Query1.FieldByName('OPTPRC').AsFloat;
        QPost2.FieldByName('DISCT').AsFloat     := StrToFloat(RqObjectTran.GetValue('DISCT').Value);
        QPost2.FieldByName('NETCOST').AsFloat   := StrToFloat(RqObjectTran.GetValue('NETCOST').Value);
        QPost2.FieldByName('NETVAT').AsFloat    := StrToFloat(RqObjectTran.GetValue('NETVAT').Value);
        QPost2.FieldByName('TOTCOST').AsFloat   := StrToFloat(RqObjectTran.GetValue('TOTCOST').Value);
        QPost2.FieldByName('MU').AsFloat        := StrToFloat(RqObjectTran.GetValue('MU').Value);
        QPost2.FieldByName('MAINCOD').AsString  := RqObjectTran.GetValue('UCODE').Value;
        QPost2.FieldByName('TYPESTAT').AsString := RqObjectTran.GetValue('TYPESTAT').Value;
        QPost2.FieldByName('TYPESTK').AsString  := RqObjectTran.GetValue('TYPESTK').Value;
        QPost2.FieldByName('FLAG').AsString     := RqObjectTran.GetValue('FLAG').Value;
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
    Response.Content := '[{ "save": ' + Return + ', "recvno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1savePaymenttranferAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, key, value, Return, locat, HF, LF, LV, S, docno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data PAYMENTTRANFER
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    locat := RqObjectMaster.GetValue('locat').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    status := RqObjectMaster.GetValue('status').Value;
    key := RqObjectMaster.GetValue('key').Value;
    if table = 'PAYMENTTRANFER' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      if (status = 'insert') then
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM PAYMENTTRANFER WHERE IDNO IS NULL ');
          Open;
        end;
        HF := 'H_PAYMENTTRANFER';
        LF := 'L_PAYMENTTRANFER';
        if not QDBConfig.Active then
        begin
          QDBConfig.ParamByName('LOCAT').AsString := locat;
          QDbconfig.Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Append;
        QPost.FieldByName('CHQDT').AsDateTime := StrToDate(RqObjectTran.GetValue('CHQDT').Value);
        if QDBConfig.Fieldbyname('R_PAYMENTTRANFER').asstring = 'Y' then
        begin
          LV := locat;
          DV := QPost.FieldByName('CHQDT').AsDateTime;
          QPost.FieldByName('CHQNO').AsString := RunNo(HF, LF, LV, DV);
        end
        else
        begin
          QPost.FieldByName('CHQNO').AsString := RqObjectTran.GetValue('CHQNO').Value;
        end;
        QPost.FieldByName('LOCAT').AsString     := RqObjectTran.GetValue('LOCAT').Value;
        QPost.FieldByName('BOOKCODE').AsString  := RqObjectTran.GetValue('BOOKCODE').Value;
        QPost.FieldByName('CHQAMT').AsFloat     := StrToFloat(RqObjectTran.GetValue('CHQAMT').Value);
        QPost.FieldByName('OFFCHQ').AsString    := RqObjectTran.GetValue('OFFCHQ').Value;
        QPost.FieldByName('FLAG').AsString      := RqObjectTran.GetValue('FLAG').Value;
        QPost.FieldByName('ACC_CODE').AsString  := RqObjectTran.GetValue('ACC_CODE').Value;
        QPost.FieldByName('USERID').AsString    := RqObjectTran.GetValue('USERID').Value;
        QPost.FieldByName('INPUTDT').AsDateTime := Now;
        QPost.FieldByName('MEMO1').AsString     := RqObjectTran.GetValue('MEMO1').Value;
        docno := QPost.FieldByName('CHQNO').AsString;
        docdt := QPost.FieldByName('CHQDT').AsDateTime;
      end
      else
      begin
        with QPost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM PAYMENTTRANFER WHERE CHQNO = :V1 ');
          Params.ParamByName('V1').AsString := key;
          Open;
        end;
        RqObjectTran := ja.Items[0] as TJSONObject;
        //Convert data to record
        QPost.Edit;
        QPost.FieldByName('FLAG').AsString        := RqObjectTran.GetValue('FLAG').Value;
        if RqObjectTran.GetValue('FLAG').Value = 'C' then
        begin
          QPost.FieldByName('CANDT').AsDateTime   := Now;
          QPost.FieldByName('CANUSERID').AsString := RqObjectTran.GetValue('USERID').Value;
        end
        else
        begin
          QPost.FieldByName('CHQDT').AsDateTime   := StrToDate(RqObjectTran.GetValue('CHQDT').Value);
          QPost.FieldByName('LOCAT').AsString     := RqObjectTran.GetValue('LOCAT').Value;
          QPost.FieldByName('BOOKCODE').AsString  := RqObjectTran.GetValue('BOOKCODE').Value;
          QPost.FieldByName('CHQAMT').AsFloat     := StrToFloat(RqObjectTran.GetValue('CHQAMT').Value);
          QPost.FieldByName('OFFCHQ').AsString    := RqObjectTran.GetValue('OFFCHQ').Value;
          QPost.FieldByName('ACC_CODE').AsString  := RqObjectTran.GetValue('ACC_CODE').Value;
          QPost.FieldByName('MEMO1').AsString     := RqObjectTran.GetValue('MEMO1').Value;
        end;
        docno := QPost.FieldByName('CHQNO').AsString;
        docdt := QPost.FieldByName('CHQDT').AsDateTime;
      end;
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
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
    if QLastno.Active then
      QLastno.CommitUpdates;
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "save": ' + Return + ', "chqno": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1saveVatmastAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  ja, LJsonArr: TJSONArray;
  jo, RqObjectMaster, RqObjectTran: TJSONObject;
  status, table, value, Return, HF, LF, LV, S, docno: string;
  I, J, K: integer;
  DV, docdt: TdateTime;
begin
  Handled := True;
  if Request.MethodType = mtPost then
  begin
    LJsonArr := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Request.Content), 0) as TJSONArray;
    //Get Data CHQANOTHER
    RqObjectMaster := LJsonArr.Items[0] as TJSONObject;
    table := RqObjectMaster.GetValue('table').Value;
    value := RqObjectMaster.GetValue('value').ToJSON;
    if table = 'VATMAST' then
    begin
      ja := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(value), 0) as TJSONArray;
      with QPost do
      begin
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM VATMAST ');
        ExecSQL;
      end;
      with QPost do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM VATMAST WHERE IDNO IS NULL ');
        Open;
      end;
      RqObjectTran := ja.Items[0] as TJSONObject;
      //Convert data to record
      QPost.Append;
      QPost.FieldByName('FRMDATE').AsDateTime := StrToDate(RqObjectTran.GetValue('FRMDATE').Value);
      QPost.FieldByName('TODATE').AsDateTime  := StrToDate(RqObjectTran.GetValue('TODATE').Value);
      QPost.FieldByName('VATRT').AsFloat      := StrToFloat(RqObjectTran.GetValue('VATRT').Value);
      docno := '';
    end;

    //StartTransaction
    UniConnection1.StartTransaction;
    try
      if QPost.Active then
        QPost.ApplyUpdates;
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
    Return := 'true';
      //Response Data

    Response.ContentType := 'application/json;charset=UTF-8';
    Response.Content := '[{ "save": ' + Return + ', "vatrt": "' + docno + '" }]';
  end
  else
  begin
    Response.Content := Page404.Content;
  end;
end;

procedure TWebModule1.WebModule1sqltextAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Handled := True;
  case Request.MethodType of
    mtGet:
      SqlTextGet(Request, Response);
  else
    begin
      Response.Content := Page404.Content;
    end;
  end;
end;

procedure TWebModule1.WebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if FServerFunctionInvokerAction <> nil then
    FServerFunctionInvokerAction.Enabled := AllowServerFunctionInvoker;
end;

function TWebModule1.AllowServerFunctionInvoker: Boolean;
begin
  Result := (Request.RemoteAddr = '127.0.0.1') or (Request.RemoteAddr = '0:0:0:0:0:0:0:1') or (Request.RemoteAddr = '::1');
end;

procedure TWebModule1.WebFileDispatcher1BeforeDispatch(Sender: TObject; const AFileName: string; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
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


