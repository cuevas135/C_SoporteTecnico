<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ejemplo.aspx.cs" Inherits="Postergaciones_Form2" %>


<!DOCTYPE html>
<html lang="es">
<head>
   <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Registration Form</title>
    <meta name="MobileOptimized" content="width">
  <meta name="HandheldFriendly" content="true">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">

    <!-- Bootstrap -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <%--<link href="css/dcalendar.picker.css" rel="stylesheet">--%>

     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../bootstrap/js/jquery-1.12.4.min.js" type="text/javascript"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

    <link href="css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
    <script src="js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    <%--<script src="js/datepicker-es.js" type="text/javascript"></script>--%>

    <style type="text/css">
        #deceased
        {
            background-color: #FFF3F5;
            padding-top: 10px;
            margin-bottom: 10px;
        }
        .remove_field
        {
            float: right;
            cursor: pointer;
            position: absolute;
        }
        .remove_field:hover
        {
            text-decoration: none;
        }
    </style>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <%--<script src="js/jquery-1.12.4.js"></script>--%>
   <%-- <script src="../bootstrap/js/jquery-1.12.4.min.js" type="text/javascript"></script>--%>
    <%--<script src="js/dcalendar.picker.js"></script>--%>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <%--<script src="js/bootstrap.min.js"></script>--%>
    <%--<script src="css/bootstrap.min.js" type="text/javascript"></script>--%>
            
    <script type='text/javascript'>
        $(function () {
            $('.form-control.date').datepicker({
                //calendarWeeks: true,
                todayHighlight: true,
                autoclose: true,
                format: 'dd/mm/yyyy'
            });
        });

    </script>
    <script type='text/javascript'>
        $(function () {
            $('.form-control.date').datepicker({
                //calendarWeeks: true,
                todayHighlight: true,
                autoclose: true,
                format: 'dd/mm/yyyy',
                language: 'es'
            });

            var max_fields = 5; //maximum input boxes allowed
            var x = 1; //initlal text box count

            $('#add').click(function () {
                if (x < max_fields) { //max input box allowed
                    x++; //text box increment
                    $("#addblock").before('<div class="col-md-12 col-sm-12" id="deceased">    <a href="#" class="remove_field" title="Remove">X</a>	<div class="form-group col-md-3 col-sm-3">            <label for="name">Name*</label>            <input type="text" class="form-control input-sm" id="name" placeholder="">        </div>	<div class="form-group col-md-3 col-sm-3">            <label for="gender">Gender*</label>            <input type="text" class="form-control input-sm" id="gender" placeholder="">        </div>	<div class="form-group col-md-3 col-sm-3">            <label for="age">Age*</label>            <input type="text" class="form-control input-sm" id="age" placeholder=""></div>	     <div class=" form-group col-md-3 col-sm-3 "><label for="DOB">Date of Death or Exact Death Year*</label><input type="text" class="form-control input-sm datepicker date" id="DOB' + x + '" placeholder=""></div>	<div class="form-group col-md-3 col-sm-3">                                                                                         <label for="DOD">Date of Death or Exact Death Year*</label>             <input type="text" class="form-control input-sm datepicker" id="DOD' + x + '" placeholder="">        </div>	<div class="form-group col-md-3 col-sm-3">            <label for="mother">Deceased Person\'s Mother Name*</label>            <input type="text" class="form-control input-sm" id="mother" placeholder="">        </div>	<div class="form-group col-md-3 col-sm-3">            <label for="father">Deceased Person\'s Father Name*</label>            <input type="text" class="form-control input-sm" id="father" placeholder="">        </div>	<div class="form-group col-md-3 col-sm-3">	    <label for="photo">Upload Photo*</label>	    <input type="file" id="photo">	    <p class="help-block">Please upload individual photo. Group photo is not acceptable.</p>	</div></div>');
                    //$("#addblock").before('<div class="col-md-12 col-sm-12" id="deceased">	<a href="#" class="remove_field" title="Remove">X</a>	<div class="form-group col-md-3 col-sm-3">            <label for="name">Name*</label>            <input type="text" class="form-control input-sm" id="name" placeholder="">        </div>	<div class="form-group col-md-3 col-sm-3">            <label for="gender">Gender*</label>            <input type="text" class="form-control input-sm" id="gender" placeholder="">        </div>	<div class="form-group col-md-3 col-sm-3">            <label for="age">Age*</label>            <input type="text" class="form-control input-sm" id="age" placeholder=""></div>	     <div class="form-group"><label for="dateofbirth" class="col-sm-2 control-label">Date of Birth:</label><div class="col-sm-3 input-group date"><input type="text" class="form-control" id="dateofbirth' + x + '" placeholder="Select Date"><span class="input-group-addon"></span></div></div>             	<div class="form-group col-md-3 col-sm-3">            <label for="DOD">Date of Death or Exact Death Year*</label>             <input type="text" class="form-control input-sm datepicker" id="DOD' + x + '" placeholder="">        </div>	<div class="form-group col-md-3 col-sm-3">            <label for="mother">Deceased Person\'s Mother Name*</label>            <input type="text" class="form-control input-sm" id="mother" placeholder="">        </div>	<div class="form-group col-md-3 col-sm-3">            <label for="father">Deceased Person\'s Father Name*</label>            <input type="text" class="form-control input-sm" id="father" placeholder="">        </div>	<div class="form-group col-md-3 col-sm-3">	    <label for="photo">Upload Photo*</label>	    <input type="file" id="photo">	    <p class="help-block">Please upload individual photo. Group photo is not acceptable.</p>	</div></div>');

                    $('.datepicker').datepicker({
                        todayHighlight: true,
                        autoclose: true,
                        format: 'dd/mm/yyyy',
                        language: 'es'
                    });

                } else {
                    alert("Only 5 Names Allowed");
                }
            });
            $(document).on('click', '.remove_field', function (e) {
                e.preventDefault();
                $(this).parent('div').remove();
                x--;
            });


        });
    </script>
</head>
<body>
<form runat="server">
    <div class="panel panel-primary" style="margin:20px;">
        <div class="panel-heading">
            <h3 class="panel-title">
                Registration Form</h3>
        </div>
        <div class="panel-body">
            
            <div class="col-md-12 col-sm-12">
                <div class="form-group col-md-6 col-sm-6">
                    <label for="name">
                        Name*
                    </label>
                    <input type="text" class="form-control input-sm" id="name" placeholder="">
                </div>
                <div class="form-group col-md-6 col-sm-6">
                    <label for="email">
                        Email*</label>
                    <input type="email" class="form-control input-sm" id="email" placeholder="">
                </div>
                <div class="form-group col-md-6 col-sm-6">
                    <label for="mobile">
                        Mobile*</label>
                    <input type="text" class="form-control input-sm" id="mobile" placeholder="">
                </div>
                <div class="form-group col-md-6 col-sm-6">
                    <label for="address">
                        Address*</label>
                    <textarea class="form-control input-sm" id="address" rows="3"></textarea>
                </div>
                <div class="form-group col-md-6 col-sm-6">
                    <label for="city">
                        City*</label>
                    <input type="text" class="form-control input-sm" id="city" placeholder="">
                </div>
                <div class="form-group col-md-6 col-sm-6">
                    <label for="state">
                        State*</label>
                    <input type="text" class="form-control input-sm" id="state" placeholder="">
                </div>
                <div class="form-group col-md-6 col-sm-6">
                    <label for="country">
                        Country*</label>
                    <input type="text" class="form-control input-sm" id="country" placeholder="">
                </div>
                <div class="form-group col-md-6 col-sm-6">
                    <label for="pincode">
                        Pincode</label>
                    <input type="text" class="form-control input-sm" id="pincode" placeholder="">
                </div>
                <div class="form-group col-md-6 col-sm-6">
                    <label for="years">
                        You could register for up to 10 years for Kalabhairava Shanthi - M.A *</label>
                    <span class="help-block">Please choose the no. of months for which you would like to
                        register</span>
                    <select class="form-control input-sm" id="years">
                        <option>-- Select No of Year --</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                    </select>
                </div>
                <div class="form-group col-md-6 col-sm-6">
                    <label for="months">
                        You could register for up to 10 months for Kalabhairava Shanthi. *</label>
                    <span class="help-block">Please choose the no. of months for which you would like to
                        register</span>
                    <select class="form-control input-sm" id="months">
                        <option>-- Select No of Month --</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                    </select>
                </div>
                <div class="form-group col-md-6 col-sm-6">
                    <label for="pincode">
                        Would you be visiting ashram to participate in Kalabhairava Shanthi - M.A ? *
                        <input type="checkbox" checked data-toggle="toggle"></label>
                    <span class="help-block">if you need a cottage to stay, you could book in advance through
                        email to ishastay@ishafoundation.org</span>
                </div>
                <div class="form-group col-md-6 col-sm-6">
                    <label for="arrival">
                        Arrival Date</label>
                    <input type="text" class="form-control input-sm datepicker" id="arrival" placeholder="">
                </div>
            </div>


            <div class="col-md-12 col-sm-12" id="deceased">
                <div class="form-group col-md-3 col-sm-3">
                    <label for="name">
                        Name*</label>
                    <input type="text" class="form-control input-sm" id="Text1" placeholder="">
                </div>
                <div class="form-group col-md-3 col-sm-3">
                    <label for="gender">
                        Gender*</label>
                    <input type="text" class="form-control input-sm" id="gender" placeholder="">
                </div>
                <div class="form-group col-md-3 col-sm-3">
                    <label for="age">
                        Age*</label>
                    <input type="text" class="form-control input-sm" id="age" placeholder=""></div>
                <div class=" form-group col-md-3 col-sm-3 ">
                    <label for="DOB">
                        Date of Death or Exact Death Year*</label><input type="text" class="form-control input-sm datepicker date"
                            id="DOB" placeholder=""></div>
                <div class="form-group col-md-3 col-sm-3">
                    <label for="DOD">
                        Date of Death or Exact Death Year*</label>
                    <input type="text" class="form-control input-sm datepicker" id=" DOD" placeholder="">
                </div>
                <div class="form-group col-md-3 col-sm-3">
                    <label for="mother">
                        Deceased Person's Mother Name*</label>
                    <input type="text" class="form-control input-sm" id="mother" placeholder="">
                </div>
                <div class="form-group col-md-3 col-sm-3">
                    <label for="father">
                        Deceased Person's Father Name*</label>
                    <input type="text" class="form-control input-sm" id="father" placeholder="">
                </div>
                <div class="form-group col-md-3 col-sm-3">
                    <label for="photo">
                        Photo*</label>
                    <input type="file" id="photo">
                    <p class="help-block">
                        Please upload individual photo. Group photo is not acceptable.</p>
                </div>
            </div>
            <div class="col-md-12 col-sm-12" id="addblock">
                <div class="form-group col-md-3 col-sm-3">
                    <input type='button' class="btn btn-primary" value="Add" id="add" />
                </div>
            </div>
            <div class="col-md-12 col-sm-12">
                <div class="form-group col-md-3 col-sm-3 pull-right">
                    <input type='text' class="form-control input-sm" id="amount" readonly placeholder="Total Amount" />
                </div>
            </div>
            <div class="col-md-12 col-sm-12">
                <div class="form-group col-md-3 col-sm-3 pull-right">
                    <input type="submit" class="btn btn-primary" value="Submit" />
                </div>
            </div>
            
        </div>
         </div>
        </form>


      <%--   <script src="bootstrap_4.3.1/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="bootstrap_4.3.1/js/bootstrap.min.js" type="text/javascript"></script>--%>
</body>
</html>
