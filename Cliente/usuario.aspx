<%@ Page Language="C#" AutoEventWireup="true" CodeFile="usuario.aspx.cs" Inherits="Cliente_usuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <link rel="icon" type="image/ico" href="imagenes/Sistema__.ico" />
        <title>Usuario
     </title>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <meta charset="utf-8"/>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->


     <!-- Bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    
    <link href="../Otros_css_js/Menu.css" rel="stylesheet"/>

    
     <%-- VALIDACIONES EN TEXTBOX --%>
    <script src="../Otros_css_js/Validaciones.js" type="text/javascript"></script>
         
    <script type="text/javascript">
      function profesiones(id, profesion) {
         form1.idprofesion.value = id;
         form1.nombreprofesion.value = profesion;
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

body
{
    background-color:#fafbfb /* La página de fondo será negra */
    /*color: white;*/ /*El texto de la página será blanco */
}

</style>

     <script  src="../Otros_css_js/restables.js" type="text/javascript"></script>
     <link rel="stylesheet" href="../Otros_css_js/estilo.css" type="text/css" />

</head>
     <body onload ="MostrarMensaje()">
    <form id="form1" runat="server">
    <div class="col-md-6 col-md-offset-3">
       <table class="table table-bordered table-hover table text-center">
            <thead>
            <tr>
                <td  colspan="2" 
                    style="text-align: center;">
                    <asp:HyperLink ID="hlColaborador" runat="server" 
                        NavigateUrl="~/Cliente/listarcolaboradores.aspx">Colaboradores</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="hlCerrarSesion" runat="server" ForeColor="Red" 
                        NavigateUrl="~/CerrarSession.aspx">Cerrar Sesion</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td  colspan="2" 
                    style="text-align: center; color: #FFFFFF; background-color: #000000;">
                    INGRESE DATOS USUARIO</td>
            </tr>
            <tr>
                <td style="text-align: center; color: #FFFFFF; background-color: #000000;" >
                    Colaborador</td>

               <td  style="text-align: left"  >
                     <asp:Label ID="lblColaborador" runat="server"></asp:Label>
                </td>
            </tr>
                 <tr>
                <td style="text-align: center; color: #FFFFFF; background-color: #000000;" >
                    Tipo
                    Colaborador</td>

                <td style="text-align: left;"  >
                     <asp:Label ID="lblTipoColaborador" runat="server"></asp:Label>
                     </td>
                 </tr>
     
                 <tr>
                <td style="text-align: center; color: #FFFFFF; background-color: #000000;" >
                    Login
                     </td>

                <td style="text-align: left;"  >
                    <asp:TextBox ID="LOGIN" runat="server" MaxLength="50" 
                        class="form-control input-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLOGIN" runat="server" BackColor="Yellow" 
                        ControlToValidate="LOGIN" ErrorMessage="RequiredFieldValidator" 
                        Font-Bold="True" ForeColor="Red" >*</asp:RequiredFieldValidator>
                     </td>
                 </tr>
     
                 <tr>
                <td style="text-align: center; color: #FFFFFF; background-color: #000000;" >
                    Contraseña</td>

                <td style="text-align: left;"  >
                    <asp:TextBox ID="PASSWORD" runat="server" MaxLength="50" 
                        class="form-control input-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPASSWORD" runat="server" BackColor="Yellow" 
                        ControlToValidate="LOGIN" ErrorMessage="RequiredFieldValidator" 
                        Font-Bold="True" ForeColor="Red" >*</asp:RequiredFieldValidator>
                     </td>
                 </tr>
     
                 <tr>
                <td style="text-align: center; color: #FFFFFF; background-color: #000000;" >
                    Estado</td>

                <td style="text-align: left;"  >
                    <asp:CheckBox ID="ESTADO" runat="server" Text="Activo / Inactivo" 
                        TextAlign="Left" />
                     </td>
                 </tr>
     
                 <tr>
                <td colspan="2">
                    <asp:Button ID="btnRegistrar" runat="server" class="btn btn-primary"
                        onclientclick="return Confirmar('¿Desea Registrar?');" 
                        style="font-family: Calibri;  font-size: medium" 
                        Text="Registrar" onclick="btnRegistrar_Click" Visible="False" Width="15%" 
                         />
&nbsp;&nbsp;
                    <asp:Button ID="btnModificar" runat="server" class="btn btn-primary"
                        onclientclick="return Confirmar('¿Desea Modificar?');" 
                        style="font-family: Calibri; font-size: medium" 
                        Text="Modificar" Visible="False" onclick="btnModificar_Click" 
                        Width="15%"  />
&nbsp;&nbsp;
                    <asp:Button ID="btnEliminar" runat="server" class="btn btn-danger"
                        onclientclick="return Confirmar('¿Desea Eliminar?');" 
                        style="font-family: Calibri;  font-size: medium" Text="Eliminar" 
                        Visible="False" Width="15%" 
                         />
                &nbsp;&nbsp;
                    <asp:Button ID="btnCancelar" runat="server" class="btn btn-primary"
                        style="font-family: Calibri; font-size: medium" 
                        Text="Cancelar" Visible="False" CausesValidation="False" 
                        onclick="btnCancelar_Click" Width="15%" 
                         />
                </td>
            </tr>
             </thead>
    <tbody>           

            <tr>
                <td colspan="2">
                    <asp:Table ID="TableUsuario" runat="server" BackColor="White" 
                        BorderColor="White" CellPadding="2" CellSpacing="0" Font-Size="Small" 
                        GridLines="Both" style="text-align: left" Width="100%">
                        <asp:TableRow ID="TableRow1" runat="server">
                              <asp:TableCell ID="ID" runat="server" BackColor="Black" BorderColor="Black" 
                                ForeColor="White"  HorizontalAlign="Center">EDITAR</asp:TableCell>
                            <asp:TableCell ID="TIPO" runat="server" BackColor="Black" BorderColor="Black" 
                                ForeColor="White" HorizontalAlign="Center">TIPO</asp:TableCell>
                            <asp:TableCell ID="COLABORADOR" runat="server" BackColor="Black" BorderColor="Black" 
                                ForeColor="White" HorizontalAlign="Center">COLABORADOR</asp:TableCell>
                            <asp:TableCell ID="_LOGIN" runat="server" BackColor="Black" BorderColor="Black" 
                                ForeColor="White" HorizontalAlign="Center">LOGIN</asp:TableCell>
                            <asp:TableCell ID="_PASSWORD" runat="server" BackColor="Black" BorderColor="Black" 
                                ForeColor="White" HorizontalAlign="Center">PASSWORD</asp:TableCell> 
                            <asp:TableCell ID="_ESTADO" runat="server" BackColor="Black" BorderColor="Black" 
                                ForeColor="White" HorizontalAlign="Center">ESTADO</asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </td>
            </tr>                   
           
                 

            <tr>
                <td style="text-align: right" colspan="2" >
                    <asp:HiddenField ID="__mensaje" runat="server" />
                    <asp:HiddenField ID="__pagina" runat="server" />
                    <asp:HiddenField ID="ID_USUA" runat="server" Value="0" />
                    <asp:HiddenField ID="OPERACION" runat="server" />
                    </td>
            </tr>
                </tbody>
        </table>
    

         
                    
        </div>
  

      </form>

           <script type="text/javascript">
               ResaltarFila('TableUsuario');
    </script>



         <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="../bootstrap/js/jquery-1.12.4.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

