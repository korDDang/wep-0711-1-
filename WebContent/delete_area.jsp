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
String areacode=request.getParameter("areacode");

try{
	String sql="delete from area0711 where areacode=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, areacode);
	pstmt.executeUpdate();
	%>
	<script>
	alert("삭제가 완료되었습니다!");
	location.href="areaSelect.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("삭제 실패");
}

%>
</body>
</html>