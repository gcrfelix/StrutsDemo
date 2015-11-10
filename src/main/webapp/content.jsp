<%@page import="java.util.ArrayList"%>
<%@page import="com.pageManager.model.FBPage"%>
<%@page import="com.pageManager.model.FBPost"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String noPage = (String)request.getAttribute("noPage");
	ArrayList<FBPage> pages = (ArrayList)request.getAttribute("pages");
	String pageNoStr = request.getParameter("page");
	Integer pageNo = 0;
	if (pageNoStr != null) {
		pageNo = new Integer(pageNoStr);
	}
	
	String postType = "published";
	if (request.getParameter("post_type") != null) {
		postType = request.getParameter("post_type");
	}
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
		<div class="bs-example" data-example-id="simple-nav-justified">
	    <ul class="nav nav-tabs nav-justified">
	      <%
			for(int i=0; i<pages.size(); i++) {
		  %>
			<li role="presentation"
		  		class="<%if (i==pageNo){%>
		  			<%= "active" %>
		  			<%} %>"
		  	>
		  		<a href="content.do?page=<%=i%>&post_type=published"><%= pages.get(i).getName() %></a>
		  	</li>
		  <%} %>
	    </ul>
	    <br>
	    <ul class="nav nav-pills nav-justified">
	   		<li role="presentation" class="<%if (postType.equals("published")){%>
		  			<%= "active" %>
		  			<%} %>">
		  		<a href="content.do?page=<%=pageNo%>&post_type=published">Published</a>
			</li>
	      	<li role="presentation" class="<%if (postType.equals("unpublished")){%>
		  			<%= "active" %>
		  			<%} %>">
	      		<a href="content.do?page=<%=pageNo%>&post_type=unpublished">Unpublished</a>
	      	</li>
	    </ul>
	  </div>
	  <%
	  	FBPage currentPage = pages.get(pageNo);
		for(FBPost post : currentPage.getPosts()) {
			if ((post.isPublished() && postType.equals("published")) || (!post.isPublished() && postType.equals("unpublished"))){
	  %>
	  	<div class="row">
		  	<div class="col-md-4">
		  		<%= post.getContent()%>
		  	</div>
		  	<div class="col-md-4">
		  		<%= "Number of Views: " + post.getViews()%>
		  	</div>
	    </div>
	  <%}} %>
	  
	</div>
	
	<script type="text/javascript">
		$("#demo_nav li").click(function(){
			var index = $(this).index();
			$("#demo_nav li").removeClass("active");
			$(this).addClass("active");
			$("#nav_content").html($("#tab"+(index+1)).html());
		});
	</script>
</body>
</html>