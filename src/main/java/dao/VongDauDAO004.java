package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.VongDau004;


public class VongDauDAO004 extends DAO004{
	public VongDauDAO004() {
		super();
	}
	
	/*..
	 *  lay danh sach vong dau cua mua giai hien tai
	 *  @return danh sach vong dau cua mua giai hien tai
	 */
	public ArrayList<VongDau004> getVongDauCuaMuaGiai() {
		ArrayList<VongDau004> vongDau004s =  new ArrayList<VongDau004>();
        try {
        	Statement statement = con.createStatement();
			ResultSet rs = 
					statement.executeQuery("select * from "
					+ "tblvongdau004 "
					+ "where tblMuaGiai004maMuaGiai = (select maMuaGiai from tblmuagiai004 where trangThai='active')");
			
			   while(rs.next())
		        {
				   VongDau004 vongDau004 = new VongDau004();
				   vongDau004.setMaVongDau(rs.getString("maVongDau"));
				   vongDau004.setSoThuTu(rs.getInt("soThuTu"));
				   vongDau004.setNgayBatDau(rs.getDate("ngayBatDau"));
				   vongDau004.setNgayKetThuc(rs.getDate("ngayKetThuc"));
				   vongDau004s.add(vongDau004);
		        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vongDau004s;
		
	}
}
