<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "db.DB_Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
		
	String id = request.getParameter("id");
	System.out.println(id);
	int cnt = DB_Connection.id_check(id);
%>
<script type="text/javascript">
if(<%=cnt%> > 1){
	alert("ID Duplication");
	history.go(-1);
}else{
	alert("Enable!");
	history.go(-1);
}
</script>
</body>
</html>