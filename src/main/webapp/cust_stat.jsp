<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@ page import = "com.datastax.driver.core.BoundStatement"%>
<%@ page import = "com.datastax.driver.core.Cluster"%>
<%@ page import = "com.datastax.driver.core.PreparedStatement"%>
<%@ page import = "com.datastax.driver.core.ResultSet"%>
<%@ page import = "com.datastax.driver.core.Row"%>
<%@ page import = "com.datastax.driver.core.Session"%>
<%@ page import = "com.datastax.driver.core.*"%>
<%@ page import = "uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap-responsive.css">
    <link rel="stylesheet" href="css/custom-styles.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" href="css/component.css">
    <link rel="stylesheet" href="css/font-awesome-ie7.css">
    <script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>

<body>
    <!-- main content starts here -->
    <div class="container b-radius-top">
        <div class="top-bar b-radius">
            <div class="top-content">
                <ul> </ul>
            </div>
        </div>
        <div class="site-header">
            <!-- Site Name starts here -->
            <div class="site-name">
                <h1>Neuro Bank</h1>
                <h5>Online Banking System</h5> </div>
            <!-- Site Name ends -->
            <%   
                LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                if (lg != null) {
                    String UserName = lg.getUsername();
                    if (lg.getlogedin()) {

            %>
           <nav class="navbar navbar-default bg-blue">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                         <li class="dropdown" style="color:#FFF"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Account Summary <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                        <li><a href="bal.jsp">View Balance</a></li>
                                        <li><a href="cust_stat.jsp">Statement</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown" style="color:#FFF"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Loans<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                        <li><a href="fixed.jsp">Home</a></li>
                                        <li><a href="fixed.jsp">Personal Loan</a></li>
                                         <li><a href="#">Education Loan</a></li>
                                        <li><a href="#">Property Load</a></li>
                                        <li><a href="#">Car Loan</a></li>
                                    </ul>
                                </li>
                                 
                                
                                <li class="dropdown" style="color:#FFF"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Requests<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                   
                                        <li><a href="#">Create</a></li>
                                        
                                    </ul>
                                </li>
                                 <li class="dropdown" style="color:#FFF"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Transaction <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                
                                        <li><a href="trans.jsp">Transfer Fund</a></li>
                                    </ul>
                                </li>
                                
                               <li> <a href="logout2.jsp" onClick="return confirmLogout()">Logout</a></li>
                                <form method="POST" action="Logout2">
                              <input type="submit" value="log out">
                                   </form>
                            </ul>
                            
                           <p style="color:#FFF; margin:10px 20px 0px 0px;"><h5 style="color:#FFF;"> <%=lg.getUsername()%></h5></p>
                            <ul class="nav navbar-nav navbar-right">
                            
                        </ul>
                        
                        </div>
                    </div>
                    </nav> 
                </div>
                <!--================REGISTRATION FORM================-->
                <div class="container reg-form">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-4 well well-sm col-md-offset-4">
            <legend><a href="Index2.jsp"><i class="fa fa-globe"></i></a> Apply Online For New Account!</legend>
            <form action="stat" method="POST" class="form" role="form">
            <div class="row">
                <div class="col-xs-6 col-md-6">
                    
                 <label for="" style="margin-left:20px;">Confirm Account Number</label><input class="form-control" style="margin-bottom:10px; margin-left:15px;" name="Accno" placeholder="Account Number" type="text"
                        required autofocus />
                </div>
                            </div>
                            <button type="submit" value="SUBMIT" class="btn btn-info btn-lg btn-round-lg" style="border-radius: 22.5px; width:100%;">Submit</button>
           
</form>
                            </div>
                </div>
                </div>
                
     <%}
                            }else{
                                %>
            
            <nav class="navbar navbar-default bg-blue">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="Index2.jsp">Home <span class="sr-only">(current)</span></a></li>
                             <li class="dropdown" style="color:#FFF"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Login <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="corp_login.jsp">Corporate Login</a></li>
                                    <li><a href="custm.jsp">Customer Login</a></li>
                                </ul>
                            </li>
                           
                            <li><a href="#">Schemes</a></li>
                            <li><a href="#">Loans</a></li>
                             <li><a href="Apply1.jsp">Apply Online</a></li>
                             <li><a href="#">About</a></li>
                            <li><a href="#">Help</a></li>
                           
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <form class="navbar-form navbar-left">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Search"> </div>
                                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                            </form>
                        </ul>
                    </div>
                    
                      <!-- /.navbar-collapse -->
                </div>
                <!-- /.container-fluid -->
            </nav>
  <%            
                    }
                %>
                  
        <div class="container bg-blue b-radius-bottom">
            <div class="site-footer">
                <div class="row-fluid">
                    <div class="span4">
                        <div class="user-info"> <i class="fw-icon-twitter"></i>
                            <h1><a href="#">Sahadev</a></h1>
                            <p class="last">XXX</p> <span>XXX</span> </div>
                    </div>
                    <div class="span4">
                        <div class="user-info"> <i class="fw-icon-twitter"></i>
                            <h1><a href="#"> Somesh</a></h1>
                            <p class="last"> XXX</p> <span>XXX</span> </div>
                    </div>
                    <div class="span4">
                        <div class="user-info"> <i class="fw-icon-twitter"></i>
                            <h1><a href="#">Abhishek</a></h1>
                            <p class="last">xxx</p> <span> xxx</span> </div>
                    </div>
                </div>
            </div>
            <div class="copy-rights"> Copyright (c)All rights reserved. </div>
        </div>
        <script src="js/jquery-1.9.1.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/masonry.pkgd.min.js"></script>
        <script src="js/imagesloaded.js"></script>
        <script src="js/classie.js"></script>
        <script src="js/AnimOnScroll.js"></script>
        <script>
            new AnimOnScroll(document.getElementById('grid'), {
                minDuration: 0.4
                , maxDuration: 0.7
                , viewportFactor: 0.2
            });
        </script>
        <script>
            $('#myCarousel').carousel({
            interval: 1800
            });
        </script>
</body>

</html>