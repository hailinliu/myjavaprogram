package com.wswhly.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.wswhly.bean.proficient.ProficientListRespBean;
import com.wswhly.bean.video.VideoListRespBean;

public interface ProficientDao  {
	
	public int queryProficientCount() throws SQLException;
	
	public List<ProficientListRespBean.Proficient> queryProficient(int pageno,int pagesize) throws SQLException;
	public  List<Map<String,Object>> getProficientListForMap(Map<String, String> map) throws SQLException;
	
	public ProficientListRespBean.Proficient queryProficient(long id) throws SQLException;
		
	public List<ProficientListRespBean.Proficient> queryProficientIndex(int pageno,int pagesize) throws SQLException;
	
}
