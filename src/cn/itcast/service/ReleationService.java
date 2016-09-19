package cn.itcast.service;

import java.util.List;

import cn.itcast.domain.Relation;

public interface ReleationService {
	public void save(Relation rel);
	public void del(Integer r_id);
	public void update(Relation rel);
	public Relation findbyid(Integer r_id);
	public List<Relation> findbyumid(Integer umid);

}
