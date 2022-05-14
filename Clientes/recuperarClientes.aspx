<%@ Page Language="C#" AutoEventWireup="true" CodeFile="recuperarClientes.aspx.cs"
    Inherits="Clientes_recuperarClientes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recuperar Cuenta</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../bootstrap/js/jquery-1.12.4.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script type='text/javascript'>
        function MostrarMensaje() {
            var mensaje = document.getElementById("__mensaje").value;
            if (mensaje != "") {
                alert(mensaje);
                if (document.getElementById("__pagina").value != "")
                    location.href = document.getElementById("__pagina").value;

            }
        }

        function Confirmar(men) {
            if (!confirm(men))
                return false;
        }
    </script>
</head>
<body onload="MostrarMensaje()">
    <form id="form1" runat="server">
        <div style="margin-top: 10px" class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <strong>Recuperar Cuenta</strong>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <div class="form-group">
                            <label class="control-label col-md-4 ">
                                Seleccione
                            </label>
                            <div class="controls col-md-8 " style="margin-bottom: 10px">
                                <asp:RadioButtonList ID="rbOpcion" runat="server" AutoPostBack="False" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="Natural &nbsp;&nbsp;" Value="1" Selected="True">
                                    </asp:ListItem>
                                    <asp:ListItem Text="Juridica" Value="2"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-4 ">
                                Nro. de Documento:
                             <asp:RequiredFieldValidator ID="rfvtxtNroDcto" runat="server" ErrorMessage="*" ControlToValidate="txtNroDcto"
                                 ForeColor="Red" BackColor="Yellow" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                            </label>
                            <div class="controls col-md-8 " style="margin-bottom: 10px">
                                <asp:TextBox ID="txtNroDcto" runat="server" CssClass="form-control input-sm" Font-Size="Small"
                                    AutoCompleteType="Disabled" Enabled="True" Autocomplete="off"></asp:TextBox>
                            </div>
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
                                    PostBackUrl="~/Clientes/acceso.aspx" />
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
</body>
</html>
