<%@ Page Language="C#" AutoEventWireup="true" CodeFile="solicitudservicio.aspx.cs" Inherits="Clientes_solicitudservicio" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Solicitud servicio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
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
            padding-top: 4rem;
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
<body onload="MostrarMensaje()">
    <form id="frmSolicitudServidio" runat="server">
        <nav class="navbar navbar-expand fixed-top" style="background-color: #66bf0e;">
            <a class="navbar-brand mr-1">
                <label class="text-White font-weight-bold" style="color: ghostwhite">
                    Bienvenido
                    <asp:LoginName ID="LoginName1" runat="server" Font-Bold="true" Visible="False" />
                </label>
            </a>
            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle">
                <i class="fa fa-align-justify" style="font-size: 20px; color: ghostwhite"></i>
            </button>
            <!-- Navbar Search -->
            <div class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <%--<input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">--%>
                    <div class="input-group-append">
                    </div>
                </div>
            </div>
            <!-- Navbar -->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown no-arrow mx-1"></li>
                <li class="nav-item dropdown no-arrow mx-1"><a class="nav-link dropdown-toggle" href="#"
                    id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false"></a></li>
                <li class="nav-item dropdown no-arrow"><a class="nav-link dropdown-toggle" href="#"
                    id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user-circle fa-fw" style="font-size: 24px; color: ghostwhite"></i>
                </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <%--<a class="dropdown-item" href="Usuario">Perfil de Usuario</a>--%>
                        <%-- <div class="dropdown-divider">
                        </div>--%>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Cerrar
                        Sesion</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div id="wrapper">
            <%--<div id="wrapper" >--%>
            <!-- Sidebar -->
            <ul class="sidebar navbar-nav" style="background-color: #0e66bf;">
                <li class="nav-item active" runat="server" id="liMenu" visible="false">
                    <a class="nav-link" href="menu.aspx"><i class="fas fa-fw fa-home"></i><span>&nbsp;Inicio</span> </a></li>
                <li class="nav-item" runat="server" id="liGenerar">
                    <asp:LinkButton ID="btnGenerarSolicitud" runat="server"
                        Text="<i class='fas fa-clipboard-list'></i>&nbsp;Generar Solicitud"
                        class="btn nav-link" CausesValidation="False"
                        UseSubmitBehavior="False" OnClick="btnGenerarSolicitud_Click"
                        PostBackUrl="~/Clientes/solicitudservicio.aspx?EnviarNotificacion=NO" /></li>
                <li class="nav-item" runat="server" id="liVerSolicitud">
                    <asp:LinkButton ID="btnCancelarSolicitud" runat="server"
                        Text="<i class='fas fa-eye'></i>&nbsp;Ver Solicitudes"
                        class="btn nav-link" CausesValidation="False"
                        UseSubmitBehavior="False" OnClick="btnCancelarSolicitud_Click" /></li>
            </ul>
            <div id="content-wrapper">
                <div class="container-fluid">
                    <%--PRIMERA PANEL--%>
                    <%-- GENERAR SOLICITUD --%>
                    <div class="card mb-3" runat="server" id="PANEL_GENERAR_SOLCITUD" visible="False">
                        <div class="card-header">
                            <i class="fas fa-clipboard-list"></i>&nbsp;Seleccione servicio y modalidad
                            <asp:Label ID="lblUsuario" runat="server" ForeColor="Red"></asp:Label>
                        </div>
                        <div class="card-body">
                            <%--PRIMERA FILA--%>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-3">
                                        <label for="name"><b>Fecha emision</b></label>
                                        <asp:TextBox ID="Fecha_S" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="name"><b>Codigo cliente</b></label>
                                        <asp:TextBox ID="CodigoPersona_S" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="name"><b>Nombre</b></label>
                                        <asp:TextBox ID="Nombre_P" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="name"><b>Servicio</b></label>
                                        <asp:DropDownList ID="Servicios" runat="server" class="form-control" AutoPostBack="True"
                                            OnSelectedIndexChanged="Servicios_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <%--FIN PRIMERA FILA--%>

                            <%--SEGUNDA FILA--%>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-3">
                                        <label for="name"><b>Modalidad</b></label>
                                        <asp:DropDownList ID="Modalidades" runat="server" class="form-control">
                                            <asp:ListItem Value="-1">-----Seleccione modalidad-----</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="name"><b>Descripcion</b></label>
                                        <asp:TextBox ID="txtDescripcion" runat="server" class="form-control"
                                            onchange="CambiaLetraMayuscula('txtDescripcion')" MaxLength="100" Autocomplete="off"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                    </div>
                                </div>
                            </div>
                            <%--FIN SEGUNDA FILA--%>

                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12 text-center">
                                        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" Width="140px" class="btn btn-success"
                                            CausesValidation="False" OnClick="btnAgregar_Click" />
                                    </div>
                                </div>
                            </div>

                            <%--TABLE--%>
                            <div class="form-group">
                                <div class="container">
                                    <div class="table-responsive">
                                        <asp:Table ID="Table_" runat="server" class="table table-bordered table-sm table-hover text-center"
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
                                                <asp:TableHeaderCell ID="DESCRIPCION_" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="White">DESCRIPCION</asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="QUITAR" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="#FFFF66">&nbsp;</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12 text-center">
                                        <asp:Button ID="btnEnviarSolicitudServicio" runat="server" Text="Enviar" Width="140px"
                                            class="btn btn-primary" CausesValidation="False" OnClick="btnEnviarSolicitudServicio_Click"
                                            OnClientClick="return Confirmar('¿Desea enviar su solicitud de servicio.?');" />
                                        <asp:HiddenField ID="__pagina" runat="server" />
                                        <asp:HiddenField ID="__mensaje" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--FIN PRIMERA PANEL--%>

                    <%--SEGUNDO PANEL--%>
                    <%-- SERVICIOS SOLICITADOS --%>
                    <div class="card mb-3" runat="server" id="PANEL_CANCELAR_SOLCITUD" visible="False">
                        <div class="card-header">
                            <i class="fas fa-eye"></i>&nbsp;Solicitudes pendientes servicios solicitados
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <div class="container">
                                    <div class="table-responsive">
                                        <asp:Table ID="TableSPSS" runat="server" class="table table-bordered table-sm table-hover text-center"
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
                                        <asp:Button ID="btnCancelarSolicitudes" runat="server" Text="Cancelar Solicitud"
                                            Width="150px" class="btn btn-primary" CausesValidation="False" OnClientClick="return Confirmar('¿Desea cancelar solicitud(es)?');"
                                            OnClick="btnCancelarSolicitudes_Click" />
                                        <asp:Button ID="btnEliminarSolicitud" runat="server" Text="Eliminar Solicitud" Width="150px"
                                            class="btn btn-danger" CausesValidation="False" OnClick="btnEliminarSolicitud_Click"
                                            OnClientClick="return Confirmar('¿Desea eliminar  solicitud(es)?');" />
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
                                                    ForeColor="White" Visible="true"></asp:TableHeaderCell>
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
                                        <asp:Button ID="btnEliminarDetalleSolicitud" runat="server" Text="Eliminar Detalle"
                                            Width="140px" class="btn btn-danger" CausesValidation="False" OnClientClick="return Confirmar('¿Desea eliminar  detalle(s)?');"
                                            OnClick="btnEliminarDetalleSolicitud_Click" />
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <%--FIN SEGUNDO PANEL--%>
                </div>
                <!-- /.container-fluid -->
                <!-- Sticky Footer -->
                <footer class="sticky-footer">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright © Soporte tecnico 2022</span>
                        </div>
                    </div>
                </footer>
            </div>
            <!-- /.content-wrapper -->
            <%--</div>--%>
        </div>
        <!-- /container -->
        <!-- /#wrapper -->
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i>
        </a>
        <!-- Cerrar Sesion Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Abandonar Sesion</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Seleccione Cerrar para abandonar la sesion
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">
                            Cancelar</button>
                        <a class="btn btn-primary" href="CerrarSession.aspx">Cerrar</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fin Modal Cerrar Sesion-->


        <%-- VENTANA MODAL PARA MENSAJE --%>
        <div id="Modal_MostarMensaje" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">
                            <label id="lblMasterMessage" style="font-family: 'Tahoma'; font-size: medium; color: #0000FF; font-weight: bold;">
                                Mensaje</label>
                        </h4>
                    </div>
                    <div class="modal-body">
                        <label id="lblMasterbodyMensaje" style="font-family: 'Tahoma'; font-size: 15px; color: #FF0000; font-weight: normal;">
                        </label>
                    </div>
                    <div class="modal-footer">
                        <button id="BtnMensajeModal" type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
                    </div>
                </div>
            </div>
        </div>
        <%-- FIN VENTANA MODAL DE MENSAJE --%>


       <%-- <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />--%>
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
