<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Menu</title>
<script>
	
</script>
</head>
<body>
	<div class="tm-main-content" id="top">

		<div class="tm-top-bar-bg"></div>
		<div class="tm-top-bar" id="tm-top-bar">
			<!-- Top Navbar -->
			<div class="container">
				<div class="row">

					<nav class="navbar navbar-expand-lg narbar-light"> <a class="navbar-brand mr-auto" href="#"> <img src="images/logo.png" alt="Site logo">
					</a>
					<button type="button" id="nav-toggle" class="navbar-toggler collapsed" data-toggle="collapse" data-target="#mainNav" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div id="mainNav" class="collapse navbar-collapse tm-bg-white">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="#top">Home <span class="sr-only">(current)</span></a></li>
							<li class="nav-item"><a class="nav-link" href="#tm-section-4">Portfolio</a></li>
							<li class="nav-item"><a class="nav-link" href="#tm-section-5">Blog Entries</a></li>
							<li class="nav-item"><a class="nav-link" href="#tm-section-6">Contact Us</a></li>
						</ul>
					</div>
					</nav>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function setPageNav() {
		if ($(window).width() > 991) {
			$('#tm-top-bar').singlePageNav({
				currentClass : 'active',
				offset : 79
			});
		} else {
			$('#tm-top-bar').singlePageNav({
				currentClass : 'active',
				offset : 65
			});
		}
	}

	$(document).ready(function() {

		$(window).on("scroll", function() {
			if ($(window).scrollTop() > 100) {
				$(".tm-top-bar").addClass("active");
			} else {
				//remove the background property so it comes transparent again (defined in your css)
				$(".tm-top-bar").removeClass("active");
			}
		});



		// Slick carousel
/* 		setCarousel();
 */		setPageNav();

		$(window).resize(function() {
			setPageNav();
		});

		// Close navbar after clicked
		$('.nav-link').click(function() {
			$('#mainNav').removeClass('show');
		});



	});
</script>
</html>
