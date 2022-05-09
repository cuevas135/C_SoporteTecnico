<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registrarcolaborador.aspx.cs" Inherits="Cliente_registrarcolaborador" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="icon" type="image/png" href="Imagenes/icono.png" />
    <title>Colaborador Cliente</title>
    <meta name="MobileOptimized" content="width">
    <meta name="HandheldFriendly" content="true">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <!-- Bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <!-- Calendario -->
    <%--<link href="css/dcalendar.picker.css" rel="stylesheet">--%>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../bootstrap/js/jquery-1.12.4.min.js" type="text/javascript"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <%--<link href="css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" />--%>
    <%--<script src="js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>--%>
    <link href="css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
    <script src="js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    <style type="text/css">
        #deceased {
            background-color: #FFF3F5;
            padding-top: 10px;
            margin-bottom: 10px;
        }

        .remove_field {
            float: right;
            cursor: pointer;
            position: absolute;
        }

            .remove_field:hover {
                text-decoration: none;
            }
    </style>
    <script type='text/javascript'>
        $(function () {
            $('.form-control.datepicker').datepicker({
                //calendarWeeks: true,
                todayHighlight: true,
                autoclose: true,
                format: 'dd/mm/yyyy'
            });
        });
    </script>
    <script type='text/javascript'>
        $(function () {
            $('.form-control.datepicker').datepicker({
                //calendarWeeks: true,
                todayHighlight: true,
                autoclose: true,
                format: 'dd/mm/yyyy'
            });



            var max_fields = 5; //maximum input boxes allowed
            var x = 1; //initlal text box count

            $('#add').click(function () {
                if (x < max_fields) { //max input box allowed
                    //                    x++; //text box increment
                    $("#addblock").before("<div class='col-md-12 col-sm-12' id='deceased'>    <a href='#' class='remove_field' title='Remove'>X</a>	<div class='form-group col-md-4 col-sm-4'>   <label for='TipoDocumentoPariente'>Tipo de Documento:</label>  <br><select id='DdlTipoDocumento'" + x.toString() + " name=DdlTipoDocumento" + +x.toString() + " CssClass='form-control input-sm' > <option Value='-1'>[---Seleccione---]</option> <option Value='1'>DNI</option> <option Value='4'>CARNET DE EXTRANJERIA</option> <option Value='7'>PASAPORTE</option></select> </div><div class='form-group col-md-4 col-sm-4'><label for='NroDocumentoPariente'> Nro. Documento:</label> <input type='text' class='form-control input-sm' id=TxtNroDocPariente" + x.toString() + " placeholder=''> </div><div class='form-group col-md-4 col-sm-4'><label for='TxtFecNacPariente' class='control-label'>Fecha de Nacimiento:</label><br><input type='date' name=TxtFechaNaciminetoPariente" + x.toString() + "></div> <div class='form-group col-md-4 col-sm-4'>   <label for='name'> Nombre:</label><input type='text' class='form-control input-sm' id=TxtNombrePariente" + x.toString() + " placeholder=''></div><div class='form-group col-md-4 col-sm-4'> <label for='ApellidoPaternoPariente'> Apellido Paterno:</label><input type='text' class='form-control input-sm' id=TxtApellidoPaternoPariente" + x.toString() + " placeholder=''></div><div class='form-group col-md-4 col-sm-4'><label for='ApellidoMaternoPariente'>Apellido Materno:</label><input type='text' class='form-control input-sm' id=TxtApellidoMaternoPariente" + x.toString() + " placeholder=''></div></div>");
                    //                    $("#addblock").before("<div class='col-md-12 col-sm-12' id='deceased'>    <a href='#' class='remove_field' title='Remove'>X</a>	<div class='form-group col-md-4 col-sm-4'>   <label for='TipoDocumentoPariente'>Tipo de Documento:</label>  <br><select id='DdlTipoDocumento'" + x.toString() + " name=DdlTipoDocumento" + +x.toString() + " CssClass='form-control input-sm' > <option Value='-1'>[---Seleccione---]</option> <option Value='1'>DNI</option> <option Value='4'>CARNET DE EXTRANJERIA</option> <option Value='7'>PASAPORTE</option></select> </div><div class='form-group col-md-4 col-sm-4'><label for='NroDocumentoPariente'> Nro. Documento:</label> <input type='text' class='form-control input-sm' id=TxtNroDocPariente" + x.toString() + " placeholder=''> </div><div class='form-group col-md-4 col-sm-4'><label for='TxtFecNacPariente' class='control-label'>Fecha de Nacimiento:</label><input type='text' class='form-control input-sm' id=TxtFechaNaciminetoPariente" + x.toString() + " placeholder='' class='form-control input-sm datepicker'><div class='input-group'><span class='input-group-addon' id='start-date'><span class='glyphicon glyphicon-calendar'></span></span>      </div> </div> <div class='form-group col-md-4 col-sm-4'>   <label for='name'> Nombre:</label><input type='text' class='form-control input-sm' id=TxtNombrePariente" + x.toString() + " placeholder=''></div><div class='form-group col-md-4 col-sm-4'> <label for='ApellidoPaternoPariente'> Apellido Paterno:</label><input type='text' class='form-control input-sm' id=TxtApellidoPaternoPariente" + x.toString() + " placeholder=''></div><div class='form-group col-md-4 col-sm-4'><label for='ApellidoMaternoPariente'>Apellido Materno:</label><input type='text' class='form-control input-sm' id=TxtApellidoMaternoPariente" + x.toString() + " placeholder=''></div></div>");
                    $('.datepicker').datepicker({
                        todayHighlight: true,
                        autoclose: true,
                        format: 'dd/mm/yyyy'
                    });
                    x += 1;
                } else {
                    alert("Solo puede agregar 5 Hijos(as)");
                }
            });
            $(document).on('click', '.remove_field', function (e) {
                e.preventDefault();
                $(this).parent('div').remove();
                x--;
            });


        });

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
    <form id="form2" runat="server">
        <div class="panel panel-primary" style="margin: 20px;">
            <div style="text-align: center">
                <asp:HyperLink ID="hlCerrarSesion" runat="server" ForeColor="Red"
                    NavigateUrl="~/CerrarSession.aspx">Cerrar Sesion</asp:HyperLink>
            </div>
            <br />
            <div class="panel-heading">
                <h3 class="panel-title">Registrar Colaborador</h3>
            </div>
            <div class="panel-body">
                <div class="col-md-12 col-sm-12">

                    <div class="form-group col-md-4 col-sm-4">
                        <%--<label for="TIPOCOLABORADOR">--%>
                        Tipo colaborador:
                        <asp:RangeValidator ID="rvTIPOCOLABORADOR" runat="server" BackColor="Yellow" ControlToValidate="TIPOCOLABORADOR"
                            ErrorMessage="*" ForeColor="Red" MaximumValue="99999" MinimumValue="1" SetFocusOnError="True"
                            Type="Integer"></asp:RangeValidator>
                        <%--</label>--%>
                        <asp:DropDownList ID="TIPOCOLABORADOR" runat="server" CssClass="form-control input-sm" Font-Size="Small" Style="margin-left: 0px"></asp:DropDownList>
                    </div>

                    <div class="form-group col-md-4 col-sm-4">
                        <%--<label for="APELLIDOPATERNO">--%>
                        Apellido paterno:
                        <asp:RequiredFieldValidator ID="rfvAPELLIDOPATERNO" runat="server" BackColor="Yellow"
                            ControlToValidate="APELLIDOPATERNO" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <%--</label>--%>
                        <asp:TextBox ID="APELLIDOPATERNO" runat="server" class="form-control input-sm"
                            onkeypress="return SoloLetrasMinusculas()"
                            onchange="CambiaLetraMayuscula('APELLIDOPATERNO')" MaxLength="15"></asp:TextBox>
                    </div>


                    <div class="form-group col-md-4 col-sm-4">
                        <%--<label for="APELLIDOMATERNO">--%>
                        Apellido materno:
                        <asp:RequiredFieldValidator ID="rfvTAPELLIDOMATERNO" runat="server" BackColor="Yellow" ControlToValidate="APELLIDOMATERNO"
                            ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <%--</label>--%>
                        <asp:TextBox ID="APELLIDOMATERNO" runat="server" class="form-control input-sm" onkeypress="return SoloLetrasMinusculas()"
                            onchange="CambiaLetraMayuscula('APELLIDOMATERNO')" MaxLength="15"></asp:TextBox>
                    </div>

                    <div class="form-group col-md-4 col-sm-4">
                        <%-- <label for="NOMBRES">--%>
                        Nombres:
                        <asp:RequiredFieldValidator ID="rfvNOMBRES" runat="server" BackColor="Yellow"
                            ControlToValidate="NOMBRES" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <%--</label>--%>
                        <asp:TextBox ID="NOMBRES" runat="server" class="form-control input-sm" onkeypress="return SoloLetrasMinusculas()"
                            onchange="CambiaLetraMayuscula('NOMBRES')" MaxLength="15"></asp:TextBox>
                    </div>

                    <div class="form-group col-md-4 col-sm-4">
                        <%--<label for="FIJO">--%>
                        Nro. fijo:
                        <%--</label>--%>
                        <asp:TextBox ID="FIJO" runat="server" class="form-control input-sm" onkeypress="return SoloNumeros()"
                            onchange="" MaxLength="9"></asp:TextBox>
                    </div>

                    <div class="form-group col-md-4 col-sm-4">
                        <%--<label for="CELULAR">--%>
                        Nro. celular:
                        <asp:RequiredFieldValidator ID="rfvCELULAR" runat="server" BackColor="Yellow"
                            ControlToValidate="CELULAR" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <%--</label>--%>
                        <asp:TextBox ID="CELULAR" runat="server" class="form-control input-sm" onkeypress="return SoloNumeros()"
                            onchange="" MaxLength="9"></asp:TextBox>
                    </div>

                    <div class="form-group col-md-4 col-sm-4">
                        <%--<label for="DIRECCION">--%>
                        Direccion:
                    <%--</label>--%>
                        <asp:TextBox ID="DIRECCION" runat="server" class="form-control input-sm" onchange="CambiaLetraMayuscula('DIRECCION')"></asp:TextBox>
                    </div>

                    <div class="form-group col-md-4 col-sm-4">
                        <%--<label for="Email">--%>
                        Correo:
                        <asp:RequiredFieldValidator ID="rfvEMAIL" runat="server" BackColor="Yellow" ControlToValidate="EMAIL"
                            ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" SetFocusOnError="True"
                            ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ControlToValidate="EMAIL"
                            ErrorMessage="Correo Invalido" BackColor="Yellow" ForeColor="Red"></asp:RegularExpressionValidator>
                        <%-- </label>--%>
                        <asp:TextBox ID="EMAIL" runat="server" class="form-control input-sm"></asp:TextBox>
                    </div>

                    <div class="form-group col-md-4 col-sm-4">
                        <%--<label for="ESTADO">--%>
                        Estado:                 
                    <%--</label>--%>

                        <asp:CheckBox ID="ESTADO" runat="server" Text="" class="form-check-input" />
                        <label class="form-check-label" for="ESTADO">
                            ACTIVO / INACTIVO
                        </label>

                    </div>


                    <%--</div>--%>


                    <div class="col-md-12 col-sm-12" style="text-align: center">
                        <div class="form-group col-md-3 col-sm-3" style="text-align: center">
                            <asp:LinkButton ID="btnAceptar" runat="server"
                                OnClientClick="return Confirmar('¿Desea guardar colaborador?');"
                                Style="font-family: Calibri; font-size: medium"
                                Text="Aceptar <span class='glyphicon glyphicon-ok'></span>"
                                CssClass="btn btn-primary" OnClick="btnAceptar_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btnCancelar" runat="server" CausesValidation="False"
                        Text="Cancelar <span class='glyphicon glyphicon-remove'></span>"
                        Style="font-family: Calibri; font-size: medium"
                        UseSubmitBehavior="False" class="btn btn-danger"
                        OnClientClick="return Confirmar('¿Desea Cancelar Registro?');"
                        PostBackUrl="~/Cliente/listarcolaboradores.aspx" />
                        </div>
                    </div>
                    <asp:HiddenField ID="__mensaje" runat="server" />
                    <asp:HiddenField ID="__pagina" runat="server" />
                </div>
            </div>
    </form>
</body>
</html>

