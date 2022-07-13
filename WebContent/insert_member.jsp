<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홈쇼핑</title>
<script>
function check() {
	var cnt=0;
	var doc=document.form;
	var chk=document.getElementsByName("goods");
	for(var i=0;i<chk.length;i++){
		if(chk[i].checked==true){
			cnt++;
			break;
		}
	}
	if(doc.custno.value==""){
		alert("회원번호를 입력하세요");
		doc.custno.focus();
		return false;
	}if(doc.custname.value==""){
		alert("회원이름를 입력하세요");
		doc.custname.focus();
		return false;
	}if(doc.phone.value==""){
		alert("회원전화를 입력하세요");
		doc.phone.focus();
		return false;
	}if(doc.address.value==""){
		alert("회원주소를 입력하세요");
		doc.address.focus();
		return false;
	}if(doc.joindate.value==""){
		alert("가입일자를 입력하세요");
		doc.joindate.focus();
		return false;
	}if(doc.grade.value==""){
		alert("고객등급을 입력하세요");
		doc.grade.focus();
		return false;
	}if(doc.city.value==""){
		alert("도시코드를 입력하세요");
		doc.city.focus();
		return false;
	}if(cnt==0){
		alert("관심상품을 입력하세요");
		return false;
	}else{
		doc.submit();
	}
	}

</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<%
int ma=0;
try{
	String sql="select max(custno) from member0713";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ma=rs.getInt(1)+1;
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<h2>홈쇼핑 회원 등록 화면</h2>
<hr>
<form name="form" method="post" action="insert_memberProcess.jsp">
<table border="1" id="tab1">
<tr>
	<th class="th1">회원번호(자동생성)</th>
		<td> <input type="text" name="custno" value="<%=ma %>"></td>
</tr>
<tr>
	<th class="th1">회원성명</th>
		<td> <input type="text" name="custname"></td>
</tr>
<tr>
	<th class="th1">회원전화</th>
		<td> <input type="text" name="phone"></td>
</tr>
<tr>
	<th class="th1">회원주소</th>
		<td> <input type="text" name="address"></td>
</tr>
<tr>
	<th class="th1">가입일자</th>
		<td> <input type="text" name="joindate"></td>
</tr>
<tr>
	<th class="th1">고객등급</th>
		<td>
		<select name="grade">
		<option value="">선택하세요</option>
		<option value="A">A : VIP</option>
		<option value="B">B : 일반</option>
		<option value="C">C : 직원</option>
		</select> </td>
</tr>
<tr>
	<th class="th1">도시코드</th>
		<td>
		<select name="city">
		<option value="">선택하세요</option>
		<option value="01">서울</option>
		<option value="02">경기</option>
		<option value="10">대전</option>
		<option value="20">부산</option>
		<option value="30">광주</option>
		<option value="40">울산</option>
		<option value="50">대구</option>
		<option value="60">강원</option>
		<option value="70">경상</option>
		<option value="80">충청</option>
		<option value="90">제주</option>
		</select> </td>
</tr>
<tr>
	<th class="th1">관심상품</th>
		<td><input type="checkbox" name="goods" value="의류">의류
			<input type="checkbox" name="goods" value="식료품">식료품
			<input type="checkbox" name="goods" value="컴퓨터">컴퓨터
			<input type="checkbox" name="goods" value="공산품">공산품
			<input type="checkbox" name="goods" value="관광">관광
			<input type="checkbox" name="goods" value="전자제품">전자제품
			<input type="checkbox" name="goods" value="건강제품">건강제품
			<input type="checkbox" name="goods" value="운동기구">운동기구
			</td>
</tr>
<tr>
<td colspan="2" class="td1">
 <input type="button" value="등록" onclick="check()" class="bt1">
 <input type="button" value="취소" onclick="location.href='index.jsp'" class="bt1">
 </td>
 </tr>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>