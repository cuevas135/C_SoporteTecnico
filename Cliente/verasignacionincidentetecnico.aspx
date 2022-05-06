<%@ Page Language="C#" AutoEventWireup="true" CodeFile="verasignacionincidentetecnico.aspx.cs" Inherits="Cliente_verasignacionincidentetecnico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ver Incidente Asignado Tecnico</title>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <meta charset="utf-8"/>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <script  src="../src/js/jscal2.js"></script>
    <script  src="../src/js/lang/es.js"></script>
    <link rel="stylesheet" type="text/css" href="../src/css/jscal2.css" />
    <link rel="stylesheet" type="text/css" href="../src/css/border-radius.css" />
    <link rel="stylesheet" type="text/css" href="../src/css/steel/steel.css" />

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
        .style1
        {
            color: #000000;
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
            document.getElementById('<%= FechaAtencion.ClientID %>').readOnly = true;

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

        function Datos_Area(_ID, _AREA, _CARGO) {

            frmArea.ID_AREA.value = _ID;
            frmArea.AREA.value = _AREA;
            nroelemnetos = frmArea.CARGO.options.length;
            for (i = 0; i < nroelemnetos; i++) {
                if (frmArea.CARGO.options[i].text == _CARGO) {
                    frmArea.CARGO.selectedIndex = i;
                }
            }
            //            alert(frmArea.CARGO.options[1].text);

        }

        function Limpiar_Datos_Area() {

            frmArea.ID_AREA.value = "0";
            frmArea.AREA.value = "";
            frmArea.CARGO.selectedIndex = 0;
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
               <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-home"></span>  Inicio</a>
              <%--<a class="navbar-brand" href="menu.aspx"><span><img src="imagenes/001-home.png" /></span>  Inicio</a>--%>
          </div>


        <!-- -->
        <!-- Agrupar los enlaces de navegación, los formularios y cualquier
       otro elemento que se pueda ocultar al minimizar la barra -->
          


             
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
    <form id="frmArea" runat="server">

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
                    INGRESE DATOS INCIDENTE ASIGNADO</td>
            </tr>
            <tr>
                <td style="text-align: right; color: #FFFFFF; background-color: #000000;">
                    Area:</td>
                <td style="text-align: left">
                    <asp:Label ID="_AREA_" runat="server" CssClass="form-control input-sm" placeholder="Ingresar solucion incidente"></asp:Label>
                </td>
                <td style="text-align: left">
                     &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right; color: #FFFFFF; background-color: #000000;">
                    Nro. ticket:</td>
                <td style="text-align: left">
                    <asp:Label ID="_NROTICKET_" runat="server" CssClass="form-control input-sm"></asp:Label>
                </td>
                <td style="text-align: left">
                     &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right; color: #FFFFFF; background-color: #000000;">
                    Incidente:</td>
                <td style="text-align: left">
                    <asp:Label ID="_INCIDENTE_" runat="server" CssClass="form-control input-sm"></asp:Label>
                </td>
                <td style="text-align: left">
                     &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right; color: #FFFFFF; background-color: #000000;">
                    Fecha asignacion:</td>
                <td style="text-align: left">
                    <asp:Label ID="_FECHAASIGNACION_" runat="server" 
                         CssClass="form-control input-sm"></asp:Label>
                </td>
                <td style="text-align: left">
                     &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right; color: #FFFFFF; background-color: #000000;">
                    Fecha atencion: </td>
                <td style="text-align: left">
                     <asp:TextBox ID="FechaAtencion" runat="server" Autocomplete = "off"
                        onkeypress="BloqueaCaracteres(event)" CssClass="form-control input-sm" 
                        Font-Size ="Small"></asp:TextBox>
                     <button id="Fecha_Atencion" type="button">
                        ...</button>
                </td>
                <td style="text-align: left">
                     <asp:RequiredFieldValidator ID="rfvFechaAtencion" runat="server" 
                         ControlToValidate="FechaAtencion" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; color: #FFFFFF; background-color: #000000;">
                    Solucion incidente:</td>
                <td style="text-align: left">
                     <asp:TextBox ID="COMENTARIO" runat="server" Autocomplete = "off"
                        onkeypress="BloqueaCaracteres(event)" CssClass="form-control input-sm" 
                        Font-Size ="Small" TextMode="MultiLine" placeholder="Ingresar solucion incidente" ></asp:TextBox>
                     </td>
                <td style="text-align: left">
                    <%-- <label for="cargo">--%><%-- </label>--%>
                     <asp:RequiredFieldValidator ID="rfvCOMENTARIO" runat="server" 
                         ControlToValidate="COMENTARIO" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:HiddenField ID="__mensaje" runat="server" />
                    <asp:HiddenField ID="__pagina" runat="server" />
                    <asp:HiddenField ID="ID_DETINCI" runat="server" Value="0" 
                        EnableViewState="False" />
                    <asp:HiddenField ID="OPERACION" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                   <asp:Button ID="btnRegistrar" runat="server" 
                        style="font-family: Calibri; color: #000000; font-size: medium" 
                        Text="Registrar" 
                        onclientclick="return Confirmar('¿Desea registrar area?');" 
                        CssClass="btn btn-primary" Visible="False" 
                        Width="15%" onclick="btnRegistrar_Click"/>
                    &nbsp;
                    <asp:Button ID="btnModificar" runat="server" 
                        style="font-family: Calibri; color: #000000; font-size: medium" 
                        Text="Modificar"  onclientclick="return Confirmar('¿Desea modificar incidente asignado tecnico?');" 
                        Visible="False" CssClass="btn btn-primary" 
                        Width="15%" onclick="btnModificar_Click"/>
                    &nbsp;
                    <asp:Button ID="btnEliminar" runat="server" 
                        style="font-family: Calibri; color: #000000; font-size: medium" 
                        Text="Eliminar"  onclientclick="return Confirmar('¿Desea eliminar area?');" 
                        Visible="False" class="btn btn-danger" 
                        Width="15%"/>
                    &nbsp;
                    <asp:Button ID="btnCancelar" runat="server" class="btn btn-primary" 
                        style="font-family: Calibri;  font-size: medium" Text="Cancelar" 
                        Visible="False" CausesValidation="False" 
                        Width="15%" onclick="btnCancelar_Click" />
                    </td>
            </tr>
            <tr>
                <td colspan="3" align="left" class="style1">
                   Seleccione incidente para ingresar fecha de atencion y solucion del incidente.</td>
            </tr>

            </thead>

            <tbody id="myTable">

            <tr>
                <td colspan="3">
                        <asp:Table ID="Tableveraignacionincidentetecnico" runat="server" CssClass="form-control input" 
                            class="table table-hover table-condensed" BackColor="White" BorderColor="White" 
                            CellPadding="7" CellSpacing="4" Font-Size="X-Small" GridLines="Both" Width="100%" 
                            style="text-align: left">
                            <asp:TableRow ID="TableRow1" runat="server">
                                <asp:TableCell ID="_ID_DETINCI"  runat="server" BackColor="Black" BorderColor="Black" 
                                    ForeColor="White" Width="5%" Visible="false">ID</asp:TableCell>
                                <asp:TableCell ID="_AREA"  runat="server" BackColor="Black" BorderColor="Black" 
                                    ForeColor="White"  Width="20%">AREA</asp:TableCell>
                                <asp:TableCell ID="_NRO_TICKET"  runat="server" BackColor="Black" BorderColor="Black" 
                                    ForeColor="White"  Width="5%">NRO TICKET</asp:TableCell>
                                <asp:TableCell ID="_INCIDENTE"  runat="server" BackColor="Black" BorderColor="Black" 
                                    ForeColor="White"  Width="">INCIDENTE</asp:TableCell>
                                <asp:TableCell ID="_FECHA_ASIGNACION"  runat="server" BackColor="Black" BorderColor="Black" 
                                    ForeColor="White"  Width="5%">FECHA ASIGNACION</asp:TableCell> 
                                <asp:TableCell ID="_FECHA_ATENCION"  runat="server" BackColor="Black" BorderColor="Black" 
                                    ForeColor="White"  Width="5%">FECHA ATENCION</asp:TableCell>
                                <asp:TableCell ID="_SOLUCION"  runat="server" BackColor="Black" BorderColor="Black" 
                                    ForeColor="White"  Width="20%">SOLUCION</asp:TableCell>
                                <asp:TableCell ID="ESTADOTICKET"  runat="server" BackColor="Black" BorderColor="Black" 
                                    ForeColor="White"  Width="5%">ESTADO</asp:TableCell>                  
                                <asp:TableCell ID="seleccionarincidente" runat="server" BackColor="Yellow" BorderColor="Yellow" 
                                    ForeColor="blue" Width="5%">SELECCIONAR</asp:TableCell>
                                <asp:TableCell ID="devolverincidente" runat="server" BackColor="Yellow" BorderColor="Yellow" 
                                    ForeColor="red" Width="5%">DEVOLVER</asp:TableCell>
                                <asp:TableCell ID="enprocesoincidente" runat="server" BackColor="Yellow" BorderColor="Yellow" 
                                    ForeColor="Green" Width="5%">EN PROCESO</asp:TableCell>
                                <asp:TableCell ID="detenerincidente" runat="server" BackColor="Yellow" BorderColor="Yellow" 
                                    ForeColor="BlueViolet" Width="5%">DETENER</asp:TableCell> 
                            </asp:TableRow>
                        </asp:Table>
                    </td>
            </tr>
            </tbody>
        </table>
               <%--</center>--%>
    </div> </div>
    </form>

     
     <script type="text/javascript">//<![CDATA[
         Calendar.setup({
             inputField: "FechaAtencion",
             trigger: "Fecha_Atencion",
             onSelect: function () { this.hide() },
             showTime: 12,
             dateFormat: "%d/%m/%Y"
         });
        //]]></script>

     <script language="JavaScript" type="text/javascript">
         ResaltarFila('Tableveraignacionincidentetecnico');   
    </script>	

     <script src="../bootstrap/js/jquery-1.12.4.min.js"></script>
     <script src="../bootstrap/js/bootstrap.min.js"></script>
   
</body>
</html>

