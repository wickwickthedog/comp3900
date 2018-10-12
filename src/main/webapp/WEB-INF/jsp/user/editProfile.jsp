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

	<div class="container pt-200">
		<div class="row">
			<div class="col-xs-12 column">
				<form class="form-horizontal" id="addUserForm" action="userLogin" method="post">
					<input id="userId" type="text" name="id" style="display: none;" value="${user.id}" />
					<div class="form-group">
						<label for="userName" class="col-sm-2 control-label col-md-offset-1">UserName</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="userName" name="userName" value="${user.userName}"/>
						</div>
					</div>
					<div class="form-group">
						<label for="pwd" class="col-sm-2 control-label col-md-offset-1">Password</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="inputNewPassword1" name="pwd"/>
						</div>
					</div>
					<div class="form-group">
						<label for="pwd" class="col-sm-2 control-label col-md-offset-1">Password Again</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="inputNewPassword2" />
						</div>
					</div>
					<div class="form-group">
						<label for="pwd" class="col-sm-2 control-label col-md-offset-1">Email</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="email" name="email" value="${user.email}"/>
						</div>
					</div>
					<div class="form-group">
						<label for="pwd" class="col-sm-2 control-label col-md-offset-1">Gender</label>
						<div class="col-sm-6">
							<select id="gender" name="gender" class="form-control">
								<option value="">Gender</option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
							</select>
						</div>
					</div>
					<div class="row pt-50">
						<div class="form-group">
							<div class="col-xs-4 col-sm-offset-5 col-sm-10">
								<a class="btn btn-default" href="javascript:validateAndCommit();">Save</a> <input type="button" class="btn btn-default" value="Return"
									onclick="javascript:window.location.href='userLoginView'" />
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
$(function(){
    $(".gender").val("${user.gender}");


});
	function validateAndCommit() {
		var userId = $("#userId").val();
		var userName = $("#userName").val();
		var formerPSW = $.trim($("#inputNewPassword1").val());
		var latterPSW = $.trim($("#inputNewPassword2").val());
		var email = $("#email").val();
		var emailFormat = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;

		if (userName == null || userName == "") {
			$.messager.alert("Warning", "User name cannot be null");
			return;
		}

		if (userName.length > 30) {
			$.messager.alert("Warning",
					"User name should not be more than 30 characters");
			return;
		}
		if (formerPSW == null || formerPSW == "") {
			$.messager.alert("Warning", "Password should be null");
			return;
		}
		if (latterPSW == null || latterPSW == "") {
			$.messager.alert("Warning", "Password should be null");
			return;
		}
		if (formerPSW.length > 16) {
			$.messager.alert("Warning",
					"Password should not be more than 16 characters");
			return;
		}
		if (latterPSW.length > 16) {
			$.messager.alert("Warning",
					"Password should not be more than 16 characters");
			return;
		}
		if (formerPSW != latterPSW) {
			$.messager.alert("Warning", "Two passwords should be the same!");
			return;
		}
		if (email.length > 100) {
			$.messager.alert("Warning",
					"E-mail should not be more than 100 characters");
			return;
		}
		if (email != null && email != "") {
			if (!emailFormat.test(email)) {
				$.messager.alert("Warning", "Please input a valid E-mail");
				return;
			}
		}
		$.post("isUserExist", {
			id : userId,
			userName : userName
		}, function(data) {
			if (data.res == "fail") {
				$.messager.alert(data.title, data.msg);
				return;
			} else {
				addUser();
			}

		}, "json");
	}

	function addUser() {
		$.messager.confirm("Comfirmation", "Are you sure to commit?", function(
				mes) {
			if (mes) {
				$("#addUserForm").ajaxSubmit({
					type : "post", //提交方式    
					url : "updateUser", //请求url
					success : function(data) { //提交成功的回调函数    
						$.messager.alert(data.title, data.msg, "info",function(mes) {
							if (data.res == "success") {
								window.location.href = "toIndex";
							}
						});
					}
				});

			} else {
				return;
			}
		});
	}
</script>
</html>
