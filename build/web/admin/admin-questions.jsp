<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.ResultSet, java.sql.Connection, java.sql.DriverManager, java.sql.Statement" errorPage="../error.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Manipulate Questions</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="../css/bootstrap.min.css" rel="stylesheet"/>
		<link href="../css/Header-Footer.css" rel="stylesheet"/>
		<link href="../css/home.css" rel="stylesheet"/>
		<link href="../css/panel-styling.css" rel="stylesheet"/>
		<link rel="stylesheet" type="text/css" href="../css/default.css" />
		<script type="text/javascript" src="../jquery/jquery.min.js"></script>
		<script type="text/javascript">
			function addNew() {
				console.log("addNew() called");
				$('.add-question').removeAttr("hidden");
				$('#show-all').attr("hidden", "hidden");
				$('.remove').attr("hidden", "hidden");
			}

			function newQ() {
				$.getJSON("/Indem/addQuestion", {question: $('#question'), choice1: $('#choice1'), choice2: $('#choice2'), choice3: $('#choice3'), choice4: $('#choice4'), correct_ans: $('input[name=correct_ans]:checked').val()}, newQResponse);
				console.log("Some request sent");
			}

			function newQResponse() {
				console.log("Response recieved");
			}

			function showAll() {
                console.log("showAll called");
				$('.add-question').attr("hidden", "hidden");
				$('.add-text-single').attr("hidden", "hidden");
				$('#show-all').removeAttr("hidden");
			}

			function removeQ() {
                console.log("removeQ called");
				$('.add-question').attr("hidden", "hidden");
				$('.add-text-single').attr("hidden", "hidden");
				$('#show-all').attr("hidden", "hidden");
				$('.remove').removeAttr("hidden");
			}

			function qCategory() {
				if ($('input[name=category]:checked').val() === "single") {
					$('.single-correct').removeAttr("disabled");
					$('.multiple-correct').attr("disabled", "disabled");
				} else if ($('input[name=category]:checked').val() === "multiple") {
					$('.multiple-correct').removeAttr("disabled");
					$('.single-correct').attr("disabled", "disabled");
				}
			}

			function addImage() {
				$('#pic').removeAttr("disabled");
			}
		</script>
		<link rel="shortcut icon" href="../img/logo.png"/>
	</head>
	<body>
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
		<!--==========Questions Part==========-->
		<div class="container">
			<div class="panel panel-primary" style="padding: 5px; padding-bottom: 0px;">
				<div class="panel-heading">
					<h3>Manipulate Exam Questions</h3>
				</div>
				<div class="panel-body" style="padding-bottom: 0px;">
					<!--==========Selecting Operation Part==========-->
					<h4>Choose Operation -</h4><br>
					<div class="well well-sm">
						<div class="row">
							<div class="col-sm-5">
								<button class="btn btn-info pull-left" id="display" onclick="showAll()">Show all Questions</button>
							</div>
							<div class="col-sm-2">
									<button class="btn btn-info" id="add" onclick="addNew()">Add a new Question</button>
							</div>
							<div class="col-sm-5">
								<button class="btn btn-info pull-right" id="remove" onclick="removeQ()">Remove an Existing Question</button>
							</div>
						</div>
					</div>
					<div class="well well-sm clearfix">
						<form role="form" method="post" action="admin-home.jsp">
							<label for="btn" style="margin-top: 5px; margin-left: 10px;">Navigate Back</label>
							<input type="submit" class="btn btn-info pull-right" value="Go Back to Admin Home Page"/>
						</form>
					</div>
					<!--==========End of Selecting Operation Part==========-->
					<!--==========Filling Info to Add New Question==========-->
					<div class="panel panel-info add-question" hidden="hidden">
						<div class="panel-heading">
							<h4>Add a new Question</h4>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" role="form" action="/Indem/addQuestion" method="post" enctype="multipart/form-data">
								<div class="form-group">
									<label class="col-sm-2 control-label">
										Enter the Question - 
									</label>
									<div class="col-sm-10"> 
										<textarea class="form-control" name="question" rows="4" required="required"></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="btn btn-success"  style="margin-left: 35px; margin-bottom: 15px;" onclick="addImage()">Add an image to this Question!</div><br>
									<label for="inputfile" class="col-sm-2 control-label">Upload an Image - </label>
									<div class="col-sm-10" style="margin-top: 7px;">
										<input type="file" name="pic" id="pic" style="margin-left: 10px;" disabled="disabled"/><br>
										<p class="help-block">
											Please Choose only an Image File such as .jpg
										</p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">
										Option One - 
									</label>
									<div class="col-sm-10"> 
										<input type="text" class="form-control" name="choice1" placeholder="Enter First Option" required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">
										Option Two - 
									</label>
									<div class="col-sm-10"> 
										<input type="text" class="form-control" name="choice2" placeholder="Enter Second Option" required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">
										Option Three - 
									</label>
									<div class="col-sm-10"> 
										<input type="text" class="form-control" name="choice3" placeholder="Enter Third Option" required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">
										Option Four - 
									</label>
									<div class="col-sm-10"> 
										<input type="text" class="form-control" name="choice4" placeholder="Enter Fourth Option" required="required">
									</div>
								</div>
								<br>
								<label class="col-lg-3">Select the Answer Model - </label>
								<div class="col-lg-9" style="margin-top: -5px;">
									<div class="row">
										<div class="col-lg-6">
											<div class="panel panel-default">
												<div class="panel-heading" style="padding: 5px; padding-bottom: 5px;">
													<h4 style="margin-bottom: 5px;">
														<label class="checkbox-inline">
															<input type="radio" name="category" value="single" style="margin-right: 5px;" onchange="qCategory()" checked>
															Single Correct
														</label>
													</h4>
												</div>
												<div class="panel-body" style="padding-left: 25px;">
													<fieldset class="single-correct">
														<input type="hidden" name="category" value="single"/>
														<label>Choose the Correct Answer - </label>
														<div class="radio"> 
															<label>
																<input type="radio" name="radio" value="1" checked> 
																Option 1
															</label>
														</div> 
														<div class="radio"> 
															<label> 
																<input type="radio" name="radio" value="2"> 
																Option 2
															</label>
														</div>
														<div class="radio"> 
															<label> 
																<input type="radio" name="radio" value="3"> 
																Option 3
															</label>
														</div>
														<div class="radio"> 
															<label> 
																<input type="radio" name="radio" value="4"> 
																Option 4
															</label>
														</div>
													</fieldset>
												</div>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="single-correct panel panel-default">
												<div class="panel-heading" style="padding: 5px; padding-bottom: 5px;">
													<h4 style="margin-bottom: 5px;">
														<label class="checkbox-inline">
															<input type="radio" name="category" value="multiple" style="margin-right: 5px;" onchange="qCategory()">
															Multiple Correct
														</label>
													</h4>
												</div>
												<div class="panel-body" style="padding-left: 25px;">
													<fieldset disabled="disabled" class="multiple-correct">
														<input type="hidden" name="category" value="multiple"/>
														<label>Choose the Correct Answers - </label>
														<div class="checkbox">
															<label>
																<input type="checkbox" name="box" value="1">
																Option 1
															</label>
														</div>
														<div class="checkbox"> 
															<label>
																<input type="checkbox" name="box" value="2">
																Option 2
															</label> 
														</div>
														<div class="checkbox">
															<label>
																<input type="checkbox" name="box" value="3">
																Option 3
															</label>
														</div>
														<div class="checkbox"> 
															<label>
																<input type="checkbox" name="box" value="4">
																Option 4
															</label> 
														</div>
													</fieldset>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-2">
									<label>Select Category - </label>
								</div>
								<div class="col-sm-10">
									<div class="radio"> 
										<label> 
											<input type="radio" name="type" value="N" checked> 
											Networking Knowledge
										</label>
									</div>
									<div class="radio"> 
										<label> 
											<input type="radio" name="type" value="I"> 
											IQ
										</label>
									</div>
								</div>
								<div class="col-sm-12" style="margin-top: 20px;">
									<div class="col-sm-3">
										<label>Select Positive Marks - </label>
									</div>
									<div class="col-sm-1">
										<div class="form-group">
											<select class="form-control" name="positive_marks" required="required">
												<option value="1">1</option> 
												<option value="2">2</option>
												<option value="3" selected="selected">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
											</select>
										</div>
									</div>
									<div class="col-sm-3"></div>
									<div class="col-sm-3">
										<label>Select Negative Marks - </label>
									</div>
									<div class="col-sm-1">
										<div class="form-group">
											<select class="form-control" name="negative_marks" required="required">
												<option value="0" selected="selected">0</option> 
												<option value="1">1</option>
												<option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
											</select>
										</div>
									</div>
									<div class="col-sm-1"></div>
								</div>
								<br>
								<input type="submit" class="btn btn-info pull-right" id="submitInfo" value="Submit Info and Create New Question" style="margin-top: 15px;"/>
							</form>
						</div>
					</div>
					<!--==========End of Filling Info to Add New Question==========-->
					<!--==========Displaying All Questions==========-->
					<div class="panel panel-info" hidden="hidden" id="show-all">
						<div class="panel-heading">
							<h4>Displaying All Questions</h4>
						</div>
						<div class="panel-body" style="padding-bottom: 0px;">
							<%
								Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
								Connection con = DriverManager.getConnection("jdbc:sqlserver://e9vt0pk4l4.database.windows.net:1433;database=Products;user=VamsiSangam@e9vt0pk4l4;password=SQLServer123;encrypt=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
								Statement st = con.createStatement();
								ResultSet rs = st.executeQuery("select * from questions");
                                System.out.println("here..?");
								int i = 1;

								while (rs.next()) {
							%>
							<div class="panel panel-info">
								<div class="panel-heading">
									<h4>Question - <%= i%></h4>
								</div>
								<div class="panel-body">
									<%
										if (rs.getBytes(3) != null) {
									%>
									<img class="img-responsive" src="/Indem/displayphoto?q_no=<%= rs.getInt(1)%>"><br>
									<%
										}
									%>		
									<h4><%= rs.getString(2)%></h4>
									<br>
									<h4>Options - </h4>
									<ul>
										<li><%= rs.getString(4)%></li>
										<li><%= rs.getString(5)%></li>
										<li><%= rs.getString(6)%></li>
										<li><%= rs.getString(7)%></li>
									</ul>
									<br>
									<h4>Question Type - &nbsp;<%= rs.getString(8)%></h4>
									<h4>Correct Answer - Option(s)&nbsp;<%= rs.getString(9)%></h4>
									<h4>Positive Marks - &nbsp;<%= rs.getString(10)%></h4>
									<h4>Negative Marks - &nbsp;<%= rs.getString(11)%></h4>
								</div>
							</div>
							<%
									i++;
								}
                                
                                System.out.println("here..?2");
							%>
						</div>
					</div>
					<!--==========End of Displaying All Questions==========-->
					<!--==========Removing a Question==========-->
					<div class="panel panel-info remove" hidden="hidden">
						<div class="panel-heading">
							<h4>Remove A Question - </h4>
						</div>
						<div class="panel-body" style="padding-bottom: 0px;">
							<form role="form" action="/Indem/removeQuestion" method="post">
								<div class="form-group">
									<%
										rs = st.executeQuery("select * from questions");
										i = 1;
										while (rs.next()) {
									%>
									<div class="panel panel-info">
										<div class="panel-heading">
											<h4>Question - <%= i%></h4>
										</div>
										<div class="panel-body">
											<%
												if (rs.getBytes(3) != null) {
											%>
											<img class="img-responsive" src="/Indem/displayphoto?q_no=<%= rs.getInt(1)%>"><br>
											<%
												}
											%>
											<h4><%= rs.getString(2)%></h4>
											<br>
											<h4>Options - </h4>
											<ul>
												<li><%= rs.getString(4)%></li>
												<li><%= rs.getString(5)%></li>
												<li><%= rs.getString(6)%></li>
												<li><%= rs.getString(7)%></li>
											</ul>
											<br>
											<h4>Question Type - &nbsp;<%= rs.getString(8)%></h4>
											<h4>Correct Answer - Option(s)&nbsp;<%= rs.getString(9)%></h4>
											<h4>Positive Marks - &nbsp;<%= rs.getString(10)%></h4>
											<h4>Negative Marks - &nbsp;<%= rs.getString(11)%></h4><br>
											<div class="radio">
												<label> 
													<input type="radio" name="q_no" value="<%= rs.getInt(1)%>">
													Select this Question for Removal
												</label>
											</div>
										</div>
										<div class="panel-footer clearfix">
											<input type="submit" class="btn btn-info pull-right" value="Delete this Question"/>
										</div>
									</div>
									<%
											i++;
										}
									%>
								</div>
							</form>
						</div>
					</div>
					<!--==========End of Removing a Question==========-->
				</div>
			</div>
		</div>
		<!--==========End of Questions Part==========-->
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
					<img src="../img/flag3.png" id="flag">
					<!-- <script language="javascript" src="../js/live_clock.js"></script> -->
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