<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check() {
	var doc=document.form;
	if(doc.custid.value==""){
		alert("고객아이디를 입력하세요.");
		doc.custid.focus();
		return false;
	}if(doc.author.value==""){
		alert("고객이름을 입력하세요.");
		doc.author.focus();
		return false;
	}else{
		doc.submit();
		
	}
}

</script>

</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section id="sec1">
<h2>고객 정보 등록 화면</h2>
<hr>
<form name="form" method="post" action="addCustomerProcess.jsp">
<table border="1" id="tab1">
<tr>
	<th class="th1">고객 아이디</th>
	<td>
		<input type="text" name="custid">
	</td>
</tr>
<tr>
	<th class="th1">고 객 성 명</th>
	<td>
		<input type="text" name="author">
	</td>
</tr>
<tr>
<th class="th1">관심상품</th>
<td>
	<input type="checkbox" name="goods" value="의류">의류
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
	<th class="th1">전화</th>
	<td>
		<input type="text" name="phone">-
		<input type="text" name="phone1">-
		<input type="text" name="phone2">
	</td>
</tr>
<tr>
	<th class="th1">이메일</th>
	<td>
		<input type="text" name="email">@
		<input type="text" name="email1">
	</td>
</tr>
<tr>
	<th class="th1">거주지</th>
	<td>
		<select name="areacode">
		<option value="101">서울</option>
		<option value="102">경기</option>
		<option value="103">대전</option>
		<option value="104">부산</option>
		<option value="105">광주</option>
		<option value="106">울산</option>
		<option value="107">대구</option>
		<option value="108">강원</option>
		<option value="109">경상</option>
		<option value="110">충청</option>
		<option value="111">제주</option>
		
		</select>
	</td>
</tr>
<tr>
 <td colspan="2" class="td1">
 	<input type="button" value="등록" onclick="check()" class="bt2">
 	<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt2">
</td>
</tr>

</table>
</form>
<hr>
</section>
<%@include file="footer.jsp" %>
</body>
</html>