package com.hyzm.forward.service.mine.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.collection.CollectReqBean;
import com.hyzm.bean.collection.CollectionListReqBean;
import com.hyzm.bean.collection.CollectionListRespBean;
import com.hyzm.bean.collection.DeleteMyCollectionReqBean;
import com.hyzm.bean.collection.DeleteUploadReqBean;
import com.hyzm.bean.collection.UploadCollectionReqBean;
import com.hyzm.bean.collection.CollectionListRespBean.Collection;
import com.hyzm.bean.enroll.CurrentEnrollRespBean;
import com.hyzm.bean.enroll.EnrollCollectionReqBean;
import com.hyzm.bean.enroll.EnrollCollectionRespBean;
import com.hyzm.bean.enroll.EnrollListReqBean;
import com.hyzm.bean.enroll.EnrollListRespBean;
import com.hyzm.bean.enroll.EnrollReqBean;
import com.hyzm.bean.enroll.CurrentEnrollRespBean.Enroll;
import com.hyzm.bean.enroll.EnrollListRespBean.EnrollRecord;
import com.hyzm.bean.enroll.EnrollReqBean.Invoice;
import com.hyzm.bean.trade.MoneyRecordListReqBean;
import com.hyzm.bean.trade.MoneyRecordListRespBean;
import com.hyzm.bean.trade.OffLineRechargeReqBean;
import com.hyzm.bean.trade.PointsRecordListReqBean;
import com.hyzm.bean.trade.PointsRecordListRespBean;
import com.hyzm.bean.trade.UpdateVipReqBean;
import com.hyzm.bean.trade.MoneyRecordListRespBean.MoneyRecord;
import com.hyzm.bean.trade.PointsRecordListRespBean.PointRecord;
import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.mine.MineService;

@Service
public class MineServiceImpl extends MessageResponse implements MineService {
	
	private final Logger log = Logger.getLogger(this.getClass());

	public Map<String, Object> getMyPoints(long userid, String year,
			int currentPage, int pageSize) throws Exception {
		log.info("获取积分明细");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			PointsRecordListReqBean point = new PointsRecordListReqBean();
			point.setUserid(userid);
			point.setYear(year);
			point.setPageno(currentPage);
			point.setPagesize(pageSize);
			PointsRecordListRespBean respBean = (PointsRecordListRespBean) getMessageResponse(point, new PointsRecordListRespBean(), "PointsRecordList");
			map.put("count", respBean.getCount());
			map.put("list", respBean.getList()==null?new ArrayList<PointRecord>():respBean.getList());
		} catch (Exception e) {
			log.error("获取积分明细异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> getMyMoney(long userid, String year,
			int currentPage, int pageSize) throws Exception {
		log.info("获取收支明细");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			MoneyRecordListReqBean money = new MoneyRecordListReqBean();
			money.setUserid(userid);
			money.setYear(year);
			money.setPageno(currentPage);
			money.setPagesize(pageSize);
			MoneyRecordListRespBean respBean = (MoneyRecordListRespBean) getMessageResponse(money, new MoneyRecordListRespBean(), "MoneyRecordList");
			map.put("count", respBean.getCount());
			map.put("list", respBean.getList()==null?new ArrayList<MoneyRecord>():respBean.getList());
		} catch (Exception e) {
			log.error("获取收支明细异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> getMyApplicationHistory(long userid,
			int currentPage, int pageSize) throws Exception {
		log.info("获取报名历史");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			EnrollListReqBean enroll = new EnrollListReqBean();
			enroll.setUserid(userid);
			enroll.setPageno(currentPage);
			enroll.setPagesize(pageSize);
			EnrollListRespBean respBean = (EnrollListRespBean) getMessageResponse(enroll, new EnrollListRespBean(), "EnrollList");
			map.put("count", respBean.getCount());
			map.put("list", respBean.getList()==null?new ArrayList<EnrollRecord>():respBean.getList());
		} catch (Exception e) {
			log.error("获取报名历史异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> getMyCollection(String reqtype, String userid, int currentPage,
			int pageSize) throws Exception {
		log.info("获取我的上传/收藏");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			CollectionListReqBean collection = new CollectionListReqBean();
			collection.setReqtype(reqtype);
			collection.setUserid(userid);
			collection.setPageno(currentPage);
			collection.setPagesize(pageSize);
			CollectionListRespBean respBean = (CollectionListRespBean) getMessageResponse(collection, new CollectionListRespBean(), "CollectionList");
			map.put("count", respBean.getCount());
			map.put("list", respBean.getList()==null?new ArrayList<Collection>():respBean.getList());
		} catch (Exception e) {
			log.error("获取我的上传/收藏异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public Enroll getCurrentEnroll() throws Exception {
		log.info("获取当前报名内容");
		Enroll enroll = null;
		try {
			CurrentEnrollRespBean respBean = (CurrentEnrollRespBean) getMessageResponse(null, new CurrentEnrollRespBean(), "CurrentEnroll");
			enroll = respBean.getEnroll();
		} catch (Exception e) {
			log.equals("获取当前报名内容异常："+e.getMessage());
			e.printStackTrace();
		}
		return enroll==null?new CurrentEnrollRespBean().new Enroll():enroll;
	}

	public List<Long> getSelectedCollection(long userid, long enrollid)
			throws Exception {
		log.info("获取已选藏品的id集合");
		List<Long> list = null;
		try {
			EnrollCollectionReqBean enroll = new EnrollCollectionReqBean();
			enroll.setUserid(userid);
			enroll.setEnrollid(enrollid);
			EnrollCollectionRespBean respBean = (EnrollCollectionRespBean) getMessageResponse(enroll, new EnrollCollectionRespBean(), "EnrollCollection");
			list = respBean.getList();
		} catch (Exception e) {
			log.error("获取已选藏品的id集合异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<Long>():list;
	}

	public MessageRespBean EnrollCollection(long bmid, long userid, String mobile,
			List<Long> collectionid, double money, Invoice invoice)
			throws Exception {
		log.info("报名");
		MessageRespBean respBean = new MessageRespBean();
		try {
			EnrollReqBean enroll = new EnrollReqBean();
			enroll.setBmid(bmid);
			enroll.setUserid(userid);
			enroll.setMobile(mobile);
			enroll.setCollectionid(collectionid);
			enroll.setMoney(money);
			enroll.setInvoice(invoice);
			respBean = getMessageResponse(enroll, "Enroll");
		} catch (Exception e) {
			log.error("报名异常："+e.getMessage());
			e.printStackTrace();
		}
		return respBean;
	}

	public boolean uploadCollectionMsg(int type, long userid, String name,
			String owner, String source, String imgurl, String memo) throws Exception {
		log.info("上传藏品信息");
		try {
			UploadCollectionReqBean uploadCollection = new UploadCollectionReqBean();
			uploadCollection.setType(type);
			uploadCollection.setUserid(userid);
			uploadCollection.setName(name);
			uploadCollection.setOwner(owner);
			uploadCollection.setSource(source);
			uploadCollection.setImgurl(imgurl);
			uploadCollection.setMemo(memo);
			MessageRespBean respBean = getMessageResponse(uploadCollection, "UploadCollection");
			if ("0000".equals(respBean.getErrorcode())) {
				log.info("上传藏品信息成功");
				return true;
			}
		} catch (Exception e) {
			log.error("上传藏品信息异常："+e.getMessage());
			e.printStackTrace();
		}
		log.info("上传藏品信息失败");
		return false;
	}

	public boolean updateCollectionMsg(String id, int type, long userid,
			String name, String owner, String source, String imgurl, String memo)
			throws Exception {
		log.info("修改藏品信息");
		try {
			UploadCollectionReqBean uploadCollection = new UploadCollectionReqBean();
			uploadCollection.setId(id);
			uploadCollection.setType(type);
			uploadCollection.setUserid(userid);
			uploadCollection.setName(name);
			uploadCollection.setOwner(owner);
			uploadCollection.setSource(source);
			uploadCollection.setImgurl(imgurl);
			uploadCollection.setMemo(memo);
			MessageRespBean respBean = getMessageResponse(uploadCollection, "UploadCollection");
			if ("0000".equals(respBean.getErrorcode())) {
				log.info("修改藏品信息成功");
				return true;
			}
		} catch (Exception e) {
			log.error("修改藏品信息异常："+e.getMessage());
			e.printStackTrace();
		}
		log.info("修改藏品信息失败");
		return false;
	}

	public boolean deleteUpload(long id) throws Exception {
		log.info("删除藏品信息");
		try {
			DeleteUploadReqBean delete = new DeleteUploadReqBean();
			delete.setId(id);
			MessageRespBean respBean = getMessageResponse(delete, "DeleteUpload");
			if ("0000".equals(respBean.getErrorcode())) {
				log.info("删除藏品信息成功");
				return true;
			}
		} catch (Exception e) {
			log.error("删除藏品信息异常："+e.getLocalizedMessage());
			e.printStackTrace();
		}
		log.info("删除藏品信息失败");
		return false;
	}

	public boolean payOffLine(long userid, double money, String imgurl)
			throws Exception {
		log.info("线下支付上传凭证");
		try {
			OffLineRechargeReqBean offLine = new OffLineRechargeReqBean();
			offLine.setUserid(userid);
			offLine.setMoney(money);
			offLine.setImgurl(imgurl);
			MessageRespBean respBean = getMessageResponse(offLine, "OffLineRecharge");
			if ("0000".equals(respBean.getErrorcode())) {
				log.info("线下支付上传凭证成功");
				return true;
			}
		} catch (Exception e) {
			log.error("线下支付上传凭证异常："+e.getMessage());
			e.printStackTrace();
		}
		log.info("线下支付上传凭证失败");
		return false;
	}

	public boolean collect(long userid, long collectionid) throws Exception {
		log.info("收藏藏品");
		try {
			CollectReqBean collect = new CollectReqBean();
			collect.setUserid(userid);
			collect.setCollectionid(collectionid);
			MessageRespBean respBean = getMessageResponse(collect, "Collect");
			if ("0000".equals(respBean.getErrorcode())) {
				log.info("收藏藏品成功");
				return true;
			}
		} catch (Exception e) {
			log.error("收藏藏品异常："+e.getMessage());
			e.printStackTrace();
		}
		log.info("收藏藏品失败");
		return false;
	}

	public boolean deleteMyCollection(long userid, long collectionid)
			throws Exception {
		log.info("删除我的收藏");
		try {
			DeleteMyCollectionReqBean collection = new DeleteMyCollectionReqBean();
			collection.setUserid(userid);
			collection.setCollectionid(collectionid);
			MessageRespBean respBean = getMessageResponse(collection, "DeleteMyCollection");
			if ("0000".equals(respBean.getErrorcode())) {
				log.info("删除我的收藏成功");
				return true;
			}
		} catch (Exception e) {
			log.error("删除我的收藏异常："+e.getMessage());
			e.printStackTrace();
		}
		log.info("删除我的收藏失败");
		return false;
	}

	public MessageRespBean vipUpdate(long userid, double money, String viplevel, String mobile)
			throws Exception {
		log.info("会员升级");
		MessageRespBean respBean = null;
		try {
			UpdateVipReqBean updateVip = new UpdateVipReqBean();
			updateVip.setUserid(userid);
			updateVip.setMoney(money);
			updateVip.setViplevel(viplevel);
			updateVip.setMobile(mobile);
			respBean = getMessageResponse(updateVip, "UpdateVip");
		} catch (Exception e) {
			log.error("会员升级异常："+e.getMessage());
			e.printStackTrace();
		}
		log.info("会员升级失败");
		return respBean;
	}

}
