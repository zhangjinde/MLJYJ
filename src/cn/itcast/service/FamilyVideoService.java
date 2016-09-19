package cn.itcast.service;

import java.util.List;

import cn.itcast.domain.app.FamilyVideo;

public interface FamilyVideoService {
	public void save(FamilyVideo fv);
	public void del(Integer ...ids);
	public void update(FamilyVideo fv);
	public FamilyVideo findById(Integer id);
	public List<FamilyVideo> findByFmilyID(Integer id,Integer limit,Integer state);
	
	

}
