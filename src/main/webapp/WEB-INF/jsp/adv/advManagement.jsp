<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

</head>
<body>
	<%@include file="../../commons/layout.jsp"%>
	<div class="container pt-200">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<h3 class="text-center text-success">My Advertisements</h3>
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>Title</th>
							<th>Description</th>
							<th>Address</th>
							<th>Property Type</th>
							<th>Bedroom</th>
							<th>Bathroom</th>
							<th>Operation</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${advList}" var="advList">
							<tr>
								<td>${advList.title}</td>
								<td>${advList.description}</td>
								<td>${advList.address}</td>
								<td>${advList.propertyType}</td>
								<td>${advList.bedroom}</td>
								<td>${advList.bathroom}</td>
								<td><a href="./toAdvDetail?id=${advList.id}&stayBeginStr=${booking1.stayBeginStr}&stayEndStr=${booking1.stayEndStr}">Detail</a><br>
								<a href="javascript:deleteAdv(${advList.id})">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function deleteAdv(id) {
		$.messager.confirm("Comfirmation",
				"Are you sure to cancel this booking?", function(mes) {
					if (mes) {
						$.post("deleteAdv", {
							id : id,
						}, function(data) {
							if (data.res == "success") {
								$.messager.alert("Success",
										"Book this room Successfully");
								window.location.href = './toAdvManagement';
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
</script>
</html>