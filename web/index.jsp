<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>RGIIT</title>
		<link href="css/bootstrap.min.css" rel="stylesheet"/>
		<link href="css/Header-Footer.css" rel="stylesheet"/>
		<link href="css/home.css" rel="stylesheet"/>
		<link href="css/colors.css" rel="stylesheet"/>
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<script type="text/javascript" src="jquery/jquery.min.js"></script>
		<script type="text/javascript">
			function countdown() {
				$.getJSON("/Indem/getDate", {}, displayDeadline);

				if ($('#days').val() === "0" && $('#hours').val() === "0" && $('#minutes').val() === "0" && $('#seconds').val() === "0") {
					$("#days").val(0);
					$("#hours").val(0);
					$("#minutes").val(0);
					$("#seconds").val(0);
					return;
				} else if ($('#days').val() < 0 || $('#hours').val() < 0 || $('#minutes').val() < 0 || $('#seconds').val() < 0) {
					$("#days").val(0);
					$("#hours").val(0);
					$("#minutes").val(0);
					$("#seconds").val(0);
					return;
				}

				setTimeout(countdown, 1000);
			}

			function displayDeadline(data) {
				if ($('#days').val() === "0" && $('#hours').val() === "0" && $('#minutes').val() === "0" && $('#seconds').val() === "0") {
					$('#roll_no').removeAttr('disabled');
					$('#name').removeAttr('disabled');
					return;
				}
				$("#days").val(data.days);
				$("#hours").val(data.hours);
				$("#minutes").val(data.minutes);
				$("#seconds").val(data.seconds);
				console.log("Countdown Updated!\n");
			}

			function addCandidate() {
				$('#loading').removeAttr("hidden");
				$.getJSON("/Indem/addCandidate?roll_no=" + $('#roll_no').val() + "&name=" + $('#name').val(), {}, validateAddCandidate);
			}

			function validateAddCandidate(data) {
				if (data.status === 1) {
					console.log("Candidate Added Successfully!");
					$('#loading').attr("hidden", "hidden");

					if ($('#days').val() === "0" && $('#hours').val() === "0" && $('#minutes').val() === "0" && $('#seconds').val() === "0") {
						$('#login-btn').removeAttr('disabled');
					}
				} else {
					console.log("Candidate could not be added!");
				}
			}
		</script>
		<link rel="shortcut icon" href="img/logo.png"/>
	</head>
	<body onLoad="show_clock();countdown()">
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
		<br>
		<!--==========Body Content Container==========-->
		<div class="container">
			<div class="panel panel-primary pattern8 no-border small-shadow">
				<div class="panel-heading pattern6" style="border-bottom: none">
					<h3 class="panel-title" style="font-size: 20pt">INDEM Examination</h3>
				</div>
				<div class="panel-body pattern8" style="padding-bottom: 0px;">
					<div class="panel panel-primary pattern no-border small-shadow">
						<div class="panel-heading pattern no-border">
							<h4>Welcome to the INDEM Team Recruitment Examination</h4>
						</div>
						<div class="panel-body pattern7">
							The members of INDEM Team heartily welcome all Freshers to the Examination.
							This examination is conducted every year to recruit the most capable students amoung
							the BTech First Year batch to IIITA's official and the most prestigious club, the INDEM Club.
							The members of INDEM Club maintain and administrate the complete Campus Network.
							They take care of everything related to the functionality of the network implemented
							in the campus and also to bring new advanced technologies to upgrade the existing
							Campus Network, but the members of INDEM Club are not responsible for the Internet
							Speed. We hope that your efforts pay off today and we wish you good luck! All the Best!
						</div>
						<div class="panel-footer clearfix pattern7">
							<form role="form" action="syllabus/index.html">
								<h4 style="margin-top: 4px; margin-bottom: 0px; display: inline-block">Plan your Work, and, Work your Plan!</h4>
								<input type="submit" class="btn btn-primary pull-right" value="Syllabus"/> 
							</form>
						</div>
					</div>
					<div class="panel panel-primary no-border pattern small-shadow">
						<div class="panel-heading pattern no-border">
							<h4>Rules and Regulations</h4>
						</div>
						<div class="panel-body pattern7 carve-border">
							<ul>
								<li>
									Please carry your College ID Cards or Enrollment Sheets.
								</li>
								<li>
									Candidates may bring only a single pen and a paper for rough work.
								</li>
								<li>
									Please enter your Roll Number and your Name and click anywhere outside on the page. After the validation you may start the examination.
								</li>
								<li>
									If a candidate is caught by entering a roll number which is not their's, he / she will be <strong>disqualified</strong> for the examination.
								</li>
								<li>
									The Examination consists of 41 questions. Attempting any question is not mandatory.
								</li>
								<li>
									Marking scheme for the question will be mentioned. There <strong>may</strong> be negative
									marking.
								</li>
								<li>
									The questions <strong>may be</strong> multiple choice based / single correct. It may have images. Read the
									question carefully.
								</li>
								<li>
									If you have any doubts regarding the question or the Images are not displayed
									properly, please talk to the invigilator at once.
								</li>
								<li>
									Mischief of any kind will not be tolerated. In such cases the candidate
									maybe disqualified.
								</li>
								<li>
									Top 10 will be short listed and will qualify for further judgement.
								</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6" style="padding-left:  0px; padding-right: 0px;">
						<div class="panel panel-primary no-border small-shadow">
							<div class="panel-heading pattern no-border">
								<h4>Please Enter your Login Credentials</h4>
							</div>
							<div class="panel-body pattern7 carve-border"  style="padding-bottom: 20px;">
								<div class="col-lg-12">
									<form class="form-horizontal" role="form" action="/Indem/client/client-exam.jsp" method="post" style="margin-top: 10px;">
										<div class="form-group">
											<label class="col-sm-3 control-label" style="margin-top: 5px;">Roll Number</label>
											<div class="col-sm-8" style="margin-top: 10px;">
												<input type="text" class="form-control" name="roll_no" id="roll_no" required="required" placeholder="Enter your Roll Number (in Caps)" disabled="disabled">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" style="margin-top: 5px;">Name</label>
											<div class="col-sm-8" style="margin-top: 10px;">
												<input type="text" class="form-control" name="name" id="name" required="required" onblur="addCandidate()" placeholder="Enter your Name" disabled="disabled">
											</div>
											<div class="col-sm-1" style="margin-top: 12px; margin-left: -10px;">
												<img  src="img/loading.gif" alt="loading" id="loading" hidden="hidden"/>
											</div>
										</div>
										<div>
											<input type="submit" class="btn btn-info pull-right" id="login-btn" disabled="disabled" value="Log in and Start my Exam!" style="margin-top: 17px;"/>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6" style="padding-right: 0px;">
						<div class="panel panel-primary no-border small-shadow">
							<div class="panel-heading pattern no-border">
								<h4>Countdown!</h4>
							</div>
							<div class="panel-body pattern7 carve-border">
								<center>
									<div class="row">
										<div class="col-lg-3 time-box">
											<label class="control-label">Days</label>
											<input type="text" readonly="readonly" id="days" class="form-control" />
										</div>
										<div class="col-lg-3 time-box">
											<label class="control-label">Hours</label>
											<input type="text" readonly="readonly" id="hours" class="form-control" />
										</div>
										<div class="col-lg-3 time-box">
											<label class="control-label">Minutes</label>
											<input type="text" readonly="readonly" id="minutes" class="form-control" /> 
										</div>
										<div class="col-lg-3 time-box">
											<label class="control-label">Seconds</label>
											<input type="text" readonly="readonly" id="seconds" class="form-control" />
										</div>
									</div>
								</center>
								<center>
									<h4 style="margin-bottom: 0px;">Are you Prepared......?!</h4>
								</center>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--==========End of Body Content Container==========-->
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
					<img src="img/flag3.png" alt="flag" id="flag">
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