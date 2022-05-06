<%@ Page Language="C#" AutoEventWireup="true" CodeFile="persona.aspx.cs" Inherits="Clientes_persona" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <%--<link rel="icon" type="image/png" href="Imagenes/icono.png" />--%>
    <title>Cliente</title>
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
    <form id="frmPersona" role="form" runat="server">
    <div class="panel panel-primary" style="border-style: hidden; margin: 20px;">
        <center><label for="TituloCabecera">Seleccione persona</label></center>
        <%-- <center>
           <div class="btn-group">  
               <asp:Button ID="btnPersonaNatural" runat="server" Text="Natural" 
                               Width="50%" class="btn btn-success" CausesValidation="False" 
                               onclick="btnPersonaNatural_Click" UseSubmitBehavior="False"/>               
               <asp:Button ID="btnPersonaJuridica" runat="server" Text="Juridica" 
                               Width="50%" class="btn btn-warning" CausesValidation="False" 
                               onclick="btnPersonaJuridica_Click" UseSubmitBehavior="False"/>
           </div> 
           </center> --%><%--la plata 090 san eduardo--%>
        <center>
           <div class="btn-group btn-group-toggle" data-toggle="buttons"> 
              <center>
              <label> 
                <asp:Button ID="btnPersonaNatural" runat="server" Text="Natural" 
                   Width="85px" class="btn btn-success" CausesValidation="False" 
                   onclick="btnPersonaNatural_Click" UseSubmitBehavior="False"/>               
               </label>
               <label>
                   <asp:Button ID="btnPersonaJuridica" runat="server" Text="Juridica" 
                   Width="85px" class="btn btn-warning" CausesValidation="False" 
                   onclick="btnPersonaJuridica_Click" UseSubmitBehavior="False"/>
               </label>              
               </center>  
           </div> 
           </center>
        <asp:Panel ID="PPN" class="panel panel-primary" runat="server" Style="margin: 20px;"
            Visible="False">
            <div class="panel-heading">
                <center>       
                    <h3 class="panel-title">
                        Ingrese datos persona natural
                    </h3>
                </center>
            </div>
            <div class="panel-body">
                <div class="col-md-12 col-sm-12">
                    <div class="form-group col-md-4 col-sm-4">
                        Nro DNI:
                        <asp:RequiredFieldValidator ID="rfvNroDNI_PN" runat="server" BackColor="Yellow" ControlToValidate="NroDNI_PN"
                            ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revNroDNI_PN" runat="server" ControlToValidate="NroDNI_PN"
                            ErrorMessage="Nro DNI tiene 8 numeros" ForeColor="Red" ValidationExpression="\d{8}"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="NroDNI_PN" runat="server" class="form-control input-sm" onkeypress="return SoloNumeros()"
                            onchange="" MaxLength="8" placeholder="Ingrese Nro. DNI"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Apellido paterno:
                        <asp:RequiredFieldValidator ID="rfvApellidoPaterno_PN" runat="server" BackColor="Yellow"
                            ControlToValidate="ApellidoPaterno_PN" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="ApellidoPaterno_PN" runat="server" class="form-control input-sm"
                            onkeypress="return SoloLetrasMinusculas()" onchange="CambiaLetraMayuscula('ApellidoPaterno_PN')"
                            MaxLength="15" placeholder="Ingrese apellido paterno"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Apellido materno:
                        <asp:RequiredFieldValidator ID="rfvApellidoMaterno_PN" runat="server" BackColor="Yellow"
                            ControlToValidate="ApellidoMaterno_PN" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="ApellidoMaterno_PN" runat="server" class="form-control input-sm"
                            onkeypress="return SoloLetrasMinusculas()" onchange="CambiaLetraMayuscula('ApellidoMaterno_PN')"
                            MaxLength="15" placeholder="Ingrese apellido materno"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Nombres:
                        <asp:RequiredFieldValidator ID="rfvNombre_PN" runat="server" BackColor="Yellow" ControlToValidate="Nombre_PN"
                            ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="Nombre_PN" runat="server" class="form-control input-sm" onkeypress="return SoloLetrasMinusculas()"
                            onchange="CambiaLetraMayuscula('Nombre_PN')" MaxLength="15" placeholder="Ingrese nombre"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Direccion:
                        <asp:RequiredFieldValidator ID="rfvDireccion_PN" runat="server" BackColor="Yellow"
                            ControlToValidate="Direccion_PN" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="Direccion_PN" runat="server" class="form-control input-sm" onchange="CambiaLetraMayuscula('Direccion_PN')"
                            placeholder="Ingrese direccion"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Nro. telefono:
                        <asp:RegularExpressionValidator ID="revTelefonoFijo_PN" runat="server" ControlToValidate="TelefonoFijo_PN"
                            ErrorMessage="Nro telefono 6 numeros" ForeColor="Red" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="TelefonoFijo_PN" runat="server" class="form-control input-sm" onkeypress="return SoloNumeros()"
                            onchange="" MaxLength="6" placeholder="Ingrese Nro. telefono"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Nro. celular:<asp:RequiredFieldValidator ID="rfvTelefonoMovil_PN" runat="server"
                            BackColor="Yellow" ControlToValidate="TelefonoMovil_PN" ErrorMessage="*" ForeColor="Red"
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        &nbsp;<asp:RegularExpressionValidator ID="revTelefonoMovil_PN" runat="server" ControlToValidate="TelefonoMovil_PN"
                            ErrorMessage="Nro celular 9 numeros" ForeColor="Red" ValidationExpression="\d{9}"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="TelefonoMovil_PN" runat="server" class="form-control input-sm" onkeypress="return SoloNumeros()"
                            onchange="" MaxLength="9" placeholder="Ingrese Nro. celular"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Usuario:
                        <asp:RequiredFieldValidator ID="rfvLogin_PN" runat="server" BackColor="Yellow" ControlToValidate="Login_PN"
                            ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="Login_PN" runat="server" class="form-control input-sm" onkeypress=""
                            onchange="" MaxLength="0" placeholder="Ingrese usuario"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Contraseña:
                        <asp:RequiredFieldValidator ID="rfvPassword_PN" runat="server" BackColor="Yellow"
                            ControlToValidate="Password_PN" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="Password_PN" runat="server" class="form-control input-sm" onkeypress=""
                            onchange="" MaxLength="0" placeholder="Ingrese contraseña"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Email:
                        <asp:RegularExpressionValidator ID="revEmail_PN" runat="server" SetFocusOnError="True"
                            ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ControlToValidate="Email_PN"
                            ErrorMessage="Correo Invalido" ForeColor="Red"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="Email_PN" runat="server" class="form-control input-sm" placeholder="email@example.com"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Faceboock:
                        <asp:TextBox ID="Faceboock_PN" runat="server" class="form-control input-sm" placeholder="Ingrese Faceboock"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Twiter:
                        <asp:TextBox ID="Twiter_PN" runat="server" class="form-control input-sm" placeholder="Ingrese Twiter"></asp:TextBox>
                    </div>
                    <div class="col-md-12 col-sm-12" style="text-align: center">
                        <div class="col-sm-offset-2 col-sm-8" style="text-align: center">
                            <asp:LinkButton ID="lbGaurdar_PN" runat="server" OnClientClick="return Confirmar('¿Desea guardar sus datos?');"
                                Style="font-family: Calibri; font-size: medium" Text="Guardar" CssClass="btn btn-primary"
                                Width="85px" OnClick="lbGaurdar_PN_Click" />
                            <asp:LinkButton ID="lbLimpiar_PN" runat="server" Style="font-family: Calibri; font-size: medium"
                                Text="Limpiar" CssClass="btn btn-success" CausesValidation="False" Width="85px"
                                OnClick="lbLimpiar_PN_Click" />
                            <asp:LinkButton ID="lbSalir_PN" runat="server" CausesValidation="False" Text="Salir"
                                Style="font-family: Calibri; font-size: medium" UseSubmitBehavior="False" class="btn btn-danger"
                                PostBackUrl="~/Clientes/acceso.aspx" Width="85px" />
                        </div>
                    </div>
                    <%--<asp:HiddenField ID="__mensaje" runat="server" />
                            <asp:HiddenField ID="__pagina" runat="server" />--%>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="PPJ" class="panel panel-primary" runat="server" Style="margin: 20px;"
            Visible="False">
            <div class="panel-heading">
                <center>
                <h3 class="panel-title">
                    Ingrese datos persona juridica
                </h3>
            </center>
            </div>
            <div class="panel-body">
                <div class="col-md-12 col-sm-12">
                    <div class="form-group col-md-4 col-sm-4">
                        Nro. RUC:
                        <asp:RequiredFieldValidator ID="rfvNroRUC_PJ" runat="server" BackColor="Yellow" ControlToValidate="NroRUC_PJ"
                            ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revNroRUC_PJ" runat="server" ControlToValidate="NroRUC_PJ"
                            ErrorMessage="Nro RUC tiene 11 numeros" ForeColor="Red" ValidationExpression="\d{11}"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="NroRUC_PJ" runat="server" class="form-control input-sm" onkeypress="return SoloNumeros()"
                            onchange="" MaxLength="11" placeholder="Ingrese Nro. RUC"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Razon Social:
                        <asp:RequiredFieldValidator ID="rfvRazonSocial_PJ" runat="server" BackColor="Yellow"
                            ControlToValidate="RazonSocial_PJ" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="RazonSocial_PJ" runat="server" class="form-control input-sm" onkeypress="return SoloLetrasMinusculas()"
                            onchange="CambiaLetraMayuscula('RazonSocial_PJ')" MaxLength="0" placeholder="Ingrese razon social"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Direccion:
                        <asp:RequiredFieldValidator ID="rfvDireccion_PJ" runat="server" BackColor="Yellow"
                            ControlToValidate="Direccion_PJ" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="Direccion_PJ" runat="server" class="form-control input-sm" onchange="CambiaLetraMayuscula('Direccion_PJ')"
                            MaxLength="0" placeholder="Ingrese direccion"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Nro. telefono:
                        <asp:RequiredFieldValidator ID="rfvTelefonoFijo_PJ" runat="server" BackColor="Yellow"
                            ControlToValidate="TelefonoFijo_PJ" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revTelefonoFijo_PJ" runat="server" ControlToValidate="TelefonoFijo_PJ"
                            ErrorMessage="Nro telefono 6 numeros" ForeColor="Red" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="TelefonoFijo_PJ" runat="server" class="form-control input-sm" onkeypress="return SoloNumeros()"
                            onchange="" MaxLength="6" placeholder="Ingrese Nro. telefono"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Nro. celular:
                        <asp:RequiredFieldValidator ID="rfvTelefonoMovil_PJ" runat="server" BackColor="Yellow"
                            ControlToValidate="TelefonoMovil_PJ" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revTelefonoMovil_PJ" runat="server" ControlToValidate="TelefonoMovil_PJ"
                            ErrorMessage="Nro celular 9 numeros" ForeColor="Red" ValidationExpression="\d{9}"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="TelefonoMovil_PJ" runat="server" class="form-control input-sm" onkeypress="return SoloNumeros()"
                            onchange="" MaxLength="9" placeholder="Ingrese Nro. celular"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Usuario:
                        <asp:RequiredFieldValidator ID="rfvLogin_PJ" runat="server" BackColor="Yellow" ControlToValidate="Login_pj"
                            ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="Login_PJ" runat="server" class="form-control input-sm" onkeypress=""
                            onchange="" MaxLength="0" placeholder="Ingrese usuario"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Contraseña:
                        <asp:RequiredFieldValidator ID="rfvPassword_PJ" runat="server" BackColor="Yellow"
                            ControlToValidate="Password_PJ" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="Password_PJ" runat="server" class="form-control input-sm" onkeypress=""
                            onchange="" MaxLength="0" placeholder="Ingrese contraseña"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Email:
                        <asp:RequiredFieldValidator ID="rfvEmail_PJ" runat="server" BackColor="Yellow" ControlToValidate="Email_PJ"
                            ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail_PJ" runat="server" SetFocusOnError="True"
                            ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ControlToValidate="Email_PJ"
                            ErrorMessage="Correo Invalido" ForeColor="Red"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="Email_PJ" runat="server" class="form-control input-sm" placeholder="email@example.com"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Faceboock:
                        <asp:TextBox ID="Faceboock_PJ" runat="server" class="form-control input-sm" placeholder="Ingrese Faceboock"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        Twiter:
                        <asp:TextBox ID="Twiter_PJ" runat="server" class="form-control input-sm" placeholder="Ingrese Twiter"></asp:TextBox>
                    </div>
                    <div class="col-md-12 col-sm-12" style="text-align: center">
                        <div class="col-sm-offset-2 col-sm-8" style="text-align: center; top: 0px; left: 0px;
                            height: 25px;">
                            <asp:LinkButton ID="lbGuardar_PJ" runat="server" OnClientClick="return Confirmar('¿Desea guardar sus datos?');"
                                Style="font-family: Calibri; font-size: medium" Text="Guardar" CssClass="btn btn-primary"
                                Width="85px" OnClick="lbGuardar_PJ_Click" />
                            <asp:LinkButton ID="lbLimpiar_PJ" runat="server" Style="font-family: Calibri; font-size: medium"
                                Text="Limpiar" CssClass="btn btn-success" CausesValidation="False" Width="85px"
                                OnClick="lbLimpiar_PJ_Click" />
                            <asp:LinkButton ID="lbSalir_PJ" runat="server" CausesValidation="False" Text="Salir"
                                Style="font-family: Calibri; font-size: medium" UseSubmitBehavior="False" class="btn btn-danger"
                                Width="85px" />
                        </div>
                    </div>
                   
                </div>
            </div>
        </asp:Panel>
        <asp:HiddenField ID="__mensaje" runat="server" />
        <asp:HiddenField ID="__pagina" runat="server" />
    </div>
    </form>
</body>
</html>
