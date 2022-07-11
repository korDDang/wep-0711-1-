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
	String sql="insert into customer0711 values(?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, custid);
	pstmt.setString(2, author);
	for(int i=0;i<goods.length;i++){
		if(i==0){
			goodssum=goods[i];
		}else{
			goodssum+=","+goods[i];
		}
	}
	pstmt.setString(3, goodssum);
	pstmt.setString(4, phone);
	pstmt.setString(5, email);
	pstmt.setString(6, areacode);
	pstmt.executeUpdate();
	%>
	<script>
	alert("등록이 완료되었습니다!");
	location.href="customerSelect.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}

%>
</body>
</html>