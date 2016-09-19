package cn.itcast.service;


import java.sql.ResultSet;
import java.util.List;

import cn.itcast.domain.Family;
import cn.itcast.domain.Remind;
import cn.itcast.domain.UserageFX;
import cn.itcast.domain.XiaofeiFamily;
import cn.itcast.domain.XiaofeiY;

import cn.itcast.domain.Usermain;
import cn.itcast.web.util.PageBean;


public interface FamilyService {
	public void save(Family family);
	public void del(Integer... family_ids);
	public void update(Family family);
	public Family find(Integer family_id);
	public PageBean queryForPage(int pageSize,int currentPage,Usermain um);
	public List<Family> findlikelovepwd(String pwd,Integer s_id);
	public List<Family> marryremind(Integer s_id);
	
	public List<Family> findBychildname(String name,Integer s_id);
	public Integer familycount();
	public Integer familycount(Integer s_id,String time);
	
	public List<Remind> marryremind1(Integer s_id);

	public List<XiaofeiY> xiaofeilistY(Integer s_id,Integer year);
	
	public List<XiaofeiY> xiaofeilistM(Integer s_id,String year);
	
	
	public List<XiaofeiFamily> xiaofeiFDY(Integer s_id);
	
	public List<XiaofeiFamily> xiaofeiFDN(Integer s_id);
	
	public List<XiaofeiFamily> xiaofeiFYX(Integer s_id);
	
	public List<UserageFX> userfx(Integer s_id);
}
