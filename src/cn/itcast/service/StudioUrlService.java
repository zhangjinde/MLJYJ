package cn.itcast.service;

import cn.itcast.domain.StudioUrl;

public interface StudioUrlService {
	public void saveorupdate(StudioUrl su);
	public StudioUrl findByStudioId(Integer id);
}
