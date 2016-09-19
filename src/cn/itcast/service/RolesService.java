package cn.itcast.service;

import java.util.List;
import java.util.Set;

import cn.itcast.domain.Permissions;
import cn.itcast.domain.Roles;
import cn.itcast.web.util.PageBean;

public interface RolesService {
	public void save(Roles sd);
	public void update(Roles sd);
	public void del(Integer... sds);
	public PageBean queryForPage(int pageSize,int currentPage);
	public Roles find(Integer sd);
	public List<Roles> findall();
}
