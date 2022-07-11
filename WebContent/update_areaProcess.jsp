<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<% 
try{
	String sql="update area0711 set areaname=? where areacode=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(2, request.getParameter("areacode"));
	pstmt.setString(1, request.getParameter("areaname"));
	pstmt.executeUpdate();
	%>
	<script>
	alert("수정이 완료되었습니다!");
	location.href="areaSelect.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}

%>
</body>
</html>