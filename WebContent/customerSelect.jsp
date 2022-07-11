<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객 정보 조회</title>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<%@include file="DBConn.jsp" %>
<section id="sec1">
<h2>고객 정보 목록</h2>
<%
int cnt=0;
try{
	String sql="select count(*) from customer0711";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<div class="div1">총 <%=cnt %>명의 고객이 있습니다.</div>
<hr>
<table border="1" id="tab1">
<tr>
<th class="th1">no</th>
<th class="th1">고객아이디</th>
<th class="th1">고객성명</th>
<th class="th1">관심상품</th>
<th class="th1">전화</th>
<th class="th1">이메일</th>
<th class="th1">거주지코드</th>
<th class="th1">거주지</th>
<th class="th1">구분</th>
</tr>
<%
int no=0;
try{
	String sql="select * from customer0711";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String custid=rs.getString(1);
		String author=rs.getString(2);
		String goods=rs.getString(3);
		String phone=rs.getString(4);
		String email=rs.getString(5);
		String areacode=rs.getString(6);
		String areacode1=rs.getString(6);
		switch(areacode1){
		case "101": areacode1="서울";
		break;
		case "102": areacode1="경기";
		break;
		case "103": areacode1="대전";
		break;
		case "104": areacode1="부산";
		break;
		case "105": areacode1="광주";
		break;
		case "106": areacode1="울산";
		break;
		case "107": areacode1="대구";
		break;
		case "108": areacode1="강원";
		break;
		case "109": areacode1="경상";
		break;
		case "110": areacode1="충청";
		break;
		case "111": areacode1="제주";
		break;
		}
		no++;
	

%>
<tr>
<td class="td1"><%=no %></td>
<td  class="td1"><a href="update_customer.jsp?custid=<%=custid %>"><%=custid%></a></td>
<td  class="td1"><%=author %></td>
<td  class="td1"><%=goods %></td>
<td  class="td1"><%=phone %></td>
<td  class="td1"><%=email %></td>
<td  class="td1"><%=areacode %></td>
<td  class="td1"><%=areacode1 %></td>
<td class="td1"><a href="delete_customer.jsp?custid=<%=custid %>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a></td>
</tr>
<%
	}
}catch(SQLException e){
	e.printStackTrace();
}


%>
</table>
<br>
<div class="td1"><input type="button" value="작성" onclick="location.href=addCustomer.jsp'" class="bt2"></div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>