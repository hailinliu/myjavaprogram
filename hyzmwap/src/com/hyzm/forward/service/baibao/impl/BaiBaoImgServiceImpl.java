package com.hyzm.forward.service.baibao.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.baibao.BaiBaoImgService;
/**
 * �ٱ���--��ƷͼƬ serviceʵ����
 * @author xjt
 * @createDate 2014��12��16�� 09:14:42
 */
@Service
public class BaiBaoImgServiceImpl extends MessageResponse implements BaiBaoImgService {
	private final Logger log = Logger.getLogger(this.getClass());
	/**
	 * ���ͼƬ
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int AddImg(Map<String, String> map){
		 log.info("���ͼƬ");
			Map<String,Object> data =new HashMap<String, Object>();
			try {
				data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_AddImg");
				return Integer.valueOf(data.get("num").toString());
			} catch (Exception e) {
				log.error("���ͼƬ�쳣��"+e.getMessage());
				e.printStackTrace();
				return 0;
			}
	}
	
	/**
	 * ɾ��ͼƬ
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int DeleteImg(Map<String, String> map){
		log.info("ɾ��ͼƬ");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_DeleteImg");
			return Integer.valueOf(data.get("num").toString());
		} catch (Exception e) {
			log.error("ɾ��ͼƬ�쳣��"+e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * ��ѯͼƬ���ݲ�Ʒid 
	 * @param map
	 * @return list
	 */
	public Map<String,Object> getImgForList(Map<String, String> map){
		log.info("��ѯͼƬ���ݲ�Ʒid");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_getImgForList");
			return data;
		} catch (Exception e) {
			log.error("��ѯͼƬ���ݲ�Ʒid�쳣��"+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

}
