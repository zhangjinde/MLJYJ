package cn.itcast.service;

import java.util.List;

import cn.itcast.domain.Userstatus;
import cn.itcast.domain.UserstatusComments;
import cn.itcast.web.util.PageBean;

public interface UserStatusService {
	public void save(Userstatus us);
	
	public void savers(UserstatusComments usc);
	public void del(Integer... id);
	public void update(Userstatus us);
	public Userstatus find(String title);
	public List<UserstatusComments> returnlist(Integer id,Integer num);
	public PageBean queryForPage(int pageSize, int page,Integer um_id);
	
	public void updatedz( Integer id);
}
