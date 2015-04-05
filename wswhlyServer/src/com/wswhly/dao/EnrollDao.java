package com.wswhly.dao;

import java.sql.SQLException;
import java.util.List;

import com.wswhly.bean.enroll.CurrentEnrollRespBean;
import com.wswhly.bean.enroll.EnrollInfoReqBean;
import com.wswhly.bean.enroll.EnrollListRespBean;
import com.wswhly.bean.enroll.EnrollReqBean;

public interface EnrollDao {

	public boolean addInvoice(long userid, long orderid, EnrollReqBean.Invoice invoice) throws SQLException;
	
	public int addEntoll(long bmid, long userid, long orderid, String code, String validdate) throws SQLException;
	
	public boolean addEntollCollection(long bmrecordid, long collectionid) throws SQLException;
	
	public int queryEntollRecordCount(long userid) throws SQLException;
	
	public List<EnrollListRespBean.EnrollRecord> queryEntollRecord(int pageno,int pagesize,long userid) throws SQLException;

	public List<CurrentEnrollRespBean.Enroll> queryCurrentEntoll() throws SQLException;
	
	public List<Long> queryEntollCollection(long userid,long enrollid) throws SQLException;
	
	public List<CurrentEnrollRespBean.Enroll> queryEntoll(long enrollid) throws SQLException;
	
	public int queryCurrentEntollCount(long enrollid) throws SQLException;
	
	public int queryEntollRecordInfoCount(long enrollid) throws SQLException;
	
	public List<EnrollListRespBean.EnrollRecord> queryEntollRecordInfo(int pageno,int pagesize,long enrollid) throws SQLException;
	public int addInfo(EnrollInfoReqBean info) throws Exception;

	
	
}
