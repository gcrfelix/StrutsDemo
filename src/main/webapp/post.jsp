<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%
	String pageNo = (String)request.getAttribute("pageNo");	
	String pageName = (String)request.getAttribute("pageName");
	String accessToken = (String)request.getAttribute("accessToken");
	String postType = (String)request.getAttribute("postType");
	Boolean redirect = (Boolean)request.getAttribute("redirect");
%>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.min.css"/>
	<script src="js/jquery-1.11.3.js"></script>
</head>
<body>
	<form action="content.do" id="successForm" method="post">
		<input type="hidden" name="page" id="page" value="<%=pageNo %>"></input>
		<input type="hidden" name="post_type" id="post_type" value="<%=postType %>"></input>
   		<input type="hidden" name="accessToken" id="accessToken" value="<%=accessToken %>"></input>
   	</form>
	<script>
		$(function(){
			if(<%=redirect %>) {
				$("#successForm").submit();
			}
		});
	</script>
	<div class="container">
		<div class="well" style="width: 100%; text-align: center; padding-bottom: 42px;">
			<form method="post" action="post.do">
				<h2>A New <%=postType %> Post for "<%=pageName %>"</h2>
				<br />
				<textarea name="postContent" rows="5" cols="120">
	    		
	    		</textarea>
	    		
				<br />
				<input type="submit" class="pull-right btn btn-primary" value="Post"></input>
				<input type="hidden" name="accessToken" id="accessToken" value="<%=accessToken %>"></input>
	        	<input type="hidden" name="postType" id="postType" value="<%=postType %>"></input>
	        	<input type="hidden" name="pageNo" id="pageNo" value="<%=pageNo %>"></input>
			</form>
		</div>
		
	</div>
	
</body>
</html>