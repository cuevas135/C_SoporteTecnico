<%@ Page Language="C#" AutoEventWireup="true" CodeFile="canal.aspx.cs" Inherits="Cliente_canal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Canal Comunicacion</title>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <meta charset="utf-8"/>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


    <!-- Bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../Otros_css_js/Menu.css" rel="stylesheet"/>

    <!-- ESTILOS PARA HEADER DE MODAL -->
     <style>
  .modal-header, h4, .close {
     /*background-color: #5cb85c;*/
        background-color: #376d98;
      color:white !important;
      text-align: center;
      font-size: 25px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
  </style>

    <!-- ESTILO PARA PAGINACION DE GRIDVIEW -->
     <style type="text/css">
   .GridPager a,
.GridPager span {
    display: inline-block;
    padding: 0px 9px;
    margin-right: 4px;
    border-radius: 3px;
    border: solid 1px #c0c0c0;
    background: #e9e9e9;
    box-shadow: inset 0px 1px 0px rgba(255,255,255, .8), 0px 1px 3px rgba(0,0,0, .1);
    font-size: .875em;
    font-weight: bold;
    text-decoration: none;
    color: #717171;
    text-shadow: 0px 2px 0px rgba(255,255,255, 1);
}

.GridPager a {
    background-color: #f5f5f5;
    color: #000000;
    border: 1px solid #969696;
}

.GridPager span {

    background: #616161;
    box-shadow: inset 0px 0px 8px rgba(0,0,0, .5), 0px 1px 0px rgba(255,255,255, .8);
    color: #f0f0f0;
    text-shadow: 0px 0px 4px rgba(0,0,0, .5);
    border: 2px solid #3AC0F2;
}
   </style>

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


    
    <script language="javascript" type="text/javascript">
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

        /*Ultima Modificacion: 22/7/2019
        Ing. Secundino Alvites Rodas.
        */
        function SoloLetrasMinusculas() {
            if (!((event.keyCode >= 97 && event.keyCode <= 122) || event.keyCode == 32 || event.keyCode == 193 || event.keyCode == 201 || event.keyCode == 205 || event.keyCode == 209 || event.keyCode == 211 || event.keyCode == 218 || event.keyCode == 220 || event.keyCode == 241)) {
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

        function Datos_Canal(_ID, _CANAL) {

            frmCanal.ID_CANAL.value = _ID;
            frmCanal.CANAL.value = _CANAL;

        }

        function Limpiar_Datos__Canal() {

            frmCanal.ID_CANAL.value = "0";
            frmCanal.CANAL.value = "";

        }


        function CambiaLetraMayuscula(Caja) {
            document.getElementById(Caja).value = document.getElementById(Caja).value.toUpperCase();
        }
    
    </script>

        <script language="JavaScript" src="../Otros_css_js/resaltar.js" type="text/javascript"></script>
        <link rel="stylesheet" href="../Otros_css_js/estilo.css" type="text/css" />

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
               <a class="navbar-brand" href="../menu.aspx"><span class="glyphicon glyphicon-home"></span>  Inicio</a>
              <%--<a class="navbar-brand" href="menu.aspx"><span><img src="imagenes/001-home.png" /></span>  Inicio</a>--%>
          </div>


        <!-- -->
        <!-- Agrupar los enlaces de navegación, los formularios y cualquier
       otro elemento que se pueda ocultar al minimizar la barra -->
          <div class="collapse navbar-collapse navbar-ex1-collapse">
              <ul class="nav navbar-nav">
                      <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%--<span class="glyphicon glyphicon-briefcase"></span>--%>  Mantenimiento <b class="caret"></b>
                      </a>
                     <ul class="dropdown-menu">
                          <li><a href="cargo.aspx">Cargo</a></li>
                          <li><a href="area.aspx">&Aacute;rea de Trabajo</a></li>
                          <li><a href="canal.aspx">Canal de comunicaci&oacute;n</a></li>
                          <li><a href="Estado_Ticket.aspx">Estado ticket inc&iacute;dencia</a></li>
                          <li><a href="impacto.aspx">Impacto inc&iacute;dencia</a></li>
                          <li><a href="prioridad.aspx">Prioridad incidencia</a></li> 
                          <%--<li><a href="listarcolaboradores.aspx">Colaborador municipalidad</a></li> --%>                                                               
                      </ul>
                  </li>
              </ul>


              <ul class="nav navbar-nav">
                  <!--<li class="active"><a href="#">Enlace #1</a></li>
                <li><a href="#">Enlace #2</a></li>-->
                  <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%--<span class="glyphicon glyphicon-user"></span>--%>  Incidencias <b class="caret"></b>
                      </a>
                       <ul class="dropdown-menu">
                           <li><a href="ticketsincidentes.aspx">Generar inc&iacute;dencia</a></li>
                           <li><a href="asignarincidentetecnico.aspx">Asignar inc&iacute;dencia t&eacute;cnico</a></li>                          
                      </ul>
                  </li>
              </ul>

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
       
          <div class="section">
        <div class="container">
            <div class="row main-low-margin">
                <div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1">
                    <h1>-</h1>
                     </div>
            </div>
         </div>
    </div>
    <%-- FINNNNNNNN ............... MENUUUUUUUUUUUUU --%>
    <form id="frmCanal" runat="server">

    <div class ="container">
           <div class="table-responsive" >

   <%-- <center>--%>
        <table class="table text-center">

         <thead>
            <tr>
                <td  colspan="3" style="text-align: left">
                     <asp:Label ID="lblusurio" runat="server" Font-Size="Small" ForeColor="White" 
                         style="color: #00CC00; text-align: left; margin-left: 0px;" Width="100%"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: center; color: #FFFFFF; background-color: #000000;" colspan="3"> 
                    INGRESE DATOS CANAL COMUNICACION</td>
            </tr>
            <tr>
                <td style="text-align: right; color: #FFFFFF; background-color: #000000;">
                    CANAL: </td>
                <td style="text-align: left">
                    <asp:TextBox ID="CANAL" runat="server" CssClass="form-control input-sm" 
                        Autocomplete = "off" placeholder="Ingresar Prioridad" MaxLength="20" 
                        style="text-align: left" onchange="CambiaLetraMayuscula('CANAL')" 
                        onkeypress="SoloLetrasMinusculas()"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="rfvCANAL" runat="server" BackColor="Yellow" 
                        ControlToValidate="CANAL" ErrorMessage="*" ForeColor="Red" 
                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:HiddenField ID="__mensaje" runat="server" />
                    <asp:HiddenField ID="__pagina" runat="server" />
                    <asp:HiddenField ID="ID_CANAL" runat="server" Value="0" 
                        EnableViewState="False" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                   <asp:Button ID="btnRegistrar" runat="server" 
                        style="font-family: Calibri; color: #000000; font-size: medium" 
                        Text="Registrar" 
                        onclientclick="return Confirmar('¿Desea registrar canal?');" 
                        CssClass="btn btn-primary" Visible="False" onclick="btnRegistrar_Click" 
                        Width="15%"/>
                    &nbsp;
                    <asp:Button ID="btnModificar" runat="server" 
                        style="font-family: Calibri; color: #000000; font-size: medium" 
                        Text="Modificar"  onclientclick="return Confirmar('¿Desea modificar canal?');" 
                        Visible="False" CssClass="btn btn-primary" onclick="btnModificar_Click" 
                        Width="15%"/>
                    &nbsp;
                    <asp:Button ID="btnEliminar" runat="server" 
                        style="font-family: Calibri; color: #000000; font-size: medium" 
                        Text="Eliminar"  onclientclick="return Confirmar('¿Desea eliminar canal?');" 
                        Visible="False" class="btn btn-danger" onclick="btnEliminar_Click" 
                        Width="15%"/>
                    &nbsp;
                    <asp:Button ID="btnCancelar" runat="server" class="btn btn-primary" 
                        style="font-family: Calibri;  font-size: medium" Text="Cancelar" 
                        Visible="False" CausesValidation="False" 
                        onclientclick="Limpiar_Datos__Canal();" Width="15%" />
                    </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;</td>
            </tr>

            </thead>

            <tbody id="myTable">

            <tr>
                <td colspan="3">
                        <asp:Table ID="Tablecanales" runat="server" CssClass="form-control input" 
                            class="table table-hover table-condensed" BackColor="White" BorderColor="White" 
                            CellPadding="6" CellSpacing="2" Font-Size="Small" GridLines="Both" Width="100%" 
                            style="text-align: left">
                            <asp:TableRow ID="TableRow1" runat="server">
                                <asp:TableCell ID="ID"  runat="server" BackColor="Black" BorderColor="Black" 
                                    ForeColor="White" Width="5%" Visible=false>ID</asp:TableCell>
                                <asp:TableCell ID="_CALNAL"  runat="server" BackColor="Black" BorderColor="Black" 
                                    ForeColor="White"  Width="90%">CALNAL</asp:TableCell>
                                <asp:TableCell ID="seleccionarcargo" runat="server" BackColor="Black" BorderColor="Black" 
                                    ForeColor="White" Width="5%">SELECCIONAR</asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </td>
            </tr>
            </tbody>
        </table>
               <%--</center>--%>
    </div> </div>
    </form>

     
     <script language="JavaScript" type="text/javascript">
         ResaltarFila('Tablecanales');   
    </script>	

     <script src="../bootstrap/js/jquery-1.12.4.min.js"></script>
     <script src="../bootstrap/js/bootstrap.min.js"></script>
   
</body>
</html>
