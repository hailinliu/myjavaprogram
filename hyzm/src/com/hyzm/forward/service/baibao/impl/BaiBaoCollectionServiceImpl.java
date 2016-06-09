package com.hyzm.forward.service.baibao.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.baibao.BaiBaoCollectionService;
/**
 * �ٱ���--��Ʒ serviceʵ����
 * @author xjt
 * @createDate 2014��12��16�� 09:08:09
 */
@Service
public class BaiBaoCollectionServiceImpl extends MessageResponse implements BaiBaoCollectionService {
	private final Logger log = Logger.getLogger(this.getClass());
	/******************************************************��������********************************************************************/
	/**
	 * ��Ӳ�Ʒ
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int AddCollection(Map<String, String> map){
		 log.info("��Ӳ�Ʒ");
			Map<String,Object> data =new HashMap<String, Object>();
			try {
				data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_AddCollection");
				return Integer.valueOf(data.get("num").toString());
			} catch (Exception e) {
				log.error("��Ӳ�Ʒ�쳣��"+e.getMessage());
				e.printStackTrace();
				return 0;
			}
	}
	
	/**
	 * �޸Ĳ�Ʒ
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int UpdateCollection(Map<String, String> map){
		 log.info("�޸Ĳ�Ʒ");
			Map<String,Object> data =new HashMap<String, Object>();
			try {
				data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_UpdateCollection");
				return Integer.valueOf(data.get("num").toString());
			} catch (Exception e) {
				log.error("�޸Ĳ�Ʒ�쳣��"+e.getMessage());
				e.printStackTrace();
				return 0;
			}
	}
	
	/**
	 * ɾ����Ʒ  
	 * @param map  ����id����ɾ��   ���߸���userid ����ɾ��
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int DeleteCollection(Map<String, String> map){
		 log.info("ɾ����Ʒ");
			Map<String,Object> data =new HashMap<String, Object>();
			try {
				data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_DeleteCollection");
				return Integer.valueOf(data.get("num").toString());
			} catch (Exception e) {
				log.error("ɾ����Ʒ�쳣��"+e.getMessage());
				e.printStackTrace();
				return 0;
			}
	}
	
	
	/******************************************************ǰ̨չʾ********************************************************************/
	
	/**
	 * ר���Ƽ���Ʒ  
	 * @param map  
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int UpdateCollectionByZj(Map<String, String> map){
		log.info("ר���Ƽ���Ʒ  ");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_UpdateCollectionByZj");
			return Integer.valueOf(data.get("num").toString());
		} catch (Exception e) {
			log.error("ר���Ƽ���Ʒ  �쳣��"+e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
	
	/******************************************************��������********************************************************************/
	
	/**
	 * ���ݲ�Ʒid��ѯ��Ʒ��ϸ��Ϣ
	 * @param map  ��Ʒid
	 * @return map
	 */
	public Map<String,Object> getCollection(Map<String, String> map){
		log.info("��ѯ��Ʒ��ϸ��Ϣ");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_getCollection");
			return data;
		} catch (Exception e) {
			log.error("��ѯ��Ʒ��ϸ��Ϣ�쳣��"+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * �����û�id   ���ߵ���id   ����  ��Ʒ����  ����Ʒ�۸�����   ������ת����  ������ת״̬    �Ƿ�ר���Ƽ�  ���ҵ�ַ   �ؼ��� ��Ʒ����  ��������  ��������  ��ҳ��ѯ        �������������� ������ȷ�� 
	 * ����  ����  ���ȣ��������    �������� ��������
	 * @param map 
	 * @return List
	 */
	public Map<String,Object> getCollectionForList(Map<String, String> map){
		log.info("��ѯ��Ʒ");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_getCollectionForList");
			return data;
		} catch (Exception e) {
			log.error("��ѯ��Ʒ�쳣��"+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	
}
