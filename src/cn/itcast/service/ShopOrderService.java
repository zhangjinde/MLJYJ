package cn.itcast.service;

import cn.itcast.domain.ShopOrder;
import cn.itcast.domain.Usermain;
import cn.itcast.web.util.PageBean;

public interface ShopOrderService {
	public void save(ShopOrder so);
	public void update(ShopOrder so);
	public void del(Integer id);
	public ShopOrder findByNum(String ordernum);
	public ShopOrder findById(Integer id);
	public PageBean queryForPage(int pageSize,int currentPage);
}
