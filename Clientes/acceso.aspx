<%@ Page Language="C#" AutoEventWireup="true" CodeFile="acceso.aspx.cs" Inherits="Clientes_acceso2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Acceso al sistema</title>

    <%--<link rel="stylesheet" href="../Otros_css_js/styleMenu1.css" />--%>

    <!-- Bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />



    <!-- MOSTRAR MENSAJE DE CARGA -->
    <link href="../Otros_css_js/CargandoDatosGif.css" rel="stylesheet" />

    <style>
        body {
            background-color: #66ccff;
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }

            .form-signin .form-signin-heading, .form-signin .checkbox {
                margin-bottom: 10px;
            }

            .form-signin .checkbox {
                font-weight: normal;
            }

            .form-signin .form-control {
                position: relative;
                font-size: 16px;
                height: auto;
                padding: 10px;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }

                .form-signin .form-control:focus {
                    z-index: 2;
                }

            .form-signin input[type="text"] {
                margin-bottom: -1px;
                border-bottom-left-radius: 0;
                border-bottom-right-radius: 0;
            }

            .form-signin input[type="password"] {
                margin-bottom: 10px;
                border-top-left-radius: 0;
                border-top-right-radius: 0;
            }

        .account-wall {
            margin-top: 20px;
            padding: 40px 0px 20px 0px;
            background-color: #f7f7f7;
            -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        }

        .login-title {
            color: #555;
            font-size: 18px;
            font-weight: 400;
            display: block;
        }

        .profile-img {
            width: 96px;
            height: 96px;
            margin: 0 auto 10px;
            display: block;
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
            border-radius: 50%;
        }

        .need-help {
            margin-top: 10px;
        }

        .new-account {
            display: block;
            margin-top: 10px;
        }
    </style>

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
</head>
<body onload="MostrarMensaje();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <h1 class="text-center login-title">Ingrese usuario y contraseña</h1>
                    <div class="account-wall">
                        <img class="profile-img" src="../Imagenes/user.png" />
                        <div class="form-signin">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <!-- MOSTRAR MENSAJE CUANDO HAY UPDATEPANEL -->
                                    <script type="text/javascript">
                                        Sys.Application.add_load(MostrarMensaje);
                                    </script>
                                    <!-- FIN DE MOSTRAR MENSAJE CUANDO HAY UPDATEPANEL -->
                                    <asp:TextBox ID="login" runat="server" placeholder="Ingresar Usuario" autocomplete="off"
                                        CssClass="form-control input" onchange="" onkeypress="" onKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvlogin" runat="server" ControlToValidate="login"
                                        Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="password" runat="server" TextMode="Password" placeholder="Ingresar Contraseña"
                                        autocomplete="off" CssClass="form-control input" onchange="" onKeyDown="if(event.keyCode==13) event.keyCode=9;"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvpassword" runat="server" ControlToValidate="password"
                                        Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    <div>
                                        <asp:HiddenField ID="__mensaje" runat="server" />
                                        <asp:HiddenField ID="__pagina" runat="server" />
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="Aceptar" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:Button ID="Aceptar" runat="server" Text="Ingresar" type="submit" class="btn btn-primary btn-block"
                                OnClick="Aceptar_Click"></asp:Button>

                            <a href="persona.aspx" class="pull-right need-help">Crear cuenta </a><span class="clearfix"></span>
                        </div>

                    </div>
                    <a href="recuperarClientes.aspx" class="text-center new-account">Recuperar cuenta </a>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

        <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="0" AssociatedUpdatePanelID="">
            <ProgressTemplate>
                <div class="CargandoDatosGif7"></div>
            </ProgressTemplate>
        </asp:UpdateProgress>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="../bootstrap/js/jquery-1.12.4.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="../bootstrap/js/bootstrap.min.js"></script>
    </form>

</body>
</html>
