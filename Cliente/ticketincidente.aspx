<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ticketincidente.aspx.cs" Inherits="Cliente_ticketincidente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ticket Incidente</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Otros_css_js/Menu.css" rel="stylesheet" />

    <script language="javascript" type="text/javascript">
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

        /*Ultima Modificacion: 22/7/2019
        Ing. Secundino Alvites Rodas.
        */
        function SoloLetrasMinusculas() {
            if (!((event.keyCode >= 97 && event.keyCode <= 122) || event.keyCode == 32 || event.keyCode == 193 || event.keyCode == 201 || event.keyCode == 205 || event.keyCode == 209 || event.keyCode == 211 || event.keyCode == 218 || event.keyCode == 220 || event.keyCode == 241)) {
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

        function Datos_Cargo(_ID, _CARGO) {

            frmAlumno.ID_CARGO.value = _ID;
            frmAlumno.CARGO.value = _CARGO;

        }

        function Limpiar_Datos_Cargo() {

            frmAlumno.ID_CARGO.value = "0";
            frmAlumno.CARGO.value = "";

        }


        function CambiaLetraMayuscula(Caja) {
            document.getElementById(Caja).value = document.getElementById(Caja).value.toUpperCase();
        }

    </script>

    <script language="JavaScript" src="../Otros_css_js/resaltar.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../Otros_css_js/estilo.css" type="text/css" />
</head>
<body onload="MostrarMensaje()">
    <form id="frmTicketIncidente" runat="server">

        <div class="container">
            <div class="table-responsive">


                <table class="table text-center">

                    <thead>
                        <tr>
                            <td colspan="3" style="text-align: left">
                                <asp:Label ID="lblusurio" runat="server" Font-Size="Small" ForeColor="White"
                                    Style="color: #00CC00; text-align: left; margin-left: 0px;" Width="100%"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center;" colspan="3">
                                <asp:HyperLink ID="hlCerrarSesion" runat="server" ForeColor="Red"
                                    NavigateUrl="~/CerrarSession.aspx">Cerrar Sesion</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center; color: #FFFFFF; background-color: #000000;" colspan="3">INGRESE DATOS TICKET</td>
                        </tr>
                        <tr>
                            <td style="text-align: right; color: #FFFFFF; background-color: #000000;">Nro. Ticket: </td>
                            <td style="text-align: left">
                                <asp:Label ID="NRO_TICKET" runat="server" CssClass="form-control input-sm"></asp:Label>
                            </td>
                            <td style="text-align: left">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right; color: #FFFFFF; background-color: #000000;">Fecha emision:</td>
                            <td style="text-align: left">
                                <asp:Label ID="FECHAEMISON" runat="server" CssClass="form-control input-sm"></asp:Label>
                            </td>
                            <td style="text-align: left">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right; color: #FFFFFF; background-color: #000000;">Canal comunicacion:</td>
                            <td style="text-align: left">
                                <asp:DropDownList ID="CANAL" runat="server" CssClass="form-control input-sm"
                                    Font-Size="Small" Style="margin-left: 0px">
                                </asp:DropDownList>
                            </td>
                            <td style="text-align: left">
                                <%--<label for="cargo">--%>
                                <asp:RangeValidator ID="rvCANAL" runat="server" BackColor="Yellow" ControlToValidate="CANAL"
                                    ErrorMessage="*" ForeColor="Red" MaximumValue="99999" MinimumValue="1" SetFocusOnError="True"
                                    Type="Integer"></asp:RangeValidator>
                                <%--</label>--%>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center; color: #FFFFFF; background-color: #000000;" colspan="3">INGRESE DATOS INCIDENTE</td>
                        </tr>
                        <tr>
                            <td style="text-align: right; color: #FFFFFF; background-color: #000000;">Area:</td>
                            <td style="text-align: left">
                                <asp:DropDownList ID="AREA" runat="server" CssClass="form-control input-sm"
                                    Font-Size="Small" Style="margin-left: 0px">
                                </asp:DropDownList>
                            </td>
                            <td style="text-align: left">
                                <%--<label for="cargo">--%>
                                <asp:RangeValidator ID="rvAREA" runat="server" BackColor="Yellow" ControlToValidate="AREA"
                                    ErrorMessage="*" ForeColor="Red" MaximumValue="99999" MinimumValue="1" SetFocusOnError="True"
                                    Type="Integer"></asp:RangeValidator>
                                <%--</label>--%>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; color: #FFFFFF; background-color: #000000;">Descripcion: </td>
                            <td style="text-align: left">
                                <asp:TextBox ID="DESCRIPCION" runat="server" CssClass="form-control input-sm" Style="text-align: left" onchange="CambiaLetraMayuscula('DESCRIPCION')"
                                    onkeypress="SoloLetrasMinusculas()"></asp:TextBox>
                            </td>
                            <td style="text-align: left">
                                <asp:RequiredFieldValidator ID="rfvDESCRIPCION" runat="server" BackColor="Yellow"
                                    ControlToValidate="DESCRIPCION" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; color: #FFFFFF; background-color: #000000;">Prioridad:</td>
                            <td style="text-align: left">
                                <asp:DropDownList ID="PRIORIDAD" runat="server" CssClass="form-control input-sm"
                                    Font-Size="Small" Style="margin-left: 0px">
                                </asp:DropDownList>
                            </td>
                            <td style="text-align: left">
                                <%-- <label for="cargo">--%>
                                <asp:RangeValidator ID="rvPRIORIDAD" runat="server" BackColor="Yellow" ControlToValidate="PRIORIDAD"
                                    ErrorMessage="*" ForeColor="Red" MaximumValue="99999" MinimumValue="1" SetFocusOnError="True"
                                    Type="Integer"></asp:RangeValidator>
                                <%-- </label>--%>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; color: #FFFFFF; background-color: #000000;">Impacto:</td>
                            <td style="text-align: left">
                                <asp:DropDownList ID="IMPACTO" runat="server" CssClass="form-control input-sm"
                                    Font-Size="Small" Style="margin-left: 0px">
                                </asp:DropDownList>
                            </td>
                            <td style="text-align: left">
                                <%--<label for="cargo">--%>
                                <asp:RangeValidator ID="rvIMPACTO" runat="server" BackColor="Yellow" ControlToValidate="IMPACTO"
                                    ErrorMessage="*" ForeColor="Red" MaximumValue="99999" MinimumValue="1" SetFocusOnError="True"
                                    Type="Integer"></asp:RangeValidator>
                                <%--    </label>--%>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                <asp:LinkButton ID="btnAceptar" runat="server"
                                    OnClientClick="return Confirmar('¿Desea Guardar Ticket Incidente?');"
                                    Style="font-family: Calibri; font-size: medium"
                                    Text="Aceptar <span class='glyphicon glyphicon-ok'></span>"
                                    CssClass="btn btn-primary" OnClick="btnAceptar_Click" />
                            </td>
                            <td style="text-align: left" colspan="2">
                                <asp:LinkButton ID="btnCancelar" runat="server" CausesValidation="False"
                                    Text="Cancelar <span class='glyphicon glyphicon-remove'></span>"
                                    Style="font-family: Calibri; font-size: medium"
                                    UseSubmitBehavior="False" class="btn btn-danger"
                                    OnClientClick="return Confirmar('¿Desea Cancelar Registro?');"
                                    PostBackUrl="~/Cliente/ticketsincidentes.aspx" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:HiddenField ID="__mensaje" runat="server" />
                                <asp:HiddenField ID="__pagina" runat="server" />
                                <asp:HiddenField ID="ID_TIKET" runat="server" Value="0"
                                    EnableViewState="False" />
                                <asp:HiddenField ID="ID_USUA" runat="server" Value="0"
                                    EnableViewState="False" />
                                <asp:HiddenField ID="ID_INCI" runat="server" Value="0"
                                    EnableViewState="False" />
                            </td>
                        </tr>

                    </thead>

                    <tbody id="myTable">
                    </tbody>
                </table>

            </div>
        </div>
    </form>




    <script src="../bootstrap/js/jquery-1.12.4.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
