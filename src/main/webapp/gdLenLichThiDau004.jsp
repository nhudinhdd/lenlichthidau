<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,dao.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lên lịch thi đấu</title>
<link href="css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">

function luuLichThiDau(){
	const doiNha = $("#doiNha");
	const doiKhach = $("#doiKhach");
	const sanDau = $("#sanDau");
	const gioDau = $("#gioDau");
	console.log(doiNha);
	if(doiNha == undefined || doiKhach == undefined || sanDau == undefined || gioDau == undefined 
		|| !doiNha.val() || !doiKhach.val() || !sanDau.val() || !gioDau.val()) {
		alert("Hãy chọn đủ thông tin trước khi lưu lịch thi đấu")
	} else {
		 window.location = '/lenLichThiDau//doLuuLichThiDau.jsp'
	}
		
}
</script>
</head>

<body>
	<%
	String maVongDau = request.getParameter("maVongDau");
	;
	TranDau004 tranDau004 = (TranDau004) session.getAttribute("tranDau");
	String action = request.getParameter("action");
	String tenDoiNha="";
	String tenDoiKhach="";
	String tenSanDau="" ;
	String gioDau="";
	ArrayList<TranDau004> tranDau004S = new ArrayList<>();
	if(tranDau004!=null){
		tenDoiNha = (String) session.getAttribute("tenDoiNha");
		 tenDoiKhach = (String)session.getAttribute("tenDoiKhach");
		 tenSanDau = (tranDau004.getSanDau() == null)?"" :tranDau004.getSanDau().getTenSanDau();
		 gioDau = (tranDau004.getThoiGianDienRa() == null)?"": tranDau004.getThoiGianDienRa().toString();
		if(gioDau == null) gioDau="";
		if ("next".equals(action)) {
			VongDau004 vongDau = new VongDau004();
			vongDau.setMaVongDau(maVongDau);
			tranDau004.setVongDau(vongDau);
			session.setAttribute("tranDau", tranDau004);

			session.setAttribute("ngayBatDau", request.getParameter("ngayBatDau"));
			session.setAttribute("ngayKetThuc", request.getParameter("ngayKetThuc"));
		} else if ("chonDoiNha".equals(action)) {
			DoiBong004 doiBongSanNha = new DoiBong004();
			String maDoiBong = request.getParameter("maDoiBong");
			doiBongSanNha.setMaDoiBong(maDoiBong);
			tranDau004.setDoiBongSanNha(doiBongSanNha);
			session.setAttribute("tranDau", tranDau004);
			tenDoiNha = request.getParameter("tenDoiBong");
			session.setAttribute("tenDoiNha", tenDoiNha);
		} else if ("chonDoiKhach".equals(action)) {
			DoiBong004 doiBongSanKhach = new DoiBong004();
			String maDoiBong = request.getParameter("maDoiBong");
			doiBongSanKhach.setMaDoiBong(maDoiBong);
			tranDau004.setDoiBongSanKhach(doiBongSanKhach);
			session.setAttribute("tranDau", tranDau004);
			tenDoiKhach = request.getParameter("tenDoiBong");
			session.setAttribute("tenDoiKhach", tenDoiKhach);
		} else if ("chonSanDau".equals(action)) {
			tenSanDau = request.getParameter("tenSanDau");
			gioDau = (String)request.getParameter("gioDau");
			SanDau004 sanDau = new SanDau004();
			sanDau.setMaSanDau(request.getParameter("maSanDau"));
			sanDau.setTenSanDau(tenSanDau);
			tranDau004.setSanDau(sanDau);
			tranDau004.setThoiGianDienRa2(gioDau);
			session.setAttribute("tranDau", tranDau004);
		} else {
			tranDau004 = null;
		}
		
		tranDau004S = new TranDauDAO004().getDanhSachTranDauTheoVongDau(maVongDau);
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
	if (maVongDau == null || maVongDau.trim() == "" || tranDau004 == null) {
	%>
	<h4>Bạn cần bắt đầu lên lịch thi đấu từ giao diện chính</h4>
	<a href="/lenLichThiDau/index.jsp"><button>Giao diện chính ban tổ chức</button></a>
	<%
	} else {
	%>


	<h1>Lên lịch thi đấu</h1>
	<table border="1" class="dsVD">
		<tr>
			<th>Đội 1 (Đội nhà)</th>
			<th>Đội 2 (Đội khách)</th>
			<th>Sân đấu</th>
			<th>Giờ đấu</th>
			<th></th>
		</tr>
		<%
		for (TranDau004 v : tranDau004S) {
		%>
		<tr>
			<td><%=v.getDoiBongSanNha().getTenDoiBong()%></td>
			<td><%=v.getDoiBongSanKhach().getTenDoiBong()%></td>
			<td><%=v.getSanDau().getTenSanDau()%></td>
			<td><%=v.getThoiGianDienRa()%></td>
			<td></td>
		</tr>
		<%
		}
		%>
		<tr>
			<td><a
				href="/lenLichThiDau/gdChonDoi004.jsp?maVongDau=<%=maVongDau%>&action=chonDoiNha">
					<%
					if (tenDoiNha == null || tenDoiNha.trim().equals("")) {
					%>
					<Button>Chọn đội</Button>
					 <%} else {%>
					 <input disabled="disabled" style="border: none; color: blue; background-color: white;" value="<%=tenDoiNha%>" id="doiNha"/>
				<%}%>
				</a>
				</td>
			<td><a
				href="/lenLichThiDau/gdChonDoi004.jsp?maVongDau=<%=maVongDau%>&action=chonDoiKhach">
					<%
					if (tenDoiKhach == null || tenDoiKhach.trim().equals("")) {
					%>
					<Button>Chọn đội</Button>
					 <%} else {%>
					 <input disabled="disabled" style="border: none; color: blue; background-color: white;" value="<%=tenDoiKhach%>" id="doiKhach"/>			 
				<%}%>
				</a>
			</td>
			<td>
			<a
				href="/lenLichThiDau/gdChonSan004.jsp?maVongDau=<%=maVongDau%>&action=chonSanDau">
					<%
					if (tenSanDau == null || tenSanDau.trim().equals("")) {
					%>
					<Button>Chọn sân</Button>
					 <%} else {%>
					 <input disabled="disabled" style="border: none; color: blue; background-color: white;" value="<%=tenSanDau%>" id="sanDau"/>	
					 
				<%}%>
				</a>
			</td>
			<td>
			<input disabled="disabled" style="border: none; color: blue; background-color: white;" value="<%=gioDau%>" id="gioDau"/>	
			</td>
			<td><Button onclick="luuLichThiDau()">Lưu</Button></td>
		</tr>
	</table>
	<div class="footer">
		<Button>Quay lại</Button>

	</div>
	<%
	}
	%>

 </body>
</html>