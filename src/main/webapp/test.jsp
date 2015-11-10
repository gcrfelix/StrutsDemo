<%@page import="java.util.List"%>
<%@page import="com.pageManager.model.FBPage"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String noPage = (String)request.getAttribute("noPage");
	List<FBPage> pages = (List)request.getAttribute("pages");
	Integer pageNo = new Integer(request.getParameter("page"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.min.css"/>
	<script src="js/jquery-1.11.3.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1 class="well" style="text-align: center;">Content page</h1>
		<div><%=noPage %></div>
		<%
			for(int i=0; i<pages.size(); i++) {
		%>
				
		<div class="test">
			<%=pages.get(i) %>
		</div>
		
		<%} %>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#test").text("js work well");
		});
	</script>
</body>
</html>