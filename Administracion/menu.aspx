<%@ Page Language="C#" AutoEventWireup="true" CodeFile="menu.aspx.cs" Inherits="Administracion_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat=server>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <%--<link rel="icon" type="image/png" href="Imagenes/icono.png" />--%>
    <title>Colaborador</title>
    <meta name="MobileOptimized" content="width"/>
    <meta name="HandheldFriendly" content="true"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/> 
    <!-- Bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    
    <!-- Calendario -->
    <%--<link href="css/dcalendar.picker.css" rel="stylesheet">--%>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../bootstrap/js/jquery-1.12.4.min.js" type="text/javascript"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <%--<link href="css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" />--%><%--<script src="js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>--%><%--<link href="css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
    <script src="js/bootstrap-datepicker.min.js" type="text/javascript"></script>--%>
    
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
    </script>
    
</head>
<body onload ="MostrarMensaje()">

<!-- #include virtual="menu.inc" -->

<%--<ul class="nav nav-pills nav-stacked">
   <li class="active"><a href="#">Home</a></li>
   <li><a href="#">SVN</a></li>
   <li><a href="#">iOS</a></li>
   <li><a href="#">VB.Net</a></li>
   <li><a href="#">Java</a></li>
   <li><a href="#">PHP</a></li>
</ul> --%>



    <form id="form1" runat="server">
        
        <asp:HiddenField ID="__pagina" runat="server" />
        <asp:HiddenField ID="__mensaje" runat="server" />        
    </form>
   
</body>
</html>
