<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--  import JDBC package -->
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<%@ page import = "db.DB_Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>LastEat_Phase4 : Sign in</title>
</head>
<body>

<% 
	
	Connection conn = null;
	PreparedStatement ps = null;
	String sql = "insert into account values(?,?,?,?,?,?,TO_DATE(?,'YYYY-MM-DD'),?,?,?)";
	
	int rs=0;
	
	try{
		
		conn = DB_Connection.getCon();
		ps = conn.prepareStatement(sql);

		ps.setString(1, request.getParameter("id"));
		ps.setString(2, request.getParameter("password"));
		ps.setString(3, request.getParameter("tel"));
		ps.setString(4, request.getParameter("fname"));
		ps.setString(5, request.getParameter("lname"));
		ps.setString(6, request.getParameter("sex"));
		ps.setString(7, request.getParameter("birth_d"));
		ps.setString(8, request.getParameter("Address"));
		ps.setString(9, request.getParameter("job"));
		ps.setString(10,request.getParameter("permission"));
	
		rs = ps.executeUpdate();
		
		conn.commit();
		ps.close();
		conn.close();
		
	}catch(SQLException se){
		System.out.println(se.getMessage());
	}
%>


<button type="button" class="nabyBtn" onClick="location.href='Main.html'">Exit</button>
		
<script type="text/javascript">
if(<%=rs%> > 0){
	alert("Enroll Success!");
	location.href="Main.html";//
}else{
	alert("Enroll Failed!");
	history.go(-1);
}
</script>

</body>
</html>