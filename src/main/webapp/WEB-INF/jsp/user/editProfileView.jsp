<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<c:set var="title">H2CG Accommodation</c:set>
	<c:set var="subTitle">My Profile</c:set>
	
	<!-- table display details-->
	
	<c:set value="editProfile.jsp" var="page"/>
	<%@include file="../../commons/layout.jsp"%>
</body>
</html>