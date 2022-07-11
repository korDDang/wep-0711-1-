<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DM 발송 내역</title>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<%@include file="DBConn.jsp" %>
<section id="sec1">
<h2>DM 발송 내역</h2>
<%
int cnt=0;
try{
	String sql="select count(*) from DM0711";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<div class="div1">총 <%=cnt %>건의 발송내역이 있습니다.</div>
<hr>
<table border="1" id="tab1">
<tr>
<th class="th1">no</th>
<th class="th1">DM발송번호</th>
<th class="th1">고객아이디</th>
<th class="th1">고객성명</th>
<th class="th1">발송일자</th>
<th class="th1">DM 내용</th>
<th class="th1">발송부서</th>
<th class="th1">고객등급</th>
<th class="th1">캠페인구분</th>
<th class="th1">구분</th>
</tr>
<%
int no=0;
try{
	String sql="select d.dmno,c.custid,c.author,to_char(d.maildate,'YYYY-MM-DD'),d.contents,d.dept,d.grade,d.campain from customer0711 c, DM0711 d where c.custid=d.custid";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String dmno=rs.getString(1);
		String custid=rs.getString(2);
		String author=rs.getString(3);
		String maildate=rs.getString(4);
		String contents=rs.getString(5);
		String dept=rs.getString(6);
		String grade=rs.getString(7);
		String campain=rs.getString(8);
		no++;
	

%>
<tr>
<td class="td1"><%=no %></td>
<td  class="td1"><a href="update_dm.jsp?dmno=<%=dmno %>"><%=dmno%></a></td>
<td  class="td1"><%=custid %></td>
<td  class="td1"><%=author %></td>
<td  class="td1"><%=maildate %></td>
<td  class="td1"><%=contents %></td>
<td  class="td1"><%=dept %></td>
<td  class="td1"><%=grade %></td>
<td  class="td1"><%=campain %></td>
<td class="td1"><a href="delete_dm.jsp?dmno=<%=dmno %>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a></td>
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