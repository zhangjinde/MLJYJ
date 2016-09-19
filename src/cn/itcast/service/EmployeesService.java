package cn.itcast.service;

import java.util.List;

import cn.itcast.domain.Employees;
import cn.itcast.web.util.PageBean;

public interface EmployeesService {
	public void save(Employees e);
	public void update(Employees e);
	public void del(Integer e_id);
	public List<Employees> findByName(String e_name);
	public Employees findById(Integer e_id);
	public PageBean queryForPage(int pageSize,int currentPage);
	public List<Employees> serach(Integer pid,Integer cid,String professional);
}
