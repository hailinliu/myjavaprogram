package com.hyzm.forward.service.baibao;
import java.util.List;
import java.util.Map;

/**
 * �ٱ���--���� service�ӿ�
 * @author xjt
 * @createDate 2014��12��16�� 08:52:50
 */
public interface BaibaoShopService {

	
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
	public Map<String,Object> getShopForList(Map<String, String> map);
	
	
	/******************************************************��������********************************************************************/
	
	/**
	 * ����map ��userid ��ѯ���̻�����Ϣ    ����ݵ���id��ѯ������Ϣ
	 * @param map
	 * @return map
	 */
	public Map<String,Object> getShop(Map<String, String> map);

}
