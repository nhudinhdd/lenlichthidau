<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%

	//lay thong tin dang ki va luu
	TranDau004 tranDau004 = (TranDau004) session.getAttribute("tranDau");
	System.out.print(tranDau004);
	if ((new TranDauDAO004()).luuLichThiDau(tranDau004)) {
	%>
	<script type="text/javascript">
		alert("Lên lịch thi đấu thành công");
	</script>
	<%
	response.sendRedirect("index.jsp");
	} else {
	%>
	<script type="text/javascript">
		alert("Lỗi lên lịch thi đấu");
		history.back();
	</script>
	<%
	}
	%>
</body>
</html>