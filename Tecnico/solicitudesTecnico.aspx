<%@ Page Language="C#" AutoEventWireup="true" CodeFile="solicitudesTecnico.aspx.cs" Inherits="Tecnico_solicitudes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Solicitudes</title>
    <meta name="MobileOptimized" content="width" />
    <meta name="HandheldFriendly" content="true" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" type="image/png" href="../Imagenes/icono.ico" />

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />

    <!-- Custom styles for this template-->
    <link href="../vendor/css/sb-admin.css" rel="stylesheet" />

    <!-- Bootstrap core JavaScript-->
    <!--jquery-3.4.1.min.js-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <style type="text/css">
        body {
            background-color: #fafafa;
            padding-top: 1rem;
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

        function CambiaLetraMayuscula(Caja) {
            document.getElementById(Caja).value = document.getElementById(Caja).value.toUpperCase();
        }
    </script>
</head>
<body>
    <form id="frmSolicitudServidio" runat="server">
        <div class="container-fluid">
            <%--PRIMERA PANEL--%>
            <%-- SERVICIOS SOLICITADOS --%>
            <div class="card mb-3" runat="server" id="PANEL_CANCELAR_SOLCITUD" visible="true">
                <div class="card-header">
                    <i class="fas fa-user-circle fa-fw"></i>Solicitudes pendientes de atención
                <asp:Label ID="lblUsuario" runat="server" ForeColor="Red"></asp:Label>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <div class="container">
                            <div class="table-responsive">
                                <asp:Table ID="TableSPSS" runat="server"  class="table table-bordered table-sm table-hover text-center"
                                    BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="Smaller" GridLines="Both"
                                    Style="text-align: left">
                                    <asp:TableHeaderRow ID="TableHeaderRow1" runat="server" TableSection="TableHeader">
                                        <asp:TableHeaderCell ID="TableHeaderCell1" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White" Visible="true"></asp:TableHeaderCell>
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
                        <div class="form-row">
                            <div class="col-md-12 text-center">
                                <asp:Button ID="btnAtenderSolicitudes" runat="server" Text="Atender Solicitud"
                                    Width="150px" class="btn btn-primary" CausesValidation="False" 
                                    OnClientClick="return Confirmar('¿Desea atender solicitud(es)?');"
                                    OnClick="btnAtenderSolicitudes_Click" />
                                <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesion"
                                    Width="150px" class="btn btn-danger"
                                    PostBackUrl="~/Tecnico/CerrarSession.aspx" UseSubmitBehavior="False" />
                            </div>

                        </div>
                    </div>

                    <%--SEGUNDO TABLE--%>
                    <div class="form-group">
                        <b>Detalle solicitud de servicio</b>
                        <div class="container">
                            <div class="table-responsive">
                                <asp:Table ID="TableDSPSS" runat="server" class="table table-bordered table-sm table-hover text-center"
                                    BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="Smaller" GridLines="Both"
                                    Style="text-align: left">
                                    <asp:TableHeaderRow ID="TableHeaderRow2" runat="server" TableSection="TableHeader">
                                        <asp:TableHeaderCell ID="TableHeaderCell2" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White" Visible="false"></asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="CODIGO_DETALLE_SOLICITUD" runat="server" BackColor="Black"
                                            BorderColor="Black" ForeColor="White" Visible="false">CODIGO_DETALLE_SOLICITUD </asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="CODIGO_SOLICITUD" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White" Visible="false">NRO. SOLICITUD</asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="SERVIVIO" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White">SERVICIO</asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="MODALIDAD" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White">MODALIDAD</asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="DESCRIPCION" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White">DESCRIPCION</asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                                </asp:Table>
                                <asp:HiddenField ID="_respuesta" runat="server" />
                            </div>
                        </div>
                    </div>
                    <%--FIN SEGUNDO TABLE--%>

                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-12 text-center">
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <%--FIN PRIMERA PANEL--%>

            <div class="form-group">
                <asp:HiddenField ID="__pagina" runat="server" />
                <asp:HiddenField ID="__mensaje" runat="server" />
            </div>
        </div>

        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
    <script type="text/javascript" src="../Otros_css_js/jquery-3.1.1.slim.min.js"></script>
    <script type="text/javascript" src="../Otros_css_js/restables.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('table').resTables();
        });
    </script>
    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../vendor/js/sb-admin.min.js"></script>
</body>
</html>
