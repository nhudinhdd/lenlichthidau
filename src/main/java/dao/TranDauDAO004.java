package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.UUID;

import model.DoiBong004;
import model.SanDau004;
import model.TranDau004;



public class TranDauDAO004 extends DAO004 {
	public TranDauDAO004() {
		super();
	}
	
	public ArrayList<TranDau004> getDanhSachTranDauTheoVongDau(String maVongDau) {
		ArrayList<TranDau004> tranDau004s =  new ArrayList<TranDau004>();
        try {
        	Statement statement = con.createStatement();
			ResultSet rs = 
					statement.executeQuery("SELECT tranDauSanNha.maTranDau as maTranDau, maSanDau, tenSanDau, tblSanDau004.diaChi as diaChiSanDau, tblSanDau004.soDienThoai as soDienThoaiSanDau,\r\n"
							+ "maDoiBongSanNha, tenDoiBongSanNha, ngayThanhLapSanNha, diaChiSanNha,\r\n"
							+ "maDoiBongSanKhach,  tenDoiBongSanKhach, ngayThanhLapSanKhach, diaChiSanKhach,\r\n"
							+ "tranDauSanNha.thoiGian as thoiGianDienRa\r\n"
							+ "FROM \r\n"
							+ "\r\n"
							+ "(select maTranDau, maDoiBong as maDoiBongSanNha, tenDoiBong as tenDoiBongSanNha, ngayThanhLap as ngayThanhLapSanNha, diaChi as diaChiSanNha, thoiGian, \r\n"
							+ " tblSanDau004maSanDau, tblVongDau004maVongDau\r\n"
							+ " FROM\r\n"
							+ "tbltrandau004 inner join tbldoibong004 \r\n"
							+ "on tbltrandau004.tblDoiBong004maDoiBongSanNha  = tbldoibong004.maDoiBong "
							+ "where tbltrandau004.tblVongDau004maVongDau='"+maVongDau+"'"
							+ ") as tranDauSanNha \r\n"
							+ "inner join \r\n"
							+ "(select maTranDau, maDoiBong as maDoiBongSanKhach, tenDoiBong as tenDoiBongSanKhach, ngayThanhLap as ngayThanhLapSanKhach, diaChi as diaChiSanKhach, thoiGian \r\n"
							+ " FROM\r\n"
							+ "tbltrandau004 inner join tbldoibong004 \r\n"
							+ "on tbltrandau004.tblDoiBong004maDoiBongSanKhach  = tbldoibong004.maDoiBong "
							+ "where tbltrandau004.tblVongDau004maVongDau='"+maVongDau+"'"
							+ ") as tranDauSanKhach \r\n"
							+ "on tranDauSanNha.maTranDau = tranDauSanKhach.maTranDau\r\n"
							+ "inner join tblSanDau004 \r\n"
							+ "on tranDauSanNha.tblSanDau004maSanDau = tblSanDau004.maSanDau");
	
			   while(rs.next())
		        {
				   TranDau004 tranDau004 = new TranDau004();
				   tranDau004.setMaTranDau(rs.getString("maTranDau"));
				   
				   SanDau004 sanDau004 = new SanDau004();
				   sanDau004.setMaSanDau(rs.getString("maSanDau"));
				   sanDau004.setTenSanDau(rs.getString("tenSanDau"));
				   sanDau004.setDiaChi(rs.getString("diaChiSanDau"));
				   sanDau004.setSoDienThoai(rs.getString("soDienThoaiSanDau"));
				   tranDau004.setSanDau(sanDau004);
				   
				   DoiBong004 doiBongSanNha = new DoiBong004();
				   doiBongSanNha.setMaDoiBong(rs.getString("maDoiBongSanNha"));
				   doiBongSanNha.setTenDoiBong(rs.getString("tenDoiBongSanNha"));
				   doiBongSanNha.setNgayThanhLap(rs.getDate("ngayThanhLapSanNha"));
				   doiBongSanNha.setDiaChi(rs.getString("diaChiSanNha"));
				   tranDau004.setDoiBongSanNha(doiBongSanNha);
				   
				   DoiBong004 doiBongSanKhach = new DoiBong004();
				   doiBongSanKhach.setMaDoiBong(rs.getString("maDoiBongSanKhach"));
				   doiBongSanKhach.setTenDoiBong(rs.getString("tenDoiBongSanKhach"));
				   doiBongSanKhach.setNgayThanhLap(rs.getDate("ngayThanhLapSanKhach"));
				   doiBongSanKhach.setDiaChi(rs.getString("diaChiSanKhach"));
				   tranDau004.setDoiBongSanKhach(doiBongSanKhach);
				   tranDau004.setThoiGianDienRa(rs.getTimestamp("thoiGianDienRa"));
				   tranDau004s.add(tranDau004);
		        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
        System.out.print(tranDau004s);
		return tranDau004s;
		
	}
	
	public boolean luuLichThiDau(TranDau004 tranDau) {
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(""
					+ "INSERT INTO tbltrandau004(maTranDau, tblBanToChuc004maBanToChuc, tblSanDau004maSanDau,"
					+ " thoiGian, tblDoiBong004maDoiBongSanNha, tblDoiBong004maDoiBongSanKhach, tblVongDau004maVongDau) "
					+ "VALUES(?,?,?,?,?,?,?)");
			stmt.setString(1,  UUID.randomUUID().toString());
			stmt.setString(2, tranDau.getBanToChuc().getMaBanToChuc());
			stmt.setString(3, tranDau.getSanDau().getMaSanDau());
			stmt.setTimestamp(4,tranDau.getThoiGianDienRa());
			stmt.setString(5, tranDau.getDoiBongSanNha().getMaDoiBong());
			stmt.setString(6, tranDau.getDoiBongSanKhach().getMaDoiBong());
			stmt.setString(7, tranDau.getVongDau().getMaVongDau());
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}


		return true;
		
	}
}
