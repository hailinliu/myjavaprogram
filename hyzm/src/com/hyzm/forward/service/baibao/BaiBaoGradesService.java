package com.hyzm.forward.service.baibao;

import java.util.List;
import java.util.Map;

/**
 * �ٱ���--��� service�ӿ�
 * @author xjt
 * @createDate 2014��12��16�� 08:52:38
 */
public interface BaiBaoGradesService {
	
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
	public Map<String,Object> getGradesForList(Map<String, String> map);
}
