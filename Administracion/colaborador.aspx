<%@ Page Language="C#" AutoEventWireup="true" CodeFile="colaborador.aspx.cs" Inherits="Administracion_colaborador" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Registrar Colaborador</title>
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
            /*background-color: #fafafa;
            font-family: 'Roboto';*/
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

        function Limpiar_Datos_Colaborador() {
            document.getElementById("CodigoP").value = "";
            document.getElementById("ID_PERSONAL").value = 0;
            document.getElementById("Area").selectedIndex = 0;
            document.getElementById("TipoColaborador").selectedIndex = 0;
            document.getElementById("NroDNI").value = "";
            document.getElementById("ApellidoPaterno").value = "";
            document.getElementById("ApellidoMaterno").value = "";
            document.getElementById("Nombre").value = "";
            document.getElementById("Direccion").value = "";
            document.getElementById("TelefonoFijo").value = "";
            document.getElementById("TelefonoMovil").value = "";
            document.getElementById("Login").value = "";
            document.getElementById("Password").value = "";
            document.getElementById("Email").value = "";
            document.getElementById("Faceboock").value = "";
            document.getElementById("Twiter").value = "";
            document.getElementById("Estado").checked = false;
        }

        function Colaborador(_CodigoP_, _Area_, _TipoColaborador_, _NroDNI_, _ApellidoPaterno_, _ApellidoMaterno_, _Nombre_, _Direccion_, _TelefonoFijo_, _TelefonoMovil_, _Login_, _Password_, _Email_, _Faceboock_, _Twiter_, _Estado_) {
            document.getElementById("CodigoP").value = _CodigoP_;
            document.getElementById("ID_PERSONAL").value = _CodigoP_;
            nroelemnetos = frmColaborador.Area.options.length;
            for (i = 0; i < nroelemnetos; i++) {
                if (frmColaborador.Area.options[i].text == _Area_) {
                    frmColaborador.Area.selectedIndex = i;
                }
            }
            nroelemnetos = frmColaborador.TipoColaborador.options.length;
            for (i = 0; i < nroelemnetos; i++) {
                if (frmColaborador.TipoColaborador.options[i].text == _TipoColaborador_) {
                    frmColaborador.TipoColaborador.selectedIndex = i;
                }
            }
            document.getElementById("NroDNI").value = _NroDNI_;
            document.getElementById("ApellidoPaterno").value = _ApellidoPaterno_;
            document.getElementById("ApellidoMaterno").value = _ApellidoMaterno_;
            document.getElementById("Nombre").value = _Nombre_;
            document.getElementById("Direccion").value = _Direccion_;
            document.getElementById("TelefonoFijo").value = _TelefonoFijo_;
            document.getElementById("TelefonoMovil").value = _TelefonoMovil_;
            document.getElementById("Login").value = _Login_;
            document.getElementById("Password").value = _Password_;
            document.getElementById("Email").value = _Email_;
            document.getElementById("Faceboock").value = _Faceboock_;
            document.getElementById("Twiter").value = _Twiter_;
            if (_Estado_ == 'ACTIVO')
                document.getElementById("Estado").checked = true;
            else
                document.getElementById("Estado").checked = false;
        }

        function MostrarMensaje() {
            var mensaje = document.getElementById("__mensaje").value;
            if (mensaje != "") {
                alert(mensaje);
                if (document.getElementById("__pagina").value != "")
                    location.href = document.getElementById("__pagina").value;

            }

            document.getElementById('<%= CodigoP.ClientID %>').readOnly = true;
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
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Cerrar Sesion</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div id="wrapper">
            <%--<div id="wrapper" >--%>
            <!-- Sidebar -->
            <ul class="sidebar navbar-nav" style="background-color: #0e66bf;">
                <li class="nav-item"><a class="nav-link" href="menu.aspx"><i class="fas fa-fw fa-home"></i><span> Inicio</span> </a></li>
                <li class="nav-item active">
                    <a class="nav-link" href="colaborador.aspx"><i class="fas fa-user-circle fa-fw"></i><span> Colaborador</span></a> </li>
                <li class="nav-item ">
                    <a class="nav-link" href="visitacliente.aspx"><i class="fas fa-calendar-check"></i><span> Asignar Visita Tecnico</span></a> </li>
            </ul>
            <div id="content-wrapper">
                <div class="container-fluid">
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-user-circle fa-fw"></i>Registrar Colaborador
                            <asp:Label ID="lblUsuario" runat="server" ForeColor="Red"></asp:Label>
                        </div>

                        <div class="card-body">
                            <%--PRIMERA FILA--%>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-3">
                                        Codigo:
                                <asp:TextBox ID="CodigoP" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        Area:
                                <asp:RangeValidator ID="rvArea" runat="server" BackColor="" ControlToValidate="Area" ErrorMessage="*" ForeColor="Red" MaximumValue="99999" MinimumValue="1" SetFocusOnError="True" Type="Integer" Font-Size="Medium"></asp:RangeValidator>
                                        <asp:RequiredFieldValidator ID="rfvArea" runat="server" ErrorMessage="*" ControlToValidate="Area" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                                        <asp:DropDownList ID="Area" runat="server" CssClass="form-control input-sm" Font-Size="Small" Style="margin-left: 0px"></asp:DropDownList>
                                    </div>
                                    <div class="col-md-3">
                                        Tipo Colaborador:  
                                <asp:RangeValidator ID="rvTipoColaborador" runat="server" BackColor="" ControlToValidate="TipoColaborador" ErrorMessage="*" ForeColor="Red" MaximumValue="99999" MinimumValue="1" SetFocusOnError="True" Type="Integer" Font-Size="Medium"></asp:RangeValidator>
                                        <asp:RequiredFieldValidator ID="rfvTipoColaborador" runat="server" ErrorMessage="*" ControlToValidate="TipoColaborador" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                                        <asp:DropDownList ID="TipoColaborador" runat="server" CssClass="form-control input-sm" Font-Size="Small" Style="margin-left: 0px"></asp:DropDownList>
                                    </div>
                                    <div class="col-md-3">
                                        Nro. DNI:
                                <asp:RequiredFieldValidator ID="rfvNroDNI" runat="server" ErrorMessage="*" ControlToValidate="NroDNI" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revNroDNI" runat="server" ControlToValidate="NroDNI" ErrorMessage="**" ForeColor="Red" ValidationExpression="\d{8}" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="NroDNI" CssClass="form-control input-sm" runat="server" placeholder="DNI" onkeypress="return SoloNumeros()" onchange="" MaxLength="8"></asp:TextBox>
                                    </div>

                                </div>
                            </div>
                            <%--FIN PRIMERA FILA--%>

                            <%--SEGUNDA FILA--%>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-3">
                                        Apellido paterno:
                                <asp:RequiredFieldValidator ID="rfvApellidoPaterno" runat="server" ErrorMessage="*" ControlToValidate="ApellidoPaterno" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="ApellidoPaterno" CssClass="form-control input-sm" runat="server"
                                            placeholder="Ingrese apellido paterno" onkeypress="return SoloLetrasMinusculas()"
                                            onchange="CambiaLetraMayuscula('ApellidoPaterno')" MaxLength="15"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        Apellido materno:
                                <asp:RequiredFieldValidator ID="rfvApellidoMaterno" runat="server" ErrorMessage="*" ControlToValidate="ApellidoMaterno" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="ApellidoMaterno" CssClass="form-control input-sm" runat="server"
                                            placeholder="Ingrese apellido materno" onkeypress="return SoloLetrasMinusculas()"
                                            onchange="CambiaLetraMayuscula('ApellidoMaterno')" MaxLength="15"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        Nombre: 
                                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="*" ControlToValidate="Nombre" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="Nombre" CssClass="form-control input-sm" runat="server"
                                            placeholder="Ingrese nombre" onkeypress="return SoloLetrasMinusculas()" onchange="CambiaLetraMayuscula('Nombre')" MaxLength="15"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        Direccion:
                                <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="Direccion" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="Direccion" runat="server" CssClass="form-control input-sm"
                                            onchange="CambiaLetraMayuscula('Direccion')" placeholder="Ingrese direccion"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <%--FIN SEGUNDA FILA--%>


                            <%--TERCERA FILA--%>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-3">
                                        Nro. telefono: 
                                <asp:RegularExpressionValidator ID="revTelefonoFijo" runat="server" ControlToValidate="TelefonoFijo" ErrorMessage="*" ForeColor="Red" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="TelefonoFijo" runat="server" CssClass="form-control input-sm" onkeypress="return SoloNumeros()" onchange="" MaxLength="6" placeholder="Ingrese Nro. telefono"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        Nro. celular:
                                <asp:RequiredFieldValidator ID="rfvTelefonoMovil" runat="server" ControlToValidate="TelefonoMovil" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revTelefonoMovil" runat="server" ControlToValidate="TelefonoMovil" ErrorMessage="**" ForeColor="Red" ValidationExpression="\d{9}"></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="TelefonoMovil" runat="server" CssClass="form-control input-sm" onkeypress="return SoloNumeros()" onchange="" MaxLength="9" placeholder="Ingrese Nro. celular"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        Usuario:
                                <asp:RequiredFieldValidator ID="rfvLogin" runat="server" ControlToValidate="Login" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="Login" runat="server" CssClass="form-control input-sm" onkeypress="" onchange="" MaxLength="0" placeholder="Ingrese usuario"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        Contraseña:
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="Password" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="Password" runat="server" CssClass="form-control input-sm" onkeypress="" onchange="" MaxLength="0" placeholder="Ingrese contraseña"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <%--FIN TERCERA FILA--%>


                            <%--CUARTA FILA--%>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-3">
                                        Email:
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" SetFocusOnError="True" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ControlToValidate="Email" ErrorMessage="Correo Invalido" ForeColor="Red"></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="Email" runat="server" CssClass="form-control input-sm" placeholder="email@example.com"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        Facebook:
                                <asp:TextBox ID="Faceboock" runat="server" CssClass="form-control input-sm" placeholder="Ingrese Facebook"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        Twiter:
                                <asp:TextBox ID="Twiter" runat="server" CssClass="form-control input-sm" placeholder="Ingrese Twiter"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        Estado:
                                <asp:CheckBox ID="Estado" runat="server" CssClass="checkbox-inline" Text="" />
                                    </div>
                                </div>
                            </div>
                            <%--FIN CUARTA FILA--%>

                            <%--BOTONES--%>
                            <div class="form-group">
                                <div class="form-row">
                                    <div class="col-md-12 text-center">
                                        <asp:Button ID="btnRegistrar" runat="server"
                                            Style="font-family: Calibri; color: #000000; font-size: medium"
                                            Text="Registrar"
                                            OnClientClick="return Confirmar('¿Desea registrar colaborador?');"
                                            CssClass="btn btn-primary" Visible="False" OnClick="btnRegistrar_Click" />
                                        <asp:Button ID="btnModificar" runat="server"
                                            Style="font-family: Calibri; color: #000000; font-size: medium"
                                            Text="Modificar"
                                            OnClientClick="return Confirmar('¿Desea modificar colaborador?');"
                                            CssClass="btn btn-success" OnClick="btnModificar_Click"
                                            Width="100px" Visible="False" />
                                        <asp:Button ID="btnEliminar" runat="server"
                                            Style="font-family: Calibri; color: #000000; font-size: medium"
                                            Text="Eliminar" OnClientClick="return Confirmar('¿Desea eliminar colaborador?');"
                                            Visible="False" class="btn btn-danger" OnClick="btnEliminar_Click"
                                            Width="100px" />
                                        <asp:Button ID="btnCancelar" runat="server" class="btn btn-warning"
                                            Style="font-family: Calibri; font-size: medium" Text="Cancelar"
                                            Visible="False" CausesValidation="False"
                                            OnClientClick="Limpiar_Datos_Colaborador();" OnClick="btnCancelar_Click"
                                            Width="100px" />
                                    </div>
                                </div>
                            </div>
                            <%--FIN BOTONES--%>

                            <%--TABLE--%>
                            <div class="container">
                                <div class="table-responsive">
                                    <asp:Table ID="Table_" runat="server"
                                        class="table table-bordered table-hover text-center"
                                        BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="X-Small"
                                        GridLines="Both" Style="text-align: left" Font-Names="Arial">
                                        <asp:TableHeaderRow ID="TableRow1" runat="server" TableSection="TableHeader">
                                            <asp:TableHeaderCell ID="EDITAR" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="Blue">EDITAR </asp:TableHeaderCell>
                                            <asp:TableHeaderCell ID="Area_" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="White">Area</asp:TableHeaderCell>
                                            <asp:TableHeaderCell ID="TipoColaborador_" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="White">T. Colab.</asp:TableHeaderCell>
                                            <asp:TableHeaderCell ID="NroDNI_" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="White">Nro DNI</asp:TableHeaderCell>
                                            <asp:TableHeaderCell ID="Colaborador_" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="White">Colaborador</asp:TableHeaderCell>
                                            <asp:TableHeaderCell ID="Direccion_" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="White">Direccion</asp:TableHeaderCell>
                                            <asp:TableHeaderCell ID="TelefonoFijo_" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="White">Telefono Fijo</asp:TableHeaderCell>
                                            <asp:TableHeaderCell ID="TelefonoMovil_" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="White">Telefono Movil</asp:TableHeaderCell>
                                            <asp:TableHeaderCell ID="Login_" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="White">Login</asp:TableHeaderCell>
                                            <asp:TableHeaderCell ID="Password_" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="White">Password</asp:TableHeaderCell>
                                            <asp:TableHeaderCell ID="Email_" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="White">Email</asp:TableHeaderCell>
                                            <asp:TableHeaderCell ID="_Faceboock" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="White" Visible="false">Facebook</asp:TableHeaderCell>
                                            <asp:TableHeaderCell ID="Twiter_" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="White" Visible="false">Twiter</asp:TableHeaderCell>
                                            <asp:TableHeaderCell ID="Estado_" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="White">Estado</asp:TableHeaderCell>
                                        </asp:TableHeaderRow>
                                    </asp:Table>
                                </div>
                            </div>
                            <%--FIN TABLE--%>
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
            <asp:HiddenField ID="ID_PERSONAL" runat="server" Value="0" EnableViewState="False" />
        </div>

        <!-- Bootstrap core JavaScript-->
        <%-- <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>

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
