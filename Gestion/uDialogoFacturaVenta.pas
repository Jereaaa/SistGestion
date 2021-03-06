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
  System.ImageList, Vcl.ImgList, System.Math, Vcl.Clipbrd, Vcl.Menus;

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
    imgAgregar: TImage;
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
    procedure dsMetPag_VentaDataChange(Sender: TObject; Field: TField);
    procedure cxdbcrncydtDescuentoExit(Sender: TObject);
    procedure pnlRecargoExit(Sender: TObject);
    procedure cxdbcrncydtRecargoExit(Sender: TObject);
    procedure dbgrdDetalleExit(Sender: TObject);
   // procedure imgAgregarClick(Sender: TObject);
  private
    { Private declarations }
    procedure PreparoGUI;
    procedure ActualizoImgAgregarMetPagGUI;
  public
    { Public declarations }
    procedure CalculoSubtotal;
  end;

var
  frmDialogoFacturaVenta: TfrmDialogoFacturaVenta;

implementation

uses
  udmGestion, udmSeguridad, uBusquedaCliente, uBusquedaArticulo, uDialogoVentaMultiplesMetPag;

{$R *.dfm}




procedure TfrmDialogoFacturaVenta.ActualizoImgAgregarMetPagGUI;     //llamo este procedimiento cuando muestro el form y cuando actualizo los met de pago
begin
  with dmGestion do
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

procedure TfrmDialogoFacturaVenta.btnAceptarClick(Sender: TObject);
 var
  temp : string;
  NumCuotas: integer;
begin
  inherited;
  //funcion chequar datos: boolean (verifique input y situacion deposito sucursal pv
  with dmGestion do
    begin
       //-------------------------------funciones para verificar input--------------------------------------//
       if (fdqryMetpago_Ventas.RecordCount = 0) and (dblkcbbMet_Pago.KeyValue = Null)  then    //verifica que se haya ingresado algun metodo de pago
          raise Exception.Create('No se ingresaron m�todos de pago');
       if dblkcbblookupDeposito.KeyValue = Null then    //verifica que se haya ingresado algun metodo de pago
          raise Exception.Create('Seleccione un deposito');

        //--------------------------------------------------------------------------------------------------//

       if (fdqryMetpago_Ventas.RecordCount = 0) and (dblkcbbMet_Pago.KeyValue <> Null)  then    //un solo met pag
          if fdqryMetodos_pago.FieldByName('TIPO').Value = 'C' then                 //verifica si es tarjeta de credito
             begin
               temp := InputBox('Ingrese la cantidad de cuotas','N�mero de cuotas: ', NullAsStringValue);  //muestro un dialogo para ingresar la cant de cuotas
               if (temp <> '') and (TryStrToInt(temp, NumCuotas)) and not (NumCuotas > 120) and (NumCuotas >= 1) then   //si el dialogo tiene algo, es entero, no es mayor de 120 y es mayor igual que 1
                  begin
                    fdqryMetpago_ventas.Insert;
                    fdqryMetpago_ventas.FieldByName('FK_IDMETPAGO').Value := fdqryMetodos_pago.FieldByName('IDMETODO_PAGO').Value;
                    fdqryMetpago_ventas.FieldByName('MONTO').Value := fdqryMDVentasRanged.FieldByName('CALTOTAL').Value;
                    if NumCuotas > 1 then
                       begin
                         fdqryMetpago_ventas.FieldByName('CUOTAS').Value := NumCuotas;
                         if fdqryPlanes_pago.Locate('NROCUOTA; FK_IDMETODOPAGO', VarArrayOf([fdqryMetpago_Ventas.FieldByName('CUOTAS').Value, fdqryMetpago_Ventas.FieldByName('FK_IDMETPAGO').Value]), []) then
                            fdqryMetpago_ventas.FieldByName('COEF_HISTORICO').Value := fdqryPlanes_pago.FieldByName('COEFICIENTE').Value;
                       end;
                    fdqryMetpago_ventas.Post;
                    //probar el mensaje de continuar aca
                  end
               else
                  begin
                    Beep;
                    Abort;
                  end;
             end;


        //-------------------------------Facturacion--------------------------------------//
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

               while not fdqryMetpago_Ventas.Eof do           //busca metodos de pago con nro de fact -1 (si el numero de factura es -1 es porque se esta realizando una factura nueva) y actualiza el valor
                 begin
                   fdqryMetpago_Ventas.First;
                   if fdqryMetpago_Ventas.FieldByName('FK_NRO_FACTURA_V').Value = -1 then
                      begin
                        fdqryMetpago_Ventas.Edit;
                        fdqryMetpago_Ventas.FieldByName('FK_NRO_FACTURA_V').Value := fdqryMDVentasRANGED.FieldByName('NRO_FACTURA').Value;
                        fdqryMetpago_Ventas.Post;
                      end;
                 end;
             end
          else
             begin
//               fdqryMDVentasRANGED.Edit;
//               //guardar los cambios en met de pago
//               fdqryMDVentasRanged.FieldByName('TOTAL').Value := fdqryMDVentasRanged.FieldByName('CALTOTAL').Value;  //si estoy editando, tambien guardo el total
//               fdqryMDVentasRANGED.Post;
             end;

          fdqryMetpago_Ventas.ApplyUpdates(0);
          fdqryMetpago_Ventas.CommitUpdates;
          fdschmdptrVentasRanged.ApplyUpdates(0);
          fdschmdptrVentasRanged.CommitUpdates;
          GestionConnection.Commit;
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
  dmGestion.fdqryMetpago_Ventas.CancelUpdates;
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

procedure TfrmDialogoFacturaVenta.cxdbcrncydtDescuentoExit(Sender: TObject);
begin
  inherited;
  with dmGestion do
    begin
      if dsMaestroVenta.DataSet.FieldByName('DESCUENTO').IsNull then
         dsMaestroVenta.DataSet.FieldByName('DESCUENTO').Value := 0;
    end;
end;

procedure TfrmDialogoFacturaVenta.cxdbcrncydtDescuentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then   //despues del enter saca el cursor del edit (sino queda parpadeando)
     dbgrdDetalle.SetFocus;
end;

procedure TfrmDialogoFacturaVenta.cxdbcrncydtRecargoExit(Sender: TObject);
begin
  inherited;
   with dmGestion do
    begin
      if dsMaestroVenta.DataSet.FieldByName('RECARGO').IsNull then
         dsMaestroVenta.DataSet.FieldByName('RECARGO').Value := 0;
    end;
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

procedure TfrmDialogoFacturaVenta.dbgrdDetalleExit(Sender: TObject);
begin
  inherited;
  if dsDetalleMovimiento.DataSet.State in [dsInsert, dsEdit] then
     dsDetalleMovimiento.DataSet.Post;

end;

procedure TfrmDialogoFacturaVenta.dbgrdDetalleKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 {
   ---ESTE CODIGO GENERA PROBLEMAS PARA VERIFICAR CON SET TEXT PORQUE AL CERRAR EL ERROR CON ENTER VUELVE A APARECER EL MSJ DE ERROR

  if Key = VK_RETURN then          //con enter postea en detalles
    if (dsDetalleMovimiento.State = dsInsert) or (dsDetalleMovimiento.State = dsEdit) then
       dmGestion.fdqryMDMovimientosRanged.Post; }

  if (Key = VK_DELETE) or (Key = 08) then   //con delete borra en detalles
    if (dbgrdDetalle.Columns.Items[dbgrdDetalle.SelectedIndex].Title.Caption = dmGestion.fdqryMDMovimientosRanged.FieldByName('NombreArt').DisplayLabel) then
       if dmGestion.fdqryMDMovimientosRanged.RecordCount > 0 then
          dmGestion.fdqryMDMovimientosRanged.Delete;
  if ((ssCtrl in Shift) AND (Key = ord('V'))) or ((ssShift in Shift) and (Key = VK_INSERT)) then     //no se puede pegar
     begin
       if Clipboard.HasFormat(CF_TEXT) then
          ClipBoard.Clear;
       Key := 0;
     end;
end;

procedure TfrmDialogoFacturaVenta.dbgrdDetalleKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //fila articulo invoca el otro form
  if (dbgrdDetalle.Columns.Items[dbgrdDetalle.SelectedIndex].Title.Caption = dmGestion.fdqryMDMovimientosRanged.FieldByName('NombreArt').DisplayLabel) then
     begin
       if not (CharInSet(Key,[#27, #08, #127])) then    //27= esc, 08= tecla borrar, 127=tecla delete
          begin
            Key := #0;
            TfrmBusquedaArticulo.MostrarModal;         //buscar articulo
            keybd_event(VK_ESCAPE, 0, 0, 0);           //evita un bug grafico del dbgrid
          end;
     end;

   if (dbgrdDetalle.Columns.Items[dbgrdDetalle.SelectedIndex].Title.Caption = dmGestion.fdqryMDMovimientosRanged.FieldByName('PRECIO_UNITARIO').DisplayLabel) and (TDBGrid(Sender).DataSource.DataSet.State in [dsEdit, dsInsert]) then
      TEdit(TDBGrid(Sender).Controls[0]).MaxLength := 15;


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
  case dsDetalleMovimiento.DataSet.State of
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

procedure TfrmDialogoFacturaVenta.dsMetPag_VentaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  ActualizoImgAgregarMetPagGUI;
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
  if dsDetalleMovimiento.DataSet.State in [dsEdit, dsInsert] then
     dsDetalleMovimiento.DataSet.Post;
  tfrmDialogoVentaMultiplesMetPag.MostrarModal;
end;

procedure TfrmDialogoFacturaVenta.pnlRecargoExit(Sender: TObject);
begin
  inherited;
  with dmGestion do
    begin
      if dsMaestroVenta.DataSet.FieldByName('RECARGO').IsNull then
         dsMaestroVenta.DataSet.FieldByName('RECARGO').Value := 0;
    end;
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
           ActualizoImgAgregarMetPagGUI;
         end;
    end;
end;

end.

