package model;

import java.sql.Date;
import java.util.Objects;

public class DoiBong004 {

	private String tenDoiBong;
	private Date ngayThanhLap;
	private String diaChi;
	private String soDienThoai;
	private String maDoiBong;

	public String getTenDoiBong() {
		return tenDoiBong;
	}

	public void setTenDoiBong(String tenDoiBong) {
		this.tenDoiBong = tenDoiBong;
	}

	public Date getNgayThanhLap() {
		return ngayThanhLap;
	}

	public void setNgayThanhLap(Date ngayThanhLap) {
		this.ngayThanhLap = ngayThanhLap;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getMaDoiBong() {
		return maDoiBong;
	}

	public void setMaDoiBong(String maDoiBong) {
		this.maDoiBong = maDoiBong;
	}

	@Override
	public int hashCode() {
		return Objects.hash(maDoiBong);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DoiBong004 other = (DoiBong004) obj;
		return Objects.equals(maDoiBong, other.maDoiBong);
	}
	
	

}