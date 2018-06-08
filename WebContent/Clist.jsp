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
<table>
<tr><th>번호</th><th>이름</th><th>내용</th><th>작성일</th></tr>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
	String user = "system";
	String pw = "1234";
	String sql = "select * from comments order by seq desc";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection(url, user, pw);
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	rs.next();
	out.print(rs.getString(2));
	while(rs.next()) {
		int seq = rs.getInt(1);
		String name = rs.getString(2);
		String pass = rs.getString(3);
		String content = rs.getString(4);
		String rdate = rs.getString(5);
	%>
		<tr><td><%=seq%></td>
			<td><%=name %></td>
			<td><%=content %></td>
			<td><%=rdate %></td>
		</tr>
	<%
	}
	rs.close();
	pstmt.close();
	con.close();
%>
</table>

<form action="Cdelete.jsp" method="post">
<h3>삭제</h3>
번호 : <input type="text" size="10" name="num"/><br />
이름 : <input type="text" size="20" name="name" /><br />
비번 : <input type="password" size="20" name="pass" /><br />
<input type="submit" value="삭제" /><br />
</form>

</body>
</html>