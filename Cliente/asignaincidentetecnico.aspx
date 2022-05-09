<%@ Page Language="C#" AutoEventWireup="true" CodeFile="asignaincidentetecnico.aspx.cs" Inherits="Cliente_asignaincidentetecnico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link rel="icon" type="image/ico" href="imagenes/Sistema__.ico" />
    <title>Asignar Incidente Tecnico
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <script src="../src/js/jscal2.js"></script>
    <script src="../src/js/lang/es.js"></script>
    <link rel="stylesheet" type="text/css" href="../src/css/jscal2.css" />
    <link rel="stylesheet" type="text/css" href="../src/css/border-radius.css" />
    <link rel="stylesheet" type="text/css" href="../src/css/steel/steel.css" />

    <!-- Bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Otros_css_js/Menu.css" rel="stylesheet" />


    <%-- VALIDACIONES EN TEXTBOX --%>
    <script src="../Otros_css_js/Validaciones.js" type="text/javascript"></script>

    <script type="text/javascript">
        function profesiones(id, profesion) {
            form1.idprofesion.value = id;
            form1.nombreprofesion.value = profesion;
        }

        function MostrarMensaje() {
            var mensaje = document.getElementById("__mensaje").value;
            if (mensaje != "") {
                alert(mensaje);
                if (document.getElementById("__pagina").value != "")
                    location.href = document.getElementById("__pagina").value;

            }
            document.getElementById('<%= FechaAsignacion.ClientID %>').readOnly = true;
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

        function SoloLetrasMinusculas(e) {
            if (!(event.keyCode >= 97 && event.keyCode <= 122 || event.keyCode == 32 || event.keyCode == 193 || event.keyCode == 201 || event.keyCode == 205 || event.keyCode == 209 || event.keyCode == 211 || event.keyCode == 218 || event.keyCode == 220)) {
                event.keyCode = 0;
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

    <style>
        .dropdown-submenu {
            position: relative;
        }

            .dropdown-submenu > .dropdown-menu {
                top: 0;
                left: 100%;
                margin-top: -6px;
                margin-left: -2px;
            }

            .dropdown-submenu:hover > .dropdown-menu {
                display: block;
            }

            .dropdown-submenu > a:after {
                content: "";
                margin-top: 6px;
                margin-right: -10px;
                float: right;
                border-left: 4px solid;
                border-top: 4px solid transparent;
                border-bottom: 4px solid transparent;
            }

        body {
            background-color: #fafbfb; /* La página de fondo será negra */
            /*color: white;*/ /*El texto de la página será blanco */
        }
    </style>

    <script src="../Otros_css_js/restables.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../Otros_css_js/estilo.css" type="text/css" />

</head>
<body onload="MostrarMensaje()">
    <form id="form1" runat="server">
        <div class="col-md-9 col-md-offset-2">
            <table class="table text-left">
                <thead>
                    <tr>
                        <td colspan="2"
                            style="text-align: center;">
                            <asp:HyperLink ID="hlColaborador" runat="server"
                                NavigateUrl="~/Cliente/asignarincidentetecnico.aspx">Incidentes por Asignar</asp:HyperLink>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="hlCerrarSesion" runat="server" ForeColor="Red"
                        NavigateUrl="~/CerrarSession.aspx">Cerrar Sesion</asp:HyperLink>
                        </td>
                        <td
                            style="text-align: center;">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3"
                            style="text-align: center; color: #FFFFFF; background-color: #000000;">INGRESE DATOS ASIGNACION INCIDENTE TECNICO</td>
                        <tr>
                            <td style="text-align: right; color: #FFFFFF; background-color: #000000;">Nro. ticket:</td>

                            <td style="text-align: left">
                                <asp:Label ID="_NRO_TICKET" runat="server" CssClass="form-control input-sm"></asp:Label>
                            </td>

                            <td style="text-align: left">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right; color: #FFFFFF; background-color: #000000;">Fecha emision:</td>

                            <td style="text-align: left">
                                <asp:Label ID="_FECHAEMISION" runat="server" CssClass="form-control input-sm"></asp:Label>
                            </td>

                            <td style="text-align: left">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right; color: #FFFFFF; background-color: #000000;">Area:</td>

                            <td style="text-align: left">
                                <asp:Label ID="_AREA_" runat="server" CssClass="form-control input-sm"></asp:Label>
                            </td>

                            <td style="text-align: left">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right; color: #FFFFFF; background-color: #000000;">Incidente:</td>

                            <td style="text-align: left">
                                <asp:Label ID="_INCIDENTE" runat="server" CssClass="form-control input-sm"></asp:Label>
                            </td>

                            <td style="text-align: left">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right; color: #FFFFFF; background-color: #000000;">Fecha asignacion:</td>

                            <td style="text-align: left">
                                <asp:TextBox ID="FechaAsignacion" runat="server" Autocomplete="off"
                                    onkeypress="BloqueaCaracteres(event)" CssClass="form-control input-sm"
                                    Font-Size="Small"></asp:TextBox>
                                <button id="Fecha_Asignacion" type="button">
                                        ...</button>
                            </td>

                            <td style="text-align: left">
                                <asp:RequiredFieldValidator ID="rfvFechaAsignacion" runat="server"
                                    ControlToValidate="FechaAsignacion" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; color: #FFFFFF; background-color: #000000;">Tecnico:</td>

                            <td style="text-align: left;">
                                <asp:DropDownList ID="TECNICO" runat="server" CssClass="form-control input-sm"
                                    Font-Size="Small" Style="margin-left: 0px">
                                </asp:DropDownList>

                            </td>

                            <td style="text-align: left;">

                                <asp:RangeValidator ID="rvTECNICO" runat="server" ControlToValidate="TECNICO"
                                    ErrorMessage="*" ForeColor="Red" MaximumValue="99999" MinimumValue="1" SetFocusOnError="True"
                                    Type="Integer"></asp:RangeValidator>

                            </td>
                        </tr>

                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="btnRegistrar" runat="server" class="btn btn-primary"
                                    OnClientClick="return Confirmar('¿Desea Registrar?');"
                                    Style="font-family: Calibri; font-size: medium"
                                    Text="Registrar" Visible="False" Width="15%" OnClick="btnRegistrar_Click" />
                                &nbsp;&nbsp;
                    <asp:Button ID="btnModificar" runat="server" class="btn btn-primary"
                        OnClientClick="return Confirmar('¿Desea Modificar?');"
                        Style="font-family: Calibri; font-size: medium"
                        Text="Modificar" Visible="False"
                        Width="15%" OnClick="btnModificar_Click" />
                                &nbsp;&nbsp;
                    <asp:Button ID="btnEliminar" runat="server" class="btn btn-danger"
                        OnClientClick="return Confirmar('¿Desea Eliminar?');"
                        Style="font-family: Calibri; font-size: medium" Text="Eliminar"
                        Visible="False" Width="15%" OnClick="btnEliminar_Click" />
                                &nbsp;&nbsp;
                    <asp:Button ID="btnCancelar" runat="server" class="btn btn-primary"
                        Style="font-family: Calibri; font-size: medium"
                        Text="Cancelar" Visible="False" CausesValidation="False" Width="15%" OnClick="btnCancelar_Click" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                </thead>
                <tbody>

                    <tr>
                        <td colspan="3">
                            <asp:Table ID="TableTecnico" runat="server" BackColor="White"
                                BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="Small"
                                GridLines="Both" Style="text-align: left" Width="100%">
                                <asp:TableRow ID="TableRow1" runat="server">
                                    <asp:TableCell ID="ID" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" HorizontalAlign="Center">EDITAR</asp:TableCell>
                                    <asp:TableCell ID="NRO_TICKET" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" HorizontalAlign="Center">NRO TICKET</asp:TableCell>
                                    <asp:TableCell ID="FECHA_EMISON" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" HorizontalAlign="Center">FECHA EMISON</asp:TableCell>
                                    <asp:TableCell ID="_AREA" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" HorizontalAlign="Center">AREA</asp:TableCell>
                                    <asp:TableCell ID="INCIDENTE" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" HorizontalAlign="Center">INCIDENTE</asp:TableCell>
                                    <asp:TableCell ID="_TECNICO" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" HorizontalAlign="Center">TECNICO</asp:TableCell>
                                    <asp:TableCell ID="FECHA_ASIGNACION" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" HorizontalAlign="Center">FECHA ASIGNACION</asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </td>
                    </tr>



                    <tr>
                        <td style="text-align: right" colspan="3">
                            <asp:HiddenField ID="__mensaje" runat="server" />
                            <asp:HiddenField ID="__pagina" runat="server" />
                            <asp:HiddenField ID="ID_DETINCI" runat="server" Value="0" />
                            <asp:HiddenField ID="OPERACION" runat="server" />
                        </td>
                    </tr>
                </tbody>
            </table>




        </div>


    </form>

    <script type="text/javascript">
        ResaltarFila('TableTecnico');
    </script>


    <script type="text/javascript">//<![CDATA[
        Calendar.setup({
            inputField: "FechaAsignacion",
            trigger: "Fecha_Asignacion",
            onSelect: function () { this.hide() },
            showTime: 12,
            dateFormat: "%d/%m/%Y"
        });
        //]]></script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../bootstrap/js/jquery-1.12.4.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

