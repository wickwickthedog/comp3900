
<%
	//Set no- cache on program  
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Expires", "0");
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/demo/demo.css">
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ums.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css"> --%>
<link href="${pageContext.request.contextPath}/css/vis.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery.form.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/ums.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/vis.min.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/json2.js"></script>

<title>Level HTML Template</title>
<!-- load stylesheets -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
<!-- Google web font "Open Sans" -->
<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Bootstrap style -->
<link rel="stylesheet" type="text/css" href="slick/slick.css" />
<link rel="stylesheet" type="text/css" href="slick/slick-theme.css" />
<link rel="stylesheet" type="text/css" href="css/datepicker.css" />
<link rel="stylesheet" href="css/tooplate-style.css">

<!-- load JS files -->
<script src="js/jquery-1.11.3.min.js"></script>
<!-- jQuery (https://jquery.com/download/) -->
<script src="js/popper.min.js"></script>
<!-- https://popper.js.org/ -->
<script src="js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script src="js/datepicker.min.js"></script>
<!-- https://github.com/qodesmith/datepicker -->
<script src="js/jquery.singlePageNav.min.js"></script>
<!-- Single Page Nav (https://github.com/ChrisWojcik/single-page-nav) -->
<script src="slick/slick.min.js"></script>