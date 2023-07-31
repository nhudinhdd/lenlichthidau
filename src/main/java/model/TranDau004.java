package model;

import java.sql.Timestamp;
import java.util.Arrays;

public class TranDau004 {

	private String maTranDau;
	private BanToChuc004 banToChuc;
	private TranDauChiTiet004[] dstranDauChiTiet;
	private SanDau004 sanDau;
	private DoiBong004 doiBongSanNha;
	private DoiBong004 doiBongSanKhach;
	private Integer ketQuaSanNha;
	private Integer ketQuaSanKhach;
	private Timestamp thoiGianDienRa;
	private VongDau004 vongDau;

	public VongDau004 getVongDau() {
		return vongDau;
	}

	public void setVongDau(VongDau004 vongDau) {
		this.vongDau = vongDau;
	}

	public DoiBong004 getDoiBongSanNha() {
		return doiBongSanNha;
	}

	public void setDoiBongSanNha(DoiBong004 doiBongSanNha) {
		this.doiBongSanNha = doiBongSanNha;
	}

	public DoiBong004 getDoiBongSanKhach() {
		return doiBongSanKhach;
	}

	public void setDoiBongSanKhach(DoiBong004 doiBongSanKhach) {
		this.doiBongSanKhach = doiBongSanKhach;
	}

	public Integer getKetQuaSanNha() {
		return ketQuaSanNha;
	}

	public void setKetQuaSanNha(Integer ketQuaSanNha) {
		this.ketQuaSanNha = ketQuaSanNha;
	}

	public Integer getKetQuaSanKhach() {
		return ketQuaSanKhach;
	}

	public void setKetQuaSanKhach(Integer ketQuaSanKhach) {
		this.ketQuaSanKhach = ketQuaSanKhach;
	}

	public String getMaTranDau() {
		return maTranDau;
	}

	public void setMaTranDau(String maTranDau) {
		this.maTranDau = maTranDau;
	}

	public BanToChuc004 getBanToChuc() {
		return banToChuc;
	}

	public void setBanToChuc(BanToChuc004 banToChuc) {
		this.banToChuc = banToChuc;
	}

	public TranDauChiTiet004[] getDstranDauChiTiet() {
		return dstranDauChiTiet;
	}

	public void setDstranDauChiTiet(TranDauChiTiet004[] dstranDauChiTiet) {
		this.dstranDauChiTiet = dstranDauChiTiet;
	}

	public SanDau004 getSanDau() {
		return sanDau;
	}

	public void setSanDau(SanDau004 sanDau) {
		this.sanDau = sanDau;
	}

	public Timestamp getThoiGianDienRa() {
		return thoiGianDienRa;
	}

	public void setThoiGianDienRa(Timestamp thoiGianDienRa) {
		this.thoiGianDienRa = thoiGianDienRa;
	}

	public void setThoiGianDienRa2(String thoiGianDienRa) {
		this.thoiGianDienRa = Timestamp.valueOf(thoiGianDienRa);
	}
	@Override
	public String toString() {
		return "TranDau004 [maTranDau=" + maTranDau + ", banToChuc=" + banToChuc + ", dstranDauChiTiet="
				+ Arrays.toString(dstranDauChiTiet) + ", sanDau=" + sanDau + ", doiBongSanNha=" + doiBongSanNha
				+ ", doiBongSanKhach=" + doiBongSanKhach + ", ketQuaSanNha=" + ketQuaSanNha + ", ketQuaSanKhach="
				+ ketQuaSanKhach + ", thoiGianDienRa=" + thoiGianDienRa + ", vongDau=" + vongDau + "]";
	}

}