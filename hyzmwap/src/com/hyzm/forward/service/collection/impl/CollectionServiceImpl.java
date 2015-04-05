package com.hyzm.forward.service.collection.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.collection.CollectionInfoReqBean;
import com.hyzm.bean.collection.CollectionInfoRespBean;
import com.hyzm.bean.collection.CollectionListReqBean;
import com.hyzm.bean.collection.CollectionListRespBean;
import com.hyzm.bean.collection.CollectionOrderListReqBean;
import com.hyzm.bean.collection.CollectionOrderListRespBean;
import com.hyzm.bean.collection.CollectionOrderReqBean;
import com.hyzm.bean.collection.CollectionTypeRespBean;
import com.hyzm.bean.collection.CollectionListRespBean.Collection;
import com.hyzm.bean.collection.CollectionOrderListRespBean.CollectionOrder;
import com.hyzm.bean.collection.CollectionTypeRespBean.Type;
import com.hyzm.bean.collectionus.CollectionusInfoReqBean;
import com.hyzm.bean.collectionus.CollectionusInfoRespBean;
import com.hyzm.bean.collectionus.CollectionusListReqBean;
import com.hyzm.bean.collectionus.CollectionusListRespBean;
import com.hyzm.bean.collectionus.CollectionusStyleReqBean;
import com.hyzm.bean.collectionus.CollectionusStyleRespBean;
import com.hyzm.bean.collectionus.CollectionusTypeRespBean;
import com.hyzm.bean.collectionus.CollectionusListRespBean.Collectionus;
import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.collection.CollectionService;

@Service
public class CollectionServiceImpl extends MessageResponse implements
		CollectionService {

	private final Logger log = Logger.getLogger(this.getClass());

	public Map<String, Object> getCollectionList(int currentPage, int pageSize)
			throws Exception {
		log.info("获取藏品列表");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Collection> list = null;
		int count = 0;
		try {
			CollectionListReqBean collection = new CollectionListReqBean();
			collection.setPageno(currentPage);
			collection.setPagesize(pageSize);
			collection.setReqtype("2");
			CollectionListRespBean respBean = (CollectionListRespBean) getMessageResponse(
					collection, new CollectionListRespBean(), "CollectionList");
			count = respBean.getCount();
			list = respBean.getList();
			map.put("count", count);
			map.put("list", list == null ? new ArrayList<Collection>() : list);
		} catch (Exception e) {
			log.error("获取收藏列表异常：" + e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> getCollectionListIndex(int currentPage,
			int pageSize) throws Exception {
		log.info("获取藏品列表");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Collection> list = null;
		int count = 0;
		try {
			CollectionListReqBean collection = new CollectionListReqBean();
			collection.setPageno(currentPage);
			collection.setPagesize(pageSize);
			collection.setReqtype("2");
			CollectionListRespBean respBean = (CollectionListRespBean) getMessageResponse(
					collection, new CollectionListRespBean(),
					"CollectionListIndex");
			count = respBean.getCount();
			list = respBean.getList();
			map.put("count", count);
			map.put("list", list == null ? new ArrayList<Collection>() : list);
		} catch (Exception e) {
			log.error("获取收藏列表异常：" + e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> getCollectionusListIndex(int currentPage,
			int pageSize,long typeid) throws Exception {
		log.info("获取藏品列表");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Collectionus> list = null;
		int count = 0;
		try {
			CollectionusListReqBean collection = new CollectionusListReqBean();
			collection.setPageno(currentPage);
			collection.setPagesize(pageSize);
		//collection.setStyleid(styleid);
			collection.setTypeid(typeid);
			CollectionusListRespBean respBean = (CollectionusListRespBean) getMessageResponse(
					collection, new CollectionusListRespBean(),
					"CollectionusListIndex");
			count = respBean.getCount();
			list = respBean.getList();
			map.put("count", count);
			map.put("list", list == null ? new ArrayList<Collectionus>()
							: list);
		} catch (Exception e) {
			log.error("获取收藏列表异常：" + e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> getCollectionList(String type, int currentPage,
			int pageSize) throws Exception {
		log.info("获取藏品列表");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Collection> list = null;
		int count = 0;
		try {
			CollectionListReqBean collection = new CollectionListReqBean();
			collection.setPageno(currentPage);
			collection.setPagesize(pageSize);
			collection.setReqtype("1");
			collection.setType(type);
			CollectionListRespBean respBean = (CollectionListRespBean) getMessageResponse(
					collection, new CollectionListRespBean(), "CollectionList");
			count = respBean.getCount();
			list = respBean.getList();
			map.put("count", count);
			map.put("list", list == null ? new ArrayList<Collection>() : list);
		} catch (Exception e) {
			log.error("获取收藏列表异常：" + e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public List<Type> getTypeList() throws Exception {
		log.info("获取藏品类型列表");
		List<Type> list = null;
		try {
			list = ((CollectionTypeRespBean) getMessageResponse(null,
					new CollectionTypeRespBean(), "CollectionType")).getList();
		} catch (Exception e) {
			log.error("获取收藏类型列表异常：" + e.getMessage());
			e.printStackTrace();
		}
		return list == null ? new ArrayList<Type>() : list;
	}

	public Collection getCollectionById(long id, long userid) throws Exception {
		log.info("获取藏品");
		Collection col = null;
		try {
			CollectionInfoReqBean collection = new CollectionInfoReqBean();
			collection.setId(id);
			collection.setUserid(userid);
			CollectionInfoRespBean respBean = (CollectionInfoRespBean) getMessageResponse(
					collection, new CollectionInfoRespBean(), "CollectionInfo");
			col = respBean.getCollection();
		} catch (Exception e) {
			log.error("获取藏品异常：" + e.getMessage());
			e.printStackTrace();
		}
		return col == null ? new CollectionListRespBean().new Collection()
				: col;
	}

	public List<Collection> getCollectionList(String id, String type)
			throws Exception {
		log.info("获取相关藏品");
		List<Collection> list = new ArrayList<Collection>();
		try {
			CollectionListReqBean collection = new CollectionListReqBean();
			collection.setPageno(1);
			collection.setPagesize(4);
			collection.setReqtype("1");
			collection.setType(type);
			collection.setId(id);
			list = ((CollectionListRespBean) getMessageResponse(collection,
					new CollectionListRespBean(), "CollectionList")).getList();
		} catch (Exception e) {
			log.error("获取相关藏品异常：" + e.getMessage());
			e.printStackTrace();
		}
		return list == null ? new ArrayList<Collection>() : list;
	}

	@Override
	public Map<String, Object> getCollectionusList(int currentPage,
			int pageSize, long styleid, long typeid,int pricearea) {
		log.info("获取藏品列表");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Collectionus> list = null;
		int count = 0;
		try {
			CollectionusListReqBean collection = new CollectionusListReqBean();
			collection.setPageno(currentPage);
			collection.setPagesize(pageSize);
			collection.setStyleid(styleid);
			collection.setTypeid(typeid);
			collection.setPricearea(pricearea);
			CollectionusListRespBean respBean = (CollectionusListRespBean) getMessageResponse(
					collection, new CollectionusListRespBean(),
					"CollectionusList");
			count = respBean.getCount();
			list = respBean.getList();
			map.put("count", count);
			map.put("list", list == null ? new ArrayList<Collection>() : list);
		} catch (Exception e) {
			log.error("获取收藏列表异常：" + e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public Map<String, Object> getCollectionusInfo(long id) throws Exception {
		log.info("获取藏品列表");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			CollectionusInfoReqBean collection = new CollectionusInfoReqBean();
			collection.setId(id);

			CollectionusInfoRespBean respBean = (CollectionusInfoRespBean) getMessageResponse(
					collection, new CollectionusInfoRespBean(),
					"CollectionusInfo");

			map.put("collection", respBean.getCollection());
		} catch (Exception e) {
			log.error("获取收藏列表异常：" + e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public Map<String, Object> getCollectionusStyle(long typeid)
			throws Exception {
		log.info("获取藏品列表");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			CollectionusStyleReqBean collection = new CollectionusStyleReqBean();
			collection.setTypeid(typeid);
			CollectionusStyleRespBean respBean = (CollectionusStyleRespBean) getMessageResponse(
					collection, new CollectionusStyleRespBean(),
					"CollectionusStyle");

			map.put("list", respBean.getList());
		} catch (Exception e) {
			log.error("获取收藏列表异常：" + e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public Map<String, Object> getCollectionusType() throws Exception {
		log.info("获取藏品列表");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			CollectionusTypeRespBean respBean = (CollectionusTypeRespBean) getMessageResponse(
					"", new CollectionusTypeRespBean(), "CollectionusType");
			map.put("list", respBean.getList());
		} catch (Exception e) {
			log.error("获取收藏列表异常：" + e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public MessageRespBean addCollectioOrder(CollectionOrderReqBean collection)
			throws Exception {
		log.info("新增预约观摩");
		MessageRespBean respBean = new MessageRespBean();
		try {
			respBean = getMessageResponse(collection, "CollectionOrder");
		} catch (Exception e) {
			log.error("报名异常：" + e.getMessage());
			e.printStackTrace();
		}
		return respBean;

	}

	@Override
	public Map<String, Object> getCollectioOrder(long userid, long collectioid)
			throws Exception {
		log.info("获取藏品列表");
		Map<String, Object> map = new HashMap<String, Object>();
		List<CollectionOrder> list = null;
		int count = 0;
		try {
			CollectionOrderListReqBean collection = new CollectionOrderListReqBean();
			collection.setUserid(userid);
			collection.setCollectionid(collectioid);
			CollectionOrderListRespBean respBean = (CollectionOrderListRespBean) getMessageResponse(
					collection, new CollectionOrderListRespBean(),
					"CollectionOrderQuery");
			count = respBean.getCount();
			list = respBean.getList();
			map.put("count", count);
			map.put("list", list == null ? new ArrayList<CollectionOrder>()
					: list);
		} catch (Exception e) {
			log.error("获取收藏列表异常：" + e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public List<Collectionus> getCollectionusList(String id, String type)
			throws Exception {
		log.info("获取相关藏品");
		List<Collectionus> list = new ArrayList<Collectionus>();
		try {
			CollectionusListReqBean collection = new CollectionusListReqBean();
			collection.setPageno(1);
			collection.setPagesize(4);
			// collection.setReqtype("1");
			collection.setTypeid(Long.parseLong(type));
			collection.setStyleid(Long.parseLong(id));
			list = ((CollectionusListRespBean) getMessageResponse(collection,
					new CollectionusListRespBean(), "CollectionusList"))
					.getList();
		} catch (Exception e) {
			log.error("获取相关藏品异常：" + e.getMessage());
			e.printStackTrace();
		}
		return list == null ? new ArrayList<Collectionus>() : list;
	}
}
