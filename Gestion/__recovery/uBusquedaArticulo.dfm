inherited frmBusquedaArticulo: TfrmBusquedaArticulo
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTop: TPanel
    inherited srchbx1: TSearchBox
      OnKeyUp = srchbx1KeyUp
      OnInvokeSearch = srchbx1InvokeSearch
    end
  end
  inherited pnlClient: TPanel
    inherited dbgrd1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGOALT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COSTO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IVA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FK_IDPROVEEDOR'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'lookupProveedor'
          Visible = False
        end>
    end
  end
  inherited dsBase: TDataSource
    DataSet = dmGestion.fdqryArticulos
  end
end
