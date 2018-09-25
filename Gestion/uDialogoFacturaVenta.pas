unit uDialogoFacturaVenta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPlantillaGenerica, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxTextEdit, cxCurrencyEdit, cxDBEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.DBCtrls, Vcl.WinXCtrls, Vcl.Mask,
  dxGDIPlusClasses, cxSpinEdit, System.IniFiles;

type
  TfrmDialogoFacturaVenta = class(TfrmPlantillaGenerica)
    grdpnlPrincipal: TGridPanel;
    grdpnlBotonera: TGridPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    btnImprimir: TBitBtn;
    grdpnlFactura: TGridPanel;
    grdpnlHeader: TGridPanel;
    grdpnlDetail: TGridPanel;
    grdpnlFooter: TGridPanel;
    dbgrdDetalle: TDBGrid;
    lblDetalle: TLabel;
    dsDetalleMovimiento: TDataSource;
    dsMaestroVenta: TDataSource;
    lblTotal: TLabel;
    cxdbcrncydtTOTAL: TcxDBCurrencyEdit;
    lblSubTotal: TLabel;
    cxdbcrncydtSUBTOTAL: TcxDBCurrencyEdit;
    pnlTotal: TPanel;
    pnlSubTotal: TPanel;
    pnlDescuento: TPanel;
    lblDescuento: TLabel;
    cxdbcrncydtDescuento: TcxDBCurrencyEdit;
    pnlRecargo: TPanel;
    lblRecargo: TLabel;
    cxdbcrncydtRecargo: TcxDBCurrencyEdit;
    dbtxtFecha: TDBText;
    lblCliente: TLabel;
    lblVendedor: TLabel;
    dbtxtVendedor: TDBText;
    dsMetodos_Pago: TDataSource;
    lblMetPag: TLabel;
    dsSeguridad: TDataSource;
    dsCliente: TDataSource;
    dblkcbbMet_Pago: TDBLookupComboBox;
    grdpnlMet_Pago: TGridPanel;
    imgAgregar: TImage;
    grdpnlTipoComp: TGridPanel;
    lblTipoComp: TLabel;
    dblkcbblookupNomTipoCompr: TDBLookupComboBox;
    grdpnlCliente: TGridPanel;
    grdpnlFecha: TGridPanel;
    grdpnlVendedor: TGridPanel;
    grdpnlPuntoVenta: TGridPanel;
    lblPuntoVenta: TLabel;
    dblkcbblookupIDPV: TDBLookupComboBox;
    cxdbtxtdtNRO_FACTURA: TcxDBTextEdit;
    dblkcbblookupNomCompCliente: TDBLookupComboBox;
    grdpnlDeposito: TGridPanel;
    lblDeposito: TLabel;
    dblkcbblookupDeposito: TDBLookupComboBox;
    dsDeposito: TDataSource;
    dsPV: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure dbgrdDetalleKeyPress(Sender: TObject; var Key: Char);
    procedure dblkcbblookupNomCompClienteKeyPress(Sender: TObject;
      var Key: Char);
    procedure dbgrdDetalleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogoFacturaVenta: TfrmDialogoFacturaVenta;

implementation

uses
  udmGestion, udmSeguridad, uBusquedaCliente, uBusquedaArticulo;

{$R *.dfm}

procedure TfrmDialogoFacturaVenta.btnAceptarClick(Sender: TObject);
begin
  inherited;
  //funcion chequar datos: boolean (verifique input y situacion deposito sucursal pv
  with dmGestion do
    begin
       GestionConnection.StartTransaction;
       try
          //antes de editar mov hago post en factura con nro_fact -1 (temporal)
          fdqryMDMovimientosRANGED.DisableControls;
          fdqryMDMovimientosRANGED.First;
          while not fdqryMDMovimientosRANGED.Eof do  //completo los datos de tabla mov
            begin
              fdqryMDMovimientosRANGED.Edit;
              fdqryMDMovimientosRANGED.FieldByName('TIPO').Value := 1; //Salida
              fdqryMDMovimientosRANGED.FieldByName('FK_NUM_DEPOSITO').Value := dblkcbblookupDeposito.KeyValue;
              fdqryMDMovimientosRANGED.Post;
              fdqryMDMovimientosRANGED.Next;
            end;
          fdqryMDMovimientosRANGED.EnableControls;

          if fdqryMDVentasRANGED.FieldByName('NRO_FACTURA').Value <= 0 then   // busca numero de factura si el actual es -1 (es decir, si esta insertando pido numero. si esta editando no)
             begin
               fdqryMDVentasRANGED.Edit;
               spProximo_id_ART.ParamByName('TIPO').Value := 'FACTURA';
               spProximo_id_ART.ExecProc;
               fdqryMDVentasRANGED.FieldByName('NRO_FACTURA').Value := spProximo_id_ART.ParamByName('VALOR').Value;
               fdqryMDVentasRanged.FieldByName('FECHA').Value := Now;
               fdqryMDVentasRanged.FieldByName('HORA').Value := Now;
               fdqryMDVentasRANGED.Post;
             end;

          fdschmdptrVentasRanged.ApplyUpdates(0);
          fdschmdptrVentasRanged.CommitUpdates;
          GestionConnection.Commit;
          //mensaje de exito en la operacion
          ShowMessage('Operacion exitosa');
          Close;
       except
         GestionConnection.Rollback;
         raise;
       end;
    end
end;

procedure TfrmDialogoFacturaVenta.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dsDetalleMovimiento.DataSet.Cancel;
  dmGestion.fdschmdptrVentasRanged.CancelUpdates;
  Close;
end;

procedure TfrmDialogoFacturaVenta.dbedtClienteKeyPress(Sender: TObject;
  var Key: Char);   //busco cliente
begin
  inherited;
  if ord(Key) <> VK_ESCAPE then
     begin
        Key := #0;
        TfrmBusquedaCliente.MostrarModal;
     end;
end;

procedure TfrmDialogoFacturaVenta.dbgrdDetalleKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then          //con enter postea en detalles
    if (dsDetalleMovimiento.State = dsInsert) or (dsDetalleMovimiento.State = dsEdit) then
       dmGestion.fdqryMDMovimientosRanged.Post;

  if (Key = VK_DELETE) or (Key = 08) then   //con delete borra en detalles
    if (dbgrdDetalle.Columns.Items[dbgrdDetalle.SelectedIndex].Title.Caption = dmGestion.fdqryMDMovimientosRanged.FieldByName('NombreArt').DisplayLabel) then
       dmGestion.fdqryMDMovimientosRanged.Delete;
end;

procedure TfrmDialogoFacturaVenta.dbgrdDetalleKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (dbgrdDetalle.Columns.Items[dbgrdDetalle.SelectedIndex].Title.Caption = dmGestion.fdqryMDMovimientosRanged.FieldByName('NombreArt').DisplayLabel) then
     begin
       if not (Key in [#27, #08, #127]) then    //27= esc, 08= tecla borrar, 127=tecla delete
          begin
            Key := #0;
            TfrmBusquedaArticulo.MostrarModal;
          end;
     end;
end;

procedure TfrmDialogoFacturaVenta.dblkcbblookupNomCompClienteKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if ord(Key) <> VK_ESCAPE then     //si no estoy apretando escape busqueda avanzada
     begin
        Key := #0;
        TfrmBusquedaCliente.MostrarModal;
     end;
end;

procedure TfrmDialogoFacturaVenta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dsDetalleMovimiento.DataSet.Cancel;
  dsMaestroVenta.DataSet.Cancel;
  dsMetodos_Pago.DataSet.Cancel;
  dsSeguridad.DataSet.Cancel;
  dsCliente.DataSet.Cancel;
  dsDeposito.DataSet.Cancel;
  dsPV.DataSet.Cancel;
  with dmGestion do
    begin
      fdqryDepositos.Filter := '';
      fdqryDepositos.Filtered := False;
      fdqryPuntos_venta.Filter := '';
      fdqryPuntos_venta.Filtered := False;
    end;
end;

procedure TfrmDialogoFacturaVenta.FormShow(Sender: TObject);
var
Ini : TIniFile;
IdSucurDefault, IdDepoDefault : Integer;
begin
  inherited;
  dsDetalleMovimiento.DataSet.Open;
  dsMaestroVenta.DataSet.Open;
  dsMetodos_Pago.DataSet.Open;
  dsSeguridad.DataSet.Open;
  dsCliente.DataSet.Open;

  Ini := Tinifile.Create(dmGestion.CarpetaGestion_IniPath);
  try
    IdSucurDefault := Ini.ReadInteger('Sucursal','ID', 1); //carga la sucursal del archivo INI y por defecto carga el 1 para filtrar el combobox deposito
    IdDepoDefault := Ini.ReadInteger('Deposito','Numero', 1);//carga el deposito "   "      "  "  "    "        "   "  "
  finally
    Ini.Free;
  end;

  with dmGestion do
    begin
       fdqryDepositos.Filtered := False;
       fdqryDepositos.Filter := 'FK_IDSUCURSAL ='+QuotedStr(IntToStr(IdSucurDefault));
       fdqryDepositos.Filtered := True;
       fdqryPuntos_venta.Filtered := False;
       fdqryPuntos_venta.Filter := 'FK_IDSUCURSAL ='+QuotedStr(IntToStr(IdSucurDefault));
       fdqryPuntos_venta.Filtered := True;

       dsPV.DataSet.Open;
       dsDeposito.DataSet.Open;
       if dsMaestroVenta.DataSet.State = dsEdit then
             dblkcbblookupDeposito.KeyValue := fdqryMDMovimientosRanged.FieldByName('FK_NUM_DEPOSITO').Value;

       if dsMaestroVenta.DataSet.State = dsInsert then      //Preparo valores defecto de la factura (cuando estoy insertando)
          begin
             fdqryMDVentasRanged.FieldByName('Fecha').Value := Now;  // Muestro por defecto la fecha de hoy
             if dblkcbbMet_Pago.KeyValue = Null then   // Muestro por defecto efectivo como metodo de pago
                if fdqryMetodos_pago.Locate('NOMBRE','Efectivo',[]) then
                   dblkcbbMet_Pago.KeyValue := fdqryMetodos_pago.FieldByName('IDMETODO_PAGO').Value;
             if fdqryClientes.Locate('NOMBRE_COMERCIAL','Consumidor Final', []) then    // Muestro por defecto consumidor final
                fdqryMDVentasRanged.FieldByName('FK_IDCLIENTE').Value := fdqryClientes.FieldByName('ID_CLIENTE').Value;
             if fdqryTipo_comprobante.Locate('LETRA','C', []) then    // Muestro por defecto Factura C
                fdqryMDVentasRanged.FieldByName('TIPO').Value := fdqryTipo_comprobante.FieldByName('ID_TIPO_COMP').Value;
             if dblkcbblookupIDPV.KeyValue = Null then  // Muestro por defecto el primer punto de venta
                begin
                  fdqryPuntos_venta.First;
                  fdqryMDVentasRanged.FieldByName('FK_IDPUNTO_VENTA').Value := fdqryPuntos_venta.FieldByName('IDPUNTOVENTA').Value;
                end;
             if dblkcbblookupDeposito.KeyValue = Null then    //muestro por defecto el deposito guardado en el archivo ini, si no lo encuentra(en la tabla depositos, la cual ya esta filtrada segun la sucursal) carga el primer deposito disponible
                if fdqryDepositos.Locate('NUMERO', IdDepoDefault, []) then
                   dblkcbblookupDeposito.KeyValue := fdqryDepositos.FieldByName('NUMERO').Value
                else
                  begin
                    fdqryDepositos.First;
                    dblkcbblookupDeposito.KeyValue := fdqryDepositos.FieldByName('NUMERO').Value;
                  end;
          end;
    end;
end;

end.

