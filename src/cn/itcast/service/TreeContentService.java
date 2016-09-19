package cn.itcast.service;

import java.util.List;

import cn.itcast.domain.TreeContent;

public interface TreeContentService {
	public void save(TreeContent tc);
	public void del(Integer tc_id);
	public List<TreeContent> findbyumid(Integer umid);
	public TreeContent findbyid(Integer tc_id);
}
