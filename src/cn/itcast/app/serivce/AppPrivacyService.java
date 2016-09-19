package cn.itcast.app.serivce;

import cn.itcast.domain.AppPrivacy;

public interface AppPrivacyService {
	public void save(AppPrivacy ap);
	public void update(AppPrivacy ap);
	public AppPrivacy findByUid(Integer uid);
}
