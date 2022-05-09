<%@ Page Language="C#" AutoEventWireup="true" CodeFile="colaborador.aspx.cs" Inherits="Administracion_colaborador" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Colaborador</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <!-- Calendario -->
    <%--<link href="css/dcalendar.picker.css" rel="stylesheet">--%>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../bootstrap/js/jquery-1.12.4.min.js" type="text/javascript"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <%--<link href="css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" />--%><%--<script src="js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>--%><%--<link href="css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
    <script src="js/bootstrap-datepicker.min.js" type="text/javascript"></script>--%>



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
<body onload="MostrarMensaje()">
    <!-- #include virtual="menu.inc" -->
    <form id="frmColaborador" role="form" runat="server">
        <div class="panel panel-primary" style="border-style: hidden; margin: 20px;">
            <asp:Label ID="lblUsuario" runat="server" ForeColor="Red"></asp:Label>
            <div class="panel-heading" style="text-align: center">
                <h3 class="panel-title">Ingrese datos colaborador
                </h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="form-group col-md-3 col-sm-3">
                            Codigo:
                                <asp:TextBox ID="CodigoP" class="form-control input-sm" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3 col-sm-3">
                            Area:
                                <asp:RangeValidator ID="rvArea" runat="server" BackColor="" ControlToValidate="Area" ErrorMessage="*" ForeColor="Red" MaximumValue="99999" MinimumValue="1" SetFocusOnError="True" Type="Integer" Font-Size="Medium"></asp:RangeValidator>
                            <asp:RequiredFieldValidator ID="rfvArea" runat="server" ErrorMessage="*" ControlToValidate="Area" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="Area" runat="server" CssClass="form-control input-sm" Font-Size="Small" Style="margin-left: 0px"></asp:DropDownList>
                        </div>
                        <div class="form-group col-md-3 col-sm-3">
                            Tipo Colaborador:  
                                <asp:RangeValidator ID="rvTipoColaborador" runat="server" BackColor="" ControlToValidate="TipoColaborador" ErrorMessage="*" ForeColor="Red" MaximumValue="99999" MinimumValue="1" SetFocusOnError="True" Type="Integer" Font-Size="Medium"></asp:RangeValidator>
                            <asp:RequiredFieldValidator ID="rfvTipoColaborador" runat="server" ErrorMessage="*" ControlToValidate="TipoColaborador" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="TipoColaborador" runat="server" CssClass="form-control input-sm" Font-Size="Small" Style="margin-left: 0px"></asp:DropDownList>
                        </div>
                        <div class="form-group col-md-3 col-sm-3">
                            Nro. DNI:
                                <asp:RequiredFieldValidator ID="rfvNroDNI" runat="server" ErrorMessage="*" ControlToValidate="NroDNI" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revNroDNI" runat="server" ControlToValidate="NroDNI" ErrorMessage="Nro DNI tiene 8 numeros" ForeColor="Red" ValidationExpression="\d{8}" SetFocusOnError="True"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="NroDNI" class="form-control" runat="server" placeholder="Ingrese Nro. DNI" onkeypress="return SoloNumeros()" onchange="" MaxLength="8"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="form-group col-md-3 col-sm-3">
                            Apellido paterno:
                                <asp:RequiredFieldValidator ID="rfvApellidoPaterno" runat="server" ErrorMessage="*" ControlToValidate="ApellidoPaterno" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="ApellidoPaterno" class="form-control" runat="server" placeholder="Ingrese apellido paterno" onkeypress="return SoloLetrasMinusculas()" onchange="CambiaLetraMayuscula('ApellidoPaterno')" MaxLength="15"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3 col-sm-3">
                            Apellido materno:
                                <asp:RequiredFieldValidator ID="rfvApellidoMaterno" runat="server" ErrorMessage="*" ControlToValidate="ApellidoMaterno" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="ApellidoMaterno" class="form-control" runat="server" placeholder="Ingrese apellido materno" onkeypress="return SoloLetrasMinusculas()" onchange="CambiaLetraMayuscula('ApellidoMaterno')" MaxLength="15"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3 col-sm-3">
                            Nombre: 
                                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="*" ControlToValidate="Nombre" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="Nombre" class="form-control" runat="server" placeholder="Ingrese nombre" onkeypress="return SoloLetrasMinusculas()" onchange="CambiaLetraMayuscula('Nombre')" MaxLength="15"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3 col-sm-3">
                            Direccion:
                                <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="Direccion" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="Direccion" runat="server" class="form-control input-sm" onchange="CambiaLetraMayuscula('Direccion')" placeholder="Ingrese direccion"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="form-group col-md-3 col-sm-3">
                            Nro. telefono: 
                                <asp:RegularExpressionValidator ID="revTelefonoFijo" runat="server" ControlToValidate="TelefonoFijo" ErrorMessage="Nro telefono 6 numeros" ForeColor="Red" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="TelefonoFijo" runat="server" class="form-control input-sm" onkeypress="return SoloNumeros()" onchange="" MaxLength="6" placeholder="Ingrese Nro. telefono"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3 col-sm-3">
                            Nro. celular:
                                <asp:RequiredFieldValidator ID="rfvTelefonoMovil" runat="server" ControlToValidate="TelefonoMovil" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revTelefonoMovil" runat="server" ControlToValidate="TelefonoMovil" ErrorMessage="Nro celular 9 numeros" ForeColor="Red" ValidationExpression="\d{9}"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="TelefonoMovil" runat="server" class="form-control input-sm" onkeypress="return SoloNumeros()" onchange="" MaxLength="9" placeholder="Ingrese Nro. celular"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3 col-sm-3">
                            Usuario:
                                <asp:RequiredFieldValidator ID="rfvLogin" runat="server" ControlToValidate="Login" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="Login" runat="server" class="form-control input-sm" onkeypress="" onchange="" MaxLength="0" placeholder="Ingrese usuario"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3 col-sm-3">
                            Contraseña:
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="Password" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="Password" runat="server" class="form-control input-sm" onkeypress="" onchange="" MaxLength="0" placeholder="Ingrese contraseña"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="form-group col-md-3 col-sm-3">
                            Email:
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" SetFocusOnError="True" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ControlToValidate="Email" ErrorMessage="Correo Invalido" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="Email" runat="server" class="form-control input-sm" placeholder="email@example.com"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3 col-sm-3">
                            Facebook:
                                <asp:TextBox ID="Faceboock" runat="server" class="form-control input-sm" placeholder="Ingrese Facebook"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3 col-sm-3">
                            Twiter:
                                <asp:TextBox ID="Twiter" runat="server" class="form-control input-sm" placeholder="Ingrese Twiter"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3 col-sm-3">
                            Estado:
                                <asp:CheckBox ID="Estado" runat="server" CssClass="checkbox-inline" Text="" />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-sm-12" style="text-align: center">
                        <div class="col-sm-offset-2 col-sm-8" style="text-align: center; top: 0px; left: 0px; height: 25px;">
                            <%--<asp:LinkButton ID="lbRegistrar" runat="server" 
                                     onclientclick="return Confirmar('¿Desea guardar sus datos?');" 
                                     style="font-family: Calibri;  font-size: medium" Text="Registrar" 
                                     CssClass="btn btn-primary" Width="85px" onclick="lbEnviar_Click" 
                                     Visible="False" />                           
                                <asp:LinkButton ID="lbModificar" runat="server" 
                                     style="font-family: Calibri;  font-size: medium" Text="Modificar" 
                                     CssClass="btn btn-success" CausesValidation="False" Width="85px" 
                                     onclick="lbModificar_Click" Visible="False" />                           
                                <asp:LinkButton ID="lbEliminar" runat="server" CausesValidation="False" 
                                     Text="Eliminar" style="font-family: Calibri; font-size: medium"  
                                     UseSubmitBehavior="False" class="btn btn-danger" Width="85px" 
                                     Visible="False"/>
                                <asp:LinkButton ID="lbCancelar" runat="server" CausesValidation="False" 
                                     Text="Cancelar" style="font-family: Calibri; font-size: medium"  
                                     UseSubmitBehavior="False" class="btn btn-danger" Width="85px" 
                                     CssClass="btn btn-warning" Visible="False"/>--%>
                            <asp:Button ID="btnRegistrar" runat="server"
                                Style="font-family: Calibri; color: #000000; font-size: medium"
                                Text="Registrar"
                                OnClientClick="return Confirmar('¿Desea registrar colaborador?');"
                                CssClass="btn btn-primary" Visible="False" OnClick="btnRegistrar_Click"
                                Width="100px" />
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

            </div>
            <asp:HiddenField ID="__mensaje" runat="server" />
            <asp:HiddenField ID="__pagina" runat="server" />
            <asp:HiddenField ID="ID_PERSONAL" runat="server" Value="0"
                EnableViewState="False" />
        </div>


        <br />


        <div class="panel panel-primary" style="border-style: hidden; margin: 20px;">
            <div class="panel-heading" style="text-align: center">
                <h3 class="panel-title">Lista colaboradores</h3>
            </div>
            <%-- <div class="panel-body">
                  This is a Basic panel
               </div>--%>
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
                                ForeColor="White">Tipo Colaborador</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="NroDNI_" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">Nro DNI</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="Colaborador_" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">Colaborador</asp:TableHeaderCell>
                            <%--<asp:TableHeaderCell  ID="ApellidoPaterno_" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White">Apellido Paterno</asp:TableHeaderCell>
                                    <asp:TableHeaderCell  ID="ApellidoMaterno_" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White">Apellido Materno</asp:TableHeaderCell>
                                    <asp:TableHeaderCell  ID="Nombre_" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White">Nombre</asp:TableHeaderCell>--%>
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
                                ForeColor="White">Faceboock</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="Twiter_" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">Twiter</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="Estado_" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">Estado</asp:TableHeaderCell>
                        </asp:TableHeaderRow>
                    </asp:Table>
                </div>
            </div>
        </div>

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
