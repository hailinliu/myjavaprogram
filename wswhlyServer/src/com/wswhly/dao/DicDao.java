package com.wswhly.dao;

import java.util.List;
import java.util.Map;

public interface DicDao {

	/**
	 * ���ݸ���id��ѯ ����ĵ���
	 * @param parentcode
	 * @return
	 */
	public List<Map<String,Object>> getDicaddress(int parentcode);
}
