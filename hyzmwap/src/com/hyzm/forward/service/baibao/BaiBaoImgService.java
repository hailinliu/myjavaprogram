package com.hyzm.forward.service.baibao;

import java.util.List;
import java.util.Map;

/**
 * �ٱ���--��ƷͼƬ service�ӿ�
 * @author xjt
 * @createDate 2014��12��16�� 08:52:44
 */
public interface BaiBaoImgService {
	/**
	 * ���ͼƬ
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int AddImg(Map<String, String> map);
	
	/**
	 * ɾ��ͼƬ
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int DeleteImg(Map<String, String> map);
	
	/**
	 * ��ѯͼƬ     ���ݲ�Ʒid 
	 * @param map
	 * @return list
	 */
	public Map<String,Object> getImgForList(Map<String, String> map);
}
