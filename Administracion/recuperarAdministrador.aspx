<%@ Page Language="C#" AutoEventWireup="true" CodeFile="recuperarAdministrador.aspx.cs"
    Inherits="Administracion_recuperarAdministrador" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="icon" type="image/png" href="../Imagenes/icono.ico" />
    <title>Recuperar cuenata</title>
    <meta name="MobileOptimized" content="width" />
    <meta name="HandheldFriendly" content="true" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />

    <%--<link href="css/sb-admin.css" rel="stylesheet"/>--%>
    <link href="../vendor/css/sb-admin.css" rel="stylesheet" />

    <script type='text/javascript'>
        function MostrarMensaje() {
            var mensaje = document.getElementById("__mensaje").value;
            if (mensaje != "") {
                alert(mensaje);
                if (document.getElementById("__pagina").value != "")
                    location.href = document.getElementById("__pagina").value;

            }
        }

        //        function window_load() {
        //            MostrarMensaje()
        //        }

        function Confirmar(men) {
            if (!confirm(men))
                return false;

        }
    </script>

    <style>
        body {
            /*background-color: #fafafa;
            font-family: 'Roboto';*/
             padding-top: 1rem;
             background-color: #66ccff;
        }
    </style>

</head>
<body onload="MostrarMensaje()">
    <form id="form1" runat="server">
        <div class="container">
            <div class="card card-login mx-auto mt-3">
                <div class="card-header">Recuperar cuenta</div>
                <div class="card-body">
                    <div class="text-center mb-4">
                        <%--<h4></h4>--%>
                        <p>Ingrese numero de documento</p>
                    </div>
                    <div>
                        <div class="form-group">
                            <div class="form-label-group">
                                Nro. de Documento:
                                <asp:RequiredFieldValidator ID="rfvtxtNroDcto" runat="server" ErrorMessage="*" ControlToValidate="txtNroDcto"
                                    ForeColor="Red" BackColor="Yellow" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                             <asp:TextBox ID="txtNroDcto" runat="server" CssClass="form-control input-sm" Font-Size="Small"
                                    AutoCompleteType="Disabled" Enabled="True" Autocomplete="off"></asp:TextBox>                            
                            </div>
                        </div>
                         <div class="form-group">
                        <div class="col-md-12 col-sm-12 text-center">
                            <div class="btn-group">
                                <asp:LinkButton ID="btnRecuperar" runat="server" Text="Recuperar Cuenta" class="btn btn-primary"
                                    OnClick="btnRecuperar_Click" OnClientClick="return Confirmar('¿Desea recuperar cuenta?');" />
                            </div>
                            <div class="btn-group">
                                <asp:LinkButton ID="lbCancelar" runat="server" CausesValidation="False" Text="Cancelar"
                                    Style="font-family: Calibri; font-size: medium" UseSubmitBehavior="False" class="btn btn-danger"
                                    PostBackUrl="~/Administracion/acceso.aspx" />
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>

        <div>
            <asp:HiddenField ID="hfId" runat="server" />
            <asp:HiddenField ID="hfCorreo" runat="server" />
            <asp:HiddenField ID="hfUsuario" runat="server" />
            <asp:HiddenField ID="hfContraseña" runat="server" />
            <asp:HiddenField ID="__pagina" runat="server" />
            <asp:HiddenField ID="__mensaje" runat="server" />
        </div>
    </form>
      <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
</body>
</html>
