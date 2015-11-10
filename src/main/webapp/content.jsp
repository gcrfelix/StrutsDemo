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
	
	String accessToken = (String)request.getAttribute("accessToken");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/css/bootstrap.min.css" />
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
		  			<%="active"%>
		  			<%}%>">
					<a href="content.do?page=<%=i%>&post_type=published"><%=pages.get(i).getName()%></a>
				</li>
				<%
					}
				%>
			</ul>
		</div>
		
		<div class="container-fluid"  style="margin-top: 10px;">
			<div class="row">
				<div class="col-md-2">
					<ul class="nav nav-pills nav-stacked">
						<li role="presentation"
							class="<%if (postType.equals("published")){%>
				  			<%="active"%>
				  			<%}%>">
							<a href="content.do?page=<%=pageNo%>&post_type=published">Published</a>
						</li>
						<li role="presentation"
							class="<%if (postType.equals("unpublished")){%>
				  			<%="active"%>
				  			<%}%>">
							<a href="content.do?page=<%=pageNo%>&post_type=unpublished">Unpublished</a>
						</li>
					</ul>
				</div>
				<div class="col-md-10">
					<div class="panel panel-default">
					  <div class="panel-heading">
					    <h3 class="panel-title" style="height: 30px;">
					    	<span ><%=postType.toUpperCase() %> Posts</span>
					    	<form action="post.do" id="successForm" method="post">
	        					<input type="hidden" name="accessToken" id="accessToken" value="<%=accessToken %>"></input>
	        					<input type="hidden" name="postType" id="postType" value="<%=postType %>"></input>
	        					<input type="hidden" name="pageNo" id="pageNo" value="<%=pageNo %>"></input>
						    	<input type="submit" class="pull-right btn btn-primary" value="New <%=postType.toUpperCase() %> Post"></input>
	        				</form>
					    </h3>
					  </div>
					  <div class="panel-body">
					  
			
		<%
			  	FBPage currentPage = pages.get(pageNo);
				for(FBPost post : currentPage.getPosts()) {
			if ((post.isPublished() && postType.equals("published")) || (!post.isPublished() && postType.equals("unpublished"))){
		%>
		<div class="row">
			<div class="col-md-1">
			</div>
			<div class="col-md-8">
				<div class="container-fluid well well-sm">
					<div class="row">
						<div class="col-md-6">
							<span><%=post.getContent().substring(0, Math.min(post.getContent().length(), 100000)) %></span>
						</div>
						<div class="col-md-6"  style="text-align: center;">
							<span><%="Number of Views: " + post.getViews()%></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%
			}}
		%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$("#demo_nav li").click(function() {
			var index = $(this).index();
			$("#demo_nav li").removeClass("active");
			$(this).addClass("active");
			$("#nav_content").html($("#tab" + (index + 1)).html());
		});
	</script>
</body>
</html>