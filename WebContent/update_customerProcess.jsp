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
String custid=request.getParameter("custid");
String author=request.getParameter("author");
String goods[]=request.getParameterValues("goods");
String goodssum="";
String phone=request.getParameter("phone")+"-"+request.getParameter("phone1")+"-"+request.getParameter("phone2");
String email=request.getParameter("email")+"@"+request.getParameter("email1");
String areacode=request.getParameter("areacode");
try{
	String sql="update customer0711 set author=?,goods=?,phone=?,email=?,areacode=? where custid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(6, custid);
	pstmt.setString(1, author);
	for(int i=0;i<goods.length;i++){
		if(i==0){
			goodssum=goods[i];
		}else{
			goodssum+=","+goods[i];
		}
	}
	pstmt.setString(2, goodssum);
	pstmt.setString(3, phone);
	pstmt.setString(4, email);
	pstmt.setString(5, areacode);
	pstmt.executeUpdate();
	%>
	<script>
	alert("수정이 완료되었습니다!");
	location.href="customerSelect.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정 실패");
}

%>
</body>
</html>