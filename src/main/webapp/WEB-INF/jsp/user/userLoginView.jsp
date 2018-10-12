<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/style.css">

</head>
<body>
	<%@include file="../../commons/layout.jsp"%>
	<div id="search-area" class="search-area">

		<div class="container">
			<div class="row">
				<div class="col-xs-12 column">
					<c:if test="${not empty error}">
						<div id="alart" class="alert alert-dismissable alert-danger ">
							<strong>${error}</strong>
						</div>
					</c:if>
					<form class="form-horizontal" role="form" name="loginFrom" action="userLogin" method="post">
						<input type="text" class="form-control" id="backUrl" name="backUrl" value="${backUrl}" style="display: none"/>

						<div class="form-group">
							<label for="userName" class="col-sm-2 control-label col-md-offset-1">UserName</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="userName" name="userName" />
							</div>
						</div>
						<div class="form-group">
							<label for="pwd" class="col-sm-2 control-label col-md-offset-1">Password</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" id="pwd" name="pwd" />
							</div>
						</div>
						<div class="row pt-50">
							<div class="form-group">
								<div class="col-xs-4 col-sm-offset-5 col-sm-10">
									<input type="submit" class="btn btn-default" type="submit" value="Sign In" onclick="javascript:loginFrom.submit();" /> <input type="button" class="btn btn-default" value="Register"
										onclick="javascript:window.location.href='userRegisterView'" />
								</div>
							</div>
							<!-- <div class="form-group">
						<div class="col-xs-4 col-sm-10">
							 <input type="button" class="btn btn-default" value="Register" onclick="javascript:window.location.href='userRegisterView'"/>
						</div>
					</div> -->
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
