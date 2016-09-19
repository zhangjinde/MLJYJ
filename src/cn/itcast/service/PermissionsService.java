package cn.itcast.service;


import java.util.List;

import cn.itcast.domain.Permissions;
import cn.itcast.web.util.PageBean;

public interface PermissionsService {
	public void save(Permissions sd);
	public void update(Permissions sd);
	public void del(Integer... sds);
	public PageBean queryForPage(int pageSize,int currentPage);
	public Permissions find(Integer sd);
	public List findall();
}
