package com.wswhly.dao;

import java.util.List;
import java.util.Map;

/**
 * �ٱ���--��ע dao�ӿ�
 * @author xjt
 * @createDate 2014��12��11�� 15:45:12
 */
public interface BaiBaoAttentionDao {
	/******************************************************��������********************************************************************/
	
	/**
	 * ���ӹ�ע
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int AddAttention(Map<String, String> map);
	
	/**
	 * ɾ����ע
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int DeleteAttention(Map<String, String> map);
	
	
	
	/******************************************************ǰ̨չʾ********************************************************************/
	
//	/**
//	 * ���ݲ�Ʒid �û�id ��ѯ     �÷������������ж��û��Ƿ��Ѿ���ע���ò�Ʒ
//	 * @param map
//	 * @return
//	 */
//	public Map<String,Object> getAttention(Map<String, String> map);
	
	
	
	/******************************************************��������********************************************************************/
	
	/**
	 * �����û�id   ���Ʒid  ���������� ��ҳ��ѯ
	 * @param map
	 * @return List
	 */
	public List<Map<String,Object>> getAttentionForList(Map<String, String> map);
	
	/**
	 * �����û�id   ���Ʒid  ���������� ��ѯ����
	 * @param map
	 * @return ����
	 */
	public int getAttentionForCount(Map<String, String> map);

}