inherited frmGrillaVentas: TfrmGrillaVentas
  Caption = 'Ventas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    inherited dbnvgr1: TDBNavigator
      Hints.Strings = ()
      OnClick = dbnvgr1Click
    end
  end
  inherited pnl2: TPanel
    inherited dbgrd1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'FECHA'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NRO_FACTURA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lookupNomCompCliente'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'HORA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'RECARGO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NRO_COMPROBANTE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'SUBTOTAL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FK_IDCLIENTE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FK_IDPUNTO_VENTA'
          Visible = False
        end>
    end
  end
  inherited dsBase: TDataSource
    DataSet = dmGestion.fdqryMDVentasRanged
  end
  object dsDetalle: TDataSource
    DataSet = dmGestion.fdqryMDMovimientosRanged
    Left = 32
    Top = 80
  end
end
