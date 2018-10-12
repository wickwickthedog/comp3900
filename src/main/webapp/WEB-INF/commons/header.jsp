<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<title>Header</title>  
</head>  
<body>  
  
    <table width="100%">
    	<tr>
    		<td align="center"><img alt="" src="${pageContext.request.contextPath}/images/pageHead.png"></td>
    	</tr>
    	<tr>
    		<td align="center">
    		 <table width="1200px">
    		 	<tr>
		    		<td align="right">
		    		<a href="${pageContext.request.contextPath}/sys/language?langType=zh">简体中文</a>
   					<a href="${pageContext.request.contextPath}/sys/language?langType=en">English</a>
		    		<a href="${pageContext.request.contextPath}/auth/logout" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'">Logout</a></td>
		    	</tr>
    		 </table>
    		</td>
    	</tr>
    </table>
</body>  
<script type="text/javascript">

</script>
</html>  