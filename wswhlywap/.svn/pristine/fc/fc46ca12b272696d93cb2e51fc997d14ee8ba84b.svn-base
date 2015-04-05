package com.hyzm.admin.service.character.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.admin.dao.character.CharacterDao;
import com.hyzm.admin.service.character.CharacterService;

@Service
public class CharacterServiceImpl implements CharacterService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	private CharacterDao dao;

	public String getCharacterList(String chinese, String pinyin,
			String english, int currentPage, int pageSize) {
		log.info("获取字符集列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getCharacterListNum(chinese, pinyin, english);
			if (total == 0)
				return "{total:0,rows:[]}";
			map.put("total", total);
			List<Map<String, Object>> maplist = dao.getCharacterList(chinese, pinyin, english, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(maplist));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取字符集列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public boolean addCharacter(String chinese, String pinyin, String english) {
		log.info("添加字符集");
		try {
			return dao.addCharacter(chinese, pinyin, english);
		} catch (Exception e) {
			log.error("添加字符集异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean delCharacter(long id) {
		log.info("删除字符集");
		try {
			return dao.delCharacter(id);
		} catch (Exception e) {
			log.error("删除字符集异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updCharacter(long id, String chinese, String pinyin,
			String english) {
		log.info("修改字符集");
		try {
			return dao.updCharacter(id, chinese, pinyin, english);
		} catch (Exception e) {
			log.error("修改字符集异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

}
