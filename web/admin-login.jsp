<%@page contentType="text/html" pageEncoding="UTF-8"  errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>INDEM Exam Admin</title>
		<link href="css/bootstrap.min.css" rel="stylesheet"/>
		<link href="css/Header-Footer.css" rel="stylesheet"/>
		<link href="css/panel-styling.css" rel="stylesheet"/>
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="shortcut icon" href="img/logo.png"/>
		<script type="text/javascript" src="jquery/jquery.min.js"></script>
	</head>
	<body onLoad="show_clock()">
		<!--==========Header Part==========-->
		<div class="container-fluid">
			<div class="container-fluid row" id="main_header">
				<div class="visible-lg col-lg-2">
					<img src="img/logo.png" id="header_logo" class="img-responsive" alt="Responsive image">
				</div>
				<div class="col-lg-8 col-md-10 col-xs-12">
					<h1 id="header_font1">Rajiv Gandhi Institute of Information Technology</h1><h2 id="header_font1">(A Campus of IIIT Allahabad)</h2>
				</div>
				<div class="visible-lg col-lg-2"></div>
			</div>
		</div>
		<!--==========End of Header Part==========-->
		<!--==========Login Part==========-->
		<div class="container">
			<br>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 style="margin: 0px;">INDEM Exam Administrator Login Page</h3>
				</div>
				<div class="panel-body" style="padding: 25px;">
					<img class="img-responsive" alt="featuredImage" src="img/IT.jpg" style="margin: auto"/>
					<br><br>
					<form role="form" class="form-horizontal" method="post" action="/Indem/adminValidate">
							<div class="form-group">
								<label for="username" class="col-sm-2 control-label">
									Username : 
								</label>
								<div class="col-sm-10"> 
									<input type="text" class="form-control" name="username" placeholder="Enter the Username"/> 
								</div>
							</div>
							<div class="form-group">
								<label for="pswd" class="col-sm-2 control-label">
									Password : 
								</label>
								<div class="col-sm-10"> 
									<input type="password" class="form-control" name="pswd" placeholder="Enter the Password"/> 
								</div>
							</div>
						<input type="submit" class="btn btn-info pull-right" value="Submit"/>
						</form>
					<br>
				</div>
			</div>
		</div>
		<!--==========End of Login Part==========-->
		<!--==========Footer Part==========-->
		<!--==========Footer Part 1==========-->
		<div class="container-fluid" id="footer1">
			<div class="col-lg-2 col-md-offset-1">
				<div class="row">
					<div class="col-lg-12">&nbsp;</div>
				</div>
				<img class="hidden-xs" src="img/logo.png" id="end-logo" alt="logo">
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
					<img src="img/flag3.png" id="flag" alt="logo">
					<script language="javascript" src="js/live_clock.js"></script>
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
				<a href="pages/INDEM.html" class="btn btn-primary button">INDEM</a>&nbsp;&nbsp;|&nbsp;
				<a href="developer/index.html" class="btn btn-primary button">Developers</a>
			</center>
			<div class="row">
				<div class="col-lg-12">&nbsp;</div>
			</div>
		</div>
		<!--==========End of Footer Part 2==========-->
	</body>
</html>