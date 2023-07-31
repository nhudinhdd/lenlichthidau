<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Giao diện chọn sân</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.js"></script>
<link rel="stylesheet" type="text/css"
	href="js/jquery.datetimepicker.min.css">
<script src="js/jquery.datetimepicker.full.min.js"></script>

<script>
	$(function() {

		const ngayBatDau = $("#ngayBatDau").val();
		const ngayKetThuc = $("#ngayKetThuc").val();
		$(".datepicker").datetimepicker({
			format : 'Y-m-d H:i:i',
			formatTime : 'H:i:i',
			formatDate : 'Y-m-d',
			minDate : new Date(ngayBatDau),
			maxDate : new Date(ngayKetThuc)
		});

	});
</script>
<script type="text/javascript">
	function chonSan(id, tenSandau, maVongDau) {
		console.log(id)
		const date = $("#" + id).val();
		console.log(date)
		if (date === 'Chọn giờ') {
			alert("Hãy chọn giờ")
		} else {
			window.location = '/lenLichThiDau/gdLenLichThiDau004.jsp?maSanDau='
					+ id
					+ "&tenSanDau="
					+ tenSandau
					+ "&action=chonSanDau"
					+ "&maVongDau=" + maVongDau + "&gioDau=" + date;
		}
	}
</script>

</head>
<body>
	<%
	String maVongDau = request.getParameter("maVongDau");
	String ngayBatDau = (String) session.getAttribute("ngayBatDau");
	String ngayKetThuc = (String) session.getAttribute("ngayKetThuc");
	TranDau004 tranDau004 = (TranDau004) session.getAttribute("tranDau");
	ArrayList<SanDau004> sanDau004s = new SanDauDA0004().getDanhSachSanTheoVongDau(maVongDau);
	System.out.print(ngayBatDau);
	System.out.print(ngayKetThuc);
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
	if (ngayBatDau == null || ngayBatDau.trim() == "" || ngayKetThuc == null || ngayKetThuc.trim() == "" || tranDau004 ==null) {
	%>
	<h4>Bạn cần bắt đầu lên lịch thi đấu từ giao diện chính</h4>
	<a href="/lenLichThiDau/index.jsp"><button>Giao diện chính
			ban tổ chức</button></a>
	<%
	} else {
	%>
	<input type="hidden" value=<%=ngayBatDau%> id="ngayBatDau" />
	<input type="hidden" value=<%=ngayKetThuc%> id="ngayKetThuc" />


	<h1>Chọn Sân</h1>
	<table border="1" class="dsVD">
		<tr>
			<th>Tên sân đấu</th>
			<th>Địa chỉ</th>
			<th>Số điện thoại</th>
			<th>Thời gian bắt đầu</th>
			<th></th>
		</tr>
		<%
		for (SanDau004 v : sanDau004s) {
		%>
		<tr>
			<td><%=v.getTenSanDau()%></td>
			<td><%=v.getDiaChi()%></td>
			<td><%=v.getSoDienThoai()%></td>
			<td><input type="button" class="datepicker" value="Chọn giờ"
				id=<%=v.getMaSanDau()%>></td>
			<td>
				<Button
					onclick="chonSan('<%=v.getMaSanDau()%>', '<%=v.getTenSanDau()%>','<%=maVongDau%>')">Chọn
					sân</Button>
			</td>
		</tr>
		<%
		}
		%>
	</table>
	<div class="footer">
		<Button>Quay lại</Button>
	</div>
	<%
	}
	%>
</body>
</html>