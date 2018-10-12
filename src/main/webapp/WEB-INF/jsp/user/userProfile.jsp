<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
<%-- <%@include file="../../commons/layout.jsp"%> --%>
		<div class="container">
	<div class="row">
		<div class="col-md-2 column">
		</div>
		<div class="col-md-8 column">
			<form class="form-horizontal" id="editUserForm" commandName="userDTO"
enctype="multipart/form-data" method="get">
				<div class="form-group">
					<label for="userName" class="col-sm-2 control-label">User Name</label>
					<div class="col-sm-10">
						<input type="text" value="${user.userName}" class="form-control" id="userName" name="userName" readonly="readonly/"/>
					</div>
				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">email</label>
					<div class="col-sm-10">
						<input type="email" value="${user.email}" class="form-control" id="email" name="email" readonly="readonly/"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="DOB" class="col-sm-2 control-label">DOB</label>
					<div class="col-sm-10">
						<span class="input-group-addon"><i class="fa fa-calendar "></i></span>
						<input type="text" value="${user.dob}" class="form-control" id="dob" name="dob"readonly="readonly/"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="gender" class="col-sm-2 control-label">gender</label>
					<div class="col-sm-10">
						<input type="text" value="${user.gender}" class="form-control" id="gender" name="gender" readonly="readonly/">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <input type="button" class="btn btn-default" value="edit" onclick="javascript:window.location.href='toUpdateUser'"/>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-2 column">
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
</script>
</html>