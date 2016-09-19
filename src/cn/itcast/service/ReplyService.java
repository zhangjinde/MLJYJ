package cn.itcast.service;

import java.util.List;

import cn.itcast.domain.android.Reply;

public interface ReplyService {
	
	//新增发布心情信息
	public void save(Reply re);

	public void del(Integer pic_id);
	
	public void update(Reply pic);
	
	public Reply find(Integer pic_id);
	
	//返回对应的发布信息
	public List<Reply> returnlist(Integer re_id);

}
