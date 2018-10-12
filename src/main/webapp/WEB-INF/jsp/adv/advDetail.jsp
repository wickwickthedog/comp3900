<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="dist/baguetteBox.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link rel="stylesheet" href="css/map.css">
<style type="text/css">
h1, h2, h3, footer, .gallery {
	text-align: center;
}

pre {
	width: 340px;
	margin: 0 auto;
	border: dashed 1px #aaa;
	margin-bottom: 10px;
}

@media ( max-width : 480px) {
	pre {
		max-width: 98%;
	}
}

header, footer {
	display: block;
	padding: .2em 0;
	background-color: #555;
	box-shadow: 0 0 8px #222;
}

footer {
	margin-top: 1.5em;
}

.content {
	max-width: 1160px;
	margin: 0 auto;
}

.gallery:after {
	content: '';
	display: block;
	height: 2px;
	margin: .5em 0 1.4em;
	background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0) 0%, rgba(77, 77, 77, 1) 50%, rgba(0, 0, 0, 0) 100%);
	background-image: linear-gradient(to right, rgba(0, 0, 0, 0) 0%, rgba(77, 77, 77, 1) 50%, rgba(0, 0, 0, 0) 100%);
}

.gallery img {
	height: 100%;
}

.gallery a {
	width: 240px;
	height: 180px;
	display: inline-block;
	overflow: hidden;
	margin: 4px 6px;
	box-shadow: 0 0 4px -1px #000;
}

.ribbon>img {
	position: absolute;
	top: 0;
	right: 0;
	border: 0;
}

@media ( max-width : 768px) {
	.sm-hidden {
		display: none;
	}
}

/* Highlight.js Tomorrow Night style */
.hljs-comment, .hljs-quote {
	color: #969896
}

.hljs-deletion, .hljs-name, .hljs-regexp, .hljs-selector-class, .hljs-selector-id, .hljs-tag, .hljs-template-variable, .hljs-variable {
	color: #c66
}

.hljs-tag {
	color: #f8f8f2
}

.hljs-built_in, .hljs-builtin-name, .hljs-link, .hljs-literal, .hljs-meta, .hljs-number, .hljs-params, .hljs-type {
	color: #de935f
}

.hljs-attr {
	color: #f0c674
}

.hljs-addition, .hljs-bullet, .hljs-string, .hljs-symbol {
	color: #b5bd68
}

.hljs-section, .hljs-title {
	color: #81a2be
}

.hljs-keyword, .hljs-selector-tag {
	color: #b294bb
}

.hljs {
	display: block;
	overflow-x: auto;
	background: #1d1f21;
	color: #c5c8c6;
	padding: .8em
}

.hljs-emphasis {
	font-style: italic
}

.hljs-strong {
	font-weight: 700
}
</style>
</head>
<body>
	<%@include file="../../commons/layout.jsp"%>
	<div id="about-area" class="about-area section pb-120 pt-200">
		<div class="container pt-100">
			<div class="row">
				<div class="col-xs-12">

					<div class="about-image float-left hidden-sm">
						<div class="baguetteBoxOne gallery">
							<a href="${advPhotoCover}" data-caption=""> <img
								src="${advPhotoCover}" alt="">
							</a>
							<div style="display: none;">
								<c:forEach items="${advPhotoList}" var="advPhoto">
									<a href="${advPhoto}" title=""> <img src="${advPhoto}" alt="">
									</a>
								</c:forEach>
							</div>
						</div>
					</div>

					<div class="about-content fix" align=center>
						<h1>
							<span>${advDto.title}</span>  
						</h1>
						<h4>Rating:${avgRating}/5</h4>
						<h4>${advDto.address}</h4>
						<p>${advDto.description}</p>

						<div class="funfact fix">

							<div class="single-funfact text-center">
								<h2>${advDto.propertyType}</h2>
								<p>Property Type</p>
							</div>

							<div class="single-funfact text-center">
								<h2 class="counter">${advDto.bedroom}</h2>
								<p>Bedrooms</p>
							</div>

							<div class="single-funfact text-center">
								<h2 class="counter">${advDto.bathroom}</h2>
								<p>Bathrooms</p>
							</div>

							<div class="single-funfact text-center">
								<h2 class="counter">${advDto.maxPeople}</h2>
								<p>Maximum number of people</p>
							</div>

						</div>

					</div>

				</div>
			</div>
			<div class="row pt-50">
				<div class="col-xs-3 col-md-offset-2">
					<div class="input-group margin-bottom-sm">
						<span class="input-group-addon"><i class="fa fa-calendar "></i></span> <input name="stayBeginStr" type="text" class="form-control" id="stayBeginStr" placeholder="Check In"
							value="${bookDto.stayBeginStr}" />

					</div>
				</div>
				<form id="searchRoomForm" action="searchRoom" method="post" type="hidden">
					<div class="col-xs-3">
						<div class="input-group margin-bottom-sm">
							<span class="input-group-addon"><i class="fa fa-calendar "></i></span> <input name="stayEndStr" type="text" class="form-control" id="stayEndStr" placeholder="Check Out"
								value="${bookDto.stayEndStr}" />
						</div>
					</div>
					<div class="col-xs-3">
						<a href="javascript:validateAndCommit()" class="btn btn-primary">Check Available Rooms</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="floor-plan-area" class="floor-plan-area section pt-120">
		<div class="container  pt-120" id="roomArea">
			
		</div>
	</div>
	<div class="container pb-150 pt-120">
		<div class="row clearfix pt-120">
			<div class="col-md-12 column">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>Room</th>
							<th>Roommate Name</th>
							<th>Habit</th>
							<th>Expectation</th>
							<th>Stay From</th>
							<th>Stay To</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${housemateList}" var="housemate">
							<tr>
								<td>${housemate.room.name}</td>
								<td>${housemate.user.userName}</td>
								<td>${housemate.habit}</td>
								<td>${housemate.expectation}</td>
								<td>${housemate.stayBeginStr}</td>
								<td>${housemate.stayEndStr}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row clearfix pt-120">
			<div class="col-md-12 column">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>User</th>
							<th>Room</th>
							<th>Comment</th>
							<th>Rating</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reviewList}" var="review">
							<tr>
								<td>${review.book.user.userName}</td>
								<td>${review.book.room.name}</td>
								<td>${review.comment}</td>
								<td>${review.rating}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="container">
	<h1>
		<span>Search around the Suburb</span> 
	</h1>
		
		<div style="height:100%; width:100%;">
			<div class="col-md-1 column">
				<input id="autocomplete" value="${advDto.suburb}" type="text" style="width:500px;"/>
				<div id="map" style="height:400px; width:500px;"></div>
			</div>
			<div class="col-md-6 column">
				<div id="listing" align="left">
				  <table id="resultsTable">
				  	<thead>Sorted by Prominence</thead>
				    <tbody id="results"></tbody>
				  </table>
				</div>
			</div>
			<div style="display: none" >
			  <div id="info-content">
			    <table >
			      <tr id="iw-url-row" class="iw_table_row">
			        <td id="iw-icon" class="iw_table_icon"></td>
			        <td id="iw-url"></td>
			      </tr>
			      <tr id="iw-address-row" class="iw_table_row">
			        <td class="iw_attribute_name">Address:</td>
			        <td id="iw-address"></td>
			      </tr>
			      <tr id="iw-hours-row" class="iw_table_row">
			        <td class="iw_attribute_name">Opening Hours:</td>
			        <td id="iw-hours1"></td>
			      </tr>
			      <tr id="iw-hours-row" class="iw_table_row">
			         <td class="iw_attribute_name"></td>
			        <td id="iw-hours2"></td>
			      </tr>
			      <tr id="iw-hours-row" class="iw_table_row">
			        <td class="iw_attribute_name"></td>
			        <td id="iw-hours3"></td>
			      </tr>
			      <tr id="iw-hours-row" class="iw_table_row">
			        <td class="iw_attribute_name"></td>
			        <td id="iw-hours4"></td>
			      </tr>
			      <tr id="iw-hours-row" class="iw_table_row">
			        <td class="iw_attribute_name"></td>
			        <td id="iw-hours5"></td>
			      </tr>
			      <tr id="iw-hours-row" class="iw_table_row">
			        <td class="iw_attribute_name"></td>
			        <td id="iw-hours6"></td>
			      </tr>
			      <tr id="iw-hours-row" class="iw_table_row">
			        <td class="iw_attribute_name"></td>
			        <td id="iw-hours7"></td>
			      </tr>
			      <tr id="iw-price-row" class="iw_table_row">
			        <td class="iw_attribute_name">Price:</td>
			        <td id="iw-price"></td>
			      </tr>
			      <tr id="iw-phone-row" class="iw_table_row">
			        <td class="iw_attribute_name">Telephone:</td>
			        <td id="iw-phone"></td>
			      </tr>
			      <tr id="iw-rating-row" class="iw_table_row">
			        <td class="iw_attribute_name">Rating:</td>
			        <td id="iw-rating"></td>
			      </tr>
			      <tr id="iw-website-row" class="iw_table_row">
			        <td class="iw_attribute_name">Website:</td>
			        <td id="iw-website"></td>
			      </tr>
			    </table>
			  </div>
			</div>
		</div> 
	</div>
</body>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAQMsV9thPFaPE4jL4Xx5lrCzMWuMKBKcw&libraries=places&callback=initMap"
        async defer></script>
<script type="text/javascript">
var map, places, infoWindow;
var markers = [];
var autocomplete;
/* var countryRestrict = {'country': 'au'}; */
var MARKER_PATH = 'https://developers.google.com/maps/documentation/javascript/images/marker_green';
var hostnameRegexp = new RegExp('^https?://.+?/');


var countries = {
  'au': {
    center: {lat: -25.3, lng: 133.8},
    zoom: 4
  }
};

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: countries['au'].zoom,
    center: countries['au'].center,
    mapTypeControl: false,
    panControl: false,
    zoomControl: false,
    streetViewControl: false
  });

  infoWindow = new google.maps.InfoWindow({
    content: document.getElementById('info-content')
  });

  // Create the autocomplete object and associate it with the UI input control.
  // Restrict the search to the default country, and to place type "cities".
  autocomplete = new google.maps.places.Autocomplete(
      /** @type {!HTMLInputElement} */ (
          document.getElementById('autocomplete')), {
        types: ['(cities)'],
        /* componentRestrictions: countryRestrict */
      });
  places = new google.maps.places.PlacesService(map);

  autocomplete.addListener('place_changed', onPlaceChanged);
  
  /* var geocoder = new google.maps.Geocoder();
  codeAddress(geocoder, map); */
  /* // Add a DOM event listener to react when the user selects a country.
  document.getElementById('country').addEventListener(
      'change', setAutocompleteCountry); */
}

/* function codeAddress(geocoder, map) {
    geocoder.geocode({'address': address}, function(results, status) {
      if (status === 'OK') {
        map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  } */

// When the user selects a city, get the place details for the city and
// zoom the map in on the city.
function onPlaceChanged() {
  var place = autocomplete.getPlace();
  if (place.geometry) {
    map.panTo(place.geometry.location);
    map.setZoom(15);
    search();
  } else {
    document.getElementById('autocomplete').placeholder = 'Enter a city';
  }
}

// Search for hotels in the selected city, within the viewport of the map.
function search() {
  var search = {
    bounds: map.getBounds(),
    types: ['lodging'],
    rankBy: google.maps.places.RankBy.PROMINENCE
  };

  places.nearbySearch(search, function(results, status) {
    if (status === google.maps.places.PlacesServiceStatus.OK) {
      clearResults();
      clearMarkers();
      // Create a marker for each hotel found, and
      // assign a letter of the alphabetic to each marker icon.
      for (var i = 0; i < results.length; i++) {
        var markerLetter = String.fromCharCode('A'.charCodeAt(0) + (i % 26));
        var markerIcon = MARKER_PATH + markerLetter + '.png';
        // Use marker animation to drop the icons incrementally on the map.
        markers[i] = new google.maps.Marker({
          position: results[i].geometry.location,
          animation: google.maps.Animation.DROP,
          icon: markerIcon
        });
        // If the user clicks a hotel marker, show the details of that hotel
        // in an info window.
        markers[i].placeResult = results[i];
        google.maps.event.addListener(markers[i], 'click', showInfoWindow);
        setTimeout(dropMarker(i), i * 100);
        addResult(results[i], i);
      }
    }
  });
}

function clearMarkers() {
  for (var i = 0; i < markers.length; i++) {
    if (markers[i]) {
      markers[i].setMap(null);
    }
  }
  markers = [];
}

/* // Set the country restriction based on user input.
// Also center and zoom the map on the given country.
function setAutocompleteCountry() {
  var country = document.getElementById('country').value;
  if (country == 'all') {
    autocomplete.setComponentRestrictions({'country': []});
    map.setCenter({lat: 15, lng: 0});
    map.setZoom(2);
  } else {
    autocomplete.setComponentRestrictions({'country': country});
    map.setCenter(countries[country].center);
    map.setZoom(countries[country].zoom);
  }
  clearResults();
  clearMarkers();
} */

function dropMarker(i) {
  return function() {
    markers[i].setMap(map);
  };
}

function addResult(result, i) {
  var results = document.getElementById('results');
  var markerLetter = String.fromCharCode('A'.charCodeAt(0) + (i % 26));
  var markerIcon = MARKER_PATH + markerLetter + '.png';

  var tr = document.createElement('tr');
  tr.style.backgroundColor = (i % 2 === 0 ? '#F0F0F0' : '#FFFFFF');
  tr.onclick = function() {
    google.maps.event.trigger(markers[i], 'click');
  };

  var iconTd = document.createElement('td');
  var nameTd = document.createElement('td');
  var icon = document.createElement('img');
  icon.src = markerIcon;
  icon.setAttribute('class', 'placeIcon');
  icon.setAttribute('className', 'placeIcon');
  var name = document.createTextNode(result.name);
  iconTd.appendChild(icon);
  nameTd.appendChild(name);
  tr.appendChild(iconTd);
  tr.appendChild(nameTd);
  results.appendChild(tr);
}

function clearResults() {
  var results = document.getElementById('results');
  while (results.childNodes[0]) {
    results.removeChild(results.childNodes[0]);
  }
}

// Get the place details for a hotel. Show the information in an info window,
// anchored on the marker for the hotel that the user selected.
function showInfoWindow() {
  var marker = this;
  places.getDetails({placeId: marker.placeResult.place_id},
      function(place, status) {
        if (status !== google.maps.places.PlacesServiceStatus.OK) {
          return;
        }
        infoWindow.open(map, marker);
        buildIWContent(place);
      });
}

// Load the place information into the HTML elements used by the info window.
function buildIWContent(place) {
  document.getElementById('iw-icon').innerHTML = '<img class="hotelIcon" ' +
      'src="' + place.icon + '"/>';
  document.getElementById('iw-url').innerHTML = '<b><a href="' + place.url +
      '">' + place.name + '</a></b>';
  document.getElementById('iw-address').textContent = place.vicinity;

  if (place.formatted_phone_number) {
    document.getElementById('iw-phone-row').style.display = '';
    document.getElementById('iw-phone').textContent =
        place.formatted_phone_number;
  } else {
    document.getElementById('iw-phone-row').style.display = 'none';
  }
	
  if (place.price_level) {
	  var priceHtml = '';
	    for (var i = 0; i < 5; i++) {
	      if (place.rating < (i + 0.5)) {
	        ratingHtml += '&#36;';
	      }
	    }
	    document.getElementById('iw-price-row').style.display = '';
	    document.getElementById('iw-price').textContent =
	        priceHtml;
  } else {
    document.getElementById('iw-price-row').style.display = 'none';
  }
  
  if (place.opening_hours.periods) {
	    document.getElementById('iw-hours-row').style.display = '';
	    document.getElementById('iw-hours1').textContent =
	        "Monday " + place.opening_hours.periods[0].open.time + " - " + place.opening_hours.periods[0].close.time;
	    document.getElementById('iw-hours2').textContent =
	        "Tuesday " + place.opening_hours.periods[1].open.time + " - " + place.opening_hours.periods[1].close.time;
	    document.getElementById('iw-hours3').textContent =
	        "Wednesday " + place.opening_hours.periods[2].open.time + " - " + place.opening_hours.periods[2].close.time;
	    document.getElementById('iw-hours4').textContent =
	        "Thurday " + place.opening_hours.periods[3].open.time + " - " + place.opening_hours.periods[3].close.time;
	    document.getElementById('iw-hours5').textContent =
	        "Friday " + place.opening_hours.periods[4].open.time + " - " + place.opening_hours.periods[4].close.time;
	    document.getElementById('iw-hours6').textContent =
	        "Saturday " + place.opening_hours.periods[5].open.time + " - " + place.opening_hours.periods[5].close.time;
	    document.getElementById('iw-hours7').textContent =
	        "Sunday " + place.opening_hours.periods[6].open.time + " - " + place.opening_hours.periods[6].close.time;
  } else {
    document.getElementById('iw-hours-row').style.display = 'none';
  }
  // Assign a five-star rating to the hotel, using a black star ('&#10029;')
  // to indicate the rating the hotel has earned, and a white star ('&#10025;')
  // for the rating points not achieved.
  if (place.rating) {
    var ratingHtml = '';
    for (var i = 0; i < 5; i++) {
      if (place.rating < (i + 0.5)) {
        ratingHtml += '&#10025;';
      } else {
        ratingHtml += '&#10029;';
      }
    document.getElementById('iw-rating-row').style.display = '';
    document.getElementById('iw-rating').innerHTML = ratingHtml;
    }
  } else {
    document.getElementById('iw-rating-row').style.display = 'none';
  }

  // The regexp isolates the first part of the URL (domain plus subdomain)
  // to give a short URL for displaying in the info window.
  if (place.website) {
    var fullUrl = place.website;
    var website = hostnameRegexp.exec(place.website);
    if (website === null) {
      website = 'http://' + place.website + '/';
      fullUrl = website;
    }
    document.getElementById('iw-website-row').style.display = '';
    document.getElementById('iw-website').textContent = website;
  } else {
    document.getElementById('iw-website-row').style.display = 'none';
  }
}
</script>
<script src="dist/baguetteBox.js" async></script>
<script src="js/highlight.min.js" async></script>
<script type="text/javascript">
	window.onload = function() {
		baguetteBox.run('.baguetteBoxOne');

		if (typeof oldIE === 'undefined' && Object.keys) {
			hljs.initHighlighting();
		}
	};
	$(function(){
		searchRoom();
	});
	$(document).ready(function() {
		$('#stayBeginStr').datetimepicker({
			format : 'dd-mm-yyyy',
			autoclose : true,
			minView : 2
		});
		$('#stayEndStr').datetimepicker({
			format : 'dd-mm-yyyy',
			autoclose : true,
			minView : 2
		});
	})
	function validateAndCommit() {
		var stayFrom = $("#stayBeginStr").val();
		var stayTo = $("#stayEndStr").val();
		window.location.href = './toAdvDetail?id=${advDto.id}&stayBeginStr='
				+ stayFrom + '&stayEndStr=' + stayTo;
	}
	function searchRoom() {
		var stayFrom = $("#stayBeginStr").val();
		var stayTo = $("#stayEndStr").val();
		$.post("searchRoom", {
			id : "${advDto.id}",
			stayBeginStr : stayFrom,
			stayEndStr : stayTo,
		},function(data){
			var roomList = data.rows;
			var html ="";
			for(var i=0;i<data.total;i++){
				var room=roomList[i];
				html += "<div class='row pt-120'><div class='floor-plan-image col-lg-5 col-md-6 col-xs-12 float-right'>	<div class='baguetteBoxOne gallery'>";
				var picList = room.picList;
				for(var j=0;j<picList.length;j++){

					html += "<a href='"+picList[j]+"' data-caption=''><img src='"+picList[j]+"' alt=''></a>";
					if(j==0){
						html +="<div style='display: none;'>"
					}
					if(j==(picList.length-1)){
						html +="</div>"
					}
				}
				html+="</div></div><div class='floor-plan-content col-lg-7 col-md-6 col-xs-12'><h2>Room: <span>"+room.name+"</span> $"+room.rental+"</h2><p>"+room.description+"</p><a href='javascript:showTextArea("+room.id+")' id='bookBtm0"+room.id+"'>Book Now</a><div class='row' id='HabitArea"+room.id+"' style='display: none;'><div class='col-xs-12'><label for='name'>Habit</label><textarea class='form-control' rows='3' id='habit' name='habit'></textarea></div></div><div class='row' id='ExpectationArea"+room.id+"' style='display: none;'><div class='col-xs-12  '><label for='name'>Expectation</label><textarea class='form-control' rows='3' id='expectation' name='expectation'></textarea></div></div><div class='row pt-30'><div class='col-xs-4 col-md-offset-4 '><a href='javascript:bookRoom("+room.id+")' class='btn btn-primary' id='bookBtm1"+room.id+"' style='display: none;'>Book</a></div></div></div></div>"
			}
			$("#roomArea").append(html);
		},"json");
	}
	function showTextArea(id) {
		document.getElementById("HabitArea"+id).style.display = "";
		document.getElementById("ExpectationArea"+id).style.display = "";
		document.getElementById("bookBtm0"+id).style.display = "none";
		document.getElementById("bookBtm1"+id).style.display = "";
	}
	function bookRoom(roomId) {
		var habit = $("#habit"+roomId).val();
		var expection = $("#expection"+roomId).val();
		$.messager
				.confirm(
						"Comfirmation",
						"Are you sure to book this room from ${bookDto.stayBeginStr} to ${bookDto.stayEndStr}?",
						function(mes) {
							if (mes) {
								$.post("bookRoom", {
									roomId : roomId,
									stayBeginStr : "${bookDto.stayBeginStr}",
									stayEndStr : "${bookDto.stayEndStr}"
								}, function(data) {
									if (data.res == "success") {
										$.messager.alert("Success",
												"Book this room Successfully");
										return;
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