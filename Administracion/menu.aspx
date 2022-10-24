<%@ Page Language="C#" AutoEventWireup="true" CodeFile="menu.aspx.cs" Inherits="Administracion_menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Menu</title>
    <meta name="MobileOptimized" content="width" />
    <meta name="HandheldFriendly" content="true" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" type="image/png" href="../Imagenes/icono.ico" />

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <!-- Page level plugin CSS-->
    <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet" />
    <!-- Custom styles for this template-->
    <%--<link href="css/sb-admin.css" rel="stylesheet">--%>

    <link href="../vendor/css/sb-admin.css" rel="stylesheet" />

    <script type="text/javascript">
        //function MostrarMensaje() {
        //    var mensaje = document.getElementById("__mensaje").value;
        //    if (mensaje != "") {
        //        alert(mensaje);
        //        if (document.getElementById("__pagina").value != "")
        //            location.href = document.getElementById("__pagina").value;
        //    }
        //}

        //function window_load() {
        //    MostrarMensaje()
        //}

        ////============================================================
        //function deshabilitaRetroceso() {
        //    window.location.hash = "no-back-button";
        //    window.location.hash = "Again-No-back-button" //chrome
        //    window.onhashchange = function () {
        //        window.location.hash = "";
        //    }
        //}
    </script>
    <style type="text/css">
        /* Show it is fixed to the top */
        body {
            /*min-height: 75rem;*/
            padding-top: 4rem;
        }
    </style>
</head>
<body onload="deshabilitaRetroceso();" id="page-top">
    <form runat="server">
        <nav class="navbar navbar-expand fixed-top" style="background-color: #66bf0e;">
            <a class="navbar-brand mr-1">
                <label class="text-White font-weight-bold" style="color: ghostwhite">
                    Bienvenido
                    <asp:LoginName ID="LoginName1" runat="server" Font-Bold="true" Visible="False" />
                </label>
            </a>
            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle">
                <i class="fa fa-align-justify" style="font-size: 20px; color: ghostwhite"></i>
            </button>
            <!-- Navbar Search -->
            <div class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <%--<input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">--%>
                    <div class="input-group-append">
                       
                    </div>
                </div>
            </div>
            <!-- Navbar -->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown no-arrow mx-1"></li>
                <li class="nav-item dropdown no-arrow mx-1"><a class="nav-link dropdown-toggle" href="#"
                    id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false"></a></li>
                <li class="nav-item dropdown no-arrow"><a class="nav-link dropdown-toggle" href="#"
                    id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user-circle fa-fw" style="font-size: 24px; color: ghostwhite"></i>
                </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <%--<a class="dropdown-item" href="Usuario">Perfil de Usuario</a>--%>
                       <%-- <div class="dropdown-divider">
                        </div>--%>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Cerrar
                        Sesion</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div id="wrapper">
            <%--<div id="wrapper" >--%>
            <!-- Sidebar -->
            <ul class="sidebar navbar-nav" style="background-color: #0e66bf;">
                <li class="nav-item active"><a class="nav-link" href="menu.aspx"><i class="fas fa-fw fa-home"></i><span> Inicio</span> </a></li>
                <li class="nav-item">
                    <%--<asp:HyperLink ID="HlOlvideContrasena" runat="server" NavigateUrl="<%$RouteUrl:RouteName=Postergar%>"
                                    Font-Size="Small" ><i class="fas fa-fw fa-calendar-day"></i>  <span>Postergaciones</span></asp:HyperLink>--%>
                    <a class="nav-link" href="colaborador.aspx"><i class="fas fa-user-circle fa-fw"></i><span> Colaborador</span></a> </li>
                <li class="nav-item">
                    <a class="nav-link" href="visitacliente.aspx"><i class="fas fa-calendar-check"></i><span> Asignar Visita Tecnico</span></a> </li>
            </ul>
            <div id="content-wrapper">
                <div class="container-fluid">
                    <!-- Breadcrumbs-->
                    <%-- <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Dashboard</a> </li>
                    <li class="breadcrumb-item active">Overview</li>
                </ol>--%>
                    <!-- Area Chart Example-->
                    <!-- Card deck -->
                    <div class="card-deck">

                        <!-- Card -->
                        <div class="card mb-4">
                            <!--Card image-->
                            <div class="view overlay">
                                <img class="card-img-top" src="../Imagenes/logoSoporteTecnico.jpeg" alt="Card image cap" />
                                <a href="#!">
                                    <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>
                            <!--Card content-->
                            <div class="card-body">

                                <!--Title-->
                                <%--<h4 class="card-title">Soporte tecnico</h4>--%>
                                <!--Text-->
                                <%--<p class="card-text">...</p>--%>
                                <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                                <%--<button type="button" class="btn btn-light-blue btn-md">Read more</button>--%>
                            </div>

                        </div>
                        <!-- Card -->

                        <!-- Card -->
                        <div class="card mb-4">

                            <!--Card image-->
                            <div class="view overlay">
                                <img class="card-img-top" src="../Imagenes/logoSoporteTecnico.jpeg" alt="Card image cap" />
                                <a href="#!">
                                    <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>

                            <!--Card content-->
                            <div class="card-body">

                                <!--Title-->
                                <%--<h4 class="card-title">Soporte tecnico</h4>--%>
                                <!--Text-->
                                <%--<p class="card-text">...</p>--%>
                                <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                                <%--<button type="button" class="btn btn-light-blue btn-md">Read more</button>--%>
                            </div>

                        </div>
                        <!-- Card -->

                      

                    </div>
                    <!-- Card deck -->

                </div>
                <!-- /.container-fluid -->
                <!-- Sticky Footer -->
                <footer class="sticky-footer">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright © Soporte tecnico 2022</span>
                        </div>
                    </div>
                </footer>
            </div>
            <!-- /.content-wrapper -->
            <%--</div>--%>
        </div>
        <!-- /container -->
        <!-- /#wrapper -->
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top"><i class="fas fa-angle-up"></i>
        </a>
        <!-- Cerrar Sesion Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Abandonar Sesion</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Seleccione Cerrar para abandonar la sesion
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">
                            Cancelar</button>
                        <a class="btn btn-primary" href="CerrarSession.aspx">Cerrar</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fin Modal Cerrar Sesion-->



        <!-- Mensaje al Postergar Modal-->
        <div class="modal fade" id="MensajeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="H1">
                            <asp:Label ID="LblTituloModalMensaje" runat="server" Text="Label"></asp:Label>
                        </h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <asp:Label ID="LblModalMensaje" runat="server" Text="Label"></asp:Label>
                    </div>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    <div class="modal-footer">
                        <asp:Button ID="BtnAceptarPostergacion" runat="server" Text="Aceptar"
                            class="btn btn-primary" />
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">
                            Cancelar</button>
                        <%--<a class="btn btn-primary" href="login.html">Logout</a>--%>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fin Modal Cerrar Sesion-->

        <%-- VENTANA MODAL PARA MENSAJE --%>
        <div id="Modal_MostarMensaje" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">
                            <label id="lblMasterMessage" style="font-family: 'Tahoma'; font-size: medium; color: #0000FF; font-weight: bold;">
                                Mensaje</label>
                        </h4>
                    </div>
                    <div class="modal-body">
                        <label id="lblMasterbodyMensaje" style="font-family: 'Tahoma'; font-size: 15px; color: #FF0000; font-weight: normal;">
                        </label>
                    </div>
                    <div class="modal-footer">
                        <button id="BtnMensajeModal" type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
                    </div>
                </div>
            </div>
        </div>
        <%-- FIN VENTANA MODAL DE MENSAJE --%>

        <asp:HiddenField ID="__mensaje" runat="server" />
        <asp:HiddenField ID="__pagina" runat="server" />


    </form>

    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>
    <!-- Page level plugin JavaScript-->
    <script src="../vendor/chart.js/Chart.min.js" type="text/javascript"></script>
    <script src="../vendor/datatables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="../vendor/datatables/dataTables.bootstrap4.js" type="text/javascript"></script>
    <!-- Custom scripts for all pages-->
    <%--<script src="js/sb-admin.min.js"></script>--%>
    <script src="../vendor/js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <%--<script src="bootstrap_4.3.1/js/demo/datatables-demo.js" type="text/javascript"></script>--%>
    <script src="../vendor/js/demo/datatables-demo.js"></script>
</body>
</html>