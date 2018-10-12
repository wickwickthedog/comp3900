<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=ISO-8859-1">
<title></title>
</head>
<body>
	<%@include file="../../commons/layout.jsp"%>
	<div class="container pt-200">
		<div class="row clearfix">
			<div class="col-md-8 col-md-offset-2 column">
				<h3 class="text-center text-success">Room 1</h3>
				<form id="addRoomForm0" action="addRoom" method="post">
					<input type="text" id="advId" name="advId" value="${advId}" style="display: none" />
					<div class="row pt-30">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Room Name:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="roomName0" name="name" />
							</div>
						</div>
					</div>

					<div class="row pt-30">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Room Description:</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="3" id="roomDescription0" name="description"></textarea>
							</div>
						</div>
					</div>

					<div class="row pt-30">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Rental:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="rental0" name="rental" />
							</div>
						</div>
					</div>
					<div class="row pt-30">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Capacity:</label>
							<div class="col-sm-10">
								<select class="form-control" id="capacity0" name="maxPeople">
									<option value="">Capacity</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>

								</select>
							</div>
						</div>
					</div>
					<div class="row pt-30">
						<label for="inputEmail3" class="col-sm-2 control-label">Photos:</label>
						<div class="col-sm-10">
							<input type="file" class="form-control" id="photo0" name="photo" placeholder="Please upload the photos" onchange="uploadImage(0)" />
						</div>
					</div>
				</form>
				<div class="row pt-30" id="addRoomButtom">
					<div class="form-group">
						<div class="col-xs-offset-2 col-xs-3">
							<a href="javascript:addRoomForm()" class="btn btn-default">Add Room Detail</a>
						</div>
						<div class="form-group">
							<div class="col-xs-3">
								<a href="javascript:deleteRoomForm()" class="btn btn-default">Delete a Room</a>
							</div>
							<div class="col-xs-3">
								<a href="javascript:iterationSumbit()" class="btn btn-default">Submit</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var roomI = 1;
	function uploadImage(i) {
		var file = $("#photo"+i).val();
		var fileType = file.substring(file.lastIndexOf(".") + 1).toLowerCase();
		if (fileType != "jpg" && fileType != "png") {
			$.messager.alert("Warning", "The photo should be jpg or png.");
			return false;
		}
		
	};
	function deleteRoomForm() {
		if (roomI > 1) {
			roomI = roomI - 1;
			$("#addRoomForm" + roomI).remove();
		} else {
			$.messager.alert("Warning", "You should add at least one room");
		}
	}
	function addRoomForm() {
		var formId = "addRoomForm" + roomI;
		var titleId = roomI + 1;
		var title = "Room " + titleId;
		var roomHtml = "<h3 class='text-center text-success  pt-30'>"
				+ title
				+ "</h3><form id='"+formId+"' action='addRoom' method='post'> <input type='hidden' type='text' id='advId' name='advId' value='"+${advId}+"'/><div class='row pt-30'><div class='form-group'> <label for='inputEmail3' class='col-sm-2 control-label'>Room Name:</label> <div class='col-sm-10'> <input type='text' class='form-control' id='roomName"+roomI+"'name='name' /> </div> </div></div><div class='row pt-30'> <div class='form-group'> <label for='inputEmail3' class='col-sm-2 control-label'>Room Description:</label> <div class='col-sm-10'> <textarea class='form-control' rows='3' id='roomDescription"+roomI+"'name='description'></textarea> </div> </div></div><div class='row pt-30'> <div class='form-group'> <label for='inputEmail3' class='col-sm-2 control-label'>Rental:</label> <div class='col-sm-10'> <input type='text' class='form-control' id='rental"+roomI+"'name='rental' /> </div> </div></div><div class='row pt-30'> <div class='form-group'> <label for='inputEmail3' class='col-sm-2 control-label'>Capacity:</label> <div class='col-sm-10'> <select class='form-control' id='capacity"+roomI+"' name='maxPeople'> <option value=''>Capacity</option> <option value='1'>1</option> <option value='2'>2</option> <option value='3'>3</option> <option value='4'>4</option> </select> </div> </div></div></div><div class='row pt-30'><label for='inputEmail3' class='col-sm-2 control-label'>Photos:</label><div class='col-sm-10'><input type='file' class='form-control' id='photo"+roomI+"' name='photo' placeholder='Please upload the photos' onchange='uploadImage("+roomI+")' /></div></div></form>";
		$("#addRoomButtom").before(roomHtml);
		roomI = roomI + 1;
	}
	function iterationSumbit() {
		$.messager.confirm("Comfirmation", "Are you sure to commit?", function(
				mes) {
			var validateFlag = 0;

			var capacity = 0;
			if (mes) {
				for (var i = 0; i < roomI; i++) {
					if (validateAndCommit(i) == 1) {
						var cap =$("#capacity" + i).val();
						capacity = capacity + cap;
						validateFlag = 1;
						break;
					}
				}
				if (validateFlag == 0) {
					var sucessFlag = 1;
					for (var i = 0; i < roomI; i++) {
						if(addRoom(i)==1){

							sucessFlag = 0;
							break;
						}
					}
					if(sucessFlag ==1){
						$.post("updateRmNum", {
							id : "${advId}",
							roomI : roomI,
							capacity : capacity,
						});
						window.location.href = "toAdvManagement";
					}else{
						return;
					}
				}
				window.location.href = "toAdvManagement";
			} else {
				return;
			}
		});
	}
	function validateAndCommit(i) {
		var roomName = $("#roomName" + i).val();
		var roomDescription = $("#roomDescription" + i).val();
		var rental = $("#rental" + i).val();
		var capacity = $("#capacity" + i).val();
		if (roomName == null || roomName == "") {
			$.messager.alert("Warning", "Room name cannot be null");
			return 1;
		}
		if (roomDescription == null || roomDescription == "") {
			$.messager.alert("Warning", "Room description cannot be null");
			return 1;
		}
		if (rental == null || rental == "") {
			$.messager.alert("Warning", "Rental cannot be null");
			return 1;
		}
		if (capacity == null || capacity == "") {
			$.messager.alert("Warning", "The capacity cannot be null");
			return 1;
		}
	}
	function addRoom(i) {
		var addRoomForm = "#addRoomForm" + i;
		var file = $("#photo"+ i).val();
		if(file== null || file == ""){
			$(addRoomForm).ajaxSubmit({
				type : "post", //提交方式    
				url : "addRoom", //请求url
				success : function(data) { //提交成功的回调函数    
					$.messager.alert(data.title, data.msg, "info", function(mes) {
						if (data.res == "success") {
							return 0;
						}else{
							return 1;
						}
					});
				}
			});}else{
				$(addRoomForm).ajaxSubmit({
					type : "post", //提交方式    
					url : "addRoomWithPhoto", //请求url
					success : function(data) { //提交成功的回调函数    
						$.messager.alert(data.title, data.msg, "info", function(mes) {
							if (data.res == "success") {
								return 0;
							}else{
								return 1;
							}
						});
					}
				});
			}
	}
</script>
</html>