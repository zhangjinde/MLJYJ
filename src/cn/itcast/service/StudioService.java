package cn.itcast.service;



import java.util.List;

import cn.itcast.domain.Studio;
import cn.itcast.domain.Usermain;
import cn.itcast.web.util.PageBean;

public interface StudioService {
	public void save(Studio sd);
	public void update(Studio sd);
	public void del(Integer... sds);
	public PageBean queryForPage(int pageSize,int currentPage);
	public Studio find(Integer sd);
	public List<Studio> findlikeName(String name);
	public List<Studio> findall();
	//�ҳ�Ӱ¥�µ����й����˺�
	public List<Usermain> findalladmin();
	public List<Usermain> findadminByStudioid(Integer sid);
	
}
