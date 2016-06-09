package com.wswhly.dao;

import java.util.List;
import java.util.Map;


/**
 * ͼƬ����
 * @author Administrator
 *2015��4��13�� 12:51:30
 */
public interface OnlinePicDao {
	
	/***********************************************************����Ϊ��Ʒ����*******************************************************************************/
	//���Ӳ�Ʒ
	public int AddOnlinePicColl(Map<String, String> map);
	//�޸Ĳ�Ʒ
	public int UpdateOnlinePicColl(Map<String, String> map);
	//ɾ����Ʒ
	public int DeleteOnlinePicColl(Map<String, String> map);
	//��ѯ������Ʒ
	public Map<String, Object>  getOnlinePicCollForMap(Map<String, String> map);
	//��ѯ��Ʒ����
	public int getOnlinePicCollForCount(Map<String, String> map);
	//��ѯ��Ʒ�б�
	public List<Map<String, Object>>  getOnlinePicCollForList(Map<String, String> map);
	
	
	//�޸��û����
	public boolean UpdateMoney(Map<String,Object> map);
	//�޸Ļ���
	public boolean AddPoint(Map<String,Object> map);
	//�޸���ϸ
	public boolean AddUserMoney(Map<String,Object> map);
	//��Ӷ���
	public boolean AddOrder(Map<String,Object> map);
	
	/***********************************************************����ΪͼƬ������Ʒ���ͷ���*******************************************************************************/
	//��ȡ��Ʒ����
	public List<Map<String, Object>> getOnlinePicType(Map<String, String> map);
	
	
	/***********************************************************����ΪͼƬ����ר�ҷ���*******************************************************************************/
	//��ȡר��
	public List<Map<String, Object>> getOnlinePicProf(Map<String, String> map);
	
	

}
