<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/index.css" rel="stylesheet" type="text/css">

</head>
<body>
<script type="text/javascript">

</script>
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
	//lay danh sach nganh hoc cua sinh vien
	session.removeAttribute("tranDau");
	session.removeAttribute("tenDoiNha");
	session.removeAttribute("tenDoiKhach");
	session.removeAttribute("ngaBatDau");
	session.removeAttribute("ngayKetThuc");
	
	ArrayList<VongDau004> vongDau004s = new VongDauDAO004().getVongDauCuaMuaGiai(); 
	BanToChuc004 banToChuc004 =  new BanToChuc004();
	banToChuc004.setMaBanToChuc("d72861fc-2db9-11ee-b132-00090faa0001");
	TranDau004 tranDau004 = new TranDau004();
	tranDau004.setBanToChuc(banToChuc004);
	session.setAttribute("tranDau", tranDau004);
	System.out.print(tranDau004);
	%>
	<h1>Danh sách vòng đấu</h1>
	<table border="1" class="dsVD">
		<tr>
			<th>Vòng đấu</th>
			<th>Ngày bắt đầu</th>
			<th>Ngày kết thúc</th>
			<th></th>
		</tr>
		<%
		for (VongDau004 v : vongDau004s) {
		%>
		<tr>
			<td><%=v.getSoThuTu()%></td>
			<td><%=v.getNgayBatDau()%></td>
			<td><%=v.getNgayKetThuc()%></td>
			<td><a href="/lenLichThiDau/gdLenLichThiDau004.jsp?maVongDau=<%= v.getMaVongDau()%>&action=next&ngayBatDau=<%=v.getNgayBatDau()%>&ngayKetThuc=<%= v.getNgayKetThuc()%>"><Button>Next</Button></a></td>
		</tr>
		<%
		}
		%>
	</table>
	
</body>
</html>