<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<%@ page import = "db.DB_Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>LastEat_Phase4 : Log in</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("password");
	int check = 0;
	int permission = 0;
	check = db.DB_Connection.Login_check(id, pwd);
	permission = db.DB_Connection.get_permission(id);
	request.setAttribute("id", id);
%>


<script type="text/javascript">
if(<%=check%> == 1 ){
	alert("Login Success!");
	if(<%=permission%> == 1){
		location.href='./ADMIN/ADMIN_INTERFACE.html';
	}else{
		location.href='./USER/USER_INTERFACE.html';
	}
	
}else{
	alert("Login Failed!");
	history.go(-1);
}
</script>

		
</body>
</html>