package com.wswhly.dao;

import java.util.List;
import java.util.Map;

/**
 * �ٱ���--���ѡ�� dao�ӿ�
 * @author xjt
 * @createDate 2014��12��11�� 15:56:13
 */
public interface BaiBaoChooseDao {
	
	/**
	 * ��ѯ���ѡ��
	 * @param map
	 * @return
	 */
	 public List<Map<String,Object>> getChooseForList(Map<String, String> map);

}
