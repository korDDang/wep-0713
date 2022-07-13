<%@page import="com.sun.javafx.tk.FocusCause"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홈쇼핑</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<h2>회원 매출 정보 조회(회원번호별 집계)</h2>
<hr>
<table border="1" id="tab2">
<tr>
<th class="th1">no</th>
<th class="th1">상품코드</th>
<th class="th1">상품명</th>
<th class="th1">매출</th>
</tr>
<%
int no=0;
try{
	String sql="select p.pcode,p.pname,sum(m.price) from product0713 p, money0713 m where p.pcode=m.pcode group by p.pcode,p.pname order by p.pcode ";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String pcode=rs.getString(1);
		String pname=rs.getString(2);
		String price=rs.getString(3);
		no++;

%>
<tr>
<td class="td1"><%=no %></td>
<td class="td1"><%=pcode %></td>
<td class="td1"><%=pname %></td>
<td class="td1"><%=price %></td>
</tr>
<%
	}
}catch(Exception e){
	e.printStackTrace();
	System.out.println("조회실패");
}%>
</table>
<br>
<div class="td1"><input type="button" value="작성" onclick="location.href='insert_money.jsp'" class="bt1"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>