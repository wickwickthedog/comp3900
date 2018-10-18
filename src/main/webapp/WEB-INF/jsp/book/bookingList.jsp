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
<link rel="stylesheet" type="text/css" href="css/xcConfirm.css" />
<style type="text/css">
.sgBtn {
	width: 135px;
	height: 35px;
	line-height: 35px;
	margin-left: 10px;
	margin-top: 10px;
	text-align: center;
	background-color: #0095D9;
	color: #FFFFFF;
	float: left;
	border-radius: 5px;
}
</style>
</head>
<body>
	<%@include file="../../commons/layout.jsp"%>
	<div class="container pt-200">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<h3 class="text-center text-success">My Future Bookings</h3>
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>Stay From</th>
							<th>Stay To</th>
							<th>Advertisement</th>
							<th>Room</th>
							<th>Habit</th>
							<th>Expectation</th>
							<th>Operation</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${bookingListBeforeCheckIn}" var="booking1">
							<tr>
								<td>${booking1.stayBeginStr}</td>
								<td>${booking1.stayEndStr}</td>
								<td>${booking1.room.adv.title}</td>
								<td>${booking1.room.name}</td>
								<td>${booking1.habit}</td>
								<td>${booking1.expectation}</td>
								<td><a href="./toAdvDetail?id=${booking1.room.adv.id}&stayBeginStr=${booking1.stayBeginStr}&stayEndStr=${booking1.stayEndStr}">Detail</a><br> <a
									href="javascript:cancelBooking(${booking1.id})">Cancel</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column">
				<h3 class="text-center text-success">My Past Bookings</h3>
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>Stay From</th>
							<th>Stay To</th>
							<th>Advertisement</th>
							<th>Room</th>
							<th>Habit</th>
							<th>Expectation</th>
							<th>Operation</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${bookingListAfterCheckIn}" var="booking2">
							<tr>
								<td>${booking2.stayBeginStr}</td>
								<td>${booking2.stayEndStr}</td>
								<td>${booking2.room.adv.title}</td>
								<td>${booking2.room.name}</td>
								<td>${booking2.habit}</td>
								<td>${booking2.expectation}</td>
								<td><a href="./toAdvDetail?id=${booking2.room.adv.id}&stayBeginStr=${booking2.stayBeginStr}&stayEndStr=${booking2.stayEndStr}">Detail</a><br> <a
									href="javascript:rating(${booking2.id})">Review</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script src="js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
	function cancelBooking(id) {
		$.messager.confirm("Comfirmation",
				"Are you sure to cancel this booking?", function(mes) {
					if (mes) {
						$.post("cancelBooking", {
							id : id,
						}, function(data) {
							if (data.res == "success") {
								$.messager.alert("Success",
										"Book this room Successfully");
								window.location.href = './toBookingManagement';
							} else {
								$.messager.alert(data.title, data.msg);
								return;
							}
						}, "json");
					} else {
						return;
					}
				});
	}
	function rating(id){
		var txt=  "Comment:";
		var option = {
			title: "Comment",
			btn: parseInt("0011",2),
			onOk: function(comment,rating){
				$.post("postComment", {
					bookId : id,
					comment : comment,
					rating : rating
				}, function(data) {
					if (data.res == "success") {
						$.messager.alert(data.title,data.msg);
					} else {
						$.messager.alert(data.title, data.msg);
						return;
					}
				}, "json");
			}
		}
		window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.input, option);
	}
</script>
</html>
