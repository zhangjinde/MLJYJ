package cn.itcast.service;




import java.util.List;

import cn.itcast.domain.PhotoAlbumClass;
import cn.itcast.web.util.PageBean;

public interface PhotoAlbumClassService {
	public void save(PhotoAlbumClass sd);
	public void update(PhotoAlbumClass sd);
	public void del(Integer... sds);
	public PageBean queryForPage(int pageSize,int currentPage);
	public PhotoAlbumClass find(Integer sd);
	public List<PhotoAlbumClass> findall();
}
