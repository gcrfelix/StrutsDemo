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
                    	//window.location.replace("content.do");
                    	$("#accessToken").val(response.authResponse.accessToken);
                    	$("#successForm").submit();
                    	/*
                        $.post('content.do',{accessToken: response.authResponse.accessToken},function(ret){
                        	    
                        })
                        */
                     FB.api('/me', function(response) {
                        console.log(response);
                     });
                    } else {
                     alert('User cancelled login or did not fully authorize.');
                    }
                }, {scope: 'public_profile,user_friends,email,user_events,user_managed_groups,user_posts,read_insights,read_audience_network_insights,manage_pages,publish_pages,publish_actions,pages_show_list,pages_manage_cta,pages_manage_leads,ads_read,ads_management'});
            }
        </script>
    </head>
    <body>
    	
    	<div class="well" style="width: 100%; text-align: center;">
    		<h1>Facebook Page Manager</h1>
    		<br/>
    		<span>a great tool to manage regular/advertisement posts for your pages</span>
   		</div>
		<div class="container">
    		<div></div>
	        <div style="text-align: center;">
		        <button class="btn btn-primary btn-lg btn-block" onclick="loginFacebook()">Login</button>
	        </div>
	        <div id="hiddenJump">
	        	<form action="content.do" id="successForm" method="post">
	        		<input type="hidden" name="accessToken" id="accessToken" value=""></input>
	        	</form>
	        </div>
        </div>
    </body>
</html>