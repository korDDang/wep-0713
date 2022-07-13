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
<%
int cnt=0;
try{
	String sql="select count(*) from money0713";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<h2>회원 매출정보 목록</h2>
<div style="margin: 0 20%">총 <%=cnt%>건의 매출정보가 있습니다.</div>
<hr>
<table border="1" id="tab2">
<tr>
<th class="th1">no</th>
<th class="th1">회원번호</th>
<th class="th1">판매번호</th>
<th class="th1">단가</th>
<th class="th1">수량</th>
<th class="th1">가격</th>
<th class="th1">상품코드</th>
<th class="th1">판매일자</th>
<th class="th1">구분</th>
</tr>
<%
DecimalFormat fo=new DecimalFormat("###,###");
int no=0;
try{
	String sql="select custno,saleno,pcost,amount,price,pcode,to_char(sdate,'YYYY-MM-DD') from money0713";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String custno=rs.getString(1);
		String saleno=rs.getString(2);
		String pcost=rs.getString(3);
		String amount=rs.getString(4);
		int price=rs.getInt(5);
		String pcode=rs.getString(6);
		String sdate=rs.getString(7);
		
		
		no++;

%>
<tr>
<td class="td1"><%=no %></td>
<td class="td1"><a href="update_money.jsp?custno=<%=custno %>&&saleno=<%=saleno%>"><%=custno %></a></td>
<td class="td1"><%=saleno %></td>
<td class="td1"><%=pcost %></td>
<td class="td1"><%=amount %></td>
<td class="td1"><%=fo.format(price) %></td>
<td class="td1"><%=pcode %></td>
<td class="td1"><%=sdate %></td>
<td class="td1"><a href="delete_money.jsp?custno=<%=custno %>&&saleno=<%=saleno%>">삭제</a></td>
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