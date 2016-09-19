package cn.itcast.service;

import cn.itcast.domain.OperationRecords;
import cn.itcast.web.util.PageBean;

public interface RecordsService {
	public void save(OperationRecords or);
	public void delete(Integer... or_id);
	public PageBean queryForPage(int pageSize,int currentPage);
}
