<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.ResultSet, java.sql.Connection, java.sql.DriverManager, java.sql.Statement" errorPage="../error.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>INDEM Exam Admin</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="../css/bootstrap.min.css" rel="stylesheet"/>
		<link href="../css/Header-Footer.css" rel="stylesheet"/>
		<link href="../css/panel-styling.css" rel="stylesheet"/>
		<link rel="stylesheet" type="text/css" href="../css/default.css" />
		<link rel="shortcut icon" href="../img/logo.png"/>
		<script type="text/javascript" src="../jquery/jquery.min.js"></script>
		<script type="text/javascript">
			function changeExamDate() {
				$('#exam-date-change').val("Changing....");
				$.getJSON("/Indem/updateDate?exam-date=" + $('#exam-date').val(), {}, changeResponse);
			}

			function changeResponse(data) {
				if (data.status) {
					$('#exam-date-change').val(data.status);
				}
			}
		</script>
	</head>
	<body onLoad="show_clock()">
		<!--==========Header Part==========-->
		<div class="container-fluid">
			<div class="container-fluid row" id="main_header">
				<div class="visible-lg col-lg-2">
					<img src="../img/logo.png" id="header_logo" class="img-responsive" alt="Responsive image">
				</div>
				<div class="col-lg-8 col-md-10 col-xs-12">
					<h1 id="header_font1">Rajiv Gandhi Institute of Information Technology</h1><h2 id="header_font1">(A Campus of IIIT Allahabad)</h2>
				</div>
				<div class="visible-lg col-lg-2"></div>
			</div>
		</div>
		<!--==========End of Header Part==========-->
		<!--==========Admin Section==========-->
		<br>
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3>INDEM Exam Admin Page</h3>
				</div>
				<div class="panel-body">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h4>Basic Navigation</h4>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" role="form" action="admin-schema.html">
								<div class="form-group">
									<label class="col-sm-3 control-label">Schema Information</label>
									<div class="col-sm-2">
										<input type="submit" class="form-control btn btn-info" value="View Schema"/>
									</div>
								</div>
							</form>
							<form class="form-horizontal" role="form" action="admin-questions.jsp">
								<div class="form-group">
									<label class="col-sm-3 control-label">Manipulate Exam Questions</label>
									<div class="col-sm-2">
										<input type="submit" class="form-control btn btn-info" value="Manage Questions"/>
									</div>
								</div>
							</form>
							<form class="form-horizontal" role="form" action="admin-studentsTable.jsp">
								<div class="form-group">
									<label class="col-sm-3 control-label">Student's Table</label>
									<div class="col-sm-3">
										<input type="submit" class="form-control btn btn-info" value="View Students Database"/>
									</div>
								</div>
							</form>
							<form class="form-horizontal" role="form" action="admin-answersTable.jsp">
								<div class="form-group">
									<label class="col-sm-3 control-label">Answers Table</label>
									<div class="col-sm-3">
										<input type="submit" class="form-control btn btn-info" value="View Answers Database"/>
									</div>
								</div>
							</form>
							<form class="form-horizontal" role="form" action="admin-feedback.jsp">
								<div class="form-group">
									<label class="col-sm-3 control-label">Check your Feedbacks</label>
									<div class="col-sm-2">
										<input type="submit" class="form-control btn btn-info" value="Feedbacks"/>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading">
							<h4>Exam-Details Table</h4>
						</div>
						<div class="panel-body">
							<table class="table table-bordered">
								<thead>
									<tr>
										<td>exam_Date</td>
										<td>duration_mins</td>
										<td>max_questions</td>
									</tr>
								</thead>
								<tbody>
									<%
										Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
										Connection con = DriverManager.getConnection("jdbc:sqlserver://e9vt0pk4l4.database.windows.net:1433;database=Products;user=VamsiSangam@e9vt0pk4l4;password=SQLServer123;encrypt=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery("select * from exam_details");
										
										while (rs.next()) {
									%>
									<tr>
										<td><%= rs.getString(1) %></td>
										<td><%= rs.getInt(2) %></td>
										<td><%= rs.getInt(3) %></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
							<br>
							<form class="form-horizontal" role="form">
								<div class="form-group">
									<label for="exam-date" class="col-sm-3 control-label">Change the Day of Examination</label>
									<div class="col-sm-6">
										<input type="datetime-local" class="form-control" id="exam-date">
									</div>
									<div class="col-sm-1">
										<input type="button" onclick="changeExamDate()" class="btn btn-default" value="Submit"/>
									</div>
									<div class="col-sm-2">
										<input type="text" readonly="readonly" id="exam-date-change" class="form-control"/>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--==========End of Admin Section==========-->
		<!--==========Footer Part==========-->
		<!--==========Footer Part 1==========-->
		<div class="container-fluid" id="footer1">
			<div class="col-lg-2 col-md-offset-1">
				<div class="row">
					<div class="col-lg-12">&nbsp;</div>
				</div>
				<img class="hidden-xs" src="../img/logo.png" id="end-logo" alt="logo">
				<div class="row">
					<div class="col-lg-12">&nbsp;</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="row">
					<div class="col-lg-12">&nbsp;</div>
				</div>
				<center><font class="footer_font">Rajiv Gandhi Institute of Information Technology<br>
					(A Campus of IIIT Allahabad)<br>
					Tikarmafi, Amethi, Sultanpur District, UP-227413<br>
					Telefax - (05368)273222</font></center>
				<div class="row">
					<div class="col-lg-12">&nbsp;</div>
				</div>
			</div>
			<div class="col-lg-3" style="padding: 25px 0px 0px 0px;">
				<center>
					<img src="../img/flag3.png" id="flag" alt="logo">
					<script language="javascript" src="../js/live_clock.js"></script>
				</center>
			</div>
		</div>
		<!--==========End of Footer Part 1==========-->
		<!--==========Footer Part 2==========-->
		<div class="container-fluid" id="footer2">
			<div class="row">
				<div class="col-lg-12">&nbsp;</div>
			</div>
			<center>
				<a href="../pages/INDEM.html" class="btn btn-primary button">INDEM</a>&nbsp;&nbsp;|&nbsp;
				<a href="../developer/index.html" class="btn btn-primary button">Developers</a>
			</center>
			<div class="row">
				<div class="col-lg-12">&nbsp;</div>
			</div>
		</div>
		<!--==========End of Footer Part 2==========-->
	</body>
</html>