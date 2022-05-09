<%@ Page Language="C#" AutoEventWireup="true" CodeFile="visitacliente.aspx.cs" Inherits="Administracion_visitacliente" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <%--<link rel="icon" type="image/png" href="Imagenes/icono.png" />--%>
    <title>Colaborador</title>
    <meta name="MobileOptimized" content="width" />
    <meta name="HandheldFriendly" content="true" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
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


    <!-- ESTILOS PARA HEADER DE MODAL -->
    <style type="text/css">
        .modal-header, h4, .close {
            /*background-color: #5cb85c;*/
            background-color: #0f5368;
            color: white !important;
            text-align: center;
            font-size: 25px;
        }

        .modal-footer {
            background-color: #f9f9f9;
        }

        .style1 {
            font-size: 14px;
            font-weight: bold;
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
<body onload="MostrarMensaje()">
    <!-- #include virtual="menu.inc" -->
    <form id="frmColaborador" role="form" runat="server">
        <div class="panel panel-primary" style="border-style: hidden; margin: 20px;">
            <asp:Label ID="lblUsuario" runat="server" ForeColor="Red"></asp:Label>
            <div class="panel-heading" style="text-align: center">
                <h3 class="panel-title">Ingrese datos visita</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="form-group col-md-4 col-sm-4">
                            <%--<a href="#" data-toggle ="modal"  data-target ="#myModal" class="popup-link">Ver solicitudes pendientes</a> --%>
                        </div>
                        <div class="form-group col-md-4 col-sm-4">
                            <b>Tecnico:</b>
                            <asp:RangeValidator ID="rvTecnico" runat="server" BackColor=""
                                ControlToValidate="Tecnico" ErrorMessage="*" ForeColor="Red"
                                MaximumValue="99999" MinimumValue="1" SetFocusOnError="True" Type="Integer"
                                Font-Size="Medium"></asp:RangeValidator>
                            <asp:RequiredFieldValidator ID="rfvTecnico" runat="server" ErrorMessage="*"
                                ControlToValidate="Tecnico" ForeColor="Red" SetFocusOnError="True"
                                Font-Size="Medium"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="Tecnico" runat="server" CssClass="form-control input-sm"
                                Font-Size="Small" Style="margin-left: 0px" AutoPostBack="True"
                                OnSelectedIndexChanged="Tecnico_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-md-4 col-sm-4">
                            <%--<a href="#" data-toggle ="modal"  data-target ="#myModal" class="popup-link">Ver solicitudes pendientes</a> --%>
                        </div>
                    </div>
                </div>
                <center><b>Solicitudes de Servicios Pendientes</b></center>
            </div>
            <div class="container">
                <div class="table-responsive">
                    <%--<h3 style="text-align: center" class="style1">Ingrese datos visita</h3><br /> --%>
                    <asp:Table ID="Table_" runat="server"
                        class="table table-bordered table-hover text-center"
                        BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="Small"
                        GridLines="Both" Style="text-align: left" Font-Names="Arial">
                        <asp:TableHeaderRow ID="TableRow1" runat="server" TableSection="TableHeader">
                            <asp:TableHeaderCell ID="SELECCIONA_" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="Blue">SELECCIONA </asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="NROSOLICITUD_" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">NRO SOLICITUD</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="FECHA" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">FEC SOLICITUD</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="CLIENTE_" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">CLIENTE</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="DIRECCION_" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">DIRECCION</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="TELFIJO_" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">TEL FIJO</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="TELMOVIL_" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">TEL MOVIL</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="VER" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="Blue">DETALLE </asp:TableHeaderCell>
                        </asp:TableHeaderRow>
                    </asp:Table>
                </div>
            </div>

            <asp:HiddenField ID="__mensaje" runat="server" />
            <asp:HiddenField ID="__pagina" runat="server" />


            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="form-group col-md-4 col-sm-4">
                        <%--<a href="#" data-toggle ="modal"  data-target ="#myModal" class="popup-link">Ver solicitudes pendientes</a> --%>
                    </div>
                    <div class="form-group col-md-4 col-sm-4" style="text-align: center">
                        <br />
                        <asp:Button ID="btnRegistrarVisita" runat="server"
                            Style="font-family: Calibri; color: #000000; font-size: medium"
                            Text="Registrar Visita"
                            OnClientClick="return Confirmar('¿Desea registrar visita?');"
                            CssClass="btn btn-primary"
                            Width="150px" OnClick="btnRegistrarVisita_Click" Visible="False" />

                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        <%--<a href="#" data-toggle ="modal"  data-target ="#myModal" class="popup-link">Ver solicitudes pendientes</a> --%>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="table-responsive">
                    <h3 style="text-align: center" class="style1">Visitas Asignadas Tecnico</h3>
                    <br />
                    <asp:Table ID="TableVisita" runat="server"
                        class="table table-bordered table-hover text-center"
                        BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="Small"
                        GridLines="Both" Style="text-align: left" Font-Names="Arial">
                        <asp:TableHeaderRow ID="TableHeaderRow2" runat="server" TableSection="TableHeader">
                            <asp:TableHeaderCell ID="TableHeaderCell1" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="Blue">SELECCIONA </asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="CODIGO_VISITA" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White" Visible="false">CODIGO VISITA</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="FEC_ASIGNACION" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">FEC ASIGNACION</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="__TECNICO" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">TECNICO</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="NRO_SOLICITUD" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">NRO SOLICITUD</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="FEC_SOLICITUD" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">FEC SOLICITUD</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="__CLIENTE" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">CLIENTE</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="__DIRECCION" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">DIRECCION </asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="TEL_FIJO" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">TEL FIJO</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="TEL_MOVIL" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="White">TEL MOVIL</asp:TableHeaderCell>
                            <asp:TableHeaderCell ID="VER_" runat="server" BackColor="Black" BorderColor="Black"
                                ForeColor="Blue">DETALLE </asp:TableHeaderCell>
                        </asp:TableHeaderRow>
                    </asp:Table>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="form-group col-md-4 col-sm-4">
                        <%--<a href="#" data-toggle ="modal"  data-target ="#myModal" class="popup-link">Ver solicitudes pendientes</a> --%>
                    </div>
                    <div class="form-group col-md-4 col-sm-4" style="text-align: center">
                        <br />
                        <asp:Button ID="btnEliminar" runat="server"
                            Style="font-family: Calibri; color: #000000; font-size: medium"
                            Text="Eliminar Visita"
                            OnClientClick="return Confirmar('¿Desea eliminar visita?');" class="btn btn-danger"
                            Width="150px" CausesValidation="False" OnClick="btnEliminar_Click"
                            Visible="False" />

                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        <%--<a href="#" data-toggle ="modal"  data-target ="#myModal" class="popup-link">Ver solicitudes pendientes</a> --%>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="myModal" role="dialog" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Detalle solicitud</h4>
                    </div>
                    <div class="modal-body">
                        <%--<label class="control-label">Nombre de Area de Trabajo</label>--%>

                        <div class="panel-body">
                            <asp:Label ID="lblCliente" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="container">
                            <div class="table-responsive">
                                <asp:Table ID="Table_Detalle" runat="server"
                                    class="table table-bordered table-hover text-center"
                                    BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="Small"
                                    GridLines="Both" Style="text-align: left" Font-Names="Arial"
                                    Width="550px">

                                    <asp:TableHeaderRow ID="TableHeaderRow1" runat="server" TableSection="TableHeader">
                                        <asp:TableHeaderCell ID="NROSOLICITUD__" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White">NRO. SOLICITUD </asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="SERVICIO__" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White">SERVICIO</asp:TableHeaderCell>
                                        <asp:TableHeaderCell ID="MODALIDAD__" runat="server" BackColor="Black" BorderColor="Black"
                                            ForeColor="White">MODALIDAD</asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                                </asp:Table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="col-md-6 col-md-offset-3">
                            <%-- <asp:LinkButton ID="btnRegistrar" runat="server"  class="btn btn-primary"
                               Text="Aceptar <span class='glyphicon glyphicon-ok'></span>" 
                                style="font-family: Calibri; font-size: medium" onclick="btnRegistrar_Click" 
                                 /> --%>
                        </div>
                    </div>
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


    <p>
        &nbsp;
    </p>


</body>
</html>

