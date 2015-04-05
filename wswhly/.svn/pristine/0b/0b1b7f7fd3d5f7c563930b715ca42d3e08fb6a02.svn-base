package com.hyzm.admin.dao.character;

import java.util.List;
import java.util.Map;

/**
 * 字符集数据库操作接口
 * @author Administrator
 *
 */
public interface CharacterDao {
	
	/**
	 * 获取字符集列表
	 * @param chinese
	 * @param pinyin
	 * @param english
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getCharacterList(String chinese, String pinyin, String english, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取字符集数量
	 * @param chinese
	 * @param pinyin
	 * @param english
	 * @return
	 * @throws Exception
	 */
	public long getCharacterListNum(String chinese, String pinyin, String english) throws Exception;
	
	/**
	 * 添加字符集
	 * @param chinese
	 * @param pinyin
	 * @param english
	 * @return
	 * @throws Exception
	 */
	public boolean addCharacter(String chinese, String pinyin, String english) throws Exception;
	
	/**
	 * 删除字符集
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean delCharacter(long id) throws Exception;
	
	/**
	 * 修改字符集
	 * @param id
	 * @param chinese
	 * @param pinyin
	 * @param english
	 * @return
	 * @throws Exception
	 */
	public boolean updCharacter(long id, String chinese, String pinyin, String english) throws Exception;

}
