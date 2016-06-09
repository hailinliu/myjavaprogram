package com.hyzm.forward.service.baibao.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.baibao.BaiBaoGradesService;
/**
 * �ٱ���--��� serviceʵ����
 * @author xjt
 * @createDate 2014��12��16�� 09:12:17
 */
@Service
public class BaiBaoGradesServiceImpl extends MessageResponse implements BaiBaoGradesService {
	private final Logger log = Logger.getLogger(this.getClass());
	/**
	 * ��Ӵ�ּ�¼
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int AddGrades(Map<String, String> map){
		log.info("��Ӵ�ּ�¼");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_AddGrades");
			return Integer.valueOf(data.get("num").toString());
		} catch (Exception e) {
			log.error("��Ӵ�ּ�¼�쳣��"+e.getMessage());
			e.printStackTrace();
			return 0;
		}
	}
	
	/**
	 * ��ѯ��ּ�¼       �ݶ��÷����ô�
	 * @param map
	 * @return
	 */
	public Map<String,Object> getGradesForList(Map<String, String> map){
		log.info("��ѯ��ּ�¼ ");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(map,"BaiBao_getGradesForList");
			return data;
		} catch (Exception e) {
			log.error("��ѯ��ּ�¼ �쳣��"+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
}
