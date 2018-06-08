<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String pass=request.getParameter("pass");
	int num=Integer.parseInt(request.getParameter("num"));
	Connection con = null;
	PreparedStatement pstmt = null;
	String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
	String user = "system";
	String pw = "1234";
	String sql="delete from comments where seq = ( select seq from comments where seq = ? and name = ? and pass = ?)";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection(url, user, pw);
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, num);
	pstmt.setString(2, name);
	pstmt.setString(3, pass);
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	
	response.sendRedirect("Clist.jsp");
%>

</body>
</html>