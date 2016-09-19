package cn.itcast.service;

import cn.itcast.domain.CustomTS;

public interface CustomTSService {
		public CustomTS findbyStudioid(Integer id);
		public void saveandeupdate(CustomTS ts);
	
}
