package cn.itcast.service;

import java.util.List;

import cn.itcast.domain.android.RePicture;


public interface RePictureService {
	
	public void save(RePicture pic);
	public void del(Integer pic_id);
	public void update(RePicture pic);
	public RePicture find(Integer pic_id);
	public List<RePicture> findall(Integer re_id);

}
