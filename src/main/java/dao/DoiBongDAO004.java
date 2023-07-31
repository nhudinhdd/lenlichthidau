package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.DoiBong004;

public class DoiBongDAO004 extends DAO004 {
	public DoiBongDAO004() {
		super();
	}
	
	public ArrayList<DoiBong004> getDanhSachDoiBongnTheoVongDau(String maVongDau) {	
		ArrayList<DoiBong004> doiBong004s =  new ArrayList<DoiBong004>();
        try {
        	Statement statement = con.createStatement();
			ResultSet rs = 
					statement.executeQuery("select\r\n"
							+ "* from tblDoiBong004\r\n"
							+ "where maDoiBong NOT IN(select tblDoiBong004maDoiBongSanNha as maDB\r\n"
							+ "from tbltrandau004\r\n"
							+ "where tblVongDau004maVongDau ='"+maVongDau+"'\r\n"
							+ "UNION ALL\r\n"
							+ "select tblDoiBong004maDoiBongSanKhach as maDB\r\n"
							+ "from tbltrandau004\r\n"
							+ "where tblVongDau004maVongDau ='"+maVongDau+"'\r\n"
							+ ")");
			
			   while(rs.next())
		        {
				   DoiBong004 doiBongSanNha = new DoiBong004();
				   doiBongSanNha.setMaDoiBong(rs.getString("maDoiBong"));
				   doiBongSanNha.setTenDoiBong(rs.getString("tenDoiBong"));
				   doiBongSanNha.setNgayThanhLap(rs.getDate("ngayThanhLap"));
				   doiBongSanNha.setSoDienThoai(rs.getString("soDienThoai"));	
				   doiBongSanNha.setDiaChi(rs.getString("diaChi"));
				   doiBong004s.add(doiBongSanNha);
		        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return doiBong004s;
		
	}
}
