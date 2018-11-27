unit uDialogoVentaMultiplesMetPag;

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
  cxCurrencyEdit, Vcl.DBCtrls, Vcl.Buttons, cxDBEdit, Vcl.ExtCtrls;

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
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    procedure cxCurrencyEditMontoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrd1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsVentasDataChange(Sender: TObject; Field: TField);
    procedure btnAgregarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure dsMetpag_VentasDataChange(Sender: TObject; Field: TField);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure IngresoPagoYLimpioGUI (idMetPag, Cuotas: Integer; Monto: Currency);
    procedure CalculoyMantengoDiferencia;
  public
    procedure AplicoCoeficiente;
    { Public declarations }
  end;

var
  frmDialogoVentaMultiplesMetPag: TfrmDialogoVentaMultiplesMetPag;

implementation

uses
  udmGestion;

{$R *.dfm}

procedure TfrmDialogoVentaMultiplesMetPag.AplicoCoeficiente;    //busco el coeficiente dependiendo de la tarjeta y la cantidad de cuotas; Calcula el costo final
begin                                                           //el procedimiento lo llmano en fdqryMetpago_VentasCalcFields
  with dmGestion do
    begin
      if (fdqryMetpago_Ventas.FieldByName('lookupTIPO').Value = 'C') and (fdqryMetpago_Ventas.FieldByName('CUOTAS').Value > 1) then
         if fdqryPlanes_pago.Locate('NROCUOTA; FK_IDMETODOPAGO', VarArrayOf([fdqryMetpago_Ventas.FieldByName('CUOTAS').Value, fdqryMetpago_Ventas.FieldByName('FK_IDMETPAGO').Value]), []) then
            fdqryMetpago_Ventas.FieldByName('MONTOFINAL').Value := fdqryMetpago_Ventas.FieldByName('MONTO').Value * fdqryPlanes_pago.FieldByName('COEFICIENTE').Value
         else
            fdqryMetpago_Ventas.FieldByName('MONTOFINAL').Value := fdqryMetpago_Ventas.FieldByName('MONTO').Value
      else
        fdqryMetpago_Ventas.FieldByName('MONTOFINAL').Value := fdqryMetpago_Ventas.FieldByName('MONTO').Value;  // muestro un valor por defecto si no credito o es en 1 cuota
    end;
end;

procedure TfrmDialogoVentaMultiplesMetPag.btn1Click(Sender: TObject);
begin
  inherited;
  ShowMessage(FloatToStr(dmGestion.fdqryMDVentasRanged.FieldByName('CALTOTAL').Value));
end;

procedure TfrmDialogoVentaMultiplesMetPag.btn2Click(Sender: TObject);
begin
  inherited;
  ShowMessage(FloatToStr(dmGestion.fdqryMetpago_Ventas.Aggregates.AggregateByName('SumMontoFinanciado').Value));
end;

procedure TfrmDialogoVentaMultiplesMetPag.btn3Click(Sender: TObject);
begin
  inherited;
   ShowMessage(FloatToStr(dmGestion.fdqryMetpago_Ventas.Aggregates.AggregateByName('SumMonto').Value));
end;

procedure TfrmDialogoVentaMultiplesMetPag.btnAceptarClick(Sender: TObject);
begin
  inherited;
  dmGestion.fdqryMetpago_Ventas.ApplyUpdates(0);
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
             if temp <> '' then                                                                          //si el dialogo tiene algo
                begin
                  if TryStrToInt(temp, NumCuotas) then                                                    //verifica que sea un numero
                     IngresoPagoYLimpioGUI(dblkcbbMetPag.KeyValue, NumCuotas, cxCurrencyEditMonto.Value);
                end
             else
                 Beep;
           end
        else
            IngresoPagoYLimpioGUI(dblkcbbMetPag.KeyValue, 0, cxCurrencyEditMonto.Value); //si no es credito paso 0 en numero de cuotas (el procedure lo ignora)
end;

procedure TfrmDialogoVentaMultiplesMetPag.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dmGestion.fdqryMetpago_Ventas.CancelUpdates;
  Close;
end;

procedure TfrmDialogoVentaMultiplesMetPag.CalculoyMantengoDiferencia;
var
Dif: double;
begin
  // este procedimiento mantiene el label que calcula la diferencia entre el subtotal a pagar y la sumatoria de los metodos de pagos (sin costos de financiamiento)
  if dsMetpag_Ventas.State <> dsInsert then
    with dmGestion do
      begin
         if VarIsNull(fdqryMetpago_Ventas.Aggregates.AggregateByName('SumMontoFinanciado').Value) then     //si no se ingreso ningun monto de pago muestra 0 en el label "Total Financiado"
            dbtxtTotalFinanciado.Caption := '$ 0'
         else
            dbtxtTotalFinanciado.Caption := FloatToStrF(fdqryMetpago_Ventas.Aggregates.AggregateByName('SumMontoFinanciado').Value, ffCurrency, 20, 2);

         if not (fdqryMetpago_Ventas.RecordCount > 0) or (fdqryMDVentasRanged.FieldByName('CALTOTAL').Value = fdqryMetpago_Ventas.Aggregates.AggregateByName('SumMonto').Value)then
            begin  //si se ingreso algun met de pago y su monto OR el importe es = a lo pagado
              dbtxtTotalPagado.Font.Color := clBlue;
              dbtxtTotalPagado.Caption := '$ 0';
            end
         else
           begin
             Dif := fdqryMDVentasRanged.FieldByName('CALTOTAL').Value - fdqryMetpago_Ventas.Aggregates.AggregateByName('SumMonto').Value;
             if fdqryMDVentasRanged.FieldByName('CALTOTAL').Value > fdqryMetpago_Ventas.Aggregates.AggregateByName('SumMonto').Value then
                begin
                  dbtxtTotalPagado.Font.Color := clRed;   //si lo que hay que pagar es > a lo que se va pagando -> rojo (falta plata)
                  Dif := Dif * -1;
                  dbtxtTotalPagado.Caption := FloatToStrF(Dif, ffCurrency, 20, 2);
                end;
             if fdqryMDVentasRanged.FieldByName('CALTOTAL').Value < fdqryMetpago_Ventas.Aggregates.AggregateByName('SumMonto').Value then
                begin
                  dbtxtTotalPagado.Font.Color := clGreen; //si lo que hay que pagar es < a lo que se va pagando -> verde (sobra plata)
                  Dif := Dif * -1;
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
    begin
      if (dbgrd1.Columns.Items[dbgrd1.SelectedIndex].Title.Caption = fdqryMetpago_ventas.FieldByName('lookupNombre').DisplayLabel) then
       begin
         fdqryMetpago_ventas.Delete;
         keybd_event(VK_ESCAPE, 0, 0, 0);
       end;
    end;
end;

procedure TfrmDialogoVentaMultiplesMetPag.dsMetpag_VentasDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  CalculoyMantengoDiferencia;
end;

procedure TfrmDialogoVentaMultiplesMetPag.dsVentasDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with dmGestion do              // filtra tabla metpag_ventas segun Nro de Factura
    begin
      fdqryMetpago_ventas.Close;
      fdqryMetpago_ventas.Filtered := False;
      fdqryMetpago_ventas.Filter := 'FK_NRO_FACTURA_V = '+ QuotedStr(fdqryMDVentasRanged.FieldByName('NRO_FACTURA').Value);
      fdqryMetpago_ventas.Filtered := True;
      fdqryMetpago_ventas.Open;
    end;
end;

procedure TfrmDialogoVentaMultiplesMetPag.FormShow(Sender: TObject);
begin
  inherited;
  if not dsMetodosPago.DataSet.Active then
     dsMetodosPago.DataSet.Open;
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
      fdqryMetpago_Ventas.ApplyUpdates(0);
      dblkcbbMetPag.KeyValue := -1; //limpia combobox
      cxCurrencyEditMonto.Clear;   //limpia currency edt
    end;
end;

end.