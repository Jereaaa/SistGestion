unit udmGestion;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, FireDAC.Comp.UI, System.IniFiles, System.IOUtils, Vcl.Themes;

type
  TdmGestion = class(TDataModule)
    fdqryClientes: TFDQuery;
    intgrfldClientesID_CLIENTE: TIntegerField;
    strngfldClientesNOMBRE: TStringField;
    strngfldClientesAPELLIDO: TStringField;
    strngfldClientesDOMICILIO: TStringField;
    strngfldClientesLOCALIDAD: TStringField;
    strngfldClientesPROVINCIA: TStringField;
    strngfldClientesDNI: TStringField;
    strngfldClientesCUIT: TStringField;
    strngfldClientesTELEFONO: TStringField;
    strngfldClientesMAIL: TStringField;
    intgrfldClientesFK_SITUACIONTRIB: TIntegerField;
    fdqrySituaciones_tributarias: TFDQuery;
    intgrfldSituaciones_tributariasTableID_SITUACIONTRIB: TIntegerField;
    strngfldSituaciones_tributariasTableNOMBRE: TStringField;
    strngfldClientesLookupSituacionTrib: TStringField;
    GestionConnection: TFDConnection;
    fdqryProveedores: TFDQuery;
    intgrfldProveedoresID_PROVEEDOR: TIntegerField;
    strngfldProveedoresNOMBRE: TStringField;
    strngfldProveedoresDOMICILIO: TStringField;
    strngfldProveedoresLOCALIDAD: TStringField;
    strngfldProveedoresPROVINCIA: TStringField;
    strngfldProveedoresCUIT: TStringField;
    strngfldProveedoresTELEFONO: TStringField;
    strngfldProveedoresMAIL: TStringField;
    intgrfldProveedoresFK_SITUACIONTRIB: TIntegerField;
    strngfldProveedoresLookupSituacionTrib: TStringField;
    strngfldClientesTIPO: TStringField;
    strngfldClientesRAZON_SOCIAL: TStringField;
    strngfldClientesNOMBRE_COMERCIAL: TStringField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    strngfldClientesNOMBRECOMP: TStringField;
    fdqryArticulos: TFDQuery;
    strngfldArticulosCODIGO: TStringField;
    strngfldArticulosCODIGOALT: TStringField;
    strngfldArticulosNOMBRE: TStringField;
    strngfldArticulosDESCRIPCION: TStringField;
    bcdfldArticulosCOSTO: TBCDField;
    bcdfldArticulosPRECIO: TBCDField;
    intgrfldArticulosFK_IDPROVEEDOR: TIntegerField;
    strngfldArticuloslookupProveedor: TStringField;
    spProximo_id_ART: TFDStoredProc;
    fdqryMetodos_pago: TFDQuery;
    intgrfldMetodos_pagoIDMETODO_PAGO: TIntegerField;
    strngfldMetodos_pagoNOMBRE: TStringField;
    strngfldMetodos_pagoTIPO: TStringField;
    fdqryPlanes_pago: TFDQuery;
    intgrfldPlanes_pagoIDPLAN_PAGO: TIntegerField;
    fdqryPlanes_pagoNROCUOTA: TSmallintField;
    fdqryPlanes_pagoCOEFICIENTE: TCurrencyField;
    fdqryPlanes_pagoFECHA_ACTUALIZACION: TDateField;
    intgrfldPlanes_pagoFK_IDMETODOPAGO: TIntegerField;
    fdqryDinamico: TFDQuery;
    fdqryMD_MetPag: TFDQuery;
    fdqryMDPlanPago: TFDQuery;
    dsMD_MetPag_PlanPag: TDataSource;
    intgrfldMD_MetPagIDMETODO_PAGO: TIntegerField;
    strngfldMD_MetPagNOMBRE: TStringField;
    strngfldMD_MetPagTIPO: TStringField;
    fdtncfldMDPlanPagoIDPLAN_PAGO: TFDAutoIncField;
    smlntfldMDPlanPagoNROCUOTA: TSmallintField;
    crncyfldMDPlanPagoCOEFICIENTE: TCurrencyField;
    dtfldMDPlanPagoFECHA_ACTUALIZACION: TDateField;
    intgrfldMDPlanPagoFK_IDMETODOPAGO: TIntegerField;
    crncyfldMetodos_pagoRETENCION: TCurrencyField;
    crncyfldMD_MetPagRETENCION: TCurrencyField;
    fdqryDepositos: TFDQuery;
    intgrfldDepositosNUMERO: TIntegerField;
    strngfldDepositosNOMBRE: TStringField;
    strngfldDepositosDOMICILIO: TStringField;
    intgrfldDepositosFK_IDSUCURSAL: TIntegerField;
    fdqrySucursales: TFDQuery;
    intgrfldSucursalesID_SUCURSAL: TIntegerField;
    strngfldSucursalesNOMBRE_COMERCIAL: TStringField;
    strngfldSucursalesRAZON_SOCIAL: TStringField;
    strngfldSucursalesCUIT: TStringField;
    strngfldSucursalesIIBB: TStringField;
    strngfldSucursalesDOMICILIO: TStringField;
    strngfldSucursalesLOCALIDAD: TStringField;
    strngfldSucursalesPROVINCIA: TStringField;
    strngfldSucursalesTELEFONO: TStringField;
    strngfldSucursalesMAIL: TStringField;
    dtfldSucursalesFECHA_INICIO: TDateField;
    intgrfldSucursalesFK_SITUACIONTRIB: TIntegerField;
    strngfldSucursaleslookupSitTrib: TStringField;
    strngfldDepositoslookupNomSuc: TStringField;
    fdqryMetpago_Ventas: TFDQuery;
    intgrfldMetpago_VentasFK_IDMETPAGO: TIntegerField;
    strngfldMetpago_VentasFK_NRO_FACTURA_V: TStringField;
    bcdfldMetpago_VentasMONTO: TBCDField;
    strngfldMetpago_VentaslookupMetPag: TStringField;
    crncyfldArticulosIVA: TCurrencyField;
    fdqryStock: TFDQuery;
    strngfldStockFK_CODIGO: TStringField;
    intgrfldStockFK_NUMERO: TIntegerField;
    intgrfldStockCANTIDAD: TIntegerField;
    fdqryMDVentasRanged: TFDQuery;
    strngfldMDVentasRANGEDNRO_FACTURA: TStringField;
    dtfldMDVentasRANGEDFECHA: TDateField;
    tmfldMDVentasRANGEDHORA: TTimeField;
    crncyfldMDVentasRANGEDDESCUENTO: TCurrencyField;
    crncyfldMDVentasRANGEDRECARGO: TCurrencyField;
    strngfldMDVentasRANGEDNRO_COMPROBANTE: TStringField;
    bcdfldMDVentasRANGEDSUBTOTAL: TBCDField;
    bcdfldMDVentasRANGEDTOTAL: TBCDField;
    intgrfldMDVentasRANGEDFK_IDCLIENTE: TIntegerField;
    intgrfldMDVentasRANGEDFK_IDPUNTO_VENTA: TIntegerField;
    fdqryMDMovimientosRanged: TFDQuery;
    intgrfldMDMovimientosRANGEDIDMOVIMIENTO: TIntegerField;
    strngfldMDMovimientosRANGEDFK_NRO_FACTURA_C: TStringField;
    intgrfldMDMovimientosRANGEDFK_IDPROVEEDOR: TIntegerField;
    strngfldMDMovimientosRANGEDFK_NRO_FACTURA_V: TStringField;
    intgrfldMDMovimientosRANGEDFK_NUM_DEPOSITO: TIntegerField;
    strngfldMDMovimientosRANGEDFK_COD_ART: TStringField;
    strngfldMDMovimientosRANGEDTIPO: TStringField;
    bcdfldMDMovimientosRANGEDPRECIO_UNITARIO: TBCDField;
    intgrfldMDMovimientosRANGEDCANTIDAD: TIntegerField;
    dsMDVentasRanged: TDataSource;
    fdschmdptrVentasRanged: TFDSchemaAdapter;
    crncyfldMDMovimientosRangedImporte: TCurrencyField;
    strngfldMDMovimientosRangedNombreArt: TStringField;
    strngfldMDVentasRangedlookupNomCompCliente: TStringField;
    intgrfldMDVentasRangedTIPO: TIntegerField;
    fdqryTipo_comprobante: TFDQuery;
    intgrfldTipo_comprobanteID_TIPO_COMP: TIntegerField;
    strngfldTipo_comprobanteNOMBRE: TStringField;
    strngfldTipo_comprobanteLETRA: TStringField;
    strngfldMDVentasRangedlookupNomTipoCompr: TStringField;
    fdqryPuntos_venta: TFDQuery;
    intgrfldPuntos_ventaIDPUNTOVENTA: TIntegerField;
    strngfldPuntos_ventaTIPO: TStringField;
    strngfldPuntos_ventaDATOS_IMP: TStringField;
    intgrfldPuntos_ventaFK_IDCAJA: TIntegerField;
    intgrfldPuntos_ventaFK_IDSUCURSAL: TIntegerField;
    agrgtfldMDMovimientosRangedAGGSubTotal: TAggregateField;
    intgrfldMDVentasRangedlookupIdPV: TIntegerField;
    procedure fdqryClientesCalcFields(DataSet: TDataSet);
    procedure fdqryArticulosNewRecord(DataSet: TDataSet);
    procedure fdqryArticulosBeforePost(DataSet: TDataSet);
    procedure fdqryArticulosReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure fdqryClientesReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure fdqryMetodos_pagoReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure fdqryPlanes_pagoReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure fdqrySituaciones_tributariasReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure fdqryProveedoresReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure r(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure fdqryMDPlanPagoReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure fdqryMD_MetPagReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure smlntfldMDPlanPagoNROCUOTAValidate(Sender: TField);
    procedure DataModuleCreate(Sender: TObject);
    procedure fdqryMDMovimientosRangedCalcFields(DataSet: TDataSet);
    procedure fdqryMDMovimientosRangedBeforeInsert(DataSet: TDataSet);
    procedure fdqryMDVentasRangedNewRecord(DataSet: TDataSet);
    procedure strngfldMDMovimientosRANGEDFK_COD_ARTChange(Sender: TField);
    procedure fdqryMDMovimientosRangedAfterPost(DataSet: TDataSet);
    procedure fdqryMDMovimientosRangedAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    function CarpetaGestion_IniPath: string; //creo carpeta gestion en mis doc y obtengo el path
    { Public declarations }
  end;

var
  dmGestion: TdmGestion;

implementation


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TdmGestion.CarpetaGestion_IniPath: string;
begin
  if not DirectoryExists(TPath.GetDocumentsPath + PathDelim + 'Gestion') then
     CreateDir(TPath.GetDocumentsPath + PathDelim + 'Gestion');
  Result :=  TPath.Combine(TPath.GetDocumentsPath,'Gestion\Gestion.ini');
end;

procedure TdmGestion.DataModuleCreate(Sender: TObject);     //Creo carpeta y leo la configuracion del archivo ini
var
  Ini : TIniFile;
  Estilo: string;
begin
  Ini := Tinifile.Create(CarpetaGestion_IniPath);
  try
    Estilo := Ini.ReadString('Estilo','Nombre', '<None>');          //leo estilo
    if Estilo <> '<None>' then                   //si no hay estilo guardado incia default
       try                                      //intenta aplicarlo o carga "Windows"
         TStyleManager.SetStyle(Estilo);
       except
         TStyleManager.SetStyle('Windows');
       end;
  finally
    Ini.Free;
  end;
end;

procedure TdmGestion.fdqryArticulosBeforePost(DataSet: TDataSet); //obtengo el codigo desde la db con un procedimiento almacenado que rellenar el string con ceros a la izq
begin
  if fdqryArticulos.State = dsInsert then
     begin
       spProximo_id_ART.ParamByName('TIPO').Value := 'ARTICULO';
       spProximo_id_ART.ExecProc;
       fdqryArticulos.FieldByName('CODIGO').Value := spProximo_id_ART.ParamByName('VALOR').Value;
     end;
end;

procedure TdmGestion.fdqryArticulosNewRecord(DataSet: TDataSet); //id temporal
begin
  fdqryArticulos.FieldByName('CODIGO').AsString := '-1';
end;

procedure TdmGestion.fdqryArticulosReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
    ApplicationShowException(e);
    Abort;
end;

procedure TdmGestion.fdqryClientesCalcFields(DataSet: TDataSet); //relleno el campo nombrecompleto con info dependiendo si es una persona fisica o juridica
begin
  with fdqryClientes do
    begin
      if FieldByName('DNI').IsNull then
         FieldByName('NOMBRECOMP').AsString := FieldByName('NOMBRE_COMERCIAL').AsString
      else
         FieldByName('NOMBRECOMP').AsString := FieldByName('APELLIDO').AsString+', '+FieldByName('NOMBRE').AsString
    end;
end;

procedure TdmGestion.fdqryClientesReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
   ApplicationShowException(e);
   Abort;
end;

procedure TdmGestion.r(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
   ApplicationShowException(e);
   Abort;
end;

procedure TdmGestion.smlntfldMDPlanPagoNROCUOTAValidate(Sender: TField);  //cargo el qryDinamico con los mismos valores
begin                                                                     //del registro que se esta ingresando para verificar si existe
  fdqryDinamico.SQL.Clear;
  fdqryDinamico.Params.Clear;
  fdqryDinamico.SQL.Text := 'SELECT * '+
                            'FROM PLANES_PAGO '+
                            'WHERE ((PLANES_PAGO.NROCUOTA =:pCUOTA) AND (PLANES_PAGO.FK_IDMETODOPAGO =:pMETPAG)) ';
  fdqryDinamico.Close;
  fdqryDinamico.ParamByName('pMETPAG').Value := fdqryMDPlanPago.FieldByName('FK_IDMETODOPAGO').Value;
  fdqryDinamico.ParamByName('pCUOTA').Value := fdqryMDPlanPago.FieldByName('NROCUOTA').Value;
  fdqryDinamico.Open();
  if not (fdqryDinamico.IsEmpty) then
     if (fdqryMDPlanPago.State = dsInsert) or (fdqryMDPlanPago.FieldByName('IDPLAN_PAGO').Value <> fdqryDinamico.FieldByName('IDPLAN_PAGO').Value) then
         raise Exception.Create('Este n�mero de cuota ya existe.');
end;

procedure TdmGestion.strngfldMDMovimientosRANGEDFK_COD_ARTChange(Sender: TField); //cuando el campo lookup busca un art, actualizo el precio
begin
  fdqryMDMovimientosRanged.FieldByName('PRECIO_UNITARIO').Value := fdqryArticulos.FieldByName('PRECIO').Value;
end;

procedure TdmGestion.fdqryMDMovimientosRangedAfterDelete(DataSet: TDataSet);
begin
   //uso este evento y movimientos after post para mantener actualizado el campo subtotal
  fdqryMDVentasRanged.Edit;
  fdqryMDVentasRanged.FieldByName('SUBTOTAL').Value := fdqryMDMovimientosRanged.FieldByName('AGGSubTotal').Value;
  fdqryMDVentasRanged.Post;
end;

procedure TdmGestion.fdqryMDMovimientosRangedAfterPost(DataSet: TDataSet);
begin     //uso este evento y movimientos after delete para mantener actualizado el campo subtotal
  fdqryMDVentasRanged.Edit;
  fdqryMDVentasRanged.FieldByName('SUBTOTAL').Value := fdqryMDMovimientosRanged.FieldByName('AGGSubTotal').Value;
  fdqryMDVentasRanged.Post;
end;

procedure TdmGestion.fdqryMDMovimientosRangedBeforeInsert(DataSet: TDataSet); //postea factura para que tenga id (-1 temporal) y se pueda vincular la tabla detalle
begin
  if (fdqryMDVentasRANGED.State = dsInsert) then
     begin
        //fdqryPuntos_venta.First;
        //fdqryMDVentasRanged.FieldByName('FK_IDPUNTO_VENTA').Value := fdqryPuntos_venta.FieldByName('IDPUNTOVENTA').Value;
        fdqryMDVentasRANGED.Post;
     end;
end;

procedure TdmGestion.fdqryMDMovimientosRangedCalcFields(DataSet: TDataSet);   //calcula precio unitario * cantidad y me da importe
begin
  with fdqryMDMovimientosRanged do
    begin
      if not(FieldByName('PRECIO_UNITARIO').IsNull) and not(FieldByName('CANTIDAD').IsNull) then
          FieldByName('Importe').Value := FieldByName('PRECIO_UNITARIO').Value * FieldByName('CANTIDAD').Value;
    end;
end;

procedure TdmGestion.fdqryMDPlanPagoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
   ApplicationShowException(e);
   Abort;
end;

procedure TdmGestion.fdqryMDVentasRangedNewRecord(DataSet: TDataSet); //nro factura temporal
begin
   fdqryMDVentasRanged.FieldByName('NRO_FACTURA').Value := '-1';
end;

procedure TdmGestion.fdqryMD_MetPagReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
   ApplicationShowException(e);
   Abort;
end;

procedure TdmGestion.fdqryMetodos_pagoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
   ApplicationShowException(e);
   Abort;
end;

procedure TdmGestion.fdqryPlanes_pagoReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
   ApplicationShowException(e);
   Abort;
end;

procedure TdmGestion.fdqryProveedoresReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
   ApplicationShowException(e);
   Abort;
end;

procedure TdmGestion.fdqrySituaciones_tributariasReconcileError(
  DataSet: TFDDataSet; E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
   ApplicationShowException(e);
   Abort;
end;

end.
