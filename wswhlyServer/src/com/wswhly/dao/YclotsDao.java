package com.wswhly.dao;

import java.util.List;

import com.wswhly.bean.yc.YcCountBean;
import com.wswhly.bean.yc.YcactionRespBean;
import com.wswhly.bean.yc.YcinstitutionsRespBean;
import com.wswhly.bean.yc.YclotsListRespBean;
import com.wswhly.bean.yc.YcspecialReqBean;
import com.wswhly.bean.yc.YcspecialRespBean;
import com.wswhly.bean.yc.YcspecialRespBean.Ycspecial;



public interface YclotsDao {

	public  int queryYclotsByspecialIDCount(String specialID);
	//根据专场specialID查询拍品信息
	public List<YclotsListRespBean.Yclots> queryYclotsByspecialID(String specialID,int pageno,int pagesize);
	//根据拍品id查询拍品详情
	public YclotsListRespBean.Yclots queryYclotsByid(String id);
	//查询拍卖专场
	public  int queryYcspecialByactionidCount(String actionid);
	//根据拍卖会id查询专场
	public List<YcspecialRespBean.Ycspecial> queryYcspecialByactionID(String actionid,int pageno,int pagesize);
	//查询拍卖会
	public  int queryYcactionByins_idCount(String ins_id);
	//根据拍卖公司id查询拍卖会
	public List<YcactionRespBean.Ycaction> queryYcactionByins_id(String ins_id,int pageno,int pagesize);	
	//查询拍卖公司数量
	public  int queryYcinstitutionsCount();
//查询拍卖公司
	public List<YcinstitutionsRespBean.Ycinstitutions> queryYcinstitutions();	
	public YcCountBean  getYcCount();	
	
}
