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
		<br>
		<!--==========End of Header Part==========-->
		<!--==========Feedback Part==========-->
		<div class="container">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>Feedback</h4>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<td>Roll Number</td>
									<td>Name</td>
									<td>Message</td>
								</tr>
							</thead>
							<tbody>
								<%
									Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
									Connection con = DriverManager.getConnection("jdbc:sqlserver://e9vt0pk4l4.database.windows.net:1433;database=Products;user=VamsiSangam@e9vt0pk4l4;password=SQLServer123;encrypt=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
									Statement st = con.createStatement();
									ResultSet rs = st.executeQuery("select * from feedback");
									
									while (rs.next()) {
								%>
								<tr>
									<td><%= rs.getString(1) %></td>
									<td><%= rs.getString(2) %></td>
									<td><%= rs.getString(3) %></td>
								</tr>
								<%	
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!--==========End of Feedback Part==========-->
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