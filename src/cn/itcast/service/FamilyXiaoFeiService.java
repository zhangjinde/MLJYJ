package cn.itcast.service;

import java.util.List;

import cn.itcast.domain.FamilyXiaoFei;

import cn.itcast.domain.XiaoFeiFM;



public interface FamilyXiaoFeiService {
	
	public void save(FamilyXiaoFei xf);
	public void update(FamilyXiaoFei xf);
	public void del(Integer xf_id);
	public List<FamilyXiaoFei> fmxiaofeilist(Integer s_id,String year,String xfcount);
	
	public FamilyXiaoFei findById(Integer xf_id);
	
	public List<XiaoFeiFM> xiaofeilist(Integer f_id);
}
