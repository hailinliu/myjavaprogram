package com.wswhly.dao;

import java.sql.SQLException;
import java.util.List;

import com.wswhly.bean.flagshop.FlagshopInfoReqBean;
import com.wswhly.bean.flagshop.FlagshopListRespBean;

public interface FlagshopDao {

	
	public int addFlagshopInfo(FlagshopInfoReqBean info) throws Exception;
	public List<FlagshopListRespBean.Flagshop> queryFlagshopList(int pageno,int pagesize) throws SQLException;
	public List<FlagshopListRespBean.Flagshop> queryFlagshop(long userid) throws SQLException;
	
}
