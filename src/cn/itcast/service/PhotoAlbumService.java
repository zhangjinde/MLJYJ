package cn.itcast.service;

import java.util.List;

import cn.itcast.domain.Family;
import cn.itcast.domain.PhotoAlbum;
//import cn.itcast.domain.Studio;

public interface PhotoAlbumService {
	public void save(PhotoAlbum pa);
	public void del(Integer pa_id);
	public void update(PhotoAlbum pa);
	public void updatewx(PhotoAlbum pa);
	public PhotoAlbum find(Integer pa_id);
	public List<PhotoAlbum> findall(Family fy);
	public List<PhotoAlbum> findall(Integer fy_id,Integer state);
	
	
//	public List<PhotoAlbum> findall(Studio studio);
}
