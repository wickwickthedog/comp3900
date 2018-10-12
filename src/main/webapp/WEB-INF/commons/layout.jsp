<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Home</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS -->
<!-- Bootstrap CSS
        ============================================ -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Icon Font CSS
        ============================================ -->
<link rel="stylesheet" href="css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- Plugins CSS
        ============================================ -->
<link rel="stylesheet" href="css/plugins.css">
<!-- Style CSS
        ============================================ -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/themes/icon.css">
</head>

<body>
	<!-- Body main wrapper start -->
	<div class="wrapper fix">

		<!-- Header Area Start -->
		<div id="header-area" class="header-area section">

			<!-- Header Top Start -->
			<div class="header-top">
				<div class="container">
					<div class="row">
						<div class="header-info text-left col-md-6"></div>
						<c:set var="user" value="${sessionScope.userSession}" />
						<c:choose>
							<c:when test="${empty sessionScope.userSession}">
								<div class="header-social text-right col-md-6 hidden-xs">
									<a href="javascript:toLogin()">Login</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="header-social text-right col-md-6 hidden-xs">
									${sessionScope.userSession.userName}<a href="${pageContext.request.contextPath}/userLogout"> Logout</a> <a href="${pageContext.request.contextPath}/toUpdateUser"> My Profile</a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<!-- Header Top End -->

			<!-- Header Bottom Start -->
			<div class="header-bottom">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">

							<div class="navbar-header">
								<button class="menu-toggle navbar-toggle collapsed" data-toggle="collapse" data-target="#main-menu">
									<i class="zmdi open zmdi-menu"></i> <i class="zmdi close zmdi-close"></i>
								</button>
								<a class="navbar-brand logo" href="toIndex"><img src="images/logo.png" alt=""></a>
							</div>

							<!---- Menu ---->
							<div id="main-menu" class="main-menu onepage-nav collapse navbar-collapse float-right">
								<nav>
								<ul>
									<li id="home"><a href="./toIndex">Home</a></li>
									<c:if test="${! empty sessionScope.userSession}">

										<li id="host"><a href="./toHostView">Host</a></li>
										<li id="booking"><a href="./toBookingManagement">My Booking</a></li>
										<li id="advertisement"><a href="./toAdvManagement">My Advertisement</a></li>
									</c:if>
								</ul>
								</nav>
							</div>

						</div>
					</div>
				</div>
			</div>
			<!-- Header Bottom End -->
		</div>
	</div>
</body>
<!-- Body main wrapper end -->

<!-- JS -->

<!-- jQuery JS
        ============================================ -->
<script src="js/vendor/jquery-1.12.0.min.js"></script>
<!-- Bootstrap JS
        ============================================ -->
<script src="js/bootstrap.min.js"></script>
<!-- Plugins JS
        ============================================ -->
<script src="js/plugins.js"></script>
<!-- Ajax Mail JS
        ============================================ -->
<script src="js/ajax-mail.js"></script>
<!-- Main JS
        ============================================ -->
<script src="js/main.js"></script>
<script src="js/bootstrap-datetimepicker.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/json2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery.form.js"></script>
<script type="text/javascript">
	var pathName;
	$(function() {
		pathName = window.location.pathname;
		pathName = pathName.match(/\/accommodation\/(.*)$/)[1];
		if (pathName == "toIndex") {
			$("#home").addClass('active');
		} else if (pathName == 'toHostView') {
			$("#host").addClass('active');
		}
		;
	})
	function toLogin() {
		var param = window.location.search;
		window.location.href = "userLoginView?backUrl='" + pathName + param
				+ "'";
	}
</script>
</html>
