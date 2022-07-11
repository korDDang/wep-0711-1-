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
	if(doc.dmno.value==""){
		alert("dm 발송번호를 입력하세요.");
		doc.dmno.focus();
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



String custid="",maildate="",contents="",dept="",grade="",campain="",author="";
String dmno=request.getParameter("dmno");
try{
	String sql="select custid,to_char(maildate,'YYYY-MM-DD'),contents,dept,grade,campain from DM0711 where dmno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, dmno);
	rs=pstmt.executeQuery();
	if(rs.next()){
		 custid=rs.getString(1);
		 maildate=rs.getString(2);
		 contents=rs.getString(3);
		 dept=rs.getString(4);
		 grade=rs.getString(5);
		 campain=rs.getString(6);


	}
	}catch(SQLException e){
		e.printStackTrace();
	}

try
{
	String sql="select author from customer0711 where custid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, custid);
	rs=pstmt.executeQuery();
	if(rs.next()){
	 author = rs.getString(1);		
		
	}
}catch(SQLException e){
	e.printStackTrace();
}



%>
<h2>dm 정보 등록</h2>
<hr>
<form name="form" method="post" action="update_dmProcess.jsp">
<table border="1" id="tab1">
<tr>
	<th class="th1">dm 발송번호</th>
	<td colspan="3">
		<input type="text" name="dmno" value="<%=dmno%>">
	</td>
</tr>
<tr>
	<th class="th1">고객아이디</th>
	<td>
		<input type="text" name="custid" value="<%=custid%>">
	</td>
	<th class="th1">고 객 명</th>
	<td>
		<input type="text" name="author" value="<%=author%>">
	</td>
</tr>
<tr>
	<th class="th1">발송일자</th>
	<td>
		<input type="text" name="maildate" value="<%=maildate%>">
	</td>
	<th class="th1">dm내용</th>
	<td>
		<input type="text" name="contents" value="<%=contents%>">
	</td>
</tr>
<tr>
	<th class="th1">발송부서</th>
	<td>
		<input type="text" name="dept" value="<%=dept%>">
	</td>
	<th class="th1">고객등급</th>
	<td>
		<select name="grade">
		<option value="1" <%=grade.equals("1")?"selected":"" %>>1</option>
		<option value="2" <%=grade.equals("2")?"selected":"" %>>2</option>
		<option value="3" <%=grade.equals("3")?"selected":"" %>>3</option>
		<option value="4" <%=grade.equals("4")?"selected":"" %>>4</option>
		<option value="5" <%=grade.equals("5")?"selected":"" %>>5</option>
		<option value="v" <%=grade.equals("v")?"selected":"" %>>v</option>
		<option value="w" <%=grade.equals("w")?"selected":"" %>>w</option>
		</select>
	</td>
</tr>
<tr>
	<th class="th1">캠페인 구분</th>
	<td colspan="3">
		<input type="text" name="campain" value="<%=campain %>">
	</td>

<tr>
 <td colspan="4" class="td1">
 	
 	<input type="button" value="목록" onclick="location.href='dmSelect.jsp'" class="bt2">
 	<input type="button" value="등록" onclick="check()" class="bt2">
</td>
</tr>




</table>
</form>
<hr>
</section>
<%@include file="footer.jsp" %>
</body>
</html>