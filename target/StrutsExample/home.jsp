<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<<<<<<< HEAD
        <script type="text/javascript" language="javascript" src="ajax1.js"></script>
        <script type="text/javascript" language="javascript" src="cart.js"></script>
        <script type="text/javascript" language="javascript" src="json_sans_eval.js"></script>
=======
		<link rel="stylesheet" type="text/css" href="css/bootstrap/css/bootstrap.min.css"/>
		<script src="js/jquery-1.11.3.js"></script>
>>>>>>> 56a95c12311cdcbeb829f05a6efe2a3e36901e09
        <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
        <link href="cartCss.css" type="text/css" rel="stylesheet"></link>
        <script>
            window.fbAsyncInit = function () {
                FB.init({
                    appId: '1518924365091713',
                    xfbml: true,
                    version: 'v2.5'
                });
            };

            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) {
                    return;
                }
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
            
            function loginFacebook() {
                FB.login(function(response) {
                    if (response.authResponse) {
<<<<<<< HEAD
                    	window.location.replace("content.do");
                    	/*
                        $.post('cart.do',{accessToken: response.authResponse.accessToken},function(ret){
=======
                    	//window.location.replace("content.do");
                    	$("#accessToken").val(response.authResponse.accessToken);
                    	$("#successForm").submit();
                    	/*
                        $.post('content.do',{accessToken: response.authResponse.accessToken},function(ret){
>>>>>>> 56a95c12311cdcbeb829f05a6efe2a3e36901e09
                        	    
                        })
                        */
                     alert('Welcome!  Fetching your information.... ');
                     FB.api('/me', function(response) {
                        console.log(response);
                        alert('Good to see you, ' + response.name + '.');
//                        window.location = 'index_1.jsp'
                     });
                    } else {
                     alert('User cancelled login or did not fully authorize.');
                    }
                }, {scope: 'public_profile,user_friends,email,user_events,user_managed_groups,user_posts,read_insights,read_audience_network_insights,manage_pages,publish_pages,publish_actions,pages_show_list,pages_manage_cta,pages_manage_leads,ads_read,ads_management'});
            }
        </script>
    </head>
    <body>
<<<<<<< HEAD
        <div>
	        <button onclick="loginFacebook()">FB Login</button>
=======
    	<div class="container">
	        <div style="text-align: center;">
		        <button class="btn btn-primary btn-lg btn-block" onclick="loginFacebook()">FB Login</button>
	        </div>
	        <div id="hiddenJump">
	        	<form action="content.do" id="successForm" method="post">
	        		<input type="hidden" name="accessToken" id="accessToken" value=""></input>
	        	</form>
	        </div>
>>>>>>> 56a95c12311cdcbeb829f05a6efe2a3e36901e09
        </div>
    </body>
</html>