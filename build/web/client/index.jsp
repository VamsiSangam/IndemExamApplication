<%@page import="java.sql.ResultSet, java.sql.Connection, java.sql.DriverManager, java.sql.Statement, classes.App" errorPage="../error.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <link rel="shortcut icon" href="../img/logo.png">
        <title>INDEM</title>

        <!-- Bootstrap core CSS -->
        <link href="../css/bootstrap.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../css/main.css" rel="stylesheet">
        <link rel="stylesheet" href="../css/icomoon.css">
        <link href="../css/animate-custom.css" rel="stylesheet">



        <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>

        <script src="../js/jquery.min.js"></script>
        <script type="text/javascript" src="../js/modernizr.custom.js"></script>
        <script>
            function scrollQ(data)
            {
                $.getJSON("/Indem/scrollQ", {"q_no": data}, displayQ);
            }

            function displayQ(data)
            {
                $('#q_no').html(data.q_no);
                $('#question').html(data.question);
                $('#positive_marks').html(data.positive_marks);
                $('#negative_marks').html(data.negative_marks);

            }
        </script>
    </head>
    <body data-spy="scroll" data-offset="0" data-target="#navbar-main" onload="scrollQ(1)">
        <div id="navbar-main">
            <!-- Fixed navbar -->
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="icon icon-connection-2" style="font-size:30px; color:#3498db;"></span>
                        </button>
                        <a class="navbar-brand hidden-xs hidden-sm" href="#home"><span class="icon icon-connection-2" style="font-size:18px; color:#3498db;"></span></a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="#home" class="smoothScroll">Home</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>

        <!-- ==== HEADERWRAP ==== -->
        <div class="headerwrap" id="home">
            <header class="clearfix">
                <h1><span class="icon icon-connection-2"></span></h1>
                <p>INDEM</p>
                <p>IIITA Networking Development and Engineering Management</p>
            </header>	    
        </div><!-- /headerwrap -->

        <div class="container"><br><br>
            <div class="row">
                <div class="col-sm-9">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Question - <span id="q_no"></span>
                        </div>
                        <div class="panel-body">
                            <p>
                                <span id="question"></span>
                            </p>

                            <p>
                                Marking : + <span id="positive_marks"></span>M, - <span id="negative_marks"></span>M
                            </p>
                        </div>
                        <div class="panel-footer clearfix">
                            <a href="#" class="btn btn-primary pull-right">Submit Response</a>
                        </div>
                    </div>

                </div>
                <div class="col-sm-3">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            Navigate through Questions
                        </div>
                        <div class="panel-body">
                            <%
                                App.countQuestions();
                                
                                for (int i = 1; i <= App.questionCount; ++i) {
                            %>
                            <a href="#" class="btn btn-primary" style="margin-top: 5px;"><%= i %></a> &nbsp;
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div><!-- row -->
        </div>
        <br>
        <br>

        <div id="footerwrap">
            <div class="container">
                <h4>Theme by <a href="http://blacktie.co">BlackTie.co</a> - Developed by Vamsi Sangam</h4>
            </div>
        </div>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->


        <script type="text/javascript" src="../js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../js/retina.js"></script>
        <script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="../js/smoothscroll.js"></script>
        <script type="text/javascript" src="../js/jquery-func.js"></script>
    </body>
</html>
