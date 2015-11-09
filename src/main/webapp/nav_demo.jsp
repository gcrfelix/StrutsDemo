<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		<ul id="demo_nav" class="nav nav-tabs nav-justified">
	      <li role="presentation"><a href="javascript:void(0);">Tab1 Title</a></li>
	      <li role="presentation" class="active"><a href="javascript:void(0);">Tab2 Title</a></li>
	    </ul>
	    <dir id="nav_content">
			Tab2 content
	    </dir>
	    <div id="tab1" style="display: none;">
	    	Tab1 content
	    </div>
	    <div id="tab2" style="display: none;">
	    	Tab2 content
	    </div>
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