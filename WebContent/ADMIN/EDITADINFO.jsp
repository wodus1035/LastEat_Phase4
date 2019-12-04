<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>LastEat_Phase4 : Edit Admin information</title>
</head>
<body>
<%

	String id = (String)request.getAttribute("id");
	String tel = request.getParameter("tel");
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String sex = request.getParameter("sex");
	String birth_d = request.getParameter("birth_d");
	String address = request.getParameter("Address");
	String job = request.getParameter("job");
	int check=-1;
	check = db.DB_Connection.Edit(tel,fname,lname,sex,birth_d,address,job,id);

%>
<script>
if(<%=check%> > 0 ){
	alert("Edit Success!");
	location.href = 'ADMIN_INTERFACE.html';
}else{
	alert("Edit Failed!");
	history.go(-1);
}
</script>

</body>
</html>