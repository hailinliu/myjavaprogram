package com.hyzm.admin.dao.character.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.character.CharacterDao;

@Repository
public class CharacterDaoImpl implements CharacterDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getCharacterList = "select c.* from t_character c where c.chineseword like ? and c.pinyinword like ? and c.englishword like ? order by c.id limit ?, ?";

	public List<Map<String, Object>> getCharacterList(String chinese,
			String pinyin, String english, int currentPage,
			int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getCharacterList, new Object[]{"%"+chinese+"%", "%"+pinyin+"%", "%"+english+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取字符集列表异常："+e.getMessage());
		}
	}
	
	private final static String getCharacterListNum = "select count(id) from t_character where chineseword like ? and pinyinword like ? and englishword like ?";
	
	public long getCharacterListNum(String chinese, String pinyin, String english) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getCharacterListNum, new Object[]{"%"+chinese+"%", "%"+pinyin+"%", "%"+english+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取字符集数量异常："+e.getMessage());
		}
	}
	
	public final static String addCharacter = "insert into t_character (chineseword, pinyinword, englishword, state) values (?, ?, ?, 1)";

	public boolean addCharacter(String chinese, String pinyin, String english)
			throws Exception {
		try {
			int i = jdbcTemplate.update(addCharacter, new Object[]{chinese, pinyin, english});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加字符集异常："+e.getMessage());
		}
	}
	
	private final static String delCharacter = "update t_character set state = 2 where id = ?";

	public boolean delCharacter(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(delCharacter, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除字符集异常："+e.getMessage());
		}
	}
	
	private final static String updCharacter = "update t_character set chineseword = ?, pinyinword = ?, englishword = ? where id = ?";

	public boolean updCharacter(long id, String chinese, String pinyin,
			String english) throws Exception {
		try {
			int i = jdbcTemplate.update(updCharacter, new Object[]{chinese, pinyin, english, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改字符集异常："+e.getMessage());
		}
	}

}
