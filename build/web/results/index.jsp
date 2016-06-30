<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.ResultSet, java.sql.Connection, java.sql.DriverManager, java.sql.Statement" errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>
            INDEM Exam
        </title>
        <link href="../css/bootstrap.min.css" rel="stylesheet" />
        <link href="../css/colors.css" rel="stylesheet" />
        <link href="../css/Header-Footer.css" rel="stylesheet" />
        <link href="../css/panel-styling.css" rel="stylesheet" />
        <link href="../css/INDEM.css" rel="stylesheet" />
        <link href="../css/default.css" rel="stylesheet" type="text/css" />
        <link href="../img/logo.png" rel="shortcut icon" />
        <script src="../jquery/jquery.min.js" type="text/javascript" >

        </script>
        <script type="text/javascript">
            function feedback() {
                console.log("feedback() called");
                $.post("/Indem/myFeedback", {
                    roll_no: $('#roll_no').val(),
                    name: $('#name').val(),
                    feedback: $('#message').val()
                }, feedbackStatus);
            }

            function feedbackStatus(data) {
                console.log("in feedbackresponse");
                if (data.status === 1) {
                    console.log("in feedbackresponse success");
                    $('#roll_no').val("");
                    $('#name').val("");
                    $('#mesage').val("");
                } else {
                    console.log("in feedbackresponse fail");
                    $('#message').val("Your Previous Message could not be sent!");
                }
            }
        </script>
    </head>

    <body onLoad="show_clock();">
        <!--==========Header Part==========-->
        <div class="container-fluid">
            <div class="container-fluid row" id="main_header">
                <div class="visible-lg col-lg-2">
                    <img src="../img/logo.png" id="header_logo" class="img-responsive" alt="Responsive image">
                </div>
                <div class="col-lg-8 col-md-10 col-xs-12">
                    <h1 id="header_font1">
                        Rajiv Gandhi Institute of Information Technology
                    </h1>
                    <h2 id="header_font1">
                        (A Campus of IIIT Allahabad)
                    </h2>
                </div>
                <div class="visible-lg col-lg-2">
                </div>
            </div>
        </div>
        <br>
        <!--==========End of Header Part==========-->
        <div class="container">
            <div class="panel panel-primary no-border small-shadow">
                <div class="panel-heading pattern6 no-border">
                    <h3>
                        Examination Results
                    </h3>
                </div>
                <div class="panel-body pattern8 carve-border" style="padding-bottom: 5px;">
                    <div class="panel panel-primary no-border small-shadow">
                        <div class="panel-heading pattern no-border">
                            <h4>
                                Top 10
                            </h4>
                        </div>
                        <div class="panel-body no-border carve-border pattern7">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>
                                                Roll Number
                                            </th>
                                            <th>
                                                Score and Analysis
                                            </th>
                                        </tr>
                                        <%
                                            // System.out.println("ok 1");
                                            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                            // System.out.println("ok 2");
                                            Connection con = DriverManager.getConnection("jdbc:sqlserver://e9vt0pk4l4.database.windows.net:1433;database=Products;user=VamsiSangam@e9vt0pk4l4;password=SQLServer123;encrypt=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
                                            // System.out.println("ok 3");
                                            if (con == null) {
                                                System.out.println("con null");
                                        %>
                                    <h2>No Data. Please report to the invigilator immediately.</h2>
                                    <%
                                            return;
                                        }
                                        System.out.println("ok 4");
                                        Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                                        System.out.println("ok 5");
                                        ResultSet rs = st.executeQuery("select roll_no, name, total, networking, iq from students order by total desc");
                                        System.out.println("ok 6");
                                        int i = 1;
                                        System.out.println("ok 7");
                                        if (rs == null) {
                                            System.out.println("rs null");
                                    %>
                                    <h2>No Data. Please report to the invigilator immediately.</h2>
                                    <%
                                            return;
                                        }
                                        System.out.println("ok 8");
                                        while (rs.next() && i <= 10) {
                                    %>
                                    <tr>
                                        <td>
                                            <%= rs.getString(2)%>
                                            <br>
                                            <br>
                                            <%= rs.getString(1)%>
                                        </td>
                                        <td>
                                            <label>
                                                Total Score&nbsp;-&nbsp;
                                            </label>
                                            <%= rs.getInt(3)%>
                                            <br>
                                            <br>
                                            <label>
                                                Networking Knowledge -
                                            </label>
                                            <div class="progress progress-striped">
                                                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60"
                                                     aria-valuemin="0" aria-valuemax="100" style="width : <%= rs.getDouble(4)%>%;">
                                                    <%= rs.getDouble(4)%>
                                                    %
                                                    <span class="sr-only">
                                                        <%= rs.getDouble(4)%>
                                                        % Complete (info)
                                                    </span>
                                                </div>
                                            </div>
                                            <label>
                                                IQ -
                                            </label>
                                            <div class="progress progress-striped">
                                                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60"
                                                     aria-valuemin="0" aria-valuemax="100" style="width: <%= rs.getDouble(5)%>%;">
                                                    <%= rs.getDouble(5)%>
                                                    %
                                                    <span class="sr-only">
                                                        <%= rs.getDouble(5)%>
                                                        % Complete (info)
                                                    </span>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <%
                                            i++;
                                        }
                                    %>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-primary no-border small-shadow">
                        <div class="panel-heading pattern no-border">
                            <h4>
                                Scores List of all Candidates
                            </h4>
                        </div>
                        <div class="panel-body pattern7 carve-border">
                            <table class="table table-responsive table-striped">
                                <thead>
                                    <tr>
                                        <td>
                                            Rank
                                        </td>
                                        <td>
                                            Name
                                        </td>
                                        <td>
                                            Score
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%  rs.beforeFirst();
                                                                            i = 1;
                                                                            while (rs.next()) {%>
                                    <tr>
                                        <td>
                                            <%= i%>
                                        </td>
                                        <td>
                                            <%= rs.getString(2)%>
                                            &nbsp;(
                                            <%= rs.getString(1)%>
                                            )
                                        </td>
                                        <td>
                                            <%= rs.getInt(3)%>
                                        </td>
                                    </tr>
                                    <%
                                            ++i;
                                        }
                                    %>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="navbar navbar-inverse" style="margin-bottom: 10px;">
                        <div class="navbar-text clearfix">
                            Please send us a Feedback of what you think about the Examination!
                        </div>
                        <button class="navbar-btn btn btn-primary pull-right" style="" data-toggle="modal"
                                data-target="#myModal">
                            Feedback
                        </button>
                    </div>
                </div>
            </div>
            <!--=========Modal part============-->
            <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form class="form-horizontal">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">
                                    Feedback
                                </h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="name" class="col-lg-2 control-label" style="font-size: large; font-weight: 400">
                                        Name &nbsp;:
                                    </label>
                                    <div class="col-lg-10">
                                        <input type="text" class="form-control" id="name" placeholder="Your Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="roll_no" class="col-lg-2 control-label" style="font-size: large; font-weight: 400">
                                        Roll Number&nbsp;:
                                    </label>
                                    <div class="col-lg-10">
                                        <input type="text" class="form-control" id="roll_no" placeholder="Your Roll Number">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="contact-msg" class="col-lg-2 control-label" style="font-size: large; font-weight: 400">
                                        Message&nbsp;:
                                    </label>
                                    <div class="col-lg-10">
                                        <textarea class="form-control" rows="6" id="message" placeholder="Keep it Short and Sweet....!">
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary btn-md" data-dismiss="modal"
                                        onclick="feedback()">
                                    Send
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!--==========End of Modal part==========-->
        </div>
    </div>
</div>
<!--==========Footer Part==========-->
<!--==========Footer Part 1==========-->
<div class="container-fluid" id="footer1">
    <div class="col-lg-2 col-md-offset-1">
        <div class="row">
            <div class="col-lg-12">
                &nbsp;
            </div>
        </div>
        <img class="hidden-xs" src="../img/logo.png" id="end-logo" alt="logo">
        <div class="row">
            <div class="col-lg-12">
                &nbsp;
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="row">
            <div class="col-lg-12">
                &nbsp;
            </div>
        </div>
        <center>
            <font class="footer_font">
            Rajiv Gandhi Institute of Information Technology
            <br>
            (A Campus of IIIT Allahabad)
            <br>
            Tikarmafi, Amethi, Sultanpur District, UP-227413
            <br>
            Telefax - (05368)273222
            </font>
        </center>
        <div class="row">
            <div class="col-lg-12">
                &nbsp;
            </div>
        </div>
    </div>
    <div class="col-lg-3" style="padding: 25px 0px 0px 0px;">
        <center>
            <img src="../img/flag3.png" id="flag" alt="logo">
            <script language="javascript" src="../js/live_clock.js">

            </script>
        </center>
    </div>
</div>
<!--==========End of Footer Part 1==========-->
<!--==========Footer Part 2==========-->
<div class="container-fluid" id="footer2">
    <div class="row">
        <div class="col-lg-12">
            &nbsp;
        </div>
    </div>
    <center>
        <a class="btn btn-primary button" href="../pages/INDEM.html">INDEM</a>
        &nbsp;&nbsp;|&nbsp;
        <a class="btn btn-primary button" href="../developer/index.html">Developers</a>
    </center>
    <div class="row">
        <div class="col-lg-12">
            &nbsp;
        </div>
    </div>
</div>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<!--==========End of Footer Part 2==========-->
</body>

</html>