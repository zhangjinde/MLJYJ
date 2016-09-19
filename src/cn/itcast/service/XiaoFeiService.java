package cn.itcast.service;

import cn.itcast.domain.XiaoFei;
import cn.itcast.web.util.PageBean;

public interface XiaoFeiService {
	public void save(XiaoFei xf);
	public void update(XiaoFei xf);
	public void del(Integer xf_id);
	public PageBean queryForPage(int pageSize,int currentPage,Integer family_id);
	public XiaoFei findById(Integer xf_id);
}
