package cn.itcast.service;

import java.util.List;

import cn.itcast.domain.Usermain;
import cn.itcast.web.util.PageBean;

public interface UsermainService {
	public void save(Usermain um);
	public void update(Usermain um);
	public void del(Integer... ums);
	public Usermain findByName(String username,Integer id);
	public Usermain findByName(String username);
	public Usermain findById(Integer um_id);
	public PageBean queryForPage(int pageSize,int currentPage,Usermain um);
	public void wxupdate(Usermain um);
}
