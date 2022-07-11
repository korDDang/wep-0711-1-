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
<%@include file="DBConn.jsp" %>
<section id="sec1">
<%
String custid=request.getParameter("custid");
try{
	String sql="select * from customer0711 where custid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, custid);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String author=rs.getString("author");
		String goods=rs.getString("goods");
		String go[]=goods.split(",");
		String phone=rs.getString("phone");
		String ph[]=phone.split("-");
		String email=rs.getString("email");
		String em[]=email.split("@");
		String areacode=rs.getString("areacode");
	
%>
<h2>고객 정보 수정 화면</h2>
<hr>
<form name="form" method="post" action="update_customerProcess.jsp">
<table border="1" id="tab1">
<tr>
	<th class="th1">고객 아이디</th>
	<td>
		<input type="text" name="custid" value="<%=custid%>">
	</td>
</tr>
<tr>
	<th class="th1">고 객 성 명</th>
	<td>
		<input type="text" name="author" value="<%=author%>">
	</td>
</tr>
<tr>
<th class="th1">관심상품</th>
<td>
	<input type="checkbox" name="goods" value="의류" <%for(int i=0;i<go.length;i++){if(go[i].equals("의류")){%>checked<%}}%>>의류
	<input type="checkbox" name="goods" value="식료품" <%for(int i=0;i<go.length;i++){if(go[i].equals("식료품")){%>checked<%}}%>>식료품
	<input type="checkbox" name="goods" value="컴퓨터" <%for(int i=0;i<go.length;i++){if(go[i].equals("컴퓨터")){%>checked<%}}%>>컴퓨터
	<input type="checkbox" name="goods" value="공산품" <%for(int i=0;i<go.length;i++){if(go[i].equals("공산품")){%>checked<%}}%>>공산품
	<input type="checkbox" name="goods" value="관광" <%for(int i=0;i<go.length;i++){if(go[i].equals("관광")){%>checked<%}}%>>관광
	<input type="checkbox" name="goods" value="전자제품" <%for(int i=0;i<go.length;i++){if(go[i].equals("전자제품")){%>checked<%}}%>>전자제품
	<input type="checkbox" name="goods" value="건강제품" <%for(int i=0;i<go.length;i++){if(go[i].equals("건강제품")){%>checked<%}}%>>건강제품
	<input type="checkbox" name="goods" value="운동기구" <%for(int i=0;i<go.length;i++){if(go[i].equals("운동기구")){%>checked<%}}%>>운동기구
</td>
</tr>
<tr>
	<th class="th1">전화</th>
	<td>
		<input type="text" name="phone" value="<%=ph[0]%>">-
		<input type="text" name="phone1"  value="<%=ph[1]%>">-
		<input type="text" name="phone2"  value="<%=ph[2]%>">
	</td>
</tr>
<tr>
	<th class="th1">이메일</th>
	<td>
		<input type="text" name="email"  value="<%=em[0]%>">@
		<input type="text" name="email1" value="<%=em[1]%>">
	</td>
</tr>
<tr>
	<th class="th1">거주지</th>
	<td>
		<select name="areacode">
		<option value="101" <%=areacode.equals("101")?"selected":"" %>>서울</option>
		<option value="102" <%=areacode.equals("102")?"selected":"" %>>경기</option>
		<option value="103" <%=areacode.equals("103")?"selected":"" %>>대전</option>
		<option value="104" <%=areacode.equals("104")?"selected":"" %>>부산</option>
		<option value="105" <%=areacode.equals("105")?"selected":"" %>>광주</option>
		<option value="106" <%=areacode.equals("106")?"selected":"" %>>울산</option>
		<option value="107" <%=areacode.equals("107")?"selected":"" %>>대구</option>
		<option value="108" <%=areacode.equals("108")?"selected":"" %>>강원</option>
		<option value="109" <%=areacode.equals("109")?"selected":"" %>>경상</option>
		<option value="110" <%=areacode.equals("110")?"selected":"" %>>충청</option>
		<option value="111" <%=areacode.equals("111")?"selected":"" %>>제주</option>
		
		</select>
	</td>
</tr>
<tr>
 <td colspan="2" class="td1">
 	<input type="button" value="등록" onclick="check()" class="bt2">
 	<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt2">
</td>
</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
	}


%>
</table>
</form>
<hr>
</section>
<%@include file="footer.jsp" %>
</body>
</html>