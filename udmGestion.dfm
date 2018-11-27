object dmGestion: TdmGestion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 474
  Width = 758
  object fdqryClientes: TFDQuery
    OnCalcFields = fdqryClientesCalcFields
    OnReconcileError = fdqryClientesReconcileError
    Connection = GestionConnection
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_IDCLIENTE'
    UpdateOptions.KeyFields = 'ID_CLIENTE'
    UpdateOptions.AutoIncFields = 'ID_CLIENTE'
    SQL.Strings = (
      'SELECT * FROM CLIENTES'
      'ORDER BY ID_CLIENTE'
      '')
    Left = 76
    Top = 137
    object intgrfldClientesID_CLIENTE: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object strngfldClientesNOMBRE: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Origin = 'NOMBRE'
      Size = 25
    end
    object strngfldClientesAPELLIDO: TStringField
      DisplayLabel = 'Apellido'
      FieldName = 'APELLIDO'
      Origin = 'APELLIDO'
      Size = 25
    end
    object strngfldClientesDOMICILIO: TStringField
      DisplayLabel = 'Domicilio'
      FieldName = 'DOMICILIO'
      Origin = 'DOMICILIO'
      Size = 40
    end
    object strngfldClientesLOCALIDAD: TStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Origin = 'LOCALIDAD'
      Size = 40
    end
    object strngfldClientesPROVINCIA: TStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Origin = 'PROVINCIA'
      Size = 40
    end
    object strngfldClientesDNI: TStringField
      FieldName = 'DNI'
      Origin = 'DNI'
      Size = 9
    end
    object strngfldClientesCUIT: TStringField
      FieldName = 'CUIT'
      Origin = 'CUIT'
      Size = 11
    end
    object strngfldClientesTELEFONO: TStringField
      DisplayLabel = 'Tel'#233'fono'#13#10
      FieldName = 'TELEFONO'
      Origin = 'TELEFONO'
      Size = 15
    end
    object strngfldClientesMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'MAIL'
      Origin = 'MAIL'
      Size = 40
    end
    object intgrfldClientesFK_SITUACIONTRIB: TIntegerField
      FieldName = 'FK_SITUACIONTRIB'
      Origin = 'FK_SITUACIONTRIB'
      Required = True
    end
    object strngfldClientesLookupSituacionTrib: TStringField
      DisplayLabel = 'Situaci'#243'n Tributaria'
      FieldKind = fkLookup
      FieldName = 'LookupSituacionTrib'
      LookupDataSet = fdqrySituaciones_tributarias
      LookupKeyFields = 'ID_SITUACIONTRIB'
      LookupResultField = 'NOMBRE'
      KeyFields = 'FK_SITUACIONTRIB'
      Size = 25
      Lookup = True
    end
    object strngfldClientesTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object strngfldClientesRAZON_SOCIAL: TStringField
      DisplayLabel = 'Raz'#243'n social'
      FieldName = 'RAZON_SOCIAL'
      Origin = 'RAZON_SOCIAL'
      Size = 40
    end
    object strngfldClientesNOMBRE_COMERCIAL: TStringField
      DisplayLabel = 'Nombre comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Origin = 'NOMBRE_COMERCIAL'
      Size = 50
    end
    object strngfldClientesNOMBRECOMP: TStringField
      DisplayLabel = 'Nombre completo'
      FieldKind = fkCalculated
      FieldName = 'NOMBRECOMP'
      Size = 52
      Calculated = True
    end
  end
  object fdqrySituaciones_tributarias: TFDQuery
    OnReconcileError = fdqrySituaciones_tributariasReconcileError
    Connection = GestionConnection
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_IDSITUACIONTRIB'
    UpdateOptions.KeyFields = 'ID_SITUACIONTRIB'
    UpdateOptions.AutoIncFields = 'ID_SITUACIONTRIB'
    SQL.Strings = (
      'SELECT * FROM SITUACIONES_TRIBUTARIAS')
    Left = 79
    Top = 197
    object intgrfldSituaciones_tributariasTableID_SITUACIONTRIB: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_SITUACIONTRIB'
      Origin = 'ID_SITUACIONTRIB'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object strngfldSituaciones_tributariasTableNOMBRE: TStringField
      DisplayLabel = 'Situaci'#243'n Tributaria'
      FieldName = 'NOMBRE'
      Origin = 'NOMBRE'
      Size = 25
    end
  end
  object GestionConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=Gestion')
    Connected = True
    LoginPrompt = False
    Left = 31
    Top = 18
  end
  object fdqryProveedores: TFDQuery
    OnReconcileError = fdqryProveedoresReconcileError
    Connection = GestionConnection
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_IDPROVEEDOR'
    UpdateOptions.KeyFields = 'ID_PROVEEDOR'
    UpdateOptions.AutoIncFields = 'ID_PROVEEDOR'
    SQL.Strings = (
      'SELECT * FROM PROVEEDORES')
    Left = 167
    Top = 139
    object intgrfldProveedoresID_PROVEEDOR: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_PROVEEDOR'
      Origin = 'ID_PROVEEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object strngfldProveedoresNOMBRE: TStringField
      DisplayLabel = 'Nombre comercial'
      FieldName = 'NOMBRE'
      Origin = 'NOMBRE'
      Size = 51
    end
    object strngfldProveedoresDOMICILIO: TStringField
      DisplayLabel = 'Domicilio'
      FieldName = 'DOMICILIO'
      Origin = 'DOMICILIO'
      Size = 40
    end
    object strngfldProveedoresLOCALIDAD: TStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Origin = 'LOCALIDAD'
      Size = 40
    end
    object strngfldProveedoresPROVINCIA: TStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Origin = 'PROVINCIA'
      Size = 40
    end
    object strngfldProveedoresCUIT: TStringField
      FieldName = 'CUIT'
      Origin = 'CUIT'
      Size = 11
    end
    object strngfldProveedoresTELEFONO: TStringField
      DisplayLabel = 'Tel'#233'fono'
      FieldName = 'TELEFONO'
      Origin = 'TELEFONO'
      Size = 15
    end
    object strngfldProveedoresMAIL: TStringField
      DisplayLabel = 'Email'#13#10
      FieldName = 'MAIL'
      Origin = 'MAIL'
      Size = 40
    end
    object intgrfldProveedoresFK_SITUACIONTRIB: TIntegerField
      FieldName = 'FK_SITUACIONTRIB'
      Origin = 'FK_SITUACIONTRIB'
      Required = True
    end
    object strngfldProveedoresLookupSituacionTrib: TStringField
      DisplayLabel = 'Situaci'#243'n Tributaria'
      FieldKind = fkLookup
      FieldName = 'LookupSituacionTrib'
      LookupDataSet = fdqrySituaciones_tributarias
      LookupKeyFields = 'ID_SITUACIONTRIB'
      LookupResultField = 'NOMBRE'
      KeyFields = 'FK_SITUACIONTRIB'
      Size = 25
      Lookup = True
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrDefault
    Left = 592
    Top = 48
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 
      'C:\Users\Jeremias\Desktop\Proyecto\Proyecto Sistema de Gestion\S' +
      'oftware\fbclient.dll'
    Left = 488
    Top = 48
  end
  object fdqryArticulos: TFDQuery
    BeforePost = fdqryArticulosBeforePost
    OnNewRecord = fdqryArticulosNewRecord
    OnReconcileError = fdqryArticulosReconcileError
    Connection = GestionConnection
    UpdateOptions.AssignedValues = [uvGeneratorName]
    SQL.Strings = (
      'SELECT * FROM ARTICULOS')
    Left = 71
    Top = 74
    object strngfldArticulosCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object strngfldArticulosCODIGOALT: TStringField
      DisplayLabel = 'C'#243'digo alternativo'
      FieldName = 'CODIGOALT'
      Origin = 'CODIGOALT'
      Size = 10
    end
    object strngfldArticulosNOMBRE: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Origin = 'NOMBRE'
      Size = 25
    end
    object strngfldArticulosDESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Origin = 'DESCRIPCION'
      Size = 80
    end
    object bcdfldArticulosCOSTO: TBCDField
      DefaultExpression = '0'
      DisplayLabel = 'Costo'
      FieldName = 'COSTO'
      Origin = 'COSTO'
      currency = True
      Precision = 18
      Size = 2
    end
    object bcdfldArticulosPRECIO: TBCDField
      DefaultExpression = '0'
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      Origin = 'PRECIO'
      currency = True
      Precision = 18
      Size = 2
    end
    object crncyfldArticulosIVA: TCurrencyField
      DefaultExpression = '0'
      DisplayLabel = 'I.V.A.'
      FieldName = 'IVA'
      Origin = 'IVA'
      DisplayFormat = '##0.00 %'
      currency = False
    end
    object intgrfldArticulosFK_IDPROVEEDOR: TIntegerField
      FieldName = 'FK_IDPROVEEDOR'
      Origin = 'FK_IDPROVEEDOR'
    end
    object strngfldArticuloslookupProveedor: TStringField
      DisplayLabel = 'Proveedor'
      FieldKind = fkLookup
      FieldName = 'lookupProveedor'
      LookupDataSet = fdqryProveedores
      LookupKeyFields = 'ID_PROVEEDOR'
      LookupResultField = 'NOMBRE'
      KeyFields = 'FK_IDPROVEEDOR'
      Size = 51
      Lookup = True
    end
  end
  object spProximo_id_ART: TFDStoredProc
    Connection = GestionConnection
    StoredProcName = 'SP_PROXIMO_ID'
    Left = 162
    Top = 76
    ParamData = <
      item
        Position = 1
        Name = 'TIPO'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
        Size = 15
      end
      item
        Position = 2
        Name = 'VALOR'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptOutput
        Size = 10
      end>
  end
  object fdqryMetodos_pago: TFDQuery
    OnReconcileError = fdqryMetodos_pagoReconcileError
    Connection = GestionConnection
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_METODO_PAGO'
    UpdateOptions.KeyFields = 'IDMETODO_PAGO'
    UpdateOptions.AutoIncFields = 'IDMETODO_PAGO'
    SQL.Strings = (
      'SELECT * FROM METODOS_PAGO')
    Left = 67
    Top = 261
    object intgrfldMetodos_pagoIDMETODO_PAGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'IDMETODO_PAGO'
      Origin = 'IDMETODO_PAGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object strngfldMetodos_pagoNOMBRE: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Origin = 'NOMBRE'
      Size = 25
    end
    object crncyfldMetodos_pagoRETENCION: TCurrencyField
      Alignment = taCenter
      DisplayLabel = 'Retenci'#243'n'
      FieldName = 'RETENCION'
      Origin = 'RETENCION'
      DisplayFormat = '##0.00 %'
      currency = False
    end
    object strngfldMetodos_pagoTIPO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
  end
  object fdqryPlanes_pago: TFDQuery
    CachedUpdates = True
    OnReconcileError = fdqryPlanes_pagoReconcileError
    Connection = GestionConnection
    UpdateOptions.AssignedValues = [uvGeneratorName, uvAutoCommitUpdates]
    UpdateOptions.GeneratorName = 'GEN_IDPLAN_PAGO'
    UpdateOptions.KeyFields = 'IDPLAN_PAGO'
    UpdateOptions.AutoIncFields = 'IDPLAN_PAGO'
    SQL.Strings = (
      'SELECT * FROM PLANES_PAGO'
      'ORDER BY NROCUOTA ASCENDING;')
    Left = 62
    Top = 330
    object intgrfldPlanes_pagoIDPLAN_PAGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'IDPLAN_PAGO'
      Origin = 'IDPLAN_PAGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdqryPlanes_pagoNROCUOTA: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Nro de Cuota'
      FieldName = 'NROCUOTA'
      Origin = 'NROCUOTA'
    end
    object fdqryPlanes_pagoCOEFICIENTE: TCurrencyField
      Alignment = taCenter
      CustomConstraint = 'COEFICIENTE < 5'
      ConstraintErrorMessage = 'error papa'
      DisplayLabel = 'Coeficiente'
      FieldName = 'COEFICIENTE'
      Origin = 'COEFICIENTE'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
      currency = False
    end
    object fdqryPlanes_pagoFECHA_ACTUALIZACION: TDateField
      DisplayLabel = 'Fecha de Actualizaci'#243'n'
      FieldName = 'FECHA_ACTUALIZACION'
      Origin = 'FECHA_ACTUALIZACION'
    end
    object intgrfldPlanes_pagoFK_IDMETODOPAGO: TIntegerField
      FieldName = 'FK_IDMETODOPAGO'
      Origin = 'FK_IDMETODOPAGO'
      Required = True
    end
  end
  object fdqryDinamico: TFDQuery
    Connection = GestionConnection
    Left = 680
    Top = 48
  end
  object fdqryMD_MetPag: TFDQuery
    OnReconcileError = fdqryMD_MetPagReconcileError
    Connection = GestionConnection
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_METODO_PAGO'
    UpdateOptions.KeyFields = 'IDMETODO_PAGO'
    UpdateOptions.AutoIncFields = 'IDMETODO_PAGO'
    SQL.Strings = (
      'SELECT * FROM {id METODOS_PAGO}'
      'WHERE TIPO = '#39'C'#39)
    Left = 181
    Top = 267
    object intgrfldMD_MetPagIDMETODO_PAGO: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayWidth = 4
      FieldName = 'IDMETODO_PAGO'
      Origin = 'IDMETODO_PAGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object strngfldMD_MetPagNOMBRE: TStringField
      DisplayWidth = 25
      FieldName = 'NOMBRE'
      Origin = 'NOMBRE'
      Size = 40
    end
    object crncyfldMD_MetPagRETENCION: TCurrencyField
      DisplayLabel = 'Retenci'#243'n'
      FieldName = 'RETENCION'
      Origin = 'RETENCION'
      DisplayFormat = '##0.00 %'
      currency = False
    end
    object strngfldMD_MetPagTIPO: TStringField
      DisplayWidth = 5
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
  end
  object fdqryMDPlanPago: TFDQuery
    CachedUpdates = True
    MasterSource = dsMD_MetPag_PlanPag
    MasterFields = 'IDMETODO_PAGO'
    DetailFields = 'FK_IDMETODOPAGO'
    OnReconcileError = fdqryMDPlanPagoReconcileError
    Connection = GestionConnection
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_IDPLAN_PAGO'
    UpdateOptions.KeyFields = 'IDPLAN_PAGO'
    UpdateOptions.AutoIncFields = 'IDPLAN_PAGO'
    SQL.Strings = (
      'SELECT * FROM {id PLANES_PAGO} '
      'WHERE FK_IDMETODOPAGO = :IDMETODO_PAGO'
      'ORDER BY NROCUOTA ASCENDING;'
      '')
    Left = 179
    Top = 329
    ParamData = <
      item
        Name = 'IDMETODO_PAGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object fdtncfldMDPlanPagoIDPLAN_PAGO: TFDAutoIncField
      FieldName = 'IDPLAN_PAGO'
      Origin = 'IDPLAN_PAGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object smlntfldMDPlanPagoNROCUOTA: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Nro de Cuota'
      FieldName = 'NROCUOTA'
      Origin = 'NROCUOTA'
      OnValidate = smlntfldMDPlanPagoNROCUOTAValidate
    end
    object crncyfldMDPlanPagoCOEFICIENTE: TCurrencyField
      Alignment = taCenter
      CustomConstraint = 'COEFICIENTE < 5'
      ConstraintErrorMessage = 'El coeficiente no puede ser mayor que 5.'
      DisplayLabel = 'Coeficiente'
      FieldName = 'COEFICIENTE'
      Origin = 'COEFICIENTE'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
      currency = False
    end
    object dtfldMDPlanPagoFECHA_ACTUALIZACION: TDateField
      FieldName = 'FECHA_ACTUALIZACION'
      Origin = 'FECHA_ACTUALIZACION'
    end
    object intgrfldMDPlanPagoFK_IDMETODOPAGO: TIntegerField
      FieldName = 'FK_IDMETODOPAGO'
      Origin = 'FK_IDMETODOPAGO'
      Required = True
    end
  end
  object dsMD_MetPag_PlanPag: TDataSource
    DataSet = fdqryMD_MetPag
    Left = 296
    Top = 272
  end
  object fdqryDepositos: TFDQuery
    Connection = GestionConnection
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_NUM_DEPO'
    UpdateOptions.KeyFields = 'NUMERO'
    UpdateOptions.AutoIncFields = 'NUMERO'
    SQL.Strings = (
      'SELECT * FROM DEPOSITOS')
    Left = 249
    Top = 76
    object intgrfldDepositosNUMERO: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Numero'
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object strngfldDepositosNOMBRE: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Origin = 'NOMBRE'
      Size = 25
    end
    object strngfldDepositosDOMICILIO: TStringField
      DisplayLabel = 'Domicilio'
      FieldName = 'DOMICILIO'
      Origin = 'DOMICILIO'
      Size = 40
    end
    object intgrfldDepositosFK_IDSUCURSAL: TIntegerField
      FieldName = 'FK_IDSUCURSAL'
      Origin = 'FK_IDSUCURSAL'
      Required = True
    end
    object strngfldDepositoslookupNomSuc: TStringField
      DisplayLabel = 'Sucursal'
      FieldKind = fkLookup
      FieldName = 'lookupNomSuc'
      LookupDataSet = fdqrySucursales
      LookupKeyFields = 'ID_SUCURSAL'
      LookupResultField = 'NOMBRE_COMERCIAL'
      KeyFields = 'FK_IDSUCURSAL'
      Size = 50
      Lookup = True
    end
  end
  object fdqrySucursales: TFDQuery
    Connection = GestionConnection
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_IDSUCURSAL'
    UpdateOptions.KeyFields = 'ID_SUCURSAL'
    UpdateOptions.AutoIncFields = 'ID_SUCURSAL'
    SQL.Strings = (
      'SELECT * FROM SUCURSALES')
    Left = 397
    Top = 78
    object intgrfldSucursalesID_SUCURSAL: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_SUCURSAL'
      Origin = 'ID_SUCURSAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object strngfldSucursalesNOMBRE_COMERCIAL: TStringField
      DisplayLabel = 'Nombre comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Origin = 'NOMBRE_COMERCIAL'
      Size = 50
    end
    object strngfldSucursalesRAZON_SOCIAL: TStringField
      DisplayLabel = 'Razon social'
      FieldName = 'RAZON_SOCIAL'
      Origin = 'RAZON_SOCIAL'
      Size = 40
    end
    object strngfldSucursalesCUIT: TStringField
      FieldName = 'CUIT'
      Origin = 'CUIT'
      Size = 11
    end
    object strngfldSucursalesIIBB: TStringField
      FieldName = 'IIBB'
      Origin = 'IIBB'
      Size = 10
    end
    object strngfldSucursalesDOMICILIO: TStringField
      DisplayLabel = 'Domicilio'
      FieldName = 'DOMICILIO'
      Origin = 'DOMICILIO'
      Size = 40
    end
    object strngfldSucursalesLOCALIDAD: TStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Origin = 'LOCALIDAD'
      Size = 40
    end
    object strngfldSucursalesPROVINCIA: TStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Origin = 'PROVINCIA'
      Size = 40
    end
    object strngfldSucursalesTELEFONO: TStringField
      DisplayLabel = 'Tel'#233'fono'
      FieldName = 'TELEFONO'
      Origin = 'TELEFONO'
      Size = 15
    end
    object strngfldSucursalesMAIL: TStringField
      DisplayLabel = 'Email'
      FieldName = 'MAIL'
      Origin = 'MAIL'
      Size = 40
    end
    object dtfldSucursalesFECHA_INICIO: TDateField
      DisplayLabel = 'Fecha inicio act.'
      FieldName = 'FECHA_INICIO'
      Origin = 'FECHA_INICIO'
    end
    object intgrfldSucursalesFK_SITUACIONTRIB: TIntegerField
      FieldName = 'FK_SITUACIONTRIB'
      Origin = 'FK_SITUACIONTRIB'
      Required = True
    end
    object strngfldSucursaleslookupSitTrib: TStringField
      DisplayLabel = 'Situaci'#243'n Tributaria'
      FieldKind = fkLookup
      FieldName = 'lookupSitTrib'
      LookupDataSet = fdqrySituaciones_tributarias
      LookupKeyFields = 'ID_SITUACIONTRIB'
      LookupResultField = 'NOMBRE'
      KeyFields = 'FK_SITUACIONTRIB'
      Size = 25
      Lookup = True
    end
  end
  object fdqryMetpago_Ventas: TFDQuery
    BeforePost = fdqryMetpago_VentasBeforePost
    OnCalcFields = fdqryMetpago_VentasCalcFields
    CachedUpdates = True
    Aggregates = <
      item
        Name = 'SumMontoFinanciado'
        Expression = 'SUM(MontoFinal)'
        Active = True
      end
      item
        Name = 'SumMonto'
        Expression = 'SUM(MONTO)'
        Active = True
      end>
    AggregatesActive = True
    Connection = GestionConnection
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    UpdateOptions.KeyFields = 'FK_IDMETPAGO;FK_NRO_FACTURA_V'
    SQL.Strings = (
      'SELECT * FROM METPAGO_VENTAS')
    Left = 673
    Top = 172
    object intgrfldMetpago_VentasFK_IDMETPAGO: TIntegerField
      FieldName = 'FK_IDMETPAGO'
      Origin = 'FK_IDMETPAGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object strngfldMetpago_VentasFK_NRO_FACTURA_V: TStringField
      FieldName = 'FK_NRO_FACTURA_V'
      Origin = 'FK_NRO_FACTURA_V'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 14
    end
    object bcdfldMetpago_VentasMONTO: TBCDField
      FieldName = 'MONTO'
      Origin = 'MONTO'
      currency = True
      Precision = 18
      Size = 2
    end
    object smlntfldMetpago_VentasCUOTAS: TSmallintField
      DefaultExpression = '1'
      FieldName = 'CUOTAS'
      Origin = 'CUOTAS'
    end
    object crncyfldMetpago_VentasCOEF_HISTORICO: TCurrencyField
      FieldName = 'COEF_HISTORICO'
      Origin = 'COEF_HISTORICO'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
      currency = False
    end
    object crncyfldMetpago_VentasMontoFinal: TCurrencyField
      FieldKind = fkInternalCalc
      FieldName = 'MontoFinal'
    end
    object strngfldMetpago_VentaslookupTipo: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupTipo'
      LookupDataSet = fdqryMetodos_pago
      LookupKeyFields = 'IDMETODO_PAGO'
      LookupResultField = 'TIPO'
      KeyFields = 'FK_IDMETPAGO'
      Size = 1
      Lookup = True
    end
    object strngfldMetpago_VentaslookupNombre: TStringField
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'lookupNombre'
      LookupDataSet = fdqryMetodos_pago
      LookupKeyFields = 'IDMETODO_PAGO'
      LookupResultField = 'NOMBRE'
      KeyFields = 'FK_IDMETPAGO'
      Size = 25
      Lookup = True
    end
  end
  object fdqryStock: TFDQuery
    Connection = GestionConnection
    SQL.Strings = (
      'SELECT * FROM STOCK')
    Left = 326
    Top = 77
    object strngfldStockFK_CODIGO: TStringField
      FieldName = 'FK_CODIGO'
      Origin = 'FK_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object intgrfldStockFK_NUMERO: TIntegerField
      FieldName = 'FK_NUMERO'
      Origin = 'FK_NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object intgrfldStockCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      Origin = 'CANTIDAD'
    end
  end
  object fdqryMDVentasRanged: TFDQuery
    OnCalcFields = fdqryMDVentasRangedCalcFields
    OnNewRecord = fdqryMDVentasRangedNewRecord
    CachedUpdates = True
    AggregatesActive = True
    Connection = GestionConnection
    SchemaAdapter = fdschmdptrVentasRanged
    SQL.Strings = (
      'SELECT * FROM {id VENTAS}')
    Left = 502
    Top = 309
    object strngfldMDVentasRANGEDNRO_FACTURA: TStringField
      FieldName = 'NRO_FACTURA'
      Required = True
      Size = 14
    end
    object intgrfldMDVentasRangedTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
    object dtfldMDVentasRANGEDFECHA: TDateField
      FieldName = 'FECHA'
      Origin = 'FECHA'
    end
    object tmfldMDVentasRANGEDHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
    end
    object crncyfldMDVentasRANGEDDESCUENTO: TCurrencyField
      DefaultExpression = '0'#13#10
      FieldName = 'DESCUENTO'
      Origin = 'DESCUENTO'
      DisplayFormat = '##0.00 %'
      currency = False
    end
    object crncyfldMDVentasRANGEDRECARGO: TCurrencyField
      DefaultExpression = '0'
      FieldName = 'RECARGO'
      Origin = 'RECARGO'
      DisplayFormat = '##0.00 %'
      currency = False
    end
    object strngfldMDVentasRANGEDNRO_COMPROBANTE: TStringField
      FieldName = 'NRO_COMPROBANTE'
      Origin = 'NRO_COMPROBANTE'
      Size = 10
    end
    object bcdfldMDVentasRANGEDSUBTOTAL: TBCDField
      DefaultExpression = '0'
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object bcdfldMDVentasRANGEDTOTAL: TBCDField
      DefaultExpression = '0'
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object intgrfldMDVentasRANGEDFK_IDCLIENTE: TIntegerField
      FieldName = 'FK_IDCLIENTE'
      Origin = 'FK_IDCLIENTE'
    end
    object intgrfldMDVentasRANGEDFK_IDPUNTO_VENTA: TIntegerField
      FieldName = 'FK_IDPUNTO_VENTA'
      Origin = 'FK_IDPUNTO_VENTA'
    end
    object strngfldMDVentasRangedlookupNomCompCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupNomCompCliente'
      LookupDataSet = fdqryClientes
      LookupKeyFields = 'ID_CLIENTE'
      LookupResultField = 'NOMBRECOMP'
      KeyFields = 'FK_IDCLIENTE'
      Size = 52
      Lookup = True
    end
    object strngfldMDVentasRangedlookupNomTipoCompr: TStringField
      FieldKind = fkLookup
      FieldName = 'lookupNomTipoCompr'
      LookupDataSet = fdqryTipo_comprobante
      LookupKeyFields = 'ID_TIPO_COMP'
      LookupResultField = 'NOMBRE'
      KeyFields = 'TIPO'
      Size = 25
      Lookup = True
    end
    object intgrfldMDVentasRangedlookupIdPV: TIntegerField
      FieldKind = fkLookup
      FieldName = 'lookupIdPV'
      LookupDataSet = fdqryPuntos_venta
      LookupKeyFields = 'IDPUNTOVENTA'
      LookupResultField = 'IDPUNTOVENTA'
      KeyFields = 'FK_IDPUNTO_VENTA'
      Lookup = True
    end
    object fltfldMDVentasRangedCalTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalTotal'
      Calculated = True
    end
  end
  object fdqryMDMovimientosRanged: TFDQuery
    BeforeInsert = fdqryMDMovimientosRangedBeforeInsert
    AfterPost = fdqryMDMovimientosRangedAfterPost
    AfterDelete = fdqryMDMovimientosRangedAfterDelete
    OnCalcFields = fdqryMDMovimientosRangedCalcFields
    CachedUpdates = True
    IndexFieldNames = 'FK_NRO_FACTURA_V'
    MasterSource = dsMDVentasRanged
    MasterFields = 'NRO_FACTURA'
    Connection = GestionConnection
    SchemaAdapter = fdschmdptrVentasRanged
    FetchOptions.AssignedValues = [evDetailCascade, evDetailServerCascade]
    FetchOptions.DetailCascade = True
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_IDMOVIMIENTO'
    UpdateOptions.KeyFields = 'IDMOVIMIENTO'
    UpdateOptions.AutoIncFields = 'IDMOVIMIENTO'
    SQL.Strings = (
      'SELECT * FROM {id MOVIMIENTOS}')
    Left = 505
    Top = 368
    object intgrfldMDMovimientosRANGEDIDMOVIMIENTO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'IDMOVIMIENTO'
      Origin = 'IDMOVIMIENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object strngfldMDMovimientosRANGEDFK_NRO_FACTURA_C: TStringField
      FieldName = 'FK_NRO_FACTURA_C'
      Origin = 'FK_NRO_FACTURA_C'
      Size = 14
    end
    object intgrfldMDMovimientosRANGEDFK_IDPROVEEDOR: TIntegerField
      FieldName = 'FK_IDPROVEEDOR'
      Origin = 'FK_IDPROVEEDOR'
    end
    object strngfldMDMovimientosRANGEDFK_NRO_FACTURA_V: TStringField
      FieldName = 'FK_NRO_FACTURA_V'
      Origin = 'FK_NRO_FACTURA_V'
      Size = 14
    end
    object intgrfldMDMovimientosRANGEDFK_NUM_DEPOSITO: TIntegerField
      FieldName = 'FK_NUM_DEPOSITO'
      Origin = 'FK_NUM_DEPOSITO'
    end
    object strngfldMDMovimientosRANGEDFK_COD_ART: TStringField
      FieldName = 'FK_COD_ART'
      Origin = 'FK_COD_ART'
      OnChange = strngfldMDMovimientosRANGEDFK_COD_ARTChange
      Size = 10
    end
    object strngfldMDMovimientosRANGEDTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object bcdfldMDMovimientosRANGEDPRECIO_UNITARIO: TBCDField
      DefaultExpression = '0'
      FieldName = 'PRECIO_UNITARIO'
      Origin = 'PRECIO_UNITARIO'
      currency = True
      Precision = 18
      Size = 2
    end
    object intgrfldMDMovimientosRANGEDCANTIDAD: TIntegerField
      DefaultExpression = '1'
      FieldName = 'CANTIDAD'
      Origin = 'CANTIDAD'
    end
    object crncyfldMDMovimientosRangedImporte: TCurrencyField
      DefaultExpression = '0'#13#10
      FieldKind = fkCalculated
      FieldName = 'Importe'
      Calculated = True
    end
    object strngfldMDMovimientosRangedNombreArt: TStringField
      DisplayLabel = 'Art'#237'culo'
      FieldKind = fkLookup
      FieldName = 'NombreArt'
      LookupDataSet = fdqryArticulos
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOMBRE'
      KeyFields = 'FK_COD_ART'
      ReadOnly = True
      Size = 25
      Lookup = True
    end
    object fltfldMDMovimientosRangedlookupIVA: TFloatField
      DefaultExpression = '0'
      FieldKind = fkLookup
      FieldName = 'lookupIVA'
      LookupDataSet = fdqryArticulos
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'IVA'
      KeyFields = 'FK_COD_ART'
      DisplayFormat = '##0.00 %'
      Lookup = True
    end
    object crncyfldMDMovimientosRangedcalIVA: TCurrencyField
      DefaultExpression = '0'
      FieldKind = fkCalculated
      FieldName = 'calIVA'
      Calculated = True
    end
  end
  object dsMDVentasRanged: TDataSource
    DataSet = fdqryMDVentasRanged
    Left = 648
    Top = 312
  end
  object fdschmdptrVentasRanged: TFDSchemaAdapter
    Left = 648
    Top = 368
  end
  object fdqryTipo_comprobante: TFDQuery
    Active = True
    Connection = GestionConnection
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_ID_TIPO_COMP'
    UpdateOptions.KeyFields = 'ID_TIPO_COMP'
    UpdateOptions.AutoIncFields = 'ID_TIPO_COMP'
    SQL.Strings = (
      'SELECT * FROM TIPO_COMPROBANTE')
    Left = 279
    Top = 136
    object intgrfldTipo_comprobanteID_TIPO_COMP: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_TIPO_COMP'
      Origin = 'ID_TIPO_COMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object strngfldTipo_comprobanteNOMBRE: TStringField
      DisplayLabel = 'Nombre de comprobante'
      FieldName = 'NOMBRE'
      Origin = 'NOMBRE'
      Size = 25
    end
    object strngfldTipo_comprobanteLETRA: TStringField
      DisplayLabel = 'Letra'
      FieldName = 'LETRA'
      Origin = 'LETRA'
      Size = 2
    end
  end
  object fdqryPuntos_venta: TFDQuery
    Connection = GestionConnection
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_PUNTO_VENTA'
    UpdateOptions.KeyFields = 'IDPUNTOVENTA'
    UpdateOptions.AutoIncFields = 'IDPUNTOVENTA'
    SQL.Strings = (
      'SELECT * FROM PUNTOS_VENTA')
    Left = 671
    Top = 117
    object intgrfldPuntos_ventaIDPUNTOVENTA: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'IDPUNTOVENTA'
      Origin = 'IDPUNTOVENTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object strngfldPuntos_ventaTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object strngfldPuntos_ventaDATOS_IMP: TStringField
      FieldName = 'DATOS_IMP'
      Origin = 'DATOS_IMP'
      Size = 80
    end
    object intgrfldPuntos_ventaFK_IDCAJA: TIntegerField
      FieldName = 'FK_IDCAJA'
      Origin = 'FK_IDCAJA'
      Required = True
    end
    object intgrfldPuntos_ventaFK_IDSUCURSAL: TIntegerField
      FieldName = 'FK_IDSUCURSAL'
      Origin = 'FK_IDSUCURSAL'
      Required = True
    end
  end
end
