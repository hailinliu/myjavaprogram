package com.hyzm.forward.service.collection;

import java.util.List;
import java.util.Map;

import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.collection.CollectionOrderReqBean;
import com.hyzm.bean.collection.CollectionListRespBean.Collection;
import com.hyzm.bean.collection.CollectionTypeRespBean.Type;
import com.hyzm.bean.collectionus.CollectionusListRespBean.Collectionus;

public interface CollectionService {
	
	/**
	 * 获取藏品列表（所有）
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getCollectionList(int currentPage, int pageSize) throws Exception;
	/**
	 * 获取藏品列表（首页随机所有）
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getCollectionListIndex(int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取藏品列表（类型）
	 * @param type
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getCollectionList(String type, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取藏品类型列表
	 * @return
	 * @throws Exception
	 */
	public List<Type> getTypeList() throws Exception;
	
	/**
	 * 获取藏品
	 * @param id
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	public Collection getCollectionById(long id, long userid) throws Exception;
	
	/**
	 * 相关藏品
	 * @param id
	 * @param type 相关类型
	 * @return
	 * @throws Exception
	 */
	public List<Collection> getCollectionList (String id, String type) throws Exception;
	
	
	/**
	 * 相关藏品
	 * @param id
	 * @param type 相关类型
	 * @return
	 * @throws Exception
	 */
	public List<Collectionus> getCollectionusList (String id, String type) throws Exception;
	
	
	/**
	 * 获取藏品列表（所有）
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getCollectionusList(int currentPage, int pageSize,long styleid,long typeid,int pricearea) throws Exception;
	/**
	 * 获取藏品小类列表
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getCollectionusStyle(long typeid) throws Exception;
	/**
	 * 获取藏品小类列表
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getCollectionusType() throws Exception;
	
	/**
	 * 获取藏品小类列表
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getCollectionusInfo(long id) throws Exception;
	
	/**
	 * 获取藏品列表（所有）
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getCollectionusListIndex(int pageno,int pagesize,long typeid) throws Exception;
	/**
	 * 预约观摩
	 * @param collection
	 * @return
	 * @throws Exception
	 */
	public MessageRespBean addCollectioOrder(CollectionOrderReqBean collection) throws Exception;
	/**
	 * 预约观摩查询
	 * @param collection
	 * @return
	 * @throws Exception
	 */
	public  Map<String, Object> getCollectioOrder(long userid,long collectioid) throws Exception;
	

}
