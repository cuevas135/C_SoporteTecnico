<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listarcolaboradores.aspx.cs" Inherits="Cliente_listarcolaboradores" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>

     <link rel="icon" type="image/ico" href="imagenes/Sistema__.ico" />
    <title>Colaboradores</title>

    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    
      <style>
body { background-color:#fafafa; font-family:'Roboto';}
.container {
  margin: 50px auto;
  max-width: 1250px;
}
.container table.restables-clone { display: none; }
.container table.restables-clone td { width: 50%; }
.container table.restables-clone td:first-child { font-weight: bold; }
.container table.restables-clone tr:first-child td { background: #333; color:#fff; }
@media (max-width: 991px) {
.container table.restables-origin { display: none; }
.container table.restables-clone { display: table; }
}
</style>


    <!-- Bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../Otros_css_js/Menu.css" rel="stylesheet"/>

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
   
      
        <style>
 .dropdown-submenu {
  position: relative;
}
.dropdown-submenu > .dropdown-menu {
  top: 0;
  left: 100%;
  margin-top: -6px;
  margin-left: -2px;
}
.dropdown-submenu:hover > .dropdown-menu {
  display: block;
}
.dropdown-submenu > a:after {
  content: "";
  margin-top: 6px;
  margin-right: -10px;
  float: right;
  border-left: 4px solid;
  border-top: 4px solid transparent;
  border-bottom: 4px solid transparent;
}
</style>

</head>


   <%-- INICIOOOOOOOO ............... MENUUUUUUUUUUUUU --%>
     <body onload ="MostrarMensaje()">
      <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <!-- El logotipo y el icono que despliega el menú se agrupan
       para mostrarlos mejor en los dispositivos móviles -->
          <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse"
                  data-target=".navbar-ex1-collapse">
                  <span class="sr-only">Desplegar navegación</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
              </button>
               <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-home"></span>  Inicio</a>
              <%--<a class="navbar-brand" href="menu.aspx"><span><img src="imagenes/001-home.png" /></span>  Inicio</a>--%>
          </div>


        <!-- -->
        <!-- Agrupar los enlaces de navegación, los formularios y cualquier
       otro elemento que se pueda ocultar al minimizar la barra -->
          <div class="collapse navbar-collapse navbar-ex1-collapse">
              
              <ul class="nav navbar-nav">
                 
                  <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-wrench"></span>  Configuraciones <b class="caret"></b>
                      </a>
                      <ul class="dropdown-menu">
                         <%-- <li><a href="usuarios.aspx">Usuarios</a></li>
                          <li><a href="permisos.aspx">Control de Accesos</a></li>
                            <li class="divider"></li> --%>
                           <li><a href="../CerrarSession.aspx">Cerrar sesi&oacute;n</a></li>                    
                      </ul>
                  </li>
              </ul>
                     </div>
    </nav>
          <%--  ......NO CAMBIAR.........  --%>
       

        
<%--         <div class="section">
        <div class="container">
            <div class="row main-low-margin">
                <div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1">
                    <h1>-</h1>
                     </div>
            </div>
         </div>
    </div>--%>
             <%-- FINNNNNNNN ............... MENUUUUUUUUUUUUU --%>


    <form id="frmclientes" runat="server">
         <div class="container">
     <%--<div class="table-responsive" >--%>

              <h5 style="text-align:center; color:blue">
                  <b>LISTA DE COLABORADORES</b></h5> 

           <table class="table table-bordered text-center">

                 <tr>
                <td   
                    style="text-align: left; color: blue; background-color: white;">
                    <b>Ingrese nombre o apellidos colaborador a buscar:</b></td>
                <td>
                    <asp:TextBox ID="Nombre" runat="server"
                        CssClass="form-control input-sm" Font-Size="Small"
                        Autocomplete="off"
                        onkeypress="BloquearTeclaEnter()"
                        onchange="" 
                       ></asp:TextBox>

                </td>

                 <td >    
                                                   
                     <asp:LinkButton ID="BuscarCliente" runat="server"
                         class="btn btn-info"
                         Text="Buscar  <span class='glyphicon glyphicon-search'></span>"
                          CausesValidation="False" UseSubmitBehavior="False" 
                         onclick="BuscarCliente_Click"  />
                                   
                                </td>

                     <td style="text-align: left" >
                         <asp:LinkButton ID="Limpiar" runat="server"
                             Text="Limpiar <span class='glyphicon glyphicon-trash'></span>"
                             CausesValidation="False" UseSubmitBehavior="False"
                             class="btn btn-success" PostBackUrl="~/Cliente/listarcolaboradores.aspx" 
                             onclick="Limpiar_Click" />
                                                          </td>  

                      <td>
                         <asp:LinkButton ID="hlnuevo" runat="server" 
                         style="font-family: Calibri;  font-size: medium" 
                    Text="Nuevo <span class='glyphicon glyphicon-file'></span>" 
                       PostBackUrl="~/Cliente/registrarcolaborador.aspx"  CssClass="btn btn-primary"  />
                      
                    </td>
            </tr>


             <thead>
                <tr>
                  
                           <asp:Table ID="Table_" runat="server"
                           class="table table-bordered table-hover text-center"
                            BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="Small"
                            GridLines="Both" Style="text-align: left">
                            
                                <asp:TableHeaderRow  ID="TableRow1" runat="server">
                                <asp:TableHeaderCell  ID="EDITAR" runat="server" BackColor="Black" BorderColor="Black"
                                    ForeColor="Blue">EDITAR </asp:TableHeaderCell>
                                <asp:TableHeaderCell  ID="TIPO_COLABORADOR" runat="server" BackColor="Black" BorderColor="Black"
                                    ForeColor="White">TIPO COLABORADOR </asp:TableHeaderCell>
                                <asp:TableHeaderCell  ID="COLABORADOR" runat="server" BackColor="Black" BorderColor="Black"
                                    ForeColor="White">COLABORADOR</asp:TableHeaderCell>
                                <asp:TableHeaderCell  ID="NRO_FIJO" runat="server" BackColor="Black" BorderColor="Black"
                                    ForeColor="White">NRO FIJO</asp:TableHeaderCell>
                                <asp:TableHeaderCell  ID="NRO_CELULAR" runat="server" BackColor="Black" BorderColor="Black"
                                    ForeColor="White">NRO CELULA</asp:TableHeaderCell>
                                <asp:TableHeaderCell  ID="CORREO" runat="server" BackColor="Black" BorderColor="Black"
                                    ForeColor="White">CORREO</asp:TableHeaderCell>
                                <asp:TableHeaderCell  ID="DIRECCION" runat="server" BackColor="Black" BorderColor="Black"
                                    ForeColor="White">DIRECCION</asp:TableHeaderCell>
                                <asp:TableHeaderCell  ID="ESTADO" runat="server" BackColor="Black" BorderColor="Black"
                                    ForeColor="White">ESTADO</asp:TableHeaderCell>
                                <asp:TableHeaderCell  ID="ELIMINAR" runat="server" BackColor="Black" BorderColor="Black"
                                    ForeColor="red">ELIMINAR</asp:TableHeaderCell>
                                <asp:TableHeaderCell  ID="USUARIO" runat="server" BackColor="Black" BorderColor="Black"
                                    ForeColor="Green">USUARIO</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                        </asp:Table>
                    <%--</td>--%>
                </tr>
                     </thead>      
             <%--</tbody>--%>


                <tr>
                    <td style="text-align: right" >
                        <asp:HiddenField ID="__pagina" runat="server" />
                        <asp:HiddenField ID="__mensaje" runat="server" />
                    </td>
                </tr>

              
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="lblusurio" runat="server" Font-Size="Large" ForeColor="White" 
                            style="color: #00CC00; text-align: right"></asp:Label>
                    </td>
                </tr>

           
                
            </table>
    </div>
       
    </form>


<script src="../Otros_css_js/jquery-3.1.1.slim.min.js"></script> 
<script src="../Otros_css_js/restables.js"></script> 
         <script>

             $(document).ready(function () {
                 $('table').resTables();
             });
         </script>
                      

     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <%--<script src="bootstrap/js/jquery-1.12.4.min.js"></script>--%>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="../bootstrap/js/bootstrap.min.js"></script>

</body>
</html>