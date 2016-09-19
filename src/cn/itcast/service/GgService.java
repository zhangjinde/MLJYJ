package cn.itcast.service;

import cn.itcast.domain.Gg;
import cn.itcast.web.util.PageBean;

public interface GgService {
	public void save(Gg g);
	public void del(Integer id);
	public void update(Gg g);
	public PageBean queryForPage(int pageSize, int page);
	public Gg find(Integer id);
	public Gg findischeck();
}
