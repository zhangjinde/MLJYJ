package cn.itcast.service;



import java.util.List;

import cn.itcast.domain.Pictures;
import cn.itcast.web.util.PageBean;

public interface PicturesService {
	public void save(Pictures pic);
	public void del(Integer pic_id);
	public void update(Pictures pic);
	public PageBean queryForPage(int pageSize,int currentPage,Integer pa_id);
	public Pictures find(Integer pic_id);
	public List<Pictures> findall(Integer pa_id);
}
