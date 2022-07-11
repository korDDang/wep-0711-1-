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
String dmno=request.getParameter("dmno");

try{
	String sql="delete from DM0711 where dmno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, dmno);
	pstmt.executeUpdate();
	%>
	<script>
	alert("삭제가 완료되었습니다!");
	location.href="dmSelect.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("삭제 실패");
}

%>
</body>
</html>