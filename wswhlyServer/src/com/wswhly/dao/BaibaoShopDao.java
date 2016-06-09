package com.wswhly.dao;
import java.util.List;
import java.util.Map;

/**
 * �ٱ���--���� dao�ӿ�
 * @author xjt
 * @createDate 2014��12��11�� 14:49:17
 */
public interface BaibaoShopDao {

	
	/******************************************************��������********************************************************************/
	
	/**
	* �̼�����
	* @param data
	* @return int  0:ʧ��  1���ɹ�
	*/
	public int AddShop(Map<String, String> map);
	
	
	/**
	* �޸��̼���Ϣ
	* @param data
	* @return int 0:ʧ��  1���ɹ�
	*/
	public int UpdateShop(Map<String, String> map);
	
	
	/******************************************************ǰ̨չʾ********************************************************************/
	 
	/**
	 * ����  ��Ʒ����   ��ϸ��ַ   �ؼ��� ���̼�����   ��������  �ֻ���  ΢�źţ�   ��ҳ��ѯ         �������������� ������ȷ�� 
	 * ����  ����  ���ȣ��������    �������� ��������
	 * @param map 
	 * @return List
	 */
	public List<Map<String,Object>> getShopForList(Map<String, String> map);
	
	
	/**
	 * ����  ��Ʒ����   ��ϸ��ַ   �ؼ��� ���̼�����   ��������  �ֻ���  ΢�źţ� ����  ���ȣ��������     ��ѯ ����  �������������� ������ȷ�� 
	 * @param map
	 * @return int  ��������
	 */
	public int getShopForCount(Map<String, String> map);
	
	
	
	/******************************************************��������********************************************************************/
	
	/**
	 * ����map ��userid ��ѯ���̻�����Ϣ    ����ݵ���id��ѯ������Ϣ
	 * @param map
	 * @return map
	 */
	public Map<String,Object> getShop(Map<String, String> map);

}
