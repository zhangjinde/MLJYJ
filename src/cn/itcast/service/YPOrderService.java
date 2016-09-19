package cn.itcast.service;


import cn.itcast.domain.YPOrder;
import cn.itcast.web.util.PageBean;

public interface YPOrderService {
	public void save(YPOrder yp);
	public void del(Integer... ids);
	public PageBean queryForPage(int pageSize,int currentPage);
	public YPOrder findById(Integer id);
}
