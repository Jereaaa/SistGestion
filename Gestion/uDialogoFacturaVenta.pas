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
  dxGDIPlusClasses, cxSpinEdit, System.IniFiles, FireDAC.Stan.Param,
  System.ImageList, Vcl.ImgList, System.Math;

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
    lbl1: TLabel;
    dsMetPag_Venta: TDataSource;
    ilMetPag: TImageList;
    dsPlanesPago: TDataSource;
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
    procedure dsMaestroVentaStateChange(Sender: TObject);
    procedure cxdbcrncydtDescuentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxdbcrncydtRecargoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure imgAgregarClick(Sender: TObject);
  private
    { Private declarations }
    procedure PreparoGUI;
  public
    { Public declarations }
    procedure CalculoSubtotal;
    procedure AplicoDescRecar;
  end;

var
  frmDialogoFacturaVenta: TfrmDialogoFacturaVenta;

implementation

uses
  udmGestion, udmSeguridad, uBusquedaCliente, uBusquedaArticulo, uDialogoVentaMultiplesMetPag;

{$R *.dfm}


procedure TfrmDialogoFacturaVenta.AplicoDescRecar;
var
temp:Double;
begin
  with dmGestion do
    begin
      if fdqryMDVentasRanged.FieldByName('DESCUENTO').Value  > fdqryMDVentasRanged.FieldByName('RECARGO').Value then      // si el descuento es mayor que el recargo, resto y descuento la diferencia
        begin
          temp := fdqryMDVentasRanged.FieldByName('DESCUENTO').Value - fdqryMDVentasRanged.FieldByName('RECARGO').Value;  //obtengo el % a descontar
          temp := (fdqryMDVentasRanged.FieldByName('SUBTOTAL').Value *(-1))*((temp/100)-1);                               //aplico el descuento
          temp := RoundTo(temp,-2);                                                                                       //redondeo a 2 decimales
          fdqryMDVentasRanged.FieldByName('CALTOTAL').Value := temp;                                                      //guardo en un campo calculado
        end;
      if fdqryMDVentasRanged.FieldByName('DESCUENTO').Value  < fdqryMDVentasRanged.FieldByName('RECARGO').Value then     // si el recargo es mayor que el descuento, resto y recargo la diferencia
        begin
          temp := fdqryMDVentasRanged.FieldByName('RECARGO').Value - fdqryMDVentasRanged.FieldByName('DESCUENTO').Value;  //obtengo el % de recargo
          temp := fdqryMDVentasRanged.FieldByName('SUBTOTAL').Value *((temp/100)+1);                                      //aplico el recargo
          temp := RoundTo(temp,-2);                                                                                       //redondeo a 2 decimales
          fdqryMDVentasRanged.FieldByName('CALTOTAL').Value := temp;                                                      //guardo en un campo calculado
        end;
      if (fdqryMDVentasRanged.FieldByName('DESCUENTO').Value = fdqryMDVentasRanged.FieldByName('RECARGO').Value) then  //si descuento y recargo son iguales. dejo el subtotal
         fdqryMDVentasRanged.FieldByName('CALTOTAL').Value :=  fdqryMDVentasRanged.FieldByName('SUBTOTAL').Value;
    end;
end;

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
               fdqryMDVentasRanged.FieldByName('TOTAL').Value := fdqryMDVentasRanged.FieldByName('CALTOTAL').Value;
               fdqryMDVentasRANGED.Post;

               //si rec count <= 1 sino saltear
               fdqryMetpago_Ventas.Insert;
               fdqryMetpago_Ventas.FieldByName('FK_IDMETPAGO').Value := fdqryMetodos_pago.FieldByName('IDMETODO_PAGO').Value;
               fdqryMetpago_Ventas.FieldByName('FK_NRO_FACTURA_V').Value := fdqryMDVentasRANGED.FieldByName('NRO_FACTURA').Value;
               fdqryMetpago_Ventas.FieldByName('MONTO').Value := fdqryMDVentasRanged.FieldByName('TOTAL').Value;
               fdqryMetpago_Ventas.Post;
             end
          else
             begin
               fdqryMDVentasRANGED.Edit;
               //guardar los cambios en met de pago
               fdqryMDVentasRanged.FieldByName('TOTAL').Value := fdqryMDVentasRanged.FieldByName('CALTOTAL').Value;  //si estoy editando, tambien guardo el total
               fdqryMDVentasRANGED.Post;
             end;

          fdqryMetpago_Ventas.ApplyUpdates(0);
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

procedure TfrmDialogoFacturaVenta.CalculoSubtotal;  //recorre todos los items listados y suma el importe.
 var                                                //Despues se lo asigno al subtotal de la factura.
 GuardoPos : TBookmark;                             //ademas utilizo un bookmark para volver a la posicion que el usuario estaba utilizando.
 SubTotal : Double;                                 //llamo el procedimiento despues de borrar o postear un cambio en el "detalle de la compra"
begin                                               //(dmGestion - fdqryMDmoviemintosranged.after post, after delete)
  SubTotal := 0;
  with dmGestion do
    begin
       GuardoPos := fdqryMDMovimientosRanged.GetBookmark;
       fdqryMDMovimientosRanged.DisableControls;
       try
          fdqryMDMovimientosRanged.First;
          while not fdqryMDMovimientosRanged.Eof do
             begin
                SubTotal := SubTotal + fdqryMDMovimientosRanged.FieldByName('Importe').Value;
                fdqryMDMovimientosRanged.Next;
             end;
       finally
          fdqryMDMovimientosRanged.GotoBookmark(GuardoPos);
          fdqryMDMovimientosRanged.EnableControls;
          fdqryMDMovimientosRanged.FreeBookmark(GuardoPos);
       end;
       fdqryMDVentasRanged.Edit;
       fdqryMDVentasRanged.FieldByName('SUBTOTAL').Value := SubTotal;
       fdqryMDVentasRanged.Post;
    end;
end;

procedure TfrmDialogoFacturaVenta.cxdbcrncydtDescuentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then   //despues del enter saca el cursor del edit (sino queda parpadeando)
     dbgrdDetalle.SetFocus;
end;

procedure TfrmDialogoFacturaVenta.cxdbcrncydtRecargoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then     //despues del enter saca el cursor del edit (sino queda parpadeando)
     dbgrdDetalle.SetFocus;
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
       if not (CharInSet(Key,[#27, #08, #127])) then    //27= esc, 08= tecla borrar, 127=tecla delete
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

procedure TfrmDialogoFacturaVenta.dsMaestroVentaStateChange(Sender: TObject);
begin
  inherited;
  case dsMaestroVenta.DataSet.State of
    dsInactive: lbl1.Caption := 'inactive' ;
    dsBrowse: lbl1.Caption := 'browse';
    dsEdit: lbl1.Caption := 'edit';
    dsInsert: lbl1.Caption := 'insert';
    dsSetKey: lbl1.Caption := 'setkey';
    dsCalcFields: lbl1.Caption := 'calcfields';
    dsFilter: lbl1.Caption := 'filter';
    dsNewValue: lbl1.Caption := 'newvalue';
    dsOldValue: lbl1.Caption := 'oldvalue';
    dsCurValue: lbl1.Caption := 'curvalue';
    dsBlockRead: lbl1.Caption := 'blockread';
    dsInternalCalc: lbl1.Caption := 'internalCalc';
    dsOpening: lbl1.Caption := 'opening';
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
  dsMetPag_Venta.DataSet.Cancel;
  dsPlanesPago.DataSet.Cancel;

  with dmGestion do
    begin
      fdqryDepositos.Filter := '';
      fdqryDepositos.Filtered := False;
      fdqryPuntos_venta.Filter := '';
      fdqryPuntos_venta.Filtered := False;
      fdqryMetpago_ventas.Filter := '';
      fdqryMetpago_ventas.Filtered := False;
    end;
end;

procedure TfrmDialogoFacturaVenta.FormShow(Sender: TObject);
begin
  inherited;
  dsDetalleMovimiento.DataSet.Open;
  dsMaestroVenta.DataSet.Open;
  dsMetodos_Pago.DataSet.Open;
  dsSeguridad.DataSet.Open;
  dsCliente.DataSet.Open;
  dsMetPag_Venta.DataSet.Open;
  dsPlanesPago.DataSet.Open;
  PreparoGUI;
end;

procedure TfrmDialogoFacturaVenta.imgAgregarClick(Sender: TObject);
begin
  inherited;
  tfrmDialogoVentaMultiplesMetPag.MostrarModal;
end;

procedure TfrmDialogoFacturaVenta.PreparoGUI;
  var
  Ini : TIniFile;
  IdSucurDefault, IdDepoDefault : Integer;
begin
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
       fdqryDepositos.Filter := 'FK_IDSUCURSAL ='+QuotedStr(IntToStr(IdSucurDefault));           //filtro los depositos segun la sucursal
       fdqryDepositos.Filtered := True;
       fdqryPuntos_venta.Filtered := False;
       fdqryPuntos_venta.Filter := 'FK_IDSUCURSAL ='+QuotedStr(IntToStr(IdSucurDefault));
       fdqryPuntos_venta.Filtered := True;                   //filtro los pv segun la sucursal
       fdqryMetpago_ventas.Filtered := False;
       fdqryMetpago_ventas.Filter := 'FK_NRO_FACTURA_V = '+ QuotedStr(fdqryMDVentasRanged.FieldByName('NRO_FACTURA').Value);   //filtro met pags segun nro factura
       fdqryMetpago_ventas.Filtered := True;
       dsPV.DataSet.Open;
       dsDeposito.DataSet.Open;
       dsMetPag_Venta.DataSet.Open;


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
      if dsMaestroVenta.DataSet.State = dsEdit then
         begin
           dblkcbblookupDeposito.KeyValue := fdqryMDMovimientosRanged.FieldByName('FK_NUM_DEPOSITO').Value; //posiciono el lookup deposito con el valor de deposito en la tabla detalles
           if fdqryMetpago_Ventas.RecordCount > 1 then   //cambio la interfaz dependiendo de la cant de metodos de pago
              begin
                dblkcbbMet_Pago.KeyValue := Null;        //deshabilito el combobox met pag
                dblkcbbMet_Pago.Enabled := False;
                imgAgregar.Picture := nil;
                ilMetPag.GetBitmap( 1, imgAgregar.Picture.Bitmap);     //cambio el icono a una lista
              end
           else
              begin
                dblkcbbMet_Pago.Enabled := True;       //habilito el combobox metpag
                imgAgregar.Picture := nil;
                ilMetPag.GetBitmap( 0, imgAgregar.Picture.Bitmap);     // cambio el icono a un mas
                dblkcbbMet_Pago.KeyValue := fdqryMetpago_Ventas.FieldByName('FK_IDMETPAGO').Value;
              end;
         end;
    end;
end;

end.

