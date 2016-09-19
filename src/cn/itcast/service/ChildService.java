package cn.itcast.service;

import java.util.List;

import cn.itcast.domain.Child;
import cn.itcast.domain.Family;


public interface ChildService {
	public void save(Child child);
	public void update(Child child);
	public void delchild(Integer... child_id);
	public List<Child> findByfamilyid(Integer family_id);
	public Child findById(Integer child_id);
	
}
