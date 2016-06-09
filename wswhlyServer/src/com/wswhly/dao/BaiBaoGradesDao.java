package com.wswhly.dao;

import java.util.List;
import java.util.Map;

/**
 * �ٱ���--��� dao�ӿ�
 * @author xjt
 * @createDate 2014��12��11�� 15:59:36
 */
public interface BaiBaoGradesDao {
	
	/**
	 * ��Ӵ�ּ�¼
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int AddGrades(Map<String, String> map);
	
	/**
	 * ��ѯ��ּ�¼       �ݶ��÷����ô�
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> getGradesForList(Map<String, String> map);
}
