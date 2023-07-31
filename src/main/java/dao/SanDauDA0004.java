package dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.SanDau004;

public class SanDauDA0004 extends DAO004{
	public SanDauDA0004() {
		super();
	}
	
	public ArrayList<SanDau004> getDanhSachSanTheoVongDau(String maVongDau) {
		
		ArrayList<SanDau004> sanDau004s =  new ArrayList<SanDau004>();
        try {
        	Statement statement = con.createStatement();
			ResultSet rs = 
					statement.executeQuery("select * from tblSanDau004\r\n"
							+ "where maSanDau \r\n"
							+ "NOT IN(select tblSanDau004maSanDau from tblTranDau004 where tblVongDau004maVongDau='"+maVongDau+"')");
			
			   while(rs.next())
		        {
				   SanDau004 sanDau004 = new SanDau004();
				   sanDau004.setMaSanDau(rs.getString("maSanDau"));
				   sanDau004.setTenSanDau(rs.getString("tenSanDau"));
				   sanDau004.setDiaChi(rs.getString("diaChi"));
				   sanDau004.setSoDienThoai(rs.getString("soDienThoai"));
				   sanDau004s.add(sanDau004);
		        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sanDau004s;
		
	}
	
	public List<Date> getNgayGioDaChonCuaSanDau(String maVongDau) {
		
		return null;
		
	}
}
