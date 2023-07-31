<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Giao diện chọn đội</title>
<link href="css/index.css" rel="stylesheet" type="text/css">

</head>


<body>
	<%
	TranDau004 tranDau004 = (TranDau004) session.getAttribute("tranDau");
	ArrayList<DoiBong004> doiBong004s = new ArrayList<>();
	String action = "";
	String maVongDau  = "";
	if(tranDau004!=null){
		maVongDau = request.getParameter("maVongDau");
		action = request.getParameter("action");
		doiBong004s = new DoiBongDAO004().getDanhSachDoiBongnTheoVongDau(maVongDau);
		DoiBong004 doiBongSaNha = tranDau004.getDoiBongSanNha();
		DoiBong004 doiBongSaKhach = tranDau004.getDoiBongSanKhach();
		if(doiBongSaNha != null) {
			doiBong004s.remove(doiBongSaNha);
		}
		if(doiBongSaKhach != null) {
			doiBong004s.remove(doiBongSaKhach);
		}
	}

	%>
	<div class="index__headerContent">
		<div class="info">
			<span>Tên người dùng: Nhữ Đình An</span> <span>Chức vụ: Ban tổ
				chức</span>
		</div>
		<div>
			<Button>Đăng xuất</Button>
		</div>
	</div>
	<%
	if (action.trim() == ""  || maVongDau.trim() == "" || tranDau004 == null) {
	%>
	<h4>Bạn cần bắt đầu lên lịch thi đấu từ giao diện chính</h4>
	<a href="/lenLichThiDau/index.jsp"><button>Giao diện chính ban tổ chức</button></a>
	<%
	} else {
	%>
	<h1>Chọn đội</h1>
	<table border="1" class="dsVD">
		<tr>
			<th>Tên đội bóng</th>
			<th>Ngày thành lập</th>
			<th>Số điện thoại</th>
			<th>Địa chỉ</th>
			<th></th>
		</tr>
		<%
		for (DoiBong004 v : doiBong004s) {
		%>
		<tr>
			<td><%=v.getTenDoiBong()%></td>
			<td><%=v.getNgayThanhLap()%></td>
			<td><%=v.getSoDienThoai()%></td>
			<td><%=v.getDiaChi()%></td>
			<td><a href="/lenLichThiDau/gdLenLichThiDau004.jsp?action=<%=action%>&maDoiBong=<%=v.getMaDoiBong()%>&tenDoiBong=<%=v.getTenDoiBong()%>&maVongDau=<%=maVongDau%>"><Button>Chọn đội</Button></a></td>
		</tr>
		<%
		}
		%>
	</table>
	<div class="footer">
		<Button>Quay lại</Button>
	</div>
	<%} %>
</body>
</html>