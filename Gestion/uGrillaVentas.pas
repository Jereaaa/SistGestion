unit uGrillaVentas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uGrillaGenerica, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, System.UITypes, System.IniFiles, FireDAC.Stan.Param;

type
  TfrmGrillaVentas = class(TfrmGrillaGenerica)
    dsDetalle: TDataSource;
    procedure btnNuevoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEliminarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrillaVentas: TfrmGrillaVentas;

implementation

uses
  udmGestion, uDialogoFacturaVenta;

{$R *.dfm}

procedure TfrmGrillaVentas.btnEditarClick(Sender: TObject);
begin
  inherited;
  TfrmDialogoFacturaVenta.MostrarModal;
end;

procedure TfrmGrillaVentas.btnEliminarClick(Sender: TObject);
begin
 // inherited;
  if not (dsBase.DataSet.IsEmpty) then
    begin
      if MessageDlg('Borrar registro?', mtConfirmation,[mbOK, mbCancel],0) = mrOk then
         begin
            DSBASE.DataSet.Delete;
            with dmGestion do
              begin
                fdschmdptrVentasRanged.ApplyUpdates(0);
                fdschmdptrVentasRanged.CommitUpdates;
              end;
         end;
    end
  else
    Abort
end;

procedure TfrmGrillaVentas.btnNuevoClick(Sender: TObject);
begin
  inherited;
  TfrmDialogoFacturaVenta.MostrarModal;
end;

procedure TfrmGrillaVentas.dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
   if Button = nbInsert then
      begin
        DSBASE.DataSet.Insert;
        TfrmDialogoFacturaVenta.MostrarModal
      end;

  if Button = nbEdit then
      begin
        DSBASE.DataSet.Edit;
        TfrmDialogoFacturaVenta.MostrarModal
      end;
end;

procedure TfrmGrillaVentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsBase.DataSet.Filtered := False;
  dsBase.DataSet.Filter := '';
  dsDetalle.DataSet.Close;
end;

procedure TfrmGrillaVentas.FormShow(Sender: TObject);
var
  FiltroSucur : string;
  Ini : TiniFile;
  IdSucurDefault : Integer;
begin
  with dmGestion do
    begin
      Ini := Tinifile.Create(dmGestion.CarpetaGestion_IniPath);
      try
         IdSucurDefault := Ini.ReadInteger('Sucursal','ID', 1);
      finally
         Ini.Free;
      end;

      fdqryDinamico.Close;
      fdqryDinamico.SQL.Clear;
      fdqryDinamico.Params.Clear;
      fdqryDinamico.Params.CreateParam(ftInteger, 'pSUCURSAL', ptInput);
      fdqryDinamico.ParamByName('pSUCURSAL').Value := IdSucurDefault;
      fdqryDinamico.SQL.Text :=   'SELECT puntos_venta.idpuntoventa '+
                                  'FROM puntos_venta '+
                                  '    INNER JOIN sucursales on (puntos_venta.fk_idsucursal = sucursales.id_sucursal) '+
                                  'WHERE sucursales.id_sucursal =:pSucursal ';
      fdqryDinamico.Open;
      fdqryDinamico.First;

      FiltroSucur := '';
      while not (fdqryDinamico.Eof) do
        begin
          FiltroSucur := FiltroSucur + inttostr(fdqryDinamico.FieldByName('IDPUNTOVENTA').Value)+',';
          fdqryDinamico.Next;
        end;

      fdqryMDVentasRanged.Filtered := False;
      fdqryMDVentasRanged.Filter := 'FK_IDPUNTO_VENTA IN '+'('+FiltroSucur+')';
      fdqryMDVentasRanged.Filtered := True;
    end;
  inherited;
  dsDetalle.DataSet.Open; //abro para filtrar
end;

end.
