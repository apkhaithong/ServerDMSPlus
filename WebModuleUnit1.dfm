object WebModule1: TWebModule1
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  Actions = <
    item
      Name = 'ReverseStringAction'
      PathInfo = '/ReverseString'
      Producer = ReverseString
    end
    item
      Name = 'ServerFunctionInvokerAction'
      PathInfo = '/ServerFunctionInvoker'
      Producer = ServerFunctionInvoker
    end
    item
      Name = 'DefaultAction'
      PathInfo = '/'
      OnAction = WebModuleDefaultAction
    end
    item
      Name = 'queryone'
      PathInfo = '/queryone'
      OnAction = WebModule1getdataAction
    end
    item
      Name = 'queryall'
      PathInfo = '/queryall'
      OnAction = WebModule1queryallAction
    end
    item
      Name = 'sqltext'
      PathInfo = '/sqltext'
      OnAction = WebModule1sqltextAction
    end
    item
      Name = 'invlocat'
      PathInfo = '/invlocat'
      OnAction = WebModule1invlocatAction
    end
    item
      Name = 'report'
      PathInfo = '/report'
      OnAction = WebModule1reportAction
    end
    item
      Name = 'export'
      PathInfo = '/export'
      OnAction = WebModule1exportAction
    end
    item
      Name = 'checklogin'
      PathInfo = '/checklogin'
      OnAction = WebModule1checkloginAction
    end
    item
      Name = 'duplicateCheck'
      PathInfo = '/duplicateCheck'
      OnAction = WebModule1duplicateCheckAction
    end
    item
      Name = 'saveOne'
      PathInfo = '/saveOne'
      OnAction = WebModule1saveOneAction
    end
    item
      Name = 'saveAll'
      PathInfo = '/saveAll'
      OnAction = WebModule1saveAllAction
    end
    item
      Name = 'delete'
      PathInfo = '/delete'
      OnAction = WebModule1deleteAction
    end
    item
      Default = True
      Name = 'login'
      PathInfo = '/login'
      Producer = login
    end
    item
      Name = 'index'
      PathInfo = '/index'
      Producer = Index
    end
    item
      Name = 'stk_onhand'
      PathInfo = '/stk_onhand'
      Producer = stk_onhand
    end
    item
      Name = 'sale_customer'
      PathInfo = '/sale_customer'
      Producer = sale_customer
    end
    item
      Name = 'sale_prospect'
      PathInfo = '/sale_prospect'
      Producer = sale_prospect
    end
    item
      Name = 'stk_onhanddate'
      PathInfo = '/stk_onhanddate'
      Producer = stk_onhanddate
    end
    item
      Name = 'stk_stockcard'
      PathInfo = '/stk_stockcard'
      Producer = stk_stockcard
    end
    item
      Name = 'rp_receiptdaily'
      PathInfo = '/rp_receiptdaily'
      Producer = rp_receiptdaily
    end
    item
      Name = 'set_settype'
      PathInfo = '/set_settype'
      Producer = set_settype
    end
    item
      Name = 'set_setmodel'
      PathInfo = '/set_setmodel'
      Producer = set_setmodel
    end
    item
      Name = 'set_setbaab'
      PathInfo = '/set_setbaab'
      Producer = set_setbaab
    end
    item
      Name = 'set_setcolor'
      PathInfo = '/set_setcolor'
      Producer = set_setcolor
    end
    item
      Name = 'set_setgroup'
      PathInfo = '/set_setgroup'
      Producer = set_setgroup
    end
    item
      Name = 'set_regflag'
      PathInfo = '/set_regflag'
      Producer = set_regflag
    end
    item
      Name = 'set_optmast'
      PathInfo = '/set_optmast'
      Producer = set_optmast
    end
    item
      Name = 'set_optmastlocat'
      PathInfo = '/set_optmastlocat'
      Producer = set_optmastlocat
    end
    item
      Name = 'set_setmod'
      PathInfo = '/set_setmod'
      Producer = set_setmod
    end
    item
      Name = 'set_modmast'
      PathInfo = '/set_modmast'
      Producer = set_modmast
    end
    item
      Name = 'set_setfleet'
      PathInfo = '/set_setfleet'
      Producer = set_setfleet
    end
    item
      Name = 'set_bookingstatus'
      PathInfo = '/set_bookingstatus'
      Producer = set_bookingstatus
    end
    item
      Name = 'set_typcont'
      PathInfo = '/set_typcont'
      Producer = set_typcont
    end
    item
      Name = 'set_typhold'
      PathInfo = '/set_typhold'
      Producer = set_typhold
    end
    item
      Name = 'set_argroup'
      PathInfo = '/set_argroup'
      Producer = set_argroup
    end
    item
      Name = 'set_typlost'
      PathInfo = '/set_typlost'
      Producer = set_typlost
    end
    item
      Name = 'set_setgrade'
      PathInfo = '/set_setgrade'
      Producer = set_setgrade
    end
    item
      Name = 'set_setaump'
      PathInfo = '/set_setaump'
      Producer = set_setaump
    end
    item
      Name = 'set_setprov'
      PathInfo = '/set_setprov'
      Producer = set_setprov
    end
    item
      Name = 'set_paytyp'
      PathInfo = '/set_paytyp'
      Producer = set_paytyp
    end
    item
      Name = 'set_payfor'
      PathInfo = '/set_payfor'
      Producer = set_payfor
    end
    item
      Name = 'set_setbank'
      PathInfo = '/set_setbank'
      Producer = set_setbank
    end
    item
      Name = 'set_bankbook'
      PathInfo = '/set_bankbook'
      Producer = set_bankbook
    end
    item
      Name = 'set_rtchq'
      PathInfo = '/set_rtchq'
      Producer = set_rtchq
    end
    item
      Name = 'set_paydue'
      PathInfo = '/set_paydue'
      Producer = set_paydue
    end
    item
      Name = 'set_setacti'
      PathInfo = '/set_setacti'
      Producer = set_setacti
    end
    item
      Name = 'set_setreson'
      PathInfo = '/set_setreson'
      Producer = set_setreson
    end>
  BeforeDispatch = WebModuleBeforeDispatch
  Height = 589
  Width = 1052
  object DSServer1: TDSServer
    Left = 64
    Top = 11
  end
  object DSHTTPWebDispatcher1: TDSHTTPWebDispatcher
    Server = DSServer1
    Filters = <>
    WebDispatch.PathInfo = 'datasnap*'
    Left = 64
    Top = 75
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 184
    Top = 11
  end
  object ServerFunctionInvoker: TPageProducer
    HTMLFile = 'Templates\ServerFunctionInvoker.html'
    OnHTMLTag = ServerFunctionInvokerHTMLTag
    Left = 64
    Top = 144
  end
  object ReverseString: TPageProducer
    HTMLFile = 'templates\ReverseString.html'
    OnHTMLTag = ServerFunctionInvokerHTMLTag
    Left = 152
    Top = 144
  end
  object DSProxyGenerator1: TDSProxyGenerator
    ExcludeClasses = 'DSMetadata'
    MetaDataProvider = DSServerMetaDataProvider1
    Writer = 'Java Script REST'
    Left = 312
    Top = 16
  end
  object DSServerMetaDataProvider1: TDSServerMetaDataProvider
    Server = DSServer1
    Left = 312
    Top = 75
  end
  object Index: TPageProducer
    HTMLFile = 'templates\index.html'
    Left = 232
    Top = 144
  end
  object WebFileDispatcher1: TWebFileDispatcher
    WebFileExtensions = <
      item
        MimeType = 'text/css'
        Extensions = 'css'
      end
      item
        MimeType = 'text/javascript'
        Extensions = 'js'
      end
      item
        MimeType = 'image/x-png'
        Extensions = 'png'
      end
      item
        MimeType = 'text/html'
        Extensions = 'htm;html'
      end
      item
        MimeType = 'image/jpeg'
        Extensions = 'jpg;jpeg;jpe'
      end
      item
        MimeType = 'image/gif'
        Extensions = 'gif'
      end
      item
        MimeType = 'application/vnd.ms-fontobject'
        Extensions = 'eot'
      end
      item
        MimeType = 'image/svg+xml'
        Extensions = 'svg;svgz'
      end
      item
        MimeType = 'application/font-sfnt'
        Extensions = 'ttf'
      end
      item
        MimeType = 'application/font-woff'
        Extensions = 'woff'
      end
      item
        MimeType = 'application/font-woff2'
        Extensions = 'woff2'
      end>
    BeforeDispatch = WebFileDispatcher1BeforeDispatch
    WebDirectories = <
      item
        DirectoryAction = dirInclude
        DirectoryMask = '*'
      end
      item
        DirectoryAction = dirExclude
        DirectoryMask = '\templates\*'
      end>
    RootDirectory = '.'
    Left = 184
    Top = 75
  end
  object UniConnection1: TUniConnection
    AutoCommit = False
    ProviderName = 'DB2'
    Port = 50000
    Database = 'TCHUMP'
    Username = 'sn'
    Server = 'localhost'
    LoginPrompt = False
    BeforeConnect = UniConnection1BeforeConnect
    Left = 424
    Top = 16
    EncryptedPassword = '8CFF91FFBFFFC6FFC6FF'
  end
  object DB2UniProvider1: TDB2UniProvider
    Left = 424
    Top = 72
  end
  object UniTransaction1: TUniTransaction
    DefaultConnection = UniConnection1
    Left = 701
    Top = 16
  end
  object QGet: TUniQuery
    Connection = UniConnection1
    Transaction = UniTransaction1
    SQL.Strings = (
      'select * from setgroup')
    Left = 512
    Top = 16
  end
  object QPost: TUniQuery
    Connection = UniConnection1
    Transaction = UniTransaction1
    CachedUpdates = True
    Left = 592
    Top = 16
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42660.609193634300000000
    ReportOptions.LastChange = 42660.619422743050000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    ShowProgress = False
    OnGetValue = frxReport1GetValue
    Left = 877
    Top = 16
    Datasets = <
      item
        DataSet = frxReport1.UniDACQuery1
        DataSetName = 'UniDACQuery1'
      end>
    Variables = <
      item
        Name = ' String'
        Value = Null
      end
      item
        Name = 'VLOCAT'
        Value = Null
      end
      item
        Name = 'VPAYFOR'
        Value = Null
      end
      item
        Name = 'VPAYTYP'
        Value = Null
      end
      item
        Name = ' Date'
        Value = Null
      end
      item
        Name = 'VFDATE'
        Value = Null
      end
      item
        Name = 'VTDATE'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
      object UniDACQuery1: TfrxUniDACQuery
        UserName = 'UniDACQuery1'
        CloseDataSource = True
        BCDToCurrency = False
        IgnoreDupParams = False
        Params = <
          item
            Name = 'VLOCAT'
            DataType = ftString
            Expression = '<VLOCAT>'
          end
          item
            Name = 'VFDATE'
            DataType = ftDate
            Expression = '<VFDATE>'
          end
          item
            Name = 'VTDATE'
            DataType = ftDate
            Expression = '<VTDATE>'
          end
          item
            Name = 'VPAYFOR'
            DataType = ftString
            Expression = '<VPAYFOR>'
          end
          item
            Name = 'VPAYTYP'
            DataType = ftString
            Expression = '<VPAYTYP>'
          end>
        SQL.Strings = (
          
            'SELECT E.PAYFOR,A.MEMO1,A.LOCATRECV,A.TMBILL,A.BILLNO,A.TMBILDT,' +
            'E.CONTNO,A.CUSCOD,A.PAYTYP,'
          
            'E.PAYAMT,E.DISCT,E.NETPAY,E.USERID,E.INPUTDT,E.FLAG,E.TSALE,A.CH' +
            'QNO,'
          'B.SNAM,B.NAME1,B.NAME2,D.FORDESC'
          'FROM CHQMAS A,CHQTRAN E,CUSTMAST B,PAYFOR D'
          'WHERE A.IDNO=E.CHQMASID '
          'AND A.CUSCOD=B.CUSCOD '
          'AND E.PAYFOR=D.FORCODE '
          'AND (A.LOCATRECV LIKE:VLOCAT) '
          'AND A.TMBILDT BETWEEN :VFDATE AND :VTDATE          '
          'AND E.PAYFOR LIKE :VPAYFOR                '
          'AND A.PAYTYP LIKE :VPAYTYP             '
          'ORDER BY A.BILLNO,A.TMBILDT  ')
        pLeft = 88
        pTop = 52
        Parameters = <
          item
            Name = 'VLOCAT'
            DataType = ftString
            Expression = '<VLOCAT>'
          end
          item
            Name = 'VFDATE'
            DataType = ftDate
            Expression = '<VFDATE>'
          end
          item
            Name = 'VTDATE'
            DataType = ftDate
            Expression = '<VTDATE>'
          end
          item
            Name = 'VPAYFOR'
            DataType = ftString
            Expression = '<VPAYFOR>'
          end
          item
            Name = 'VPAYTYP'
            DataType = ftString
            Expression = '<VPAYTYP>'
          end>
      end
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo4: TfrxMemoView
          Align = baWidth
          Top = 1.889773550000001000
          Width = 1046.929810000000000000
          Height = 37.795282910000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #3619#3634#3618#3591#3634#3609#3585#3634#3619#3633#3610#3594#3635#3619#3632#3611#3619#3632#3592#3635#3623#3633#3609)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Top = 64.252009999999990000
          Width = 56.692950000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #3621#3635#3604#3633#3610#3607#3637#3656)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 60.472480000000000000
          Top = 64.252009999999990000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #3648#3621#3586#3607#3637#3656#3651#3610#3619#3633#3610#3648#3591#3636#3609)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 170.078850000000000000
          Top = 64.252009999999990000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #3623#3633#3609#3607#3637#3656#3651#3610#3619#3633#3610)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 279.685220000000000000
          Top = 64.252009999999990000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #3648#3621#3586#3607#3637#3656#3626#3633#3597#3597#3634)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 389.291590000000000000
          Top = 64.252009999999990000
          Width = 272.126160000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #3594#3639#3656#3629' - '#3609#3634#3617#3626#3585#3640#3621)
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end>
        end
        object Memo14: TfrxMemoView
          Left = 661.417750000000000000
          Top = 64.252009999999990000
          Width = 56.692950000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #3594#3635#3619#3632#3650#3604#3618)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 729.449290000000000000
          Top = 64.252009999999990000
          Width = 204.094620000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #3594#3635#3619#3632#3588#3656#3634)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 937.323440000000000000
          Top = 64.252009999999990000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #3592#3635#3609#3623#3609#3648#3591#3636#3609)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 986.457330000000000000
          Top = 41.795300000000020000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Angsana New'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #3627#3609#3657#3634' [<Page#>] / [<TotalPages#>]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 62.472479999999990000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Align = baWidth
          Top = 90.708719999999950000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 170.078850000000000000
        Width = 1046.929810000000000000
        DataSet = frxReport1.UniDACQuery1
        DataSetName = 'UniDACQuery1'
        RowCount = 0
        object UniDACQuery1GCODE: TfrxMemoView
          Width = 56.692950000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = []
          Memo.UTF8W = (
            '[Line#]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 60.472480000000000000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataField = 'TMBILL'
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = []
          Memo.UTF8W = (
            '[UniDACQuery1."TMBILL"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 170.078850000000000000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataField = 'TMBILDT'
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = []
          Memo.UTF8W = (
            '[UniDACQuery1."TMBILDT"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 279.685220000000000000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataField = 'CONTNO'
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = []
          Memo.UTF8W = (
            '[UniDACQuery1."CONTNO"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 389.291590000000000000
          Width = 272.126160000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = []
          Memo.UTF8W = (
            
              '[UniDACQuery1."SNAM"][UniDACQuery1."NAME1"]   [UniDACQuery1."NAM' +
              'E2"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 661.417750000000000000
          Width = 56.692950000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataField = 'PAYTYP'
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = []
          Memo.UTF8W = (
            '[UniDACQuery1."PAYTYP"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 729.449290000000000000
          Width = 204.094620000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataField = 'FORDESC'
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = []
          Memo.UTF8W = (
            '[UniDACQuery1."FORDESC"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 937.323440000000000000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          DataField = 'PAYAMT'
          DataSet = frxReport1.UniDACQuery1
          DataSetName = 'UniDACQuery1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '#,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Angsana New'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[UniDACQuery1."PAYAMT"]')
          ParentFont = False
        end
      end
    end
  end
  object frxUniDACComponents1: TfrxUniDACComponents
    DefaultDatabase = UniConnection1
    Left = 701
    Top = 72
  end
  object frxUserDataSet1: TfrxUserDataSet
    UserName = 'frxUserDataSet1'
    Left = 877
    Top = 72
  end
  object frxXLSXExport1: TfrxXLSXExport
    ShowDialog = False
    UseFileCache = False
    ShowProgress = False
    OverwritePrompt = False
    DataOnly = False
    ChunkSize = 0
    PictureType = gpPNG
    Wysiwyg = False
    Left = 981
    Top = 72
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = QGet
    BCDToCurrency = False
    Left = 805
    Top = 72
  end
  object frxPDFExport1: TfrxPDFExport
    ShowDialog = False
    UseFileCache = True
    ShowProgress = False
    OverwritePrompt = False
    DataOnly = False
    EmbeddedFonts = True
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 981
    Top = 16
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 805
    Top = 16
  end
  object Page404: TPageProducer
    HTMLFile = 'templates\pages.404.html'
    Left = 304
    Top = 144
  end
  object stk_onhand: TPageProducer
    HTMLFile = 'templates\stk_onhand.html'
    Left = 48
    Top = 400
  end
  object sale_customer: TPageProducer
    HTMLFile = 'templates\sale_customer.html'
    Left = 48
    Top = 464
  end
  object sale_prospect: TPageProducer
    HTMLFile = 'templates\sale_prospect.html'
    Left = 136
    Top = 464
  end
  object stk_onhanddate: TPageProducer
    HTMLFile = 'templates\stk_onhanddate.html'
    Left = 136
    Top = 400
  end
  object stk_stockcard: TPageProducer
    HTMLFile = 'templates\stk_stockcard.html'
    Left = 216
    Top = 400
  end
  object rp_receiptdaily: TPageProducer
    HTMLFile = 'templates\rp_receiptdaily.html'
    Left = 48
    Top = 520
  end
  object login: TPageProducer
    HTMLFile = 'templates\login.html'
    Left = 368
    Top = 144
  end
  object set_settype: TPageProducer
    HTMLFile = 'templates\set_settype.html'
    Left = 64
    Top = 208
  end
  object set_setmodel: TPageProducer
    HTMLFile = 'templates\set_setmodel.html'
    Left = 144
    Top = 208
  end
  object set_setbaab: TPageProducer
    HTMLFile = 'templates\set_setbaab.html'
    Left = 225
    Top = 208
  end
  object set_setgroup: TPageProducer
    HTMLFile = 'templates\set_setgroup.html'
    Left = 386
    Top = 208
  end
  object set_setcolor: TPageProducer
    HTMLFile = 'templates\set_setcolor.html'
    Left = 306
    Top = 208
  end
  object DataSource1: TDataSource
    DataSet = QPost
    Left = 701
    Top = 128
  end
  object set_regflag: TPageProducer
    HTMLFile = 'templates\set_regflag.html'
    Left = 467
    Top = 208
  end
  object set_optmast: TPageProducer
    HTMLFile = 'templates\set_optmast.html'
    Left = 548
    Top = 208
  end
  object set_optmastlocat: TPageProducer
    HTMLFile = 'templates\set_optmastlocat.html'
    Left = 629
    Top = 208
  end
  object set_setmod: TPageProducer
    HTMLFile = 'templates\set_setmod.html'
    Left = 709
    Top = 208
  end
  object set_modmast: TPageProducer
    HTMLFile = 'templates\set_modmast.html'
    Left = 790
    Top = 208
  end
  object set_setfleet: TPageProducer
    HTMLFile = 'templates\set_setfleet.html'
    Left = 871
    Top = 208
  end
  object set_bookingstatus: TPageProducer
    HTMLFile = 'templates\set_bookingstatus.html'
    Left = 952
    Top = 208
  end
  object set_typcont: TPageProducer
    HTMLFile = 'templates\set_typcont.html'
    Left = 64
    Top = 264
  end
  object set_typhold: TPageProducer
    HTMLFile = 'templates\set_typhold.html'
    Left = 144
    Top = 264
  end
  object set_argroup: TPageProducer
    HTMLFile = 'templates\set_argroup.html'
    Left = 225
    Top = 264
  end
  object set_setgrade: TPageProducer
    HTMLFile = 'templates\set_setgrade.html'
    Left = 386
    Top = 264
  end
  object set_typlost: TPageProducer
    HTMLFile = 'templates\set_typlost.html'
    Left = 306
    Top = 264
  end
  object set_setaump: TPageProducer
    HTMLFile = 'templates\set_setaump.html'
    Left = 467
    Top = 264
  end
  object set_setprov: TPageProducer
    HTMLFile = 'templates\set_setprov.html'
    Left = 548
    Top = 264
  end
  object set_paytyp: TPageProducer
    HTMLFile = 'templates\set_paytyp.html'
    Left = 629
    Top = 264
  end
  object set_payfor: TPageProducer
    HTMLFile = 'templates\set_payfor.html'
    Left = 709
    Top = 264
  end
  object set_setbank: TPageProducer
    HTMLFile = 'templates\set_setbank.html'
    Left = 790
    Top = 264
  end
  object set_bankbook: TPageProducer
    HTMLFile = 'templates\set_bankbook.html'
    Left = 871
    Top = 264
  end
  object set_rtchq: TPageProducer
    HTMLFile = 'templates\set_rtchq.html'
    Left = 952
    Top = 264
  end
  object set_paydue: TPageProducer
    HTMLFile = 'templates\set_paydue.html'
    Left = 64
    Top = 320
  end
  object set_setacti: TPageProducer
    HTMLFile = 'templates\set_setacti.html'
    Left = 144
    Top = 320
  end
  object set_setreson: TPageProducer
    HTMLFile = 'templates\set_setreson.html'
    Left = 225
    Top = 320
  end
  object PageProducer4: TPageProducer
    HTMLFile = 'templates\set_setgrade.html'
    Left = 386
    Top = 320
  end
  object PageProducer5: TPageProducer
    HTMLFile = 'templates\set_typlost.html'
    Left = 306
    Top = 320
  end
  object PageProducer6: TPageProducer
    HTMLFile = 'templates\set_setaump.html'
    Left = 467
    Top = 320
  end
  object PageProducer7: TPageProducer
    HTMLFile = 'templates\set_setprov.html'
    Left = 548
    Top = 320
  end
  object PageProducer8: TPageProducer
    HTMLFile = 'templates\set_paytyp.html'
    Left = 629
    Top = 320
  end
  object PageProducer9: TPageProducer
    HTMLFile = 'templates\set_payfor.html'
    Left = 709
    Top = 320
  end
  object PageProducer10: TPageProducer
    HTMLFile = 'templates\set_setbank.html'
    Left = 790
    Top = 320
  end
  object PageProducer11: TPageProducer
    HTMLFile = 'templates\set_bankbook.html'
    Left = 871
    Top = 320
  end
  object PageProducer12: TPageProducer
    HTMLFile = 'templates\set_rtchq.html'
    Left = 952
    Top = 320
  end
  object QPost1: TUniQuery
    Connection = UniConnection1
    Transaction = UniTransaction1
    CachedUpdates = True
    Left = 592
    Top = 72
  end
  object QPost2: TUniQuery
    Connection = UniConnection1
    Transaction = UniTransaction1
    CachedUpdates = True
    Left = 592
    Top = 128
  end
end
