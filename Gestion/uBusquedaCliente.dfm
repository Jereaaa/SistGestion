inherited frmBusquedaCliente: TfrmBusquedaCliente
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
      Top = 50
      Height = 127
      Margins.Top = 50
      Margins.Bottom = 30
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_CLIENTE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NOMBRE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'APELLIDO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DOMICILIO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'LOCALIDAD'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PROVINCIA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DNI'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CUIT'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TELEFONO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'MAIL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FK_SITUACIONTRIB'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'LookupSituacionTrib'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'RAZON_SOCIAL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NOMBRE_COMERCIAL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NOMBRECOMP'
          Width = 604
          Visible = True
        end>
    end
  end
  inherited dsBase: TDataSource
    DataSet = dmGestion.fdqryClientes
  end
end
