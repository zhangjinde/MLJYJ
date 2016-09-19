package cn.itcast.service;



import cn.itcast.domain.StandInsideLetter;
import cn.itcast.web.util.PageBean;

public interface SILService {
	public void save(StandInsideLetter sil);
	public void del(Integer...sil_id);
	public PageBean findaccept(int pageSize,int currentPage,String username);
	
	public Integer findnoread(String username);
	public StandInsideLetter findaccept(Integer sil_id);
}
