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
<th class="th1">회원번호</th>
<th class="th1">회원이름</th>
<th class="th1">고객등급</th>
<th class="th1">매출</th>
</tr>
<%
int no=0;
try{
	String sql="select m.custno,m.custname,m.grade,sum(n.price) from member0713 m, money0713 n where m.custno=n.custno group by m.custno,m.custname,m.grade order by m.custno";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String custno=rs.getString(1);
		String custname=rs.getString(2);
		String grade=rs.getString(3);
		switch(grade){
		case "A" : grade="VIP";
		break;
		case "B" : grade="일반";
		break;
		case "C" : grade="직원";
		break;
		}
		String price=rs.getString(4);
		no++;

%>
<tr>
<td class="td1"><%=no %></td>
<td class="td1"><%=custno %></td>
<td class="td1"><%=custname %></td>
<td class="td1"><%=grade %></td>
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