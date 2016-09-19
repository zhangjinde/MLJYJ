package cn.itcast.service;



import java.util.List;

import cn.itcast.domain.Uservice;

public interface UserviceService {
	public void save(Uservice um);
	public void update(Uservice um);
	public void del(Integer... ums);
	public List<Uservice> findByName(String username,Integer id);
	public Uservice findById(Integer uv_id);
	public List<Uservice> findByfamilyid(Integer family_id);
	public Uservice findByTel(String tel,Integer id);
	public Uservice findByTelOnly(String tel);
	public Uservice findByOpenId(String openid);
	public List<Uservice> findbylickname(String name);
}
