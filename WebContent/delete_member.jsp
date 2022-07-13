<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
String custno=request.getParameter("custno");

try{
	String sql="delete from member0713 where custno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, custno);
 	pstmt.executeUpdate();
 	%><script>
 	alert("삭제가 완료 되었습니다!");
 	location.href="select_member.jsp";
 	</script>
 	<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("삭제 실패");
}

%>
</body>
</html>