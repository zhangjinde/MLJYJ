package cn.itcast.app.serivce;

import java.util.List;

import cn.itcast.domain.app.AppActivity;

public interface AppActivityService {
	public void save(AppActivity aa);
	public void update(AppActivity aa);
	public void del(Integer id);
	public List<AppActivity> allList(Integer studioid,Integer isuse);
	
}
