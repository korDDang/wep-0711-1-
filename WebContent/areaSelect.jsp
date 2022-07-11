<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>거주지 정보 조회</title>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<%@include file="DBConn.jsp" %>
<section id="sec1">
<h2>거주지 정보 목록</h2>
<%
int cnt=0;
try{
	String sql="select count(*) from area0711";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<div class="div1">총 <%=cnt %>개의 거주지가 있습니다.</div>
<hr>
<table border="1" id="tab1">
<tr>
<th class="th1">no</th>
<th class="th1">거주지 코드</th>
<th class="th1">거주지 이름</th>
<th class="th1">구분</th>
</tr>
<%
int no=0;
try{
	String sql="select * from area0711";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String areacode=rs.getString(1);
		String areaname=rs.getString(2);
		switch(areaname){
		case "101": areaname="서울";
		break;
		case "102": areaname="경기";
		break;
		case "103": areaname="대전";
		break;
		case "104": areaname="부산";
		break;
		case "105": areaname="광주";
		break;
		case "106": areaname="울산";
		break;
		case "107": areaname="대구";
		break;
		case "108": areaname="강원";
		break;
		case "109": areaname="경상";
		break;
		case "110": areaname="충청";
		break;
		case "111": areaname="제주";
		break;
		}
		no++;
	

%>
<tr>
<td class="td1"><%=no %></td>
<td  class="td1"><%=areacode %></td>
<td  class="td1"><%=areaname %></td>
<td class="td1">
<a href="update_area.jsp?areacode=<%=areacode %>">수정</a>/
<a href="delete_area.jsp?areacode=<%=areacode %>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a></td>
</tr>
<%
	}
}catch(SQLException e){
	e.printStackTrace();
}


%>
</table>
<br>
<div class="td1"><input type="button" value="작성" onclick="location.href=addArea.jsp'" class="bt2"></div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>