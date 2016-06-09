package com.hyzm.forward.service.baibao;

import java.util.List;
import java.util.Map;

/**
 * �ٱ���--������ת service�ӿ�
 * @author xjt
 * @createDate 2014��12��16�� 08:53:08
 */
public interface BaiBaoTransferService {
	/**
	 * ֧��������ת��Ϣ
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int PayTransfer(Map<String, String> map);
	/**
	 * ��ӽ�����ת��Ϣ
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int AddTransfer(Map<String, String> map);
	
	
	/**
	 * �޸Ľ�����ת��Ϣ
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int UpdateTransfer(Map<String, String> map);
	
	/**
	 * ɾ��������ת��Ϣ
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int DeleteTransfer(Map<String, String> map);
	
	/**
	 * ������id  ��������id  �� ��ѯ������ת   ��ҳ��ѯ
	 * @param map
	 * @return list
	 */
	public Map<String,Object> getTransferForList(Map<String, String> map);
	
	/**
	 * ��ѯ�������
	 * @param map
	 * @return
	 */
	public Map<String,Object>getTransfer(Map<String, String> map);
}
