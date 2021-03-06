<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.demandware.vulnapp.flags.*"%>
<%@ page import="com.demandware.vulnapp.sessionmgmt.*"%>
<%@ page import="com.demandware.vulnapp.servlet.*"%>
<%@ page import="com.demandware.vulnapp.challenge.*"%>
<%@ page import="com.demandware.vulnapp.challenge.impl.*"%>
<%@ page import="com.demandware.vulnapp.util.*"%>
<%@ page import="com.demandware.vulnapp.servlet.Dictionary"%>
<%@ page import="java.util.*"%>

<%--

Command Injection Challenge

 --%>
<%
	DIVAServletRequestWrapper req = (DIVAServletRequestWrapper) request;
	SessionStorage sessionStore = (SessionStorage)req.getInformation(Dictionary.SESSION_STORE_OBJ);
	CommandInjectionChallenge chall = (CommandInjectionChallenge) req
			.getInformation(Dictionary.CURRENT_CHALLENGE_OBJ);
	String output = chall.handleChallengeRequest(req);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>DIVA - Overview</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<jsp:include page="../jspincludes/include_head.jsp" flush="true"></jsp:include>
</head>
<body>
	<div class="wrapper">
		<div class="box">
			<div class="row row-offcanvas row-offcanvas-left">
				<jsp:include page="../jspincludes/sidebar.jsp" flush="true"></jsp:include>

				<!-- main right col -->
				<div class="column col-sm-10 col-xs-11" id="main">

					<jsp:include page="../jspincludes/topnav.jsp" flush="true"></jsp:include>

					<div class="padding">
						<div class="full col-sm-9">

							<!-- content -->
							<div class="row">

								<!-- main col right -->
								<div class="col">

									<div class="well">
										<h3>Challenge</h3>
									</div>

									<div class="panel panel-default">

										<div class="panel-body">
											<div id="challenge">
												<h4>Is this host up?</h4>
												<h5>Note: Please use IP addresses. There seems to be
													something wrong with the environment</h5>
												<br/>
												<form method=POST autocomplete="off">
													<input type="text"
														name="<%=CommandInjectionChallenge.PING_PARAM%>">
													<input type="submit" value="Ping">
												</form>
												<br/>
												<h4>Output</h4>
												<pre><%=output%></pre>
											</div>
										</div>
									</div>

								</div>
								<!--/row-->

								<jsp:include page="../jspincludes/footer.jsp" flush="true"></jsp:include>

							</div>
							<!-- /col-9 -->
						</div>
						<!-- /padding -->
					</div>
					<!-- /main -->

				</div>
			</div>
		</div>
</body>
</html>