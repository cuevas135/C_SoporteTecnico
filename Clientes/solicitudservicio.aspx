<%@ Page Language="C#" AutoEventWireup="true" CodeFile="solicitudservicio.aspx.cs"
    Inherits="Clientes_solicitudservicio" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Solicitud servicio</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../bootstrap/js/jquery-1.12.4.min.js" type="text/javascript"></script>
   
    <link href="../Otros_css_js/Menu.css" rel="stylesheet" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <style type="text/css">
        body {
            background-color: #fafafa;
            font-family: 'Roboto';
        }

        .container {
            margin: 10px auto;
            max-width: 1250px;
        }

            .container table.restables-clone {
                display: none;
            }

                .container table.restables-clone td {
                    width: 50%;
                    color: Black;
                    text-align: left;
                }

                    .container table.restables-clone td:first-child {
                        font-weight: bold;
                        color: #1E90FF;
                        text-align: right;
                    }

                .container table.restables-clone tr:first-child td {
                    background: #333;
                    color: #fff;
                }

        @media (max-width: 991px) {
            .container table.restables-origin {
                display: none;
            }

            .container table.restables-clone {
                display: table;
            }
        }
    </style>
    <script type="text/javascript">
        function eliminar_solicitud() {
            var Ok, Rpta;
            Ok = true;
            Rpta = confirm("¿Desea eliminar solicitud?");
            document.getElementById("_respuesta").value = Rpta;
            //             if (Rpta == 1)//Aceptar
            //             {
            //                 document.getElementById("_respuesta").value = true;
            //             }
            //             else {
            //                 document.getElementById("_respuesta").value = false;
            //             }
        }

        function MostrarMensaje() {
            var mensaje = document.getElementById("__mensaje").value;
            if (mensaje != "") {
                alert(mensaje);
                if (document.getElementById("__pagina").value != "")
                    location.href = document.getElementById("__pagina").value;

            }
        }

        function window_load() {
            MostrarMensaje()
        }

        function Confirmar(men) {
            if (!confirm(men))
                return false;
        }
    </script>
</head>
<body onload="MostrarMensaje()">
    <form id="frmSolicitudServidio" runat="server">
        <div class="container" style="margin-top: 5px;">
            <div class="col-md-12 col-sm-12">
                <div class="form-group col-md-12 col-sm-12 text-center">
                    <asp:Label ID="lblUsuario" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </div>
            <div class="col-md-12 col-sm-12 text-center">
                <div class="form-group col-md-4 col-sm-4">
                    <asp:Button ID="btnGenerarSolicitud" runat="server" Text="Generar Solicitud"
                        Width="140px" class="btn btn-success" CausesValidation="False"
                        UseSubmitBehavior="False" OnClick="btnGenerarSolicitud_Click"
                        PostBackUrl="~/Clientes/solicitudservicio.aspx?EnviarNotificacion=NO" />
                </div>
                <div class="form-group col-md-4 col-sm-4">
                    <asp:Button ID="btnCancelarSolicitud" runat="server" Text="Ver Solicitudes"
                        Width="140px" class="btn btn-warning" CausesValidation="False"
                        UseSubmitBehavior="False" OnClick="btnCancelarSolicitud_Click" />
                </div>
                <div class="form-group col-md-4 col-sm-4">
                    <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesion"
                        Width="140px" class="btn btn-danger"
                        PostBackUrl="~/Clientes/CerrarSession.aspx" UseSubmitBehavior="False" />
                </div>
            </div>
        </div>
        <div class="container-fluid" style="margin-top: 5px;">
            <%-- GENERAR SOLICITUD --%>
            <asp:Panel ID="PANEL_GENERAR_SOLCITUD" class="panel panel-primary" runat="server"
                Style="margin: 5px;" Visible="False">
                <div class="panel-heading" style="text-align: center">
                    <h3 class="panel-title">Seleccione servicio y modalidad</h3>
                </div>
                <div class="panel-body">
                    <div class="container">
                        <div class="col-md-12 col-sm-12">
                            <div class="form-group col-md-4 col-sm-4">
                                <label for="name"><b>Fecha emision</b></label>
                                <asp:TextBox ID="Fecha_S" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4 col-sm-4">
                                <label for="name"><b>Codigo cliente</b></label>
                                <asp:TextBox ID="CodigoPersona_S" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4 col-sm-4">
                                <label for="name"><b>Nombre</b></label>
                                <asp:TextBox ID="Nombre_P" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-12">
                            <div class="form-group col-md-4 col-sm-4">
                                <label for="name"><b>Servicio</b></label>
                                <asp:DropDownList ID="Servicios" runat="server" class="form-control" AutoPostBack="True"
                                    OnSelectedIndexChanged="Servicios_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            <div class="form-group col-md-4 col-sm-4">
                                <label for="name"><b>Modalidad</b></label>
                                <asp:DropDownList ID="Modalidades" runat="server" class="form-control">
                                    <asp:ListItem Value="-1">-----Seleccione modalidad-----</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>


                        <div class="col-md-12 col-sm-12 text-center">
                            <div class="btn-group">
                                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" Width="140px" class="btn btn-success"
                                    CausesValidation="False" OnClick="btnAgregar_Click" />
                            </div>
                        </div>


                        <div class="col-md-12 col-sm-12">
                            <div class="form-group col-md-12 col-sm-12 text-center">
                                <br />
                                <label for="name"><b>Servicios solicitados</b></label>
                            </div>
                            <div class="form-group col-md-12 col-sm-12">
                                <%--<div class="table-responsive">--%>
                                <asp:Table ID="Table_" runat="server" class="table table-bordered table-hover text-center"
                                    BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="Smaller" GridLines="Both"
                                    Style="text-align: left">
                                    <asp:TableHeaderRow ID="TableRow1" runat="server" TableSection="TableHeader">
                                        <asp:TableHeaderCell ID="CODIGOSERVICIO_" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White" Visible="False">CODIGOSERVICIO </asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="SERVICIO_" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White">SERVICIO</asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="CODIGOMODALIDAD_" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White" Visible="False">CODIGOMODALIDAD</asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="MODALIDAD_" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White">MODALIDAD</asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="QUITAR" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="#FFFF66">&nbsp;</asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                                </asp:Table>
                                <%--</div>--%>
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-12 text-center">
                            <div class="btn-group">
                                <asp:Button ID="btnEnviarSolicitudServicio" runat="server" Text="Enviar" Width="140px"
                                    class="btn btn-primary" CausesValidation="False" OnClick="btnEnviarSolicitudServicio_Click"
                                    OnClientClick="return Confirmar('¿Desea enviar su solicitud de servicio.?');" />
                               
                                <asp:HiddenField ID="__pagina" runat="server" />
                                <asp:HiddenField ID="__mensaje" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
        <%-- SERVICIOS SOLICITADOS --%>
        <asp:Panel ID="PANEL_CANCELAR_SOLCITUD" class="panel panel-success" runat="server"
            Style="margin: 20px;" Visible="False">
            <div class="panel-heading" style="text-align: center">
                <h3 class="panel-title">Solicitudes pendientes servicios solicitados</h3>
            </div>
            <div class="panel-body">
                <div class="container">                    
                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-10">
                            <div class="table-responsive">
                                <asp:Table ID="TableSPSS" runat="server" class="table table-bordered table-hover text-center"
                                    BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="Smaller" GridLines="Both"
                                    Style="text-align: left">
                                    <asp:TableHeaderRow ID="TableHeaderRow1" runat="server" TableSection="TableHeader">
                                        <asp:TableHeaderCell ID="TableHeaderCell1" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White" Visible="true">SELECCIONA</asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="CODIGOSOLICITUD" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White" Visible="true">NRO. SOLICTUD </asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="FECHA" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White">FECHA</asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="ESTADO" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White">ESTADO</asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                                </asp:Table>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-10" style="text-align: center; top: 0px; left: 0px;">
                            <asp:Button ID="btnCancelarSolicitudes" runat="server" Text="Cancelar Solicitud"
                                Width="140px" class="btn btn-primary" CausesValidation="False" OnClientClick="return Confirmar('¿Desea cancelar solicitud(es)?');"
                                OnClick="btnCancelarSolicitudes_Click" />
                            <asp:Button ID="btnEliminarSolicitud" runat="server" Text="Eliminar Solicitud" Width="140px"
                                class="btn btn-danger" CausesValidation="False" OnClick="btnEliminarSolicitud_Click"
                                OnClientClick="return Confirmar('¿Desea eliminar  solicitud(es)?');" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-heading" style="text-align: center">
                <h3 class="panel-title">Detalle solicitud de servicio</h3>
            </div>
            <div class="panel-body">
                <div class="container">
                    
                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-10">
                            <div class="table-responsive">
                                <asp:Table ID="TableDSPSS" runat="server" class="table table-bordered table-hover text-center"
                                    BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="Smaller" GridLines="Both"
                                    Style="text-align: left">
                                    <asp:TableHeaderRow ID="TableHeaderRow2" runat="server" TableSection="TableHeader">
                                        <asp:TableHeaderCell ID="TableHeaderCell2" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White" Visible="true">SELECCIONA</asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="CODIGO_DETALLE_SOLICITUD" runat="server" BackColor="Black"
                                            BorderColor="Black" ForeColor="White" Visible="false">CODIGO_DETALLE_SOLICITUD </asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="CODIGO_SOLICITUD" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White" Visible="false">NRO. SOLICITUD</asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="SERVIVIO" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White">SERVIVIO</asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="MODALIDAD" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White">MODALIDAD</asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                                </asp:Table>
                                <asp:HiddenField ID="_respuesta" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-10" style="text-align: center; top: 0px; left: 0px;">
                            <asp:Button ID="btnEliminarDetalleSolicitud" runat="server" Text="Eliminar Detalle"
                                Width="140px" class="btn btn-danger" CausesValidation="False" OnClientClick="return Confirmar('¿Desea eliminar  detalle(s)?');"
                                OnClick="btnEliminarDetalleSolicitud_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    </form>
    <script type="text/javascript" src="../Otros_css_js/jquery-3.1.1.slim.min.js"></script>
    <script type="text/javascript" src="../Otros_css_js/restables.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('table').resTables();
        });
    </script>
     <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
</body>
</html>
