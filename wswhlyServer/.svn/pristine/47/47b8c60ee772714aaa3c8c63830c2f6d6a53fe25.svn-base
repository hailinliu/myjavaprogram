package com.wswhly.dao;

import java.sql.SQLException;
import java.util.List;

import com.wswhly.bean.collectionus.CollectionusListRespBean;
import com.wswhly.bean.collectionus.CollectionusStyleRespBean;
import com.wswhly.bean.collectionus.CollectionusTypeRespBean;

public interface CollectionusDao {

	public List<CollectionusTypeRespBean.Type> queryCollectionusType() throws SQLException;

	public List<CollectionusStyleRespBean.Style> queryCollectionusStyle(long typeid) throws SQLException;
	
	public int queryCollectionusCount(long typeid,long styleid,int pricearea) throws SQLException;
	
	public List<CollectionusListRespBean.Collectionus> queryCollectionus(int pageno,int pagesize,long typeid,long styleid,int pricearea) throws SQLException;
	
	public int queryCollectionusCount(long typeid) throws SQLException;
	
	public List<CollectionusListRespBean.Collectionus> queryCollectionus(int pageno,int pagesize,long typeid) throws SQLException;
	
	public CollectionusListRespBean.Collectionus queryCollectionusInfo(long id) throws SQLException;
	
	public boolean updateClicknum(long id) throws SQLException;
	//INDEX
	public List<CollectionusListRespBean.Collectionus> queryCollectionusIndex(int pageno,int pagesize,long typeid) throws SQLException;
	
}
