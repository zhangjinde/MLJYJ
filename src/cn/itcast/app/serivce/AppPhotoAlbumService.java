package cn.itcast.app.serivce;

import java.util.List;

import cn.itcast.domain.Family;
import cn.itcast.domain.PhotoAlbum;

public interface AppPhotoAlbumService {
	public void save(PhotoAlbum pa);
	public void del(Integer pa_id);
	public void update(PhotoAlbum pa);
	public void updatewx(PhotoAlbum pa);
	public PhotoAlbum find(Integer pa_id);
	public List<PhotoAlbum> findall(Family fy);
	public List<PhotoAlbum> findall(Integer fy_id);
}
