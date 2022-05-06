<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistrarUsuario.aspx.cs" Inherits="Postergaciones_RegistrarUsuario"  %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat=server>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" type="image/png" href="Imagenes/icono.png" />
    <title>Registrar Cliente</title>
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
        #deceased
        {
            background-color: #FFF3F5;
            padding-top: 10px;
            margin-bottom: 10px;
        }
        .remove_field
        {
            float: right;
            cursor: pointer;
            position: absolute;
        }
        .remove_field:hover
        {
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
<body onload ="MostrarMensaje()">
    <form id="form2" runat="server">
    <div class="panel panel-primary" style="margin: 20px;">
        <div class="panel-heading">
            <h3 class="panel-title">
                Registrar Cliente</h3>
        </div>
        <div class="panel-body">
            <div class="col-md-12 col-sm-12">
                <div class="form-group col-md-4 col-sm-4">
                    <label for="TipoDocumento">
                        Tipo de Documento:
                        <asp:RangeValidator ID="RvDdlTipoDocumento" runat="server" BackColor="Yellow" ControlToValidate="DdlTipoDocumento"
                            ErrorMessage="*" ForeColor="Red" MaximumValue="99999" MinimumValue="1" SetFocusOnError="True"
                            Type="Integer"></asp:RangeValidator>
                    </label>
                    <asp:DropDownList ID="DdlTipoDocumento" runat="server" CssClass="form-control input-sm"
                        Font-Size="Small" Style="margin-left: 0px">
                        <asp:ListItem Value="-1">[---Seleccione---]</asp:ListItem>
                        <asp:ListItem Value="1">DNI</asp:ListItem>
                        <asp:ListItem Value="4">CARNET DE EXTRANJERIA</asp:ListItem>
                        <asp:ListItem Value="7">PASAPORTE</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group col-md-4 col-sm-4">
                    <label for="NroDocumento">
                        Nro. Documento:
                        <asp:RequiredFieldValidator ID="rfvTxtNroDocumento" runat="server" BackColor="Yellow"
                            ControlToValidate="TxtNroDocumento" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="TxtNroDocumento" runat="server" class="form-control input-sm"></asp:TextBox>
                </div>
                <div class="form-group col-md-4 col-sm-4">
                    <label class="control-label">
                        Fecha de Nacimiento:
                        <asp:RequiredFieldValidator ID="rfvTxtFecNacCli" runat="server" BackColor="Yellow"
                            ControlToValidate="TxtFecNacCli" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revTxtFecNacCli" runat="server" ControlToValidate="TxtFecNacCli"
                            ErrorMessage="&nbsp;&nbsp Fecha Incorrecta." Font-Size="X-Small" Font-Names="Arial"
                            ForeColor="Red" ValidationExpression="\d{2}/\d{2}/\d{4}"></asp:RegularExpressionValidator>
                    </label>
                    <div class="input-group">
                        <asp:TextBox ID="TxtFecNacCli" runat="server" class="form-control input-sm datepicker"></asp:TextBox>
                        <span class="input-group-addon" id="start-date"><span class="glyphicon glyphicon-calendar">
                        </span></span>
                    </div>
                </div>
                <div class="form-group col-md-4 col-sm-4">
                    <label for="Nombre">
                        Nombre:
                        <asp:RequiredFieldValidator ID="rfvTxtNombre" runat="server" BackColor="Yellow" ControlToValidate="TxtNombre"
                            ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="TxtNombre" runat="server" class="form-control input-sm"></asp:TextBox>
                </div>
                <div class="form-group col-md-4 col-sm-4">
                    <label for="ApellidoPaterno">
                        Apellido Paterno:
                        <asp:RequiredFieldValidator ID="rfvTxtApellidoPaterno" runat="server" BackColor="Yellow"
                            ControlToValidate="TxtApellidoPaterno" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="TxtApellidoPaterno" runat="server" class="form-control input-sm"></asp:TextBox>
                </div>
                <div class="form-group col-md-4 col-sm-4">
                    <label for="ApellidoMaterno">
                        Apellido Materno:
                        <asp:RequiredFieldValidator ID="rfvTxtApellidoMaterno" runat="server" BackColor="Yellow"
                            ControlToValidate="TxtApellidoMaterno" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="TxtApellidoMaterno" runat="server" class="form-control input-sm"></asp:TextBox>
                </div>
                <div class="form-group col-md-4 col-sm-4">
                    <label for="Sexo">
                        Sexo:
                        <asp:RangeValidator ID="RvDdlSexo" runat="server" BackColor="Yellow" ControlToValidate="DdlSexo"
                            ErrorMessage="*" ForeColor="Red" MaximumValue="99999" MinimumValue="1" SetFocusOnError="True"
                            Type="Integer"></asp:RangeValidator>
                    </label>
                    <asp:DropDownList ID="DdlSexo" runat="server" CssClass="form-control input-sm" Font-Size="Small"
                        Style="margin-left: 0px">
                        <asp:ListItem Value="-1">[---Seleccione---]</asp:ListItem>
                        <asp:ListItem Value="1">MASCULINO</asp:ListItem>
                        <asp:ListItem Value="2">FEMENINO</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group col-md-4 col-sm-4">
                    <label for="Telefono">
                        Telefono:
                        <asp:RequiredFieldValidator ID="rfvTxtTelefono" runat="server" BackColor="Yellow"
                            ControlToValidate="TxtTelefono" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="TxtTelefono" runat="server" class="form-control input-sm"></asp:TextBox>
                </div>
                <div class="form-group col-md-4 col-sm-4">
                    <label for="Direccion">
                        Direccion:
                    </label>
                    <asp:TextBox ID="TxtDireccion" runat="server" class="form-control input-sm"></asp:TextBox>
                </div>
                <div class="form-group col-md-4 col-sm-4">
                    <label for="Correo">
                        Correo:
                        <asp:RequiredFieldValidator ID="rfvTxtCorreo" runat="server" BackColor="Yellow" ControlToValidate="TxtCorreo"
                            ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" SetFocusOnError="True" 
                            ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ControlToValidate="TxtCorreo" 
                            ErrorMessage="Correo Invalido" BackColor="Yellow" ForeColor="Red"></asp:RegularExpressionValidator>
                    </label>
                    <asp:TextBox ID="TxtCorreo" runat="server" class="form-control input-sm"></asp:TextBox>
                </div>
                <div class="form-group col-md-4 col-sm-4">
                    <label for="Usuario">
                        Usuario:
                        <asp:RequiredFieldValidator ID="rfvTxtUsuario" runat="server" BackColor="Yellow"
                            ControlToValidate="TxtUsuario" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="TxtUsuario" runat="server" class="form-control input-sm"></asp:TextBox>
                </div>
                <div class="form-group col-md-4 col-sm-4">
                    <label for="Contrasena">
                        Contraseña:
                        <asp:RequiredFieldValidator ID="rfvTxtContrasena" runat="server" BackColor="Yellow"
                            ControlToValidate="TxtContrasena" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="TxtContrasena" runat="server" class="form-control input-sm"></asp:TextBox>
                </div>
            </div>

            <%--PARIENTE--%>
            <div class="col-md-12 col-sm-12" id="addblock">
                <div class="form-group col-md-3 col-sm-3">
                    <input type='button' class="btn btn-primary" value="Agregar Pariente" id="add" />
                    </div>
            </div>
            <div class="col-md-12 col-sm-12" id="Div1">
                <div class="form-group col-md-3 col-sm-3">
                     <asp:LinkButton ID="btnAceptar" runat="server" 
                         onclientclick="return Confirmar('¿Desea Guardar Hoja de Vida?');" 
                       style="font-family: Calibri;  font-size: medium" 
                    Text="Aceptar <span class='glyphicon glyphicon-ok'></span>" 
                         CssClass="btn btn-primary" 
                                   />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btnCancelar" runat="server" CausesValidation="False" 
                         Text="Cancelar <span class='glyphicon glyphicon-remove'></span>" 
                        style="font-family: Calibri; font-size: medium"  
                        UseSubmitBehavior="False" class="btn btn-danger" 
                                    onclientclick="return Confirmar('¿Desea Cancelar Registro?');" />
                </div>
            </div>
                            <asp:HiddenField ID="__mensaje" runat="server" />
                            <asp:HiddenField ID="__pagina0" runat="server" />
        </div>
    </div>

    <%
        
      
    %>
    
     <%--<div class="col-md-12 col-sm-12" id="deceased">    <a href="#" class="remove_field" title="Remove">X</a>	<div class="form-group col-md-4 col-sm-4">     <label for="TipoDocumentoPariente">Tipo de Documento:<asp:RangeValidator ID="RvDdlTipoDocPariente"' + x + '" runat="server" BackColor="Yellow" ControlToValidate="DdlTipoDocPariente' + x + '" ErrorMessage="*" ForeColor="Red" MaximumValue="99999" MinimumValue="1" SetFocusOnError="True" Type="Integer"></asp:RangeValidator> </label><asp:DropDownList ID="DdlTipoDocPariente' + x + '" runat="server" CssClass="form-control input-sm" Font-Size="Small" Style="margin-left: 0px"><asp:ListItem Value="-1">[---Seleccione---]</asp:ListItem><asp:ListItem Value="1">DNI</asp:ListItem> <asp:ListItem Value="4">CARNET DE EXTRANJERIA</asp:ListItem>   <asp:ListItem Value="7">PASAPORTE</asp:ListItem></asp:DropDownList></div><div class="form-group col-md-4 col-sm-4"><label for="NroDocumentoPariente"> Nro. Documento:<asp:RequiredFieldValidator ID="rfvTxtNroDocPariente' + x + '" runat="server" BackColor="Yellow" ControlToValidate="TxtNroDocPariente' + x + '" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator></label><asp:TextBox ID="TxtNroDocPariente' + x + '" runat="server" class="form-control input-sm"></asp:TextBox></div><div class="form-group col-md-4 col-sm-4"><label for="TxtFecNacPariente" class="control-label">Fecha de Nacimiento:<asp:RequiredFieldValidator ID="rfvTxtFecNacPariente' + x + '" runat="server" BackColor="Yellow" ControlToValidate="TxtFecNacPariente' + x + '" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator> <asp:RegularExpressionValidator ID="revTxtFecNacPariente' + x + '" runat="server" ControlToValidate="TxtFecNacPariente' + x + '" ErrorMessage="&nbsp;&nbsp Fecha Incorrecta." Font-Size="X-Small" Font-Names="Arial" ForeColor="Red" ValidationExpression="\d{2}/\d{2}/\d{4}"></asp:RegularExpressionValidator> </label>     <div class="input-group"> <asp:TextBox ID="TxtFecNacPariente' + x + '" runat="server" class="form-control input-sm datepicker"></asp:TextBox><span class="input-group-addon" id="Span1"><span class="glyphicon glyphicon-calendar"> </span></span>  </div> </div> <div class="form-group col-md-4 col-sm-4">   <label for="name"> Nombre: <asp:RequiredFieldValidator ID="rfvTxtNombrePariente' + x + '" runat="server" BackColor="Yellow"   ControlToValidate="TxtNombrePariente' + x + '" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator></label><asp:TextBox ID="TxtNombrePariente' + x + '" runat="server" class="form-control input-sm"></asp:TextBox></div><div class="form-group col-md-4 col-sm-4"><label for="ApellidoPaternoPariente"> Apellido Paterno:<asp:RequiredFieldValidator ID="rfvTxtApellidoPaternoPariente' + x + '" runat="server" BackColor="Yellow" ControlToValidate="TxtApellidoPaternoPariente' + x + '" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator> </label><asp:TextBox ID="TxtApellidoPaternoPariente' + x + '" runat="server" class="form-control input-sm"></asp:TextBox></div><div class="form-group col-md-4 col-sm-4"><label for="ApellidoMaternoPariente">Apellido Materno:<asp:RequiredFieldValidator ID="rfvTxtApellidoMaternoPariente' + x + '" runat="server" BackColor="Yellow" ControlToValidate="TxtApellidoMaternoPariente' + x + '" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator> </label> <asp:TextBox ID="TxtApellidoMaternoPariente' + x + '" runat="server" class="form-control input-sm"></asp:TextBox> </div></div>--%>
     <%--<div class="col-md-12 col-sm-12" id="deceased">    <a href="#" class="remove_field" title="Remove">X</a>	<div class="form-group col-md-4 col-sm-4">     <label for="TipoDocumentoPariente">Tipo de Documento:</label><asp:DropDownList ID="DdlTipoDocPariente' + x + '" runat="server" CssClass="form-control input-sm" Font-Size="Small" Style="margin-left: 0px"><asp:ListItem Value="-1">[---Seleccione---]</asp:ListItem><asp:ListItem Value="1">DNI</asp:ListItem> <asp:ListItem Value="4">CARNET DE EXTRANJERIA</asp:ListItem>   <asp:ListItem Value="7">PASAPORTE</asp:ListItem></asp:DropDownList></div><div class="form-group col-md-4 col-sm-4"><label for="NroDocumentoPariente"> Nro. Documento:</label><asp:TextBox ID="TxtNroDocPariente' + x + '" runat="server" class="form-control input-sm"></asp:TextBox></div><div class="form-group col-md-4 col-sm-4"><label for="TxtFecNacPariente" class="control-label">Fecha de Nacimiento:</label><div class="input-group"> <asp:TextBox ID="TxtFecNacPariente' + x + '" runat="server" class="form-control input-sm datepicker"></asp:TextBox><span class="input-group-addon" id="Span1"><span class="glyphicon glyphicon-calendar"> </span></span>  </div> </div> <div class="form-group col-md-4 col-sm-4">   <label for="name"> Nombre:</label><asp:TextBox ID="TxtNombrePariente' + x + '" runat="server" class="form-control input-sm"></asp:TextBox></div><div class="form-group col-md-4 col-sm-4"><label for="ApellidoPaternoPariente"> Apellido Paterno:</label><asp:TextBox ID="TxtApellidoPaternoPariente' + x + '" runat="server" class="form-control input-sm"></asp:TextBox></div><div class="form-group col-md-4 col-sm-4"><label for="ApellidoMaternoPariente">Apellido Materno:</label> <asp:TextBox ID="TxtApellidoMaternoPariente' + x + '" runat="server" class="form-control input-sm"></asp:TextBox> </div></div>--%>
     <%--<div class="col-md-12 col-sm-12" id="deceased">    <a href="#" class="remove_field" title="Remove">X</a>	<div class="form-group col-md-4 col-sm-4">     <label for="TipoDocumentoPariente">Tipo de Documento:</label><asp:DropDownList ID="DdlTipoDocPariente" runat="server" CssClass="form-control input-sm" Font-Size="Small" Style="margin-left: 0px"><asp:ListItem Value="-1">[---Seleccione---]</asp:ListItem><asp:ListItem Value="1">DNI</asp:ListItem> <asp:ListItem Value="4">CARNET DE EXTRANJERIA</asp:ListItem>   <asp:ListItem Value="7">PASAPORTE</asp:ListItem></asp:DropDownList></div><div class="form-group col-md-4 col-sm-4"><label for="NroDocumentoPariente"> Nro. Documento:</label><asp:TextBox ID="TxtNroDocPariente" runat="server" class="form-control input-sm"></asp:TextBox></div><div class="form-group col-md-4 col-sm-4"><label for="TxtFecNacPariente" class="control-label">Fecha de Nacimiento:</label><div class="input-group"> <asp:TextBox ID="TxtFecNacPariente" runat="server" class="form-control input-sm datepicker"></asp:TextBox><span class="input-group-addon" id="Span1"><span class="glyphicon glyphicon-calendar"> </span></span>  </div> </div> <div class="form-group col-md-4 col-sm-4">   <label for="name"> Nombre:</label><asp:TextBox ID="TxtNombrePariente" runat="server" class="form-control input-sm"></asp:TextBox></div><div class="form-group col-md-4 col-sm-4"><label for="ApellidoPaternoPariente"> Apellido Paterno:</label><asp:TextBox ID="TxtApellidoPaternoPariente" runat="server" class="form-control input-sm"></asp:TextBox></div><div class="form-group col-md-4 col-sm-4"><label for="ApellidoMaternoPariente">Apellido Materno:</label> <asp:TextBox ID="TxtApellidoMaternoPariente" runat="server" class="form-control input-sm"></asp:TextBox> </div></div>--%>
     <%--<div class="col-md-12 col-sm-12" id="deceased">    <a href="#" class="remove_field" title="Remove">X</a>	<div class="form-group col-md-4 col-sm-4">     <label for="TipoDocumentoPariente">Tipo de Documento:</label></div><div class="form-group col-md-4 col-sm-4"><label for="NroDocumentoPariente"> Nro. Documento:</label></div><div class="form-group col-md-4 col-sm-4"><label for="TxtFecNacPariente" class="control-label">Fecha de Nacimiento:</label><div class="input-group"><span class="input-group-addon" id="Span1"><span class="glyphicon glyphicon-calendar"> </span></span>  </div> </div> <div class="form-group col-md-4 col-sm-4">   <label for="name"> Nombre:</label></div><div class="form-group col-md-4 col-sm-4"><label for="ApellidoPaternoPariente"> Apellido Paterno:</label></div><div class="form-group col-md-4 col-sm-4"><label for="ApellidoMaternoPariente">Apellido Materno:</label></div></div>--%>
                            <asp:HiddenField ID="__pagina" runat="server" />
                            </form>
</body>
</html>
