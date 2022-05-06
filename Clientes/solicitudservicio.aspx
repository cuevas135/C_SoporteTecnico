<%@ Page Language="C#" AutoEventWireup="true" CodeFile="solicitudservicio.aspx.cs"
    Inherits="Clientes_solicitudservicio" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Solicitud servicio</title>
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
    <!-- Bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../bootstrap/js/jquery-1.12.4.min.js" type="text/javascript"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Otros_css_js/Menu.css" rel="stylesheet" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <style type="text/css">
        body
        {
            background-color: #fafafa;
            font-family: 'Roboto';
        }
        .container
        {
            margin: 10px auto;
            max-width: 1250px;
        }
        .container table.restables-clone
        {
            display: none;
        }
        .container table.restables-clone td
        {
            width: 50%;
            color: Black;
            text-align: left;
        }
        .container table.restables-clone td:first-child
        {
            font-weight: bold;
            color: #1E90FF;
            text-align: right;
        }
        .container table.restables-clone tr:first-child td
        {
            background: #333;
            color: #fff;
        }
        @media (max-width: 991px)
        {
            .container table.restables-origin
            {
                display: none;
            }
            .container table.restables-clone
            {
                display: table;
            }
        }
    </style>
    <script type="text/javascript">

        function eliminar_solicitud() {
            var Ok, Rpta;
            Ok = true;


            Rpta = confirm("¿Desea eliminar solicitud?");

            document.getElementById("_respuesta").value = Rpta;

            //             if (Rpta == 1)//Aceptar
            //             {
            //                 document.getElementById("_respuesta").value = true;
            //             }
            //             else {
            //                 document.getElementById("_respuesta").value = false;
            //             }

        }

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
    </script>
</head>
<body onload="MostrarMensaje()">
    <form id="frmSolicitudServidio" runat="server" class="form-horizontal" role="form">
    <br />
    <center>
           <div class="btn-group btn-group-toggle" data-toggle="buttons"> 
              <center>
              <asp:Label ID="lblUsuario" runat="server" ForeColor="Red"></asp:Label><br /><br />
              <label> 
                  <asp:Button ID="btnGenerarSolicitud" runat="server" Text="Generar Solicitud" 
                   Width="140px" class="btn btn-success" CausesValidation="False" 
                    UseSubmitBehavior="False" onclick="btnGenerarSolicitud_Click" 
                      PostBackUrl="~/Clientes/solicitudservicio.aspx" />        
              </label>
              <label>
                  <asp:Button ID="btnCancelarSolicitud" runat="server" Text="Ver Solicitudes" 
                   Width="140px" class="btn btn-warning" CausesValidation="False" 
                   UseSubmitBehavior="False" onclick="btnCancelarSolicitud_Click" />
               </label>
               <label>
                   <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesion" 
                      Width="140px" class="btn btn-danger"
                      PostBackUrl="~/Clientes/CerrarSession.aspx" UseSubmitBehavior="False" />
               </label>         
               </center>  
           </div> 
           </center>
    <%-- <div class="panel panel-primary" style="border-style: hidden; margin: 20px;">   --%>
    <asp:Panel ID="PANEL_GENERAR_SOLCITUD" class="panel panel-primary" runat="server"
        Style="margin: 20px;" Visible="False">
        <div class="panel-heading" style="text-align: center">
            <h3 class="panel-title">
                Seleccione servicio y modalidad</h3>
        </div>
        <div class="panel-body">
            <div class="container">
                <%--<div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10" style="text-align: center">
                             <h5><b>Seleccione servicio y modalidad</b></h5>
                        </div>                    
                     </div>--%>
                <div class="form-group">
                    <label for="FechaEmision" class="col-sm-2 control-label">
                        Fecha emision</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="Fecha_S" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Codigo_P" class="col-sm-2 control-label">
                        Codigo cliente</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="CodigoPersona_S" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Nombre_P" class="col-sm-2 control-label">
                        Nombre</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="Nombre_P" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Servicios_S" class="col-sm-2 control-label">
                        Servicio</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="Servicios" runat="server" class="form-control" AutoPostBack="True"
                            OnSelectedIndexChanged="Servicios_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Modalidad_S" class="col-sm-2 control-label">
                        Modalidad</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="Modalidades" runat="server" class="form-control">
                            <asp:ListItem Value="-1">-----Seleccione modalidad-----</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10" style="text-align: center">
                        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" Width="140px" class="btn btn-success"
                            CausesValidation="False" OnClick="btnAgregar_Click" />
                        <%--<asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesion" 
                           Width="115px" class="btn btn-danger" CausesValidation="False" 
                              PostBackUrl="~/Clientes/CerrarSession.aspx"/>--%>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10" style="text-align: center">
                        <h5>
                            <b>Servicios solicitados</b></h5>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="table-responsive">
                            <asp:Table ID="Table_" runat="server" class="table table-bordered table-hover text-center"
                                BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="Smaller" GridLines="Both"
                                Style="text-align: left">
                                <asp:TableHeaderRow ID="TableRow1" runat="server" TableSection="TableHeader">
                                    <asp:TableHeaderCell ID="CODIGOSERVICIO_" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" Visible="False">CODIGOSERVICIO </asp:TableHeaderCell>
                                    <asp:TableHeaderCell ID="SERVICIO_" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" Width="40%">SERVICIO</asp:TableHeaderCell>
                                    <asp:TableHeaderCell ID="CODIGOMODALIDAD_" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" Visible="False">CODIGOMODALIDAD</asp:TableHeaderCell>
                                    <asp:TableHeaderCell ID="MODALIDAD_" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" Width="40%">MODALIDAD</asp:TableHeaderCell>
                                    <asp:TableHeaderCell ID="QUITAR" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="#FFFF66">&nbsp;</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                            </asp:Table>
                            <%--<asp:Table ID="Table_" runat="server"
                                   class="table table-bordered table-hover text-center"
                                    BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="X-Small"
                                    GridLines="Both" Style="text-align: left">
                            
                                        <asp:TableHeaderRow  ID="TableRow1" runat="server">
                                            <asp:TableHeaderCell  ID="CODIGOSERVICIO_" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="White">CODIGOSERVICIO </asp:TableHeaderCell>
                                            <asp:TableHeaderCell  ID="SERVICIO_" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="White">SERVICIO</asp:TableHeaderCell>
                                            <asp:TableHeaderCell  ID="CODIGOMODALIDAD_" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="White">CODIGOMODALIDAD</asp:TableHeaderCell>
                                            <asp:TableHeaderCell  ID="MODALIDAD_" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="White">MODALIDAD</asp:TableHeaderCell>
                                            <asp:TableHeaderCell  ID="ELIMINAR" runat="server" BackColor="Black" BorderColor="Black"
                                                ForeColor="Blue">ELIMINAR</asp:TableHeaderCell>                                       
                                         </asp:TableHeaderRow>                               
                                </asp:Table>--%><%--<asp:GridView ID="gvDetalleSokicitud" runat="server" BackColor="White" 
                                    BorderColor="#DEDFDE" BorderWidth="1px" CellPadding="5" 
                                    ForeColor="Black" Font-Size="Smaller" Width="100%" AutoGenerateColumns="False"
                                    ShowFooter="True">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="CODIGOSERVICIO" HeaderText="CODIGOSERVICIO">
                                        <HeaderStyle BackColor="Black" HorizontalAlign="Left" Width="5%" />
                                        <ItemStyle HorizontalAlign="Left" Width="5%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SERVICIO" HeaderText="SERVICIO">
                                        <HeaderStyle BackColor="Black" HorizontalAlign="Left" Width="40%"/>
                                        <ItemStyle HorizontalAlign="Left" Width="40%"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CODIGOMODALIDAD" HeaderText="CODIGOMODALIDAD">
                                        <HeaderStyle BackColor="Black" HorizontalAlign="Left" Width="5%"/>
                                        <ItemStyle HorizontalAlign="Left" Width="5%"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="MODALIDAD" HeaderText="MODALIDAD">
                                        <HeaderStyle BackColor="Black" HorizontalAlign="Left" Width="40%" />
                                        <ItemStyle HorizontalAlign="Left" Width="40%" />
                                        </asp:BoundField>
                                        <asp:CommandField SelectText="EDITAR" ShowSelectButton="True">
                                        <HeaderStyle BackColor="Black" HorizontalAlign="Center" Width="5%"/>
                                        <ItemStyle HorizontalAlign="Center" Width="5%"/>
                                        </asp:CommandField>
                                        <asp:CommandField DeleteText="QUITAR" ShowDeleteButton="True">
                                        <HeaderStyle BackColor="Black" Width="5%"/>
                                        <ItemStyle HorizontalAlign="Center" Width="5%"/>
                                        </asp:CommandField>
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" />
                                    <HeaderStyle BackColor="#6B696B" Font-Bold="False" ForeColor="White" />
                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#F7F7DE" />
                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />          
                                </asp:GridView>--%>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10" style="text-align: center">
                        <asp:Button ID="btnEnviarSolicitudServicio" runat="server" Text="Enviar" Width="140px"
                            class="btn btn-primary" CausesValidation="False" OnClick="btnEnviarSolicitudServicio_Click"
                            OnClientClick="return Confirmar('¿Desea enviar su solicitud de servicio.?');" />
                        <asp:HiddenField ID="__pagina" runat="server" />
                        <asp:HiddenField ID="__mensaje" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PANEL_CANCELAR_SOLCITUD" class="panel panel-success" runat="server"
        Style="margin: 20px;" Visible="False">
        <div class="panel-heading" style="text-align: center">
            <h3 class="panel-title">
                Solicitudes pendientes servicios solicitados</h3>
        </div>
        <div class="panel-body">
            <div class="container">
                <%--<div class="form-group">
                            <div class="col-sm-offset-1 col-sm-10" style="text-align: center">
                                 <h5><b>Solicitudes pendientes servicios solicitados</b></h5>
                            </div>                    
                        </div> --%>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-10">
                        <div class="table-responsive">
                            <asp:Table ID="TableSPSS" runat="server" class="table table-bordered table-hover text-center"
                                BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="Smaller" GridLines="Both"
                                Style="text-align: left">
                                <asp:TableHeaderRow ID="TableHeaderRow1" runat="server" TableSection="TableHeader">
                                    <asp:TableHeaderCell ID="TableHeaderCell1" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" Width="2%" Visible="true">SELECCIONA</asp:TableHeaderCell>
                                    <asp:TableHeaderCell ID="CODIGOSOLICITUD" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" Width="2%" Visible="true">NRO. SOLICTUD </asp:TableHeaderCell>
                                    <asp:TableHeaderCell ID="FECHA" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" Width="2%">FECHA</asp:TableHeaderCell>
                                    <asp:TableHeaderCell ID="ESTADO" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" Width="2%">ESTADO</asp:TableHeaderCell>
                                    <%-- <asp:TableHeaderCell  ID="VER" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="#FFFF66" Width="2%">VER</asp:TableHeaderCell> 
                                                
                                                <asp:TableHeaderCell  ID="CANCELAR" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="#FFFF66" Width="2%">CANCELAR</asp:TableHeaderCell> 
                                                    
                                               <asp:TableHeaderCell  ID="ELIMINAR" runat="server" BackColor="Black" BorderColor="Black"
                                                    ForeColor="#FFFF66" Width="2%">ELIMINAR</asp:TableHeaderCell>    --%>
                                </asp:TableHeaderRow>
                            </asp:Table>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-10" style="text-align: center; top: 0px; left: 0px;">
                        <asp:Button ID="btnCancelarSolicitudes" runat="server" Text="Cancelar Solicitud"
                            Width="140px" class="btn btn-primary" CausesValidation="False" OnClientClick="return Confirmar('¿Desea cancelar solicitud(es)?');"
                            OnClick="btnCancelarSolicitudes_Click" />
                        <asp:Button ID="btnEliminarSolicitud" runat="server" Text="Eliminar Solicitud" Width="140px"
                            class="btn btn-danger" CausesValidation="False" OnClick="btnEliminarSolicitud_Click"
                            OnClientClick="return Confirmar('¿Desea eliminar  solicitud(es)?');" />
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-heading" style="text-align: center">
            <h3 class="panel-title">
                Detalle solicitud de servicio</h3>
        </div>
        <div class="panel-body">
            <div class="container">
                <%--<div class="form-group">
                            <div class="col-sm-offset-1 col-sm-10" style="text-align: center">
                                 <h5><b>Solicitudes pendientes servicios solicitados</b></h5>
                            </div>                    
                        </div> --%>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-10">
                        <div class="table-responsive">
                            <asp:Table ID="TableDSPSS" runat="server" class="table table-bordered table-hover text-center"
                                BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="Smaller" GridLines="Both"
                                Style="text-align: left">
                                <asp:TableHeaderRow ID="TableHeaderRow2" runat="server" TableSection="TableHeader">
                                    <asp:TableHeaderCell ID="TableHeaderCell2" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" Width="2%" Visible="true">SELECCIONA</asp:TableHeaderCell>
                                    <asp:TableHeaderCell ID="CODIGO_DETALLE_SOLICITUD" runat="server" BackColor="Black"
                                        BorderColor="Black" ForeColor="White" Width="20%" Visible="false">CODIGO_DETALLE_SOLICITUD </asp:TableHeaderCell>
                                    <asp:TableHeaderCell ID="CODIGO_SOLICITUD" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" Width="20%" Visible="false">NRO. SOLICITUD</asp:TableHeaderCell>
                                    <asp:TableHeaderCell ID="SERVIVIO" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" Width="20%">SERVIVIO</asp:TableHeaderCell>
                                    <asp:TableHeaderCell ID="MODALIDAD" runat="server" BackColor="Black" BorderColor="Black"
                                        ForeColor="White" Width="20%">MODALIDAD</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                            </asp:Table>
                            <asp:HiddenField ID="_respuesta" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-10" style="text-align: center; top: 0px; left: 0px;">
                        <asp:Button ID="btnEliminarDetalleSolicitud" runat="server" Text="Eliminar Detalle"
                            Width="140px" class="btn btn-danger" CausesValidation="False" OnClientClick="return Confirmar('¿Desea eliminar  detalle(s)?');"
                            OnClick="btnEliminarDetalleSolicitud_Click" />
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <%--<div class="form-group">
                            <div class="col-sm-offset-1 col-sm-10" style="text-align: center">
                                 <h5><b>Solicitudes pendientes servicios solicitados</b></h5>
                            </div>                    
                        </div> --%>
    </form>
    <script type="text/javascript" src="../Otros_css_js/jquery-3.1.1.slim.min.js"></script>
    <script type="text/javascript" src="../Otros_css_js/restables.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $('table').resTables();
        });
    </script>
</body>
</html>
