<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<%@ include file="../commons/meta.jsp"%>
<c:if test="${sessionScope['org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'] eq 'zh_CN'}">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/locale/easyui-lang-zh_CN.js"></script>
</c:if>
<title>H2CG Accommodation</title> 
</head>  
<body>
	<div class="sub-title">
    <div class="content-div">
        <img src="${pageContext.request.contextPath}/images/unswBook.png" style="margin: 5px 0">
    <div class="lang-div"><img src="${pageContext.request.contextPath}/images/LOGO_ren.png"
                               class="person-img">
                               <span><sec:authentication property="name"/></span>
                               <span><a href="${pageContext.request.contextPath}/logout" >Logout</a></span>
                               </div>
    </div>
</div>
<div class="sub-title">
    <div class="content-div">
    </div>
</div>
<div class="content" style="display: table;width: 100%">
	 <div class="tb-p-c"></div>
    <div style="display: table-cell;width: 990px">
      		<table class="umstable" cellspacing="0">
      			<tr>
      				<td class="umsTitle">${title}</td>
      				<td class="umsTitleImg"></td>
      				<td class="umsSubTitle">${subTitle}</td>
					<td class="umsTitleImg2"></td>
      			</tr>
      		</table>
			<div class="easyui-panel" style="height:600px;padding:0px;">			
				<jsp:include page="${page}" flush="true"/>
			</div>
	
    </div>
    <div class="tb-p-c" style="text-align: left"></div>
</div>
<div class="gold-line"></div>
<div class="footer">
    <div class="content-div">
    </div>
</div>
</body>  
</html>  