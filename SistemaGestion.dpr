program SistemaGestion;

uses
  Vcl.Forms,
  uPlantillaGenerica in 'uPlantillaGenerica.pas' {frmPlantillaGenerica},
  uLogin in 'uLogin.pas' {frmLogin},
  udmGestion in 'udmGestion.pas' {dmGestion: TDataModule},
  udmSeguridad in 'udmSeguridad.pas' {dmSeguridad: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  uMenuPrincipal in 'uMenuPrincipal.pas' {frmMenuPrincipal},
  uDialogoGenerico in 'uDialogoGenerico.pas' {frmDialogoGenerico},
  uGrillaGenerica in 'uGrillaGenerica.pas' {frmGrillaGenerica},
  uDialogoGrupos in 'Seguridad\uDialogoGrupos.pas' {frmDialogoGrupos},
  uDialogoOpciones in 'Seguridad\uDialogoOpciones.pas' {frmDialogoOpciones},
  uDialogoUsuarios in 'Seguridad\uDialogoUsuarios.pas' {frmDialogoUsuarios},
  uGrillaGrupos in 'Seguridad\uGrillaGrupos.pas' {frmGrillaGrupos},
  uGrillaOpciones in 'Seguridad\uGrillaOpciones.pas' {frmGrillaOpciones},
  uGrillaUsuarios in 'Seguridad\uGrillaUsuarios.pas' {frmGrillaUsuarios},
  ufrmGrup_Usu in 'Seguridad\ufrmGrup_Usu.pas' {frmGrup_Usu},
  ufrmGrup_Opc in 'Seguridad\ufrmGrup_Opc.pas' {frmGrup_Opc},
  uConfiguracion in 'Gestion\uConfiguracion.pas' {frmConfiguracion},
  uGrillaClientes in 'Gestion\uGrillaClientes.pas' {frmGrillaClientes},
  uDialogoClientes in 'Gestion\uDialogoClientes.pas' {frmDialogoClientes},
  uGrillaSituacionTrib in 'Gestion\uGrillaSituacionTrib.pas' {frmGrillaSituacionTrib},
  uDialogoSituacionTrib in 'Gestion\uDialogoSituacionTrib.pas' {frmDialogoSituacionTrib},
  uGrillaProveedores in 'Gestion\uGrillaProveedores.pas' {frmGrillaProveedores},
  uDialogoProveedores in 'Gestion\uDialogoProveedores.pas' {frmDialogoProveedores},
  uGrillaArticulos in 'Gestion\uGrillaArticulos.pas' {frmGrillaArticulos},
  uDialogoArticulos in 'Gestion\uDialogoArticulos.pas' {frmDialogoArticulos},
  uGrillaMetPago in 'Gestion\uGrillaMetPago.pas' {frmGrillaMetPago},
  uDialogoMetPago in 'Gestion\uDialogoMetPago.pas' {frmDialogoMetPago},
  uGrillaPlanPago in 'Gestion\uGrillaPlanPago.pas' {frmGrillaPlanPago},
  uDialogoPlanPago in 'Gestion\uDialogoPlanPago.pas' {frmDialogoPlanPago},
  uGrillaVentas in 'Gestion\uGrillaVentas.pas' {frmGrillaVentas},
  uGrillaDepositos in 'Gestion\uGrillaDepositos.pas' {frmGrillaDepositos},
  uDialogoDepositos in 'Gestion\uDialogoDepositos.pas' {frmDialogoDepositos},
  uGrillaSucursales in 'Gestion\uGrillaSucursales.pas' {frmGrillaSucursal},
  uDialogoSucursal in 'Gestion\uDialogoSucursal.pas' {frmDialogoSucursal},
  uDialogoFacturaVenta in 'Gestion\uDialogoFacturaVenta.pas' {frmDialogoFacturaVenta},
  uBusquedaGenerica in 'uBusquedaGenerica.pas' {frmBusquedaGenerica},
  uBusquedaCliente in 'Gestion\uBusquedaCliente.pas' {frmBusquedaCliente},
  uGrillaTipoComp in 'Gestion\uGrillaTipoComp.pas' {frmGrillaTipoComp},
  uDialogoTipoComp in 'Gestion\uDialogoTipoComp.pas' {frmDialogoTipoComp},
  uBusquedaArticulo in 'Gestion\uBusquedaArticulo.pas' {frmBusquedaArticulo};

{$R *.res}

begin
  TStyleManager.TrySetStyle('Amakrits');
  Application.CreateForm(TdmGestion, dmGestion);
  Application.CreateForm(TdmSeguridad, dmSeguridad);
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  if TfrmLogin.logea then
     begin
       Application.Initialize;
       Application.MainFormOnTaskbar := True;
       Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
       Application.Run
     end
end.
