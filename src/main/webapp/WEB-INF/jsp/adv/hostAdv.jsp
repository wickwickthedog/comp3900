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
				<form id="addPostForm" action="postAdvertisment" method="post" type="hidden">
					<div class="row">
						<label for="inputEmail3" class="col-sm-2 control-label">Title:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title" name="title" required="true" placeholder="Enter the title" />
						</div>
					</div>
					<div class="row pt-30">
						<label for="inputEmail3" class="col-sm-2 control-label">Description:</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="3" id="description" name="description" placeholder="Enter the description" required="true"></textarea>
						</div>
					</div>
					<div class="row pt-30">
						<label for="inputEmail3" class="col-sm-2 control-label">Address:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="address" name="address" placeholder="Enter your adress" onFocus="geolocate()" required="true" />
						</div>
					</div>
					<div class="row pt-30">
						<label for="inputEmail3" class="col-sm-2 control-label">Bathroom:</label>
						<div class="col-sm-10">
							<select class="form-control" id="bathroom" name="bathroom">
								<option value="">Bathroom</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select>
						</div>
					</div>
					<div class="row pt-30">
						<label for="inputEmail3" class="col-sm-2 control-label">Type of property:</label>
						<div class="col-sm-10">
							<select id="propertyType" name="propertyType" class="form-control">
								<option value="">Property Type</option>
								<option value="Apartment">Apartment</option>
								<option value="House">House</option>
								<option value="Hotel">Hotel</option>
								<option value="Townhouse">Town house</option>
								<option value="Villa">Villa</option>
								<option value="Unit">Unit</option>
							</select>
						</div>
					</div>
					<div class="row pt-30">
						<label for="inputEmail3" class="col-sm-2 control-label">Photos:</label>
						<div class="col-sm-10">
							<input type="file" class="form-control" id="photo" name="photo" placeholder="Please upload the photos" onchange="uploadImage()" />
						</div>
					</div>
					<div class="row pt-30" id="addRoomButtom">
						<div class="col-xs-offset-3 col-xs-3">
							<a href="javascript:validateAndCommit()" class="btn btn-default">Save and Add Room</a>
						</div>
						<div class="col-xs-3">
							<a href="toIndex" class="btn btn-default">Return</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function uploadImage() {
	var file = $("#photo").val();
	var fileType = file.substring(file.lastIndexOf(".") + 1).toLowerCase();
	if (fileType != "jpg" && fileType != "png") {
		$.messager.alert("Warning", "The photo should be jpg or png.");
		return false;
	}
	
};
	function validateAndCommit() {
		var title = $("#title").val();
		var desc = $("#description").val();
		var address = $("#address").val();
		var bathroom = $("#bathroom").val();
		var propertyType = $("#propertyType").val();
		if (title == null || title == "") {
			$.messager.alert("Warning", "Title cannot be null");
			return;
		}
		if (desc == null || desc == "") {
			$.messager.alert("Warning", "The description cannot be null");
			return;
		}
		if (address == null || address == "") {
			$.messager.alert("Warning", "Address cannot be null");
			return;
		}
		if (bathroom == null || bathroom == "") {
			$.messager.alert("Warning", "Bathroom cannot be null");
			return;
		}
		if (propertyType == null || propertyType == "") {
			$.messager.alert("Warning", "Property type cannot be null");
			return;
		}
		$.post("isAddrExist", {
			userId : "",
			address : address
		}, function(data) {
			if (data.isExist == "yes") {
				$.messager.alert("Warning", "Address exists");
				return;
			} else {
				addPost();
			}
		}, "json");
	}
	function addPost() {
		$.messager.confirm("Comfirmation", "Are you sure to commit?", function(
				mes) {
			if (mes) {
				var file = $("#photo").val();
				if(file== null || file == ""){
				$("#addPostForm").ajaxSubmit(
						{
							type : "post", //提交方式    
							url : "hostAdvertisment", //请求url
							success : function(data) { //提交成功的回调函数  
								if (data.res == "success") {
									window.location.href = "toAddRoomView?id="
											+ data.title;
								} else {
									$.messager.alert(data.title, data.msg);
								}
							}
						});}else{
							$("#addPostForm").ajaxSubmit(
									{
										type : "post", //提交方式    
										url : "hostAdvertismentWithPhoto", //请求url
										success : function(data) { //提交成功的回调函数  
											if (data.res == "success") {
												window.location.href = "toAddRoomView?id="
														+ data.title;
											} else {
												$.messager.alert(data.title, data.msg);
											}
										}
									});
						}

			} else {
				return;
			}
		});
	}
	/* function uploadImage() {
	 var file = ($("#photo").filebox('getValue'));
	 // 	if (file == "") {
	 // 		$.messager.alert("<fmt:message key='title.common.warning'/>", "<fmt:message key='msg.notification.fileEmpty'/>");
	 // 		return false;
	 // 	}
	 var fileType = file.substring(file.lastIndexOf(".") + 1).toLowerCase();
	 if (fileType != "jpg" && fileType != "png") {
	 $.messager.alert("Warning", "The image should be jpg or png.");
	 return false;
	 }
	
	 }; */
	/* For google map api */

	var placeSearch, autocomplete;
	/* 	var componentForm = {
	 street_number : 'short_name',
	 route : 'long_name',
	 locality : 'long_name',
	 administrative_area_level_1 : 'short_name',
	 country : 'long_name',
	 postal_code : 'short_name'
	 }; */

	function initAutocomplete() {
		// Create the autocomplete object, restricting the search to geographical
		// location types.
		autocomplete = new google.maps.places.Autocomplete(
		/** @type {!HTMLInputElement} */
		(document.getElementById('address')), {
			types : [ 'geocode' ]
		});

		// When the user selects an address from the dropdown, populate the address
		// fields in the form.
		autocomplete.addListener('place_changed', fillInAddress);
	}

	function fillInAddress() {
		// Get the place details from the autocomplete object.
		var place = autocomplete.getPlace();

		/* 		for ( var component in componentForm) {
		 document.getElementById(component).value = '';
		 document.getElementById(component).disabled = false;
		 } */

		// Get each component of the address from the place details
		// and fill the corresponding field on the form.
		/* for (var i = 0; i < place.address_components.length; i++) {
			var addressType = place.address_components[i].types[0];
			if (componentForm[addressType]) {
				var val = place.address_components[i][componentForm[addressType]];
				document.getElementById(addressType).value = val;
			}
		} */
	}

	// Bias the autocomplete object to the user's geographical location,
	// as supplied by the browser's 'navigator.geolocation' object.
	function geolocate() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				var geolocation = {
					lat : position.coords.latitude,
					lng : position.coords.longitude
				};
				var circle = new google.maps.Circle({
					center : geolocation,
					radius : position.coords.accuracy
				});
				autocomplete.setBounds(circle.getBounds());
			});
		}
	}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAQMsV9thPFaPE4jL4Xx5lrCzMWuMKBKcw
	&libraries=places&callback=initAutocomplete"></script>
</html>