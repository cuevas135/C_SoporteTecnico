<%@ Page Language="C#" AutoEventWireup="true" CodeFile="visitacliente.aspx.cs" Inherits="Administracion_visitacliente" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" type="image/png" href="../Imagenes/icono.ico" />
    <title>Registrar visita</title>

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


    <script type='text/javascript'>
        function openModal() {
            $('#myModal').modal('show');
        };


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

        function BloqueaIngresoDatos() {
            event.returnValue = false;

        }

        function SoloNumeros() {
            if ((event.keyCode < 48) || (event.keyCode > 57)) {
                event.returnValue = false;
            }

        }

        function SoloLetras(e) {
            if (!(event.keyCode >= 65 && event.keyCode <= 90 || event.keyCode == 32 || event.keyCode == 193 || event.keyCode == 201 || event.keyCode == 205 || event.keyCode == 209 || event.keyCode == 211 || event.keyCode == 218 || event.keyCode == 220)) {
                event.keyCode = 0;
            }
        }

        //Creada el dia 23/10/2019.
        //Solo permite ingresar letras minuculas incluye la letra "ñ"
        function SoloLetrasMinusculas() {
            if (!(event.keyCode >= 97 && event.keyCode <= 122 || event.keyCode == 32 || event.keyCode == 193 || event.keyCode == 201 || event.keyCode == 205 || event.keyCode == 209 || event.keyCode == 211 || event.keyCode == 218 || event.keyCode == 220 || event.keyCode == 241)) {
                event.returnValue = false;
            }
        }

        function LetrasNumeros(e) {
            if (!(event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode >= 65 && event.keyCode <= 90 || event.keyCode == 32 || event.keyCode == 193 || event.keyCode == 201 || event.keyCode == 205 || event.keyCode == 209 || event.keyCode == 211 || event.keyCode == 218 || event.keyCode == 220)) {
                event.keyCode = 0;
            }
        }

        /*
        Función que permite al usuario ingrese sólo números enteros o reales.
        Parametros: e    , permite obtener el valor de la tecla prsionada.
        Punto, false sólo números enteros;true sólo números reales.
        Texto, texto que contiene el valor numerico. 
        */
        function SoloDecimales(e, Punto, Texto) {
            if (event.keyCode == 8)
                ;
            else if (event.keyCode == 46) {
                if (Punto == false)
                    event.keyCode = 0;
                else {
                    for (i = 0; i < Texto.value.length; i++) {
                        if (Texto.value.charCodeAt(i) == 46) {
                            event.keyCode = 0;
                        }
                    }
                }
            }
            else if (!(event.keyCode >= 48 && event.keyCode <= 57)) {
                event.keyCode = 0;
            }
        }

        function LimpiaImagen() {


        }


        function CambiaLetraMayuscula(Caja) {
            document.getElementById(Caja).value = document.getElementById(Caja).value.toUpperCase();
        }

    </script>

</head>
<body onload="MostrarMensaje();" id="page-top">
    <form id="frmColaborador" role="form" runat="server">
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
                       <%-- <a class="dropdown-item" href="Usuario">Perfil de Usuario</a>
                        <div class="dropdown-divider">
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
                <li class="nav-item"><a class="nav-link" href="menu.aspx"><i class="fas fa-fw fa-home"></i><span>Inicio</span> </a></li>
                <li class="nav-item ">
                    <a class="nav-link" href="colaborador.aspx"><i class="fas fa-user-circle fa-fw"></i><span>Colaborador</span></a> </li>
                <li class="nav-item active">
                    <a class="nav-link" href="visitacliente.aspx"><i class="fas fa-calendar-check"></i><span>Asignar Visita Tecnico</span></a> </li>
            </ul>
            <div id="content-wrapper">
                <div class="container-fluid">
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-calendar-check"></i> Registrar visita
                            <asp:Label ID="lblUsuario" runat="server" ForeColor="Red"></asp:Label>
                        </div>

                        <div class="card-body">
                            <%--PRIMERA FILA--%>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <b>Tecnico:</b>
                                        <asp:RangeValidator ID="rvTecnico" runat="server" BackColor=""
                                            ControlToValidate="Tecnico" ErrorMessage="*" ForeColor="Red"
                                            MaximumValue="99999" MinimumValue="1" SetFocusOnError="True" Type="Integer"
                                            Font-Size="Medium"></asp:RangeValidator>
                                        <asp:RequiredFieldValidator ID="rfvTecnico" runat="server" ErrorMessage="*"
                                            ControlToValidate="Tecnico" ForeColor="Red" SetFocusOnError="True"
                                            Font-Size="Medium"></asp:RequiredFieldValidator>
                                        <asp:DropDownList ID="Tecnico" runat="server" CssClass="form-control input-sm"
                                            Font-Size="Small" Style="margin-left: 0px"
                                            OnSelectedIndexChanged="Tecnico_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <%--FIN PRIMERA FILA--%>

                            <%--TABLE--%>
                            <div class="form-group">
                                <b>Solicitudes de Servicios Pendientes</b>
                                <div class="container">
                                    <div class="table-responsive">
                                        <asp:Table ID="Table_" runat="server"
                                            class="table table-bordered table-hover text-center"
                                            BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="Small"
                                            GridLines="Both" Style="text-align: left" Font-Names="Arial">
                                            <asp:TableHeaderRow ID="TableRow1" runat="server" TableSection="TableHeader">
                                                <asp:TableHeaderCell ID="SELECCIONA_" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="Blue"></asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="NROSOLICITUD_" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="White">SOLICITUD</asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="FECHA" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="White">F. SOLICITUD</asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="CLIENTE_" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="White">CLIENTE</asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="DIRECCION_" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="White">DIRECCION</asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="TELFIJO_" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="White">T. FIJO</asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="TELMOVIL_" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="White">T. MOVIL</asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="VER" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="Blue">DETALLE </asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>
                            <%--FIN TABLE--%>

                            <%--SEGUNDA FILA--%>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12 text-center">
                                        <asp:Button ID="btnRegistrarVisita" runat="server"
                                            Style="font-family: Calibri; color: #000000; font-size: medium"
                                            Text="Registrar Visita"
                                            OnClientClick="return Confirmar('¿Desea registrar visita?');"
                                            CssClass="btn btn-primary"
                                            OnClick="btnRegistrarVisita_Click" Visible="False" />
                                    </div>
                                </div>
                            </div>
                            <%--FIN SEGUNDA FILA--%>

                            <%--SEGUNDO TABLE--%>
                            <div class="form-group">
                                <b>Visitas Asignadas Tecnico</b>
                                <div class="container">
                                    <div class="table-responsive">
                                        <asp:Table ID="TableVisita" runat="server"
                                            class="table table-bordered table-hover text-center"
                                            BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="Small"
                                            GridLines="Both" Style="text-align: left" Font-Names="Arial">
                                            <asp:TableHeaderRow ID="TableHeaderRow2" runat="server" TableSection="TableHeader">
                                                <asp:TableHeaderCell ID="TableHeaderCell1" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="Blue"></asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="CODIGO_VISITA" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="White" Visible="false">CODIGO VISITA</asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="FEC_ASIGNACION" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="White">F. ASIG.</asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="__TECNICO" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="White">TECNICO</asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="NRO_SOLICITUD" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="White">SOLICITUD</asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="FEC_SOLICITUD" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="White">F. SOL.</asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="__CLIENTE" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="White">CLIENTE</asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="__DIRECCION" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="White">DIRECCION </asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="TEL_FIJO" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="White">FIJO</asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="TEL_MOVIL" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="White">T. MOVIL</asp:TableHeaderCell>
                                                <asp:TableHeaderCell ID="VER_" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="Blue">DETALLE </asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>
                            <%--FIN SEGUNDO TABLE--%>

                            <%--BOTONES--%>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12 text-center">
                                        <asp:Button ID="btnEliminar" runat="server"
                                            Style="font-family: Calibri; font-size: medium"
                                            Text="Eliminar Visita"
                                            OnClientClick="return Confirmar('¿Desea eliminar visita?');" class="btn btn-danger"
                                            CausesValidation="False" OnClick="btnEliminar_Click"
                                            Visible="False" />
                                    </div>
                                </div>
                            </div>
                            <%--FIN BOTONES--%>
                        </div>
                    </div>

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



        <!-- Mensaje al Postergar Modal-->
        <div class="modal fade" id="MensajeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="H1">
                            <asp:Label ID="LblTituloModalMensaje" runat="server" Text="Label"></asp:Label>
                        </h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <asp:Label ID="LblModalMensaje" runat="server" Text="Label"></asp:Label>
                    </div>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    <div class="modal-footer">
                        <asp:Button ID="BtnAceptarPostergacion" runat="server" Text="Aceptar"
                            class="btn btn-primary" />
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">
                            Cancelar</button>
                        <%--<a class="btn btn-primary" href="login.html">Logout</a>--%>
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

        <div>
            <asp:HiddenField ID="__mensaje" runat="server" />
            <asp:HiddenField ID="__pagina" runat="server" />
        </div>

        <%-- MODAL DE DETALLE DE SERVICIO TECNICO --%>
         <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">    
            <div class="modal-dialog" role="document">
                <!-- Modal content-->
                <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title"> Detalle solicitud</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                  
                    <div class="modal-body">                     
                        <div class="panel-body">
                            <asp:Label ID="lblCliente" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="container">
                            <div class="table-responsive">
                                <asp:Table ID="Table_Detalle" runat="server"
                                    class="table table-bordered table-hover text-center"
                                    BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="Small"
                                    GridLines="Both" Style="text-align: left" Font-Names="Arial">
                                    <asp:TableHeaderRow ID="TableHeaderRow1" runat="server" TableSection="TableHeader">
                                        <asp:TableHeaderCell ID="NROSOLICITUD__" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White">SOLICITUD </asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="SERVICIO__" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White">SERVICIO</asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="MODALIDAD__" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White">MODALIDAD</asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                                </asp:Table>
                            </div>
                        </div>
                    </div>
                  
                </div>
            </div>
        </div>
         <%-- FIN DE MODAL DE DETALLE DE SERVICIO TECNICO --%>

        
        <!-- Core plugin JavaScript-->
        <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="../vendor/js/sb-admin.min.js"></script>

    </form>

    <script type="text/javascript" src="../Otros_css_js/jquery-3.1.1.slim.min.js"></script>
    <script type="text/javascript" src="../Otros_css_js/restables.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $('table').resTables();
        });
    </script>

</body>
</html>

