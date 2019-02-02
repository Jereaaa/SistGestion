unit uDialogoVentaMultiplesMetPag;
 {
  Para mejorar y simplicar el codigo se puede implementar en un futuro el mismo sistema de maestro-detalle
  que esta utilizando la tabla Ventas-Movimientos.
  Principalmente se eliminaria el filtrado y la actualizacion del id_foraneo_N�_de_factura. Ademas el
  procedimineto calculoymantengo diferencia podria ser un campo calculado
 }
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPlantillaGenerica, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinXmas2008Blue, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, cxTextEdit,
  cxCurrencyEdit, Vcl.DBCtrls, Vcl.Buttons, cxDBEdit, Vcl.ExtCtrls, System.Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmDialogoVentaMultiplesMetPag = class(TfrmPlantillaGenerica)
    dblkcbbMetPag: TDBLookupComboBox;
    cxCurrencyEditMonto: TcxCurrencyEdit;
    dbgrd1: TDBGrid;
    dsVentas: TDataSource;
    dsMetodosPago: TDataSource;
    dsMetpag_Ventas: TDataSource;
    lblMetPag: TLabel;
    lblMonto: TLabel;
    btnAgregar: TBitBtn;
    btnCancelar: TBitBtn;
    btnAceptar: TBitBtn;
    dsPlanesPago: TDataSource;
    grpTotales: TGroupBox;
    pnlTop: TPanel;
    pnlClient: TPanel;
    pnlBot: TPanel;
    lblTotal: TLabel;
    cxdbcrncydtTOTAL: TcxDBCurrencyEdit;
    lblTotalPagado: TLabel;
    dbtxtTotalPagado: TDBText;
    lblTotalFinanciado: TLabel;
    dbtxtTotalFinanciado: TDBText;
    fdmtblMetPagAux: TFDMemTable;
    dsMetodosPagoAux: TDataSource;
    procedure cxCurrencyEditMontoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrd1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAgregarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure dsMetpag_VentasDataChange(Sender: TObject; Field: TField);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure IngresoPagoYLimpioGUI (idMetPag, Cuotas: Integer; Monto: Currency);
    procedure CalculoyMantengoDiferencia;
    procedure FiltroMetodosPago;
  public
    { Public declarations }
  end;

var
  frmDialogoVentaMultiplesMetPag: TfrmDialogoVentaMultiplesMetPag;

implementation

uses
  udmGestion;

{$R *.dfm}



procedure TfrmDialogoVentaMultiplesMetPag.btn1Click(Sender: TObject);
begin
  inherited;
  FiltroMetodosPago;
end;

procedure TfrmDialogoVentaMultiplesMetPag.btnAceptarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmDialogoVentaMultiplesMetPag.btnAgregarClick(Sender: TObject);
 var
  temp : string;
  NumCuotas: integer;
begin
  inherited;
  if (dblkcbbMetPag.KeyValue <> null) and (cxCurrencyEditMonto.Value > 0) then  // verifica que se ingrese Met de Pag y Monto
     if dmGestion.fdqryMetodos_pago.Locate('IDMETODO_PAGO', dblkcbbMetPag.KeyValue,[]) then //verifica si es tarjeta de credito
        if dmGestion.fdqryMetodos_pago.FieldByName('TIPO').Value = 'C' then                 //verifica si es tarjeta de credito
           begin
             temp := InputBox('Ingrese la cantidad de cuotas','N�mero de cuotas: ', NullAsStringValue);  //muestro in dialogo para ingresar la cant de cuotas
             if (temp <> '') and (TryStrToInt(temp, NumCuotas)) and not (NumCuotas > 120) and (NumCuotas >= 1) then   //si el dialogo tiene algo, es entero, no es mayor de 120 y es mayor igual que 1
                IngresoPagoYLimpioGUI(dblkcbbMetPag.KeyValue, NumCuotas, cxCurrencyEditMonto.Value)
             else
                Beep;
           end
        else
          IngresoPagoYLimpioGUI(dblkcbbMetPag.KeyValue, 0, cxCurrencyEditMonto.Value); //si no es credito paso 0 en numero de cuotas (el procedure lo ignora)
end;

procedure TfrmDialogoVentaMultiplesMetPag.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dmGestion.fdqryMetpago_ventas.CancelUpdates;
  Close;
end;

procedure TfrmDialogoVentaMultiplesMetPag.CalculoyMantengoDiferencia;
var
Dif, temp: double;
begin
  // este procedimiento mantiene el label que calcula la diferencia entre el subtotal a pagar y la sumatoria de los metodos de pagos (sin costos de financiamiento)
  if dsMetpag_Ventas.State <> dsInsert then
    with dmGestion do
      begin
         if VarIsNull(fdqryMetpago_Ventas.Aggregates.AggregateByName('SumMontoFinanciado').Value) then     //si no se ingreso ningun monto de pago muestra 0 en el label "Total Financiado"
            dbtxtTotalFinanciado.Caption := '$ 0,00'
         else
           begin
             temp := RoundTo(fdqryMetpago_Ventas.Aggregates.AggregateByName('SumMontoFinanciado').Value, -2);
             dbtxtTotalFinanciado.Caption := FloatToStrF(temp, ffCurrency, 20, 2);
           end;


         if not (fdqryMetpago_Ventas.RecordCount > 0) then     //si no se ingreso algun met de pago muestro lo que se debe
            begin
              Dif := fdqryMDVentasRanged.FieldByName('CALTOTAL').Value * -1;
              dbtxtTotalPagado.Caption := FloatToStrF(Dif, ffCurrency, 20, 2);
              if fdqryMDVentasRanged.FieldByName('CALTOTAL').Value <> 0 then   //si se ingresaron articulos (en rojo aparece $ -xx,xx)
                 dbtxtTotalPagado.Font.Color := clRed
              else                                                             //caso contrario (en azul $0,00)
                 dbtxtTotalPagado.Font.Color := clBlue;
            end
         else
            begin  //si se ingresaron metodos de pago
              if fdqryMDVentasRanged.FieldByName('CALTOTAL').Value = fdqryMetpago_Ventas.Aggregates.AggregateByName('SumMonto').Value then
                 begin   //si lo que se debe, con lo que se pago es igual
                   dbtxtTotalPagado.Font.Color := clBlue;
                   dbtxtTotalPagado.Caption := '$ 0,00';
                 end;
              Dif := fdqryMDVentasRanged.FieldByName('CALTOTAL').Value - fdqryMetpago_Ventas.Aggregates.AggregateByName('SumMonto').Value;
              if fdqryMDVentasRanged.FieldByName('CALTOTAL').Value > fdqryMetpago_Ventas.Aggregates.AggregateByName('SumMonto').Value then
                 begin
                   dbtxtTotalPagado.Font.Color := clRed;   //si lo que hay que pagar es mayor a lo que se va pagando -> rojo (falta plata)
                   Dif := Dif * -1;                        // multiplico *-1 para mostrar cuanto falta pagar con un signo menos adelante
                   dbtxtTotalPagado.Caption := FloatToStrF(Dif, ffCurrency, 20, 2);
                 end;
              if fdqryMDVentasRanged.FieldByName('CALTOTAL').Value < fdqryMetpago_Ventas.Aggregates.AggregateByName('SumMonto').Value then
                 begin
                   dbtxtTotalPagado.Font.Color := clGreen; //si lo que hay que pagar es menor a lo que se va pagando -> verde (sobra plata)
                   Dif := Dif * -1;                        //multiplico *-1 para mostrar lo que sobra en numeros positivos
                   dbtxtTotalPagado.Caption := FloatToStrF(Dif, ffCurrency, 20, 2);
                 end;
            end;
      end;
end;

procedure TfrmDialogoVentaMultiplesMetPag.cxCurrencyEditMontoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then             // despues del enter cambia el focus (al boton). verificar tab order
     keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TfrmDialogoVentaMultiplesMetPag.dbgrd1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_DELETE) or (Key = 08) then   //con delete en columna met pag -> borra
   with dmGestion do
      if (dbgrd1.Columns.Items[dbgrd1.SelectedIndex].Title.Caption = fdqryMetpago_ventas.FieldByName('lookupNombre').DisplayLabel) then
         if fdqryMetpago_Ventas.RecordCount > 0 then
            begin
              fdqryMetpago_ventas.Delete;
              keybd_event(VK_ESCAPE, 0, 0, 0);
              FiltroMetodosPago;
            end;
end;

procedure TfrmDialogoVentaMultiplesMetPag.dsMetpag_VentasDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  CalculoyMantengoDiferencia;
end;

procedure TfrmDialogoVentaMultiplesMetPag.FiltroMetodosPago;
{este procedimiento carga los metodos de pago y filtra la tabla auxiliar de memoria -> para mantener el combobox filtrado}
var
 GuardoPos : TBookmark;
 Filtro: string;
begin
  with dmGestion do
    begin
       GuardoPos := fdqryMetpago_Ventas.GetBookmark;
       fdqryMetpago_Ventas.DisableControls;
       Filtro := '';
       try
          fdqryMetpago_Ventas.First;
          while not fdqryMetpago_Ventas.Eof do
             begin
                Filtro := Filtro + IntToStr(fdqryMetpago_Ventas.FieldByName('FK_IDMETPAGO').Value) + ', ';
                fdqryMetpago_Ventas.Next;
             end;
       finally
          fdqryMetpago_Ventas.GotoBookmark(GuardoPos);
          fdqryMetpago_Ventas.EnableControls;
          fdqryMetpago_Ventas.FreeBookmark(GuardoPos);
       end;
       fdmtblMetPagAux.CopyDataSet(dmGestion.fdqryMetodos_pago, [coStructure, coRestart, coAppend]); //carga la tabla de memoria
       fdmtblMetPagAux.Filtered := False;
       fdmtblMetPagAux.Filter := 'IDMETODO_PAGO not IN ('+ Filtro +')';
       if Filtro = '' then
          fdmtblMetPagAux.Filtered := False
       else
          fdmtblMetPagAux.Filtered := True;
       fdmtblMetPagAux.Open;
    end;
end;

procedure TfrmDialogoVentaMultiplesMetPag.FormShow(Sender: TObject);
begin
  inherited;
  if not dsMetodosPago.DataSet.Active then
     dsMetodosPago.DataSet.Open;
  FiltroMetodosPago;
  if not dsMetodosPagoAux.DataSet.Active then
     dsMetodosPagoAux.DataSet.Open;
  if not dsMetpag_Ventas.DataSet.Active then
     dsMetpag_Ventas.DataSet.Open;
  if not dsPlanesPago.DataSet.Active then
     dsPlanesPago.DataSet.Open;
  CalculoyMantengoDiferencia;
end;

procedure TfrmDialogoVentaMultiplesMetPag.IngresoPagoYLimpioGUI(idMetPag,
  Cuotas: Integer; Monto: Currency);
begin
  with dmGestion do
    begin
      fdqryMetpago_ventas.Insert;
      fdqryMetpago_ventas.FieldByName('FK_IDMETPAGO').Value := idMetPag;
      fdqryMetpago_ventas.FieldByName('MONTO').Value := Monto;
      if Cuotas > 1 then
         begin
           fdqryMetpago_ventas.FieldByName('CUOTAS').Value := Cuotas;
           if fdqryPlanes_pago.Locate('NROCUOTA; FK_IDMETODOPAGO', VarArrayOf([fdqryMetpago_Ventas.FieldByName('CUOTAS').Value, fdqryMetpago_Ventas.FieldByName('FK_IDMETPAGO').Value]), []) then
              fdqryMetpago_ventas.FieldByName('COEF_HISTORICO').Value := fdqryPlanes_pago.FieldByName('COEFICIENTE').Value
         end;
      fdqryMetpago_ventas.Post;
      dblkcbbMetPag.KeyValue := -1; //limpia combobox
      cxCurrencyEditMonto.Clear;   //limpia currency edt
      FiltroMetodosPago;
    end;
end;

end.
