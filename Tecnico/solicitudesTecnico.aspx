<%@ Page Language="C#" AutoEventWireup="true" CodeFile="solicitudesTecnico.aspx.cs" Inherits="Tecnico_solicitudes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Solicitudes</title>
    <meta name="MobileOptimized" content="width" />
    <meta name="HandheldFriendly" content="true" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" type="image/png" href="../Imagenes/icono.ico" />

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />

    <!-- Custom styles for this template-->
    <link href="../vendor/css/sb-admin.css" rel="stylesheet" />

    <!-- Bootstrap core JavaScript-->
    <!--jquery-3.4.1.min.js-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <style type="text/css">
        body {
            background-color: #fafafa;
            padding-top: 1rem;
        }

         </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="form-group">
             <div class="card mb-3" runat="server" id="PANEL_GENERAR_SOLCITUD" visible="True">
                <div class="card-header">
                    <i class="fas fa-user-circle fa-fw"></i>Seleccione
                            <asp:Label ID="lblUsuario" runat="server" ForeColor="Red"></asp:Label>
                </div>
                <div class="card-body">
                    <%--PRIMERA FILA--%>
                    <div class="form-group">
                        <div class="form-row">
                            <div class="col-md-3">

                                </div>
                            </div>
                        </div>
                    </div>
                 </div>
            </div>
        </div>

    </form>
    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../vendor/js/sb-admin.min.js"></script>
</body>
</html>
