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
			function executeQuery() {
				console.log("Inside ExecuteQuery() - " + $('#query').val());
				$.post("/Indem/executeQuery", {query : $('#query').val()}, showResult);
			}
			
			function showResult(data) {
				console.log("Show Result Called");
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
		<br>
		<!--==========End of Header Part==========-->
		<!--==========Displaying Table Part==========-->
		<div class="container">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>Students Table</h4>
				</div>
				<div class="panel-body">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h4>Structure of Database (students)</h4>
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<td>Row Name</td>
											<td>Datatype</td>
											<td>Primary Key</td>
											<td>Unique</td>
											<td>Null</td>
											<td>Default Value</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>roll_no</td>
											<td>varchar(10)</td>
											<td>YES</td>
											<td>YES</td>
											<td>NO</td>
											<td>NULL</td>
										</tr>
										<tr>
											<td>name</td>
											<td>varchar(45)</td>
											<td>NO</td>
											<td>NO</td>
											<td>YES</td>
											<td>NULL</td>
										</tr>
										<tr>
											<td>networking</td>
											<td>double(5, 2)</td>
											<td>NO</td>
											<td>NO</td>
											<td>YES</td>
											<td>0.000</td>
										</tr>
										<tr>
											<td>iq</td>
											<td>double(5, 2)</td>
											<td>NO</td>
											<td>NO</td>
											<td>YES</td>
											<td>0.000</td>
										</tr>
										<tr>
											<td>total</td>
											<td>tinyint(4)</td>
											<td>NO</td>
											<td>NO</td>
											<td>YES</td>
											<td>0</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading">
							<h4>Database Table</h4>
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-responsive table-striped">
									<thead>
										<tr>
											<td>No.</td>
											<td>roll_no</td>
											<td>name</td>
											<td>networking</td>
											<td>iq</td>
											<td>total</td>
										</tr>
									</thead>
									<tbody>
										<%
											Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
											Connection con = DriverManager.getConnection("jdbc:sqlserver://e9vt0pk4l4.database.windows.net:1433;database=Products;user=VamsiSangam@e9vt0pk4l4;password=SQLServer123;encrypt=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
											Statement st = con.createStatement();
											ResultSet rs = st.executeQuery("select * from students order by roll_no");

											int i = 1;

											while (rs.next()) {
										%>
										<tr>
											<td><%= i%></td>
											<td><%= rs.getString(1)%></td>
											<td><%= rs.getString(2)%></td>
											<td><%= rs.getString(3)%></td>
											<td><%= rs.getDouble(4)%></td>
											<td><%= rs.getDouble(5)%></td>
										</tr>
										<%
												++i;
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--==========End of Displaying Table Part==========-->
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