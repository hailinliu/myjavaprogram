package com.hyzm.forward.service.baibao;

import java.util.Map;

/**
 * �ٱ���--��Ʒ service�ӿ�
 * @author xjt
 * @createDate 2014��12��16�� 08:52:32
 */
public interface BaiBaoCollectionService {
	/******************************************************��������********************************************************************/
	/**
	 * ��Ӳ�Ʒ
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int AddCollection(Map<String, String> map);
	
	/**
	 * �޸Ĳ�Ʒ
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int UpdateCollection(Map<String, String> map);
	
	/**
	 * ɾ����Ʒ  
	 * @param map  ����id����ɾ��   ���߸���userid ����ɾ��
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int DeleteCollection(Map<String, String> map);
	
	
	/******************************************************ǰ̨չʾ********************************************************************/
	
	/**
	 * ר���Ƽ���Ʒ  
	 * @param map  
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int UpdateCollectionByZj(Map<String, String> map);
	
	/******************************************************��������********************************************************************/
	
	/**
	 * ���ݲ�Ʒid��ѯ��Ʒ��ϸ��Ϣ
	 * @param map  ��Ʒid
	 * @return map
	 */
	public Map<String,Object> getCollection(Map<String, String> map);
	
	/**
	 * �����û�id   ���ߵ���id   ����  ��Ʒ����  ����Ʒ�۸�����   ������ת����  ������ת״̬    �Ƿ�ר���Ƽ�  ���ҵ�ַ   �ؼ��� ��Ʒ����  ��������  ��������  ��ҳ��ѯ        �������������� ������ȷ�� 
	 * ����  ����  ���ȣ��������    �������� ��������
	 * @param map 
	 * @return List
	 */
	public Map<String,Object> getCollectionForList(Map<String, String> map);
	
}
