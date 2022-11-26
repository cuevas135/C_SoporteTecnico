<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Prueba1.aspx.cs" Inherits="Prueba_Prueba1" %>

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
        <div class="container" style="margin-top: 10px;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Precios de pasajes
                </div>
                <div class="panel-body">
                    <div class="col-md-12 col-sm-12">
                        <div class="form-group col-md-4 col-sm-4">
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </div>
                        <div class="form-group col-md-4 col-sm-4">
                            <asp:Button ID="btnUpload" runat="server" Text="Cargar" OnClick="btnUpload_Click"
                                class="btn btn-default" />
                        </div>
                        <div class="form-group col-md-4 col-sm-4">
                            <asp:LinkButton ID="lbtnDescargarExcel" runat="server" BorderColor="#DC3545" BorderStyle="Dashed"
                                Font-Bold="True" OnClick="lbtnDescargarExcel_Click" ToolTip="Descargar formato de precios"
                                OnClientClick="return confirm('¿Desea descargar formato de precios?');">
                                 &nbsp;Descargar formato&nbsp;</asp:LinkButton>
                        </div>
                    </div>

                    <div class="col-md-12 col-sm-12">
                        <div class="form-group col-md-12 col-sm-12">
                            <div style="overflow-y: scroll; height: 260px">
                                <asp:GridView ID="gvReporte" runat="server" CellPadding="3"
                                    CaptionAlign="Top" Font-Size="8" Width="100%" AutoGenerateColumns="False"
                                    DataKeyNames="Id_Precios_Fecha"
                                    Class=" table table-hover table-bordered table-condensed table-striped">
                                    <Columns>
                                        <%-- <asp:TemplateField>
                                                            <HeaderTemplate>
                                                                <asp:CheckBox ID="checkAll" runat="server" onclick="checkAll(this);" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkSelect" runat="server" onclick="Check_Click(this)" />

                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Left" Width="1%" />
                                                            <ItemStyle HorizontalAlign="Left" Width="1%" />
                                                        </asp:TemplateField>--%>
                                        <asp:BoundField DataField="Id_Precios_Fecha" HeaderText="Id_Precios_Fecha"></asp:BoundField>
                                        <asp:BoundField DataField="ORIGEN" HeaderText="ORIGEN" Visible="true">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DESTINO" HeaderText="DESTINO" Visible="True">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SERVICIO" HeaderText="SERVICIO" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Nivel" HeaderText="Nivel" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Canal" HeaderText="Canal" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Nacionalidad" HeaderText="Nacionalidad" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Precio_Nor" HeaderText="Precio_Nor" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Precio_Min" HeaderText="Precio_Min" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Precio_Max" HeaderText="Precio_Max" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="FECHA" HeaderText="FECHA" DataFormatString="{0:d}" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Hora" HeaderText="Hora" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Fecha2" HeaderText="Fecha2" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:BoundField>

                                    </Columns>
                                    <FooterStyle BackColor="White" ForeColor="#000066" BorderColor="Black" />
                                    <HeaderStyle BackColor="#428bca" Font-Bold="True" ForeColor="White" />
                                    <SelectedRowStyle BackColor="#c4f2e7" Font-Bold="True" />
                                </asp:GridView>
                                <asp:GridView ID="GridView1" runat="server" Font-Size="8pt" Font-Names="Tahoma"
                                    Class="table table-hover table-bordered table-condensed table-striped"
                                    Width="100%">
                                    <FooterStyle BackColor="White" ForeColor="#000066" BorderColor="Black" />
                                    <HeaderStyle BackColor="#428bca" Font-Bold="True" ForeColor="White" />
                                    <RowStyle ForeColor="Black" />
                                    <SelectedRowStyle BackColor="#c4f2e7" Font-Bold="True" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 col-sm-12 text-center">
                        <div class="btn-group">
                            <asp:LinkButton ID="btnRegistrar" runat="server"
                                Style="font-family: Calibri; font-size: medium"
                                Text="Registrar <span class='glyphicon glyphicon-floppy-saved'></span>"
                                OnClick="btnRegistrar_Click" CssClass="btn btn-xs btn-primary" Visible="False"
                                OnClientClick="return confirm('¿Desea registrar precios?');" />
                            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                        </div>
                        <div class="btn-group">
                            <asp:LinkButton ID="btnCancelar" runat="server" CausesValidation="False"
                                Style="font-family: Calibri; font-size: medium"
                                Text="&nbsp;Limpiar&nbsp; <span class='glyphicon glyphicon-trash'></span>"
                                UseSubmitBehavior="False" class="btn btn-xs btn-success" OnClick="btnCancelar_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <asp:HiddenField ID="__mensaje" runat="server" />
            <asp:HiddenField ID="__pagina" runat="server" />
        </div>
    </form>
</body>
</html>
