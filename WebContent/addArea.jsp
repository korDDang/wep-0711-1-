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
	if(doc.areacode.value==""){
		alert("거주지 코드를 입력하세요.");
		doc.areacode.focus();
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
<h2>거주지 정보 등록 화면</h2>
<hr>
<form name="form" method="post" action="addAreaProcess.jsp">
<table border="1" id="tab1">
<tr>
	<th class="th1">거주지 코드</th>
	<td>
		<input type="text" name="areacode">
	</td>
</tr>
<tr>
	<th class="th1">거주지 이름</th>
	<td>
		<input type="text" name="areaname">
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