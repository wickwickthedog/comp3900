<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
	<%@include file="../../commons/layout.jsp"%>

	<!-- Header Area End -->

	<div id="search-area" class="search-area">

		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<form:form id="searchAdvForm" commandName="bookDto" action="toIndex" method="post">
						<div class="row">
							<div class="col-xs-3 col-md-offset-1 ">
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
									<form:input id="destination" name="destination" type="text" class="form-control" placeholder="Type your destination..." onFocus="geolocate()" path="room.adv.city"
										value="${book.room.adv.city}" />
								</div>

							</div>
							<div class="col-xs-3">
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon"><i class="fa fa-calendar "></i></span>
									<form:input name="stayBeginStr" type="text" class="form-control" id="inputCheckIn" placeholder="Check In" path="stayBeginStr" value="${book.stayBeginStr}" />

								</div>
							</div>
							<div class="col-xs-3">
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon"><i class="fa fa-calendar "></i></span>
									<form:input name="stayEndStr" type="text" class="form-control" id="inputCheckOut" placeholder="Check Out" path="stayEndStr" value="${book.stayEndStr}" />


								</div>
							</div>
						</div>
						<div class="row pt-50">
							<div class="col-xs-3 col-md-offset-1">
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon"><i class="fa fa-user "></i></span>
									<form:select name="maxPeople" class="form-control" id="adult" path="room.adv.maxPeople" value="${book.room.adv.maxPeople}">
										<option value="">Adult</option>
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
									</form:select>
								</div>

							</div>
							<div class="col-xs-3">
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon"><i class="fa fa-home"></i></span>
									<form:select name="propertyType" class="form-control" id="children" path="room.adv.propertyType" value="${book.room.adv.propertyType}">
										<option value="">Property Type</option>
										<option value="Apartment">Apartment</option>
										<option value="House">House</option>
										<option value="Hotel">Hotel</option>
										<option value="Townhouse">Townhouse</option>
										<option value="Villa">Villa</option>
										<option value="Unit">Unit</option>
									</form:select>

								</div>

							</div>
							<div class="col-xs-3">
								<div class="input-group margin-bottom-sm">
									<span class="input-group-addon"><i class="fa fa-bed"></i></span>
									<form:select name="bedroom" class="form-control" id="room" path="room.adv.bedroom" value="${book.room.adv.bedroom}">
										<option value="">Room</option>
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
									</form:select>

								</div>

							</div>
							<div class="row pt-60">
								<div class="col-xs-12 col-md-offset-5">
									<a href="javascript:validateAndCommit()" type="submit" class="btn btn-primary">Check Availability</a>
								</div>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<!-- About Area Start -->
	</div>

</body>
<script>
	$(document).ready(function() {
		$('#inputCheckIn').datetimepicker({
			format : 'dd-mm-yyyy',
			autoclose : true,
			minView : 2
		});
		$('#inputCheckOut').datetimepicker({
			format : 'dd-mm-yyyy',
			autoclose : true,
			minView : 2
		});
		if ("${scrollFlag}" == 1) {
			scrollToLocation();
		}
	})
	function validateAndCommit() {
		var room = $("#room").val();
		var adult = $("#adult").val();
		var inputCheckIn = $("#inputCheckIn").val();
		var inputCheckOut = $("#inputCheckOut").val();
		if (room == null || room == "") {
			$.messager.alert("Warning", "The room quantity cannot be null");
			return;
		}
		if (adult == null || adult == "") {
			$.messager.alert("Warning", "The adult number cannot be null");
			return;
		}
		if (inputCheckIn == null || inputCheckIn == "") {
			$.messager.alert("Warning", "The date of check-in cannot be null");
			return;
		}
		if (inputCheckOut == null || inputCheckOut == "") {
			$.messager.alert("Warning", "The date of check-out cannot be null");
			return;
		}
		var form = document.getElementById('searchAdvForm');
		//再次修改input内容

		searchAdv();

	}
	function searchAdv() {
		var inputCheckIn = $("#inputCheckIn").val();
		var inputCheckOut = $("#inputCheckOut").val();
		$("#searchAdvForm")
				.ajaxSubmit(
						{
							type : "post", //提交方式    
							url : "searchAdv", //请求url
							success : function(data) { //提交成功的回调函数  
								var advList = data.rows;
								for (var i = 0; i < data.total; i++) {
									var adv = advList[i];
									var html = "<div id='about-area' class='about-area section'><div class='container'><div class='row'><div class='col-xs-12'><div class='about-image float-left hidden-sm'>";
									var pic = adv.picPath;
									if (pic == null || pic == '') {
										pic = "images/about/1.jpg";
									}
									html += "<img src='"+pic+"' alt=''>";
									html += "</div><div class='about-content fix' align=center><h1><span>";
									html += "<a href='./toAdvDetail?id="
											+ adv.id + "&stayBeginStr="
											+ inputCheckIn + "&stayEndStr="
											+ inputCheckOut
											+ "' target='_blank'>" + adv.title
											+ "</a></span></h1>"
									html += "<h4>" + adv.address + "</h4><p>"
											+ adv.description + "</p>";
									html += "<div class='funfact fix'><div class='single-funfact text-center'><h2>"
											+ adv.propertyType
											+ "</h2><p>Property Type</p></div><div class='single-funfact text-center'><h2 class='counter'>"
											+ adv.bedroom
											+ "</h2><p>Bedrooms</p></div><div class='single-funfact text-center'><h2 class='counter'>"
											+ adv.bathroom
											+ "</h2><p>Bathrooms</p></div><div class='single-funfact text-center'><h2 class='counter'>"
											+ adv.maxPeople
											+ "</h2><p>Capacity</p></div></div></div></div></div></div></div>";
									$("#search-area").after(html);
								}
							}
						});
	}
	function scrollToLocation() {
		var body = $("body");
		var scroll_1 = $('#about-area');///滚动到<div id="thisMainPanel">中类名为son-panel的最后一个div处
		if (scrollTo.length) {
			body.animate({
				scrollTop : scroll_1.offset().top - 100
			}, 2000);
		}
	}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbNm9Fz6RfDTbq_cGqlpbPvvi_R4u_Skc&libraries=places&callback=initMap"
        async defer></script>
<script type="text/javascript">
function initAutocomplete() {
	  // Create the autocomplete object, restricting the search to geographical
	  // location types.
	  var autocomplete = new google.maps.places.Autocomplete(
	      /** @type {!HTMLInputElement} */(document.getElementById('destination')),
	      {types: ['(cities)']});

	  // When the user selects an address from the dropdown, populate the address
	  // fields in the form.
	  //autocomplete.addListener('place_changed', fillInAddress);
	}
</script>
</html>
