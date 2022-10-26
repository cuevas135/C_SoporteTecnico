<%@ Page Language="C#" AutoEventWireup="true" CodeFile="accesoTecnico.aspx.cs" Inherits="Tecnico_acceso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="icon" type="image/png" href="Imagenes/icono.png" />
    <title>Acceso</title>
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

    <%--<link rel="stylesheet" href="../Otros_css_js/styleMenu1.css" />--%>

    <!-- Bootstrap -->
    <%--<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />--%>

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
        body {
            /*background-color: #fafafa;
            font-family: 'Roboto';*/
            padding-top: 1rem;
            background-color: #0e66bf;
        }

        .login-img img {
            width: 10%;
            max-height: 20%;
        }
    </style>
</head>
<body onload="MostrarMensaje();">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row text-center mb-4">
                <div class="col-md-12">
                    <h4 style="color: #FFFFFF">Acceso al sistema</h4>

                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="login-img">
                                <img src="../Imagenes/soporte.png" />
                            </div>
                            <div class="login-title">
                                <h4 style="color: #000000">Tecnico</h4>
                            </div>
                            <div class="login-form mt-4">
                                <div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <asp:TextBox ID="txtUsuario" runat="server" placeholder="Ingresar Usuario" autocomplete="off"
                                                CssClass="form-control input" onchange="" onkeypress="" onKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvtxtUsuario" runat="server" ControlToValidate="txtUsuario"
                                        Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <asp:TextBox ID="txtContraseña" runat="server" TextMode="Password" placeholder="Ingresar Contraseña"
                                                autocomplete="off" CssClass="form-control input" onchange="" onKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvtxtContraseña" runat="server" ControlToValidate="txtContraseña"
                                        Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <asp:Button ID="Aceptar" runat="server" Text="Ingresar" type="submit" 
                                            class="btn btn-danger btn-block" OnClick="Aceptar_Click"></asp:Button>
                                        <asp:HiddenField ID="__mensaje" runat="server" />
                                        <asp:HiddenField ID="__pagina" runat="server" />
                                        <%--<button type="button" class="btn btn-danger btn-block">Submit</button>--%>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <%--<script src="../bootstrap/js/jquery-1.12.4.min.js"></script>--%>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <%--<script src="../bootstrap/js/bootstrap.min.js"></script>--%>

        <!-- Core plugin JavaScript-->
        <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="../vendor/js/sb-admin.min.js"></script>

    </form>
</body>
</html>
