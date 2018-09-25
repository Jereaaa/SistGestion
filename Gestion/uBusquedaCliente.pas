unit uBusquedaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBusquedaGenerica, Data.DB,
  Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  dxGDIPlusClasses, Vcl.ExtCtrls;

type
  TfrmBusquedaCliente = class(TfrmBusquedaGenerica)
    procedure srchbx1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure srchbx1InvokeSearch(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    RegInicial: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBusquedaCliente: TfrmBusquedaCliente;

implementation

uses
  udmGestion;

{$R *.dfm}

procedure TfrmBusquedaCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   with dmGestion do
     begin
        if not(fdqryMDVentasRanged.State = dsEdit) or not(fdqryMDVentasRanged.State = dsInsert) then
           fdqryMDVentasRanged.Edit;
        if not (fdqryClientes.IsEmpty) then
           fdqryMDVentasRanged.FieldByName('FK_IDCLIENTE').Value := fdqryClientes.FieldByName('ID_CLIENTE').Value
        else
           fdqryClientes.Locate('ID_CLIENTE', RegInicial, []);
        fdqryClientes.Filtered := False;
     end;
end;

procedure TfrmBusquedaCliente.FormShow(Sender: TObject);
begin
  inherited;
  lblTitulo.Caption := 'Clientes';
  RegInicial := dsBase.DataSet.FieldByName('ID_CLIENTE').Value;
end;

procedure TfrmBusquedaCliente.srchbx1InvokeSearch(Sender: TObject);
begin
  inherited;
  with dmGestion do
    begin
       fdqryClientes.FilterOptions := [foCaseInsensitive];
       fdqryClientes.Filter := 'NOMBRE_COMERCIAL LIKE' + QuotedStr('%'+srchbx1.Text+'%')+' OR '+'NOMBRE LIKE' + QuotedStr('%'+srchbx1.Text+'%')+' OR '+'APELLIDO LIKE' + QuotedStr('%'+srchbx1.Text+'%');
       fdqryClientes.Filtered := True;
    end;
end;

procedure TfrmBusquedaCliente.srchbx1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  with dmGestion do
    begin
       if srchbx1.Text = '' then
          begin
            fdqryClientes.Filter := '';
            fdqryClientes.Filtered := False;
          end
       else
          srchbx1.OnInvokeSearch(Self);
    end;
end;

end.
