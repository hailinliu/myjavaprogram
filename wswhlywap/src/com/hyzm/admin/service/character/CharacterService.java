package com.hyzm.admin.service.character;

public interface CharacterService {
	
	/**
	 * 获取字符集列表
	 * @param chinese
	 * @param pinyin
	 * @param english
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getCharacterList(String chinese, String pinyin, String english, int currentPage, int pageSize);
	
	/**
	 * 添加字符集
	 * @param chinese
	 * @param pinyin
	 * @param english
	 * @return
	 */
	public boolean addCharacter(String chinese, String pinyin, String english);
	
	/**
	 * 删除字符集
	 * @param id
	 * @return
	 */
	public boolean delCharacter(long id);
	
	/**
	 * 修改字符集
	 * @param id
	 * @param chinese
	 * @param pinyin
	 * @param english
	 * @return
	 */
	public boolean updCharacter(long id, String chinese, String pinyin, String english);

}
