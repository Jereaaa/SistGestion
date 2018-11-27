inherited frmDialogoVentaMultiplesMetPag: TfrmDialogoVentaMultiplesMetPag
  BorderStyle = bsDialog
  Caption = 'Multiples m'#233'todos de pago'
  ClientHeight = 396
  ClientWidth = 750
  OnShow = FormShow
  ExplicitWidth = 756
  ExplicitHeight = 424
  PixelsPerInch = 96
  TextHeight = 13
  object lblMetPag: TLabel
    Left = 231
    Top = 22
    Width = 82
    Height = 13
    Caption = 'M'#233'todo de pago:'
  end
  object lblMonto: TLabel
    Left = 460
    Top = 22
    Width = 34
    Height = 13
    Caption = 'Monto:'
  end
  object dblkcbbMetPag: TDBLookupComboBox
    Left = 199
    Top = 41
    Width = 147
    Height = 21
    KeyField = 'IDMETODO_PAGO'
    ListField = 'NOMBRE'
    ListSource = dsMetodosPago
    TabOrder = 0
  end
  object cxCurrencyEditMonto: TcxCurrencyEdit
    Left = 404
    Top = 41
    Hint = 'Monto'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TextHint = '$ 0,00'
    OnKeyDown = cxCurrencyEditMontoKeyDown
    Width = 147
  end
  object dbgrd1: TDBGrid
    Left = 78
    Top = 80
    Width = 593
    Height = 140
    DataSource = dsMetpag_Ventas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = dbgrd1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'FK_IDMETPAGO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'lookupTipo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FK_NRO_FACTURA_V'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lookupNombre'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUOTAS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COEF_HISTORICO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MontoFinal'
        Visible = True
      end>
  end
  object btnAgregar: TBitBtn
    Left = 629
    Top = 22
    Width = 42
    Height = 42
    Hint = 'Agregar'
    Glyph.Data = {
      36100000424D3610000000000000360000002800000020000000200000000100
      2000000000000010000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000D0000005700000099000000C8000000EA000000F9000000F90000
      00EA000000C800000099000000560000000C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000240000
      009C000000F5000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000F50000009A00000023000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000090000008A000000FB0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FA000000870000
      0008000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000024000000D2000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00D0000000220000000000000000000000000000000000000000000000000000
      0000000000000000000000000030000000EA000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000E80000002F00000000000000000000000000000000000000000000
      00000000000000000024000000EA000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000E800000022000000000000000000000000000000000000
      00000000000A000000D3000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000D0000000080000000000000000000000000000
      00000000008B000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000870000000000000000000000000000
      0025000000FB000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FA0000002300000000000000000000
      009D000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000009A000000000000000E0000
      00F6000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000F50000000C000000590000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000560000009C0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF00000099000000CB0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000C8000000EC0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000EA000000FA0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000F9000000FA0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000F9000000ED0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000EA000000CB0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000C80000009C0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000990000005A0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000570000000F0000
      00F7000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000F50000000D000000000000
      009F000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000009C00000000000000000000
      0027000000FC000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FB0000002400000000000000000000
      00000000008D000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF0000008A0000000000000000000000000000
      00000000000B000000D5000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000D2000000090000000000000000000000000000
      00000000000000000026000000EB000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000EA00000024000000000000000000000000000000000000
      0000000000000000000000000032000000EB000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000EA0000003000000000000000000000000000000000000000000000
      000000000000000000000000000000000026000000D5000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00D2000000240000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000A0000008D000000FC0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FB0000008B0000
      0009000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000270000
      009F000000F7000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000F60000009D00000025000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000E0000005A0000009C000000CB000000ED000000FA000000FA0000
      00EC000000CB0000009C000000590000000E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    Layout = blGlyphRight
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnAgregarClick
  end
  object btnCancelar: TBitBtn
    Left = 425
    Top = 344
    Width = 85
    Height = 34
    Anchors = [akBottom]
    Caption = 'Cancelar'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object btnAceptar: TBitBtn
    Left = 240
    Top = 344
    Width = 85
    Height = 34
    Anchors = [akBottom]
    Caption = 'Aceptar'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 5
    OnClick = btnAceptarClick
  end
  object grpTotales: TGroupBox
    Left = 425
    Top = 226
    Width = 246
    Height = 112
    TabOrder = 6
    object pnlTop: TPanel
      Left = 2
      Top = 15
      Width = 242
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        242
        30)
      object lblTotal: TLabel
        Left = 15
        Top = 0
        Width = 68
        Height = 13
        Hint = 'Total a pagar despues de impuestos y recargos'
        Alignment = taRightJustify
        Caption = 'Total a pagar:'
        ParentShowHint = False
        ShowHint = True
      end
      object cxdbcrncydtTOTAL: TcxDBCurrencyEdit
        Left = 120
        Top = 0
        Hint = 'Total a pagar despues de impuestos y recargos'
        Margins.Right = 15
        Anchors = [akTop, akRight]
        DataBinding.DataField = 'CalTotal'
        DataBinding.DataSource = dsVentas
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Width = 113
      end
    end
    object pnlClient: TPanel
      Left = 2
      Top = 45
      Width = 242
      Height = 28
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        242
        28)
      object lblTotalPagado: TLabel
        Left = 15
        Top = 0
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total pagado:'
      end
      object dbtxtTotalPagado: TDBText
        Left = 120
        Top = 0
        Width = 113
        Height = 17
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        DataSource = dsMetpag_Ventas
      end
    end
    object pnlBot: TPanel
      Left = 2
      Top = 73
      Width = 242
      Height = 37
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        242
        37)
      object lblTotalFinanciado: TLabel
        Left = 15
        Top = 0
        Width = 82
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total Financiado:'
      end
      object dbtxtTotalFinanciado: TDBText
        Left = 120
        Top = 0
        Width = 113
        Height = 20
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        DataSource = dsMetpag_Ventas
      end
    end
  end
  object btn1: TButton
    Left = 78
    Top = 226
    Width = 75
    Height = 25
    Caption = 'CalTotal'
    TabOrder = 7
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 78
    Top = 294
    Width = 75
    Height = 25
    Caption = 'Total Financiado'
    TabOrder = 8
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 78
    Top = 263
    Width = 75
    Height = 25
    Caption = 'Total Pagado'
    TabOrder = 9
    OnClick = btn3Click
  end
  object dsVentas: TDataSource
    DataSet = dmGestion.fdqryMDVentasRanged
    OnDataChange = dsVentasDataChange
    Left = 24
    Top = 8
  end
  object dsMetodosPago: TDataSource
    DataSet = dmGestion.fdqryMetodos_pago
    Left = 104
    Top = 8
  end
  object dsMetpag_Ventas: TDataSource
    DataSet = dmGestion.fdqryMetpago_Ventas
    OnDataChange = dsMetpag_VentasDataChange
    Left = 104
    Top = 64
  end
  object dsPlanesPago: TDataSource
    DataSet = dmGestion.fdqryPlanes_pago
    Left = 24
    Top = 64
  end
end
