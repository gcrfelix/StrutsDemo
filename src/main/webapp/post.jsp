<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.min.css"/>
		<script src="js/jquery-1.11.3.js"></script>
    </head>
    <body>

	<div class="container">
		<div class="well" style="width: 100%; text-align: center; padding-bottom: 42px;">
			<form method="post" action="post.do">
				<h1>New Post</h1>
				<br />
				<textarea name="postContent" rows="5" cols="120">
	    		
	    		</textarea>
				<br />
				<input type="submit" class="pull-right btn btn-primary" value="Post"></input>
			</form>
		</div>
	</div>
</body>
</html>