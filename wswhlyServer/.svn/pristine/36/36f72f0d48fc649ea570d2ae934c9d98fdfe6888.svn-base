package com.wswhly.dao;

import java.sql.SQLException;
import java.util.List;

import com.wswhly.bean.collection.CollectionListRespBean;
import com.wswhly.bean.collection.CollectionOrderListRespBean;
import com.wswhly.bean.collection.CollectionOrderReqBean;
import com.wswhly.bean.collection.CollectionTypeRespBean;

public interface CollectionDao {

	public int queryCollectionByTypeCount(String type,String id) throws SQLException;

	public int queryCollectionCount() throws SQLException;
	
	public int queryMyCollectionCount(String userid) throws SQLException;
	
	public int queryMyCollectCount(String userid) throws SQLException;
	
	public List<CollectionListRespBean.Collection> queryCollectionByType(int pageno,int pagesize,String type,String id) throws SQLException;

	public List<CollectionListRespBean.Collection> queryCollection(int pageno,int pagesize) throws SQLException;
	
	public List<CollectionListRespBean.Collection> queryMyCollection(int pageno,int pagesize,String userid) throws SQLException;
	
	public List<CollectionListRespBean.Collection> queryMyCollect(int pageno,int pagesize,String userid) throws SQLException;
	
	public CollectionListRespBean.Collection queryCollection(long id) throws SQLException;
	
	public boolean addCollect(long userid, long collectionid) throws SQLException;
	
	public boolean queryUserIsCollect(long userid, long collectionid) throws SQLException;
	
	public List<CollectionTypeRespBean.Type> queryCollectionType() throws SQLException;
	
	public boolean updateCollectnum(long id) throws SQLException;
	
	public boolean updateClicknum(long id) throws SQLException;
	
	public boolean deleteMyCollection(long userid,long collectionid) throws SQLException;
	
	public boolean addCollection(int type,String name,String serialnum,long userid,String owner,String source,String imgurl,String memo) throws SQLException;
	
	public boolean updateCollection(long id,int type,String name,String owner,String source,String imgurl,String memo) throws SQLException;
	
	public boolean deleteCollection(long id) throws SQLException;
	
	//INDEX
	public List<CollectionListRespBean.Collection> queryCollectionIndex(int pageno,int pagesize) throws SQLException;
	public int addCollectionOrder(CollectionOrderReqBean collection) throws Exception;
	public List<CollectionOrderListRespBean.CollectionOrder> queryCollectionOrder(long userid, long collectionid) throws SQLException;

		
}
