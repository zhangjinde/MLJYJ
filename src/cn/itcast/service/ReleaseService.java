package cn.itcast.service;

import java.util.List;

import cn.itcast.domain.android.Release;



public interface ReleaseService {
	
	//新增发布心情信息
	public void save(Release re);
	//删除
	public void del(Integer... id);
	//更新
	public void update(Release re);
	//查询单个对象
	public Release find(Integer id);
	
	public Integer gettotal();
	public List<Release> listall(Integer offset, Integer limitnum);
	//返回所选区域所有发布的心情列表
	public List<Release> returnlist(String city);
	
}
