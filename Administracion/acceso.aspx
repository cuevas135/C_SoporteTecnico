<%@ Page Language="C#" AutoEventWireup="true" CodeFile="acceso.aspx.cs" Inherits="acceso" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Acceso al Sistema</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="MobileOptimized" content="width" />
    <meta name="HandheldFriendly" content="true" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="../Otros_css_js/styleMenu1.css" />
    <!-- Bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../bootstrap/js/jquery-1.12.4.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
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

        function CambiaLetraMayuscula(Caja) {
            document.getElementById(Caja).value = document.getElementById(Caja).value.toUpperCase();
        }

    </script>
    <style>
        body
        {
            margin: 0;
            padding: 0;
            background-color: #66ccff;
            font-family: sans-serif;
        }
    </style>
</head>
<body onload="MostrarMensaje()">
    <div class="loginBox">
        <img alt="" src="../Imagenes/user.png" class="user" />
        <center><label for="Titulo">Ingrese usuario y contraseña</label></center>
        <h2>
        </h2>
        <form id="frmAcceso" role="form" runat="server">
        <div class="form-group">
            <label for="NombreUusraio">
                Usuario</label>
            <asp:TextBox ID="login" runat="server" placeholder="Ingresar Usuario" autocomplete="off"
                CssClass="form-control input" onchange="" onkeypress="" onKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvlogin" runat="server" ControlToValidate="login"
                Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label for="ContraseñaUusraio">
                Contraseña</label>
            <asp:TextBox ID="password" runat="server" TextMode="Password" placeholder="Ingresar Contraseña"
                autocomplete="off" CssClass="form-control input" onchange="" onKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvpassword" runat="server" ControlToValidate="password"
                Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Button ID="Aceptar" runat="server" Text="Ingresar" type="submit" class="btn btn-primary btn-block"
                OnClick="Aceptar_Click"></asp:Button>
            <asp:HiddenField ID="__mensaje" runat="server" />
            <asp:HiddenField ID="__pagina" runat="server" />
        </div>
        <div class="form-group">
            <asp:HyperLink ID="hlRecuperarCuenta" runat="server" NavigateUrl="~/Administracion/recuperarAdministrador.aspx"
                class="btn btn-link" ForeColor="#3333CC">Recuperar Cuenta</asp:HyperLink>
        </div>
        </form>
    </div>
    <%-- <script type="text/javascript" src="../bootstrap/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>--%>
</body>
</html>
