package com.wswhly.control;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.wswhly.bean.collection.CollectReqBean;
import com.wswhly.bean.collection.CollectionInfoReqBean;
import com.wswhly.bean.collection.CollectionInfoRespBean;
import com.wswhly.bean.collection.CollectionListReqBean;
import com.wswhly.bean.collection.CollectionListRespBean;
import com.wswhly.bean.collection.CollectionOrderListReqBean;
import com.wswhly.bean.collection.CollectionOrderListRespBean;
import com.wswhly.bean.collection.CollectionOrderReqBean;
import com.wswhly.bean.collection.CollectionTypeRespBean;
import com.wswhly.bean.collection.DeleteMyCollectionReqBean;
import com.wswhly.bean.collection.DeleteUploadReqBean;
import com.wswhly.bean.collection.UploadCollectionReqBean;
import com.wswhly.bean.collection.UploadImgReqBean;
import com.wswhly.bean.collection.UploadImgRespBean;
import com.wswhly.dao.CollectionDao;
import com.wswhly.util.StringUtil;

@Controller
public class CollenctionControl {

	private static final Logger logger = Logger.getLogger(CollenctionControl.class);

	@Autowired
	private CollectionDao collectiondao;//注入藏品DAO
	
	/**
	 * 获取藏品List
	 * @param reqtype 1.按藏品分类查询2.全部  3.我发布的 4.我收藏的 
	 */
	@RequestMapping("/CollectionList")
	public void CollectionList(HttpServletRequest request,HttpServletResponse response){
		CollectionListReqBean collectionreq = (new Gson()).fromJson(request.getAttribute("data").toString(), CollectionListReqBean.class);
		if(collectionreq.getReqtype() == null || collectionreq.getReqtype().equals("")){
			request.setAttribute("resultjson",StringUtil.Error("0001", "类型不能为空"));
			return;
		}
		CollectionListRespBean collectionresp = new CollectionListRespBean(); 
		try{
			if(collectionreq.getReqtype().equals("1")){//按藏品分类查询
				collectionresp.setCount(collectiondao.queryCollectionByTypeCount(collectionreq.getType(), collectionreq.getId()));
				collectionresp.setList(collectiondao.queryCollectionByType(collectionreq.getPageno(), collectionreq.getPagesize(), collectionreq.getType(), collectionreq.getId()));
			}else if(collectionreq.getReqtype().equals("2")){//全部
				collectionresp.setCount(collectiondao.queryCollectionCount());
				collectionresp.setList(collectiondao.queryCollection(collectionreq.getPageno(), collectionreq.getPagesize()));
			}else if(collectionreq.getReqtype().equals("3")){//我发布的
				collectionresp.setCount(collectiondao.queryMyCollectionCount(collectionreq.getUserid()));
				collectionresp.setList(collectiondao.queryMyCollection(collectionreq.getPageno(), collectionreq.getPagesize(), collectionreq.getUserid()));
			}else if(collectionreq.getReqtype().equals("4")){//我收藏的
				collectionresp.setCount(collectiondao.queryMyCollectCount(collectionreq.getUserid()));
				collectionresp.setList(collectiondao.queryMyCollect(collectionreq.getPageno(), collectionreq.getPagesize(), collectionreq.getUserid()));
			}else{
				request.setAttribute("resultjson",StringUtil.Error("9999", "状态未知"));
				return;
			}
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(collectionresp)));
		}catch (Exception e) {
			logger.error("CollectionList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 获取藏品List
	 * @param reqtype 1.按藏品分类查询2.全部  3.我发布的 4.我收藏的 
	 */
	@RequestMapping("/CollectionListIndex")
	public void CollectionListIndex(HttpServletRequest request,HttpServletResponse response){
		CollectionListReqBean collectionreq = (new Gson()).fromJson(request.getAttribute("data").toString(), CollectionListReqBean.class);
		CollectionListRespBean collectionresp = new CollectionListRespBean();
		try{	
				collectionresp.setCount(collectiondao.queryCollectionCount());
				collectionresp.setList(collectiondao.queryCollectionIndex(collectionreq.getPageno(), collectionreq.getPagesize()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(collectionresp)));
		}catch (Exception e) {
			logger.error("CollectionListIndex Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 获取藏品单个信息
	 * @param id 藏品id
	 * @param userid 用户id
	 */
	@RequestMapping("/CollectionInfo")
	public void CollectionInfo(HttpServletRequest request,HttpServletResponse response){
		CollectionInfoReqBean collectionreq = (new Gson()).fromJson(request.getAttribute("data").toString(), CollectionInfoReqBean.class);
		CollectionInfoRespBean collectionresp = new CollectionInfoRespBean();
		try{
			collectiondao.updateClicknum(collectionreq.getId());
			collectionresp.setCollection(collectiondao.queryCollection(collectionreq.getId()));
			collectionresp.getCollection().setIscollect(false);
			if(collectionreq.getUserid() != 0)//判断用户是否收藏该藏品
				collectionresp.getCollection().setIscollect(collectiondao.queryUserIsCollect(collectionreq.getUserid(), collectionreq.getId()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(collectionresp)));
		}catch (Exception e) {
			logger.error("CollectionInfo Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 获取藏品类型
	 */
	@RequestMapping("/CollectionType")
	public void CollectionType(HttpServletRequest request,HttpServletResponse response){
		CollectionTypeRespBean collectionresp = new CollectionTypeRespBean();
		try{
			collectionresp.setList(collectiondao.queryCollectionType());
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(collectionresp)));
		}catch (Exception e) {
			logger.error("CollectionType Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 收藏藏品
	 * @param collectionid 藏品id
	 * @param userid 用户id
	 */
	@RequestMapping("/Collect")
	public void Collect(HttpServletRequest request,HttpServletResponse response){
		CollectReqBean collectreq = (new Gson()).fromJson(request.getAttribute("data").toString(), CollectReqBean.class);
		try{
			collectiondao.updateCollectnum(collectreq.getCollectionid());
			if(collectiondao.addCollect(collectreq.getUserid(), collectreq.getCollectionid())){
				request.setAttribute("resultjson",StringUtil.Success(""));
				return ;
			}
			request.setAttribute("resultjson",StringUtil.Error("0001", "收藏失败"));
		}catch (Exception e) {
			logger.error("Collect Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 删除我的藏品
	 * @param collectionid 藏品id
	 * @param userid 用户id
	 */
	@RequestMapping("/DeleteMyCollection")
	public void DeleteMyCollection(HttpServletRequest request,HttpServletResponse response){
		DeleteMyCollectionReqBean collectionreq = (new Gson()).fromJson(request.getAttribute("data").toString(), DeleteMyCollectionReqBean.class);
		try{
			if(!collectiondao.deleteMyCollection(collectionreq.getUserid(), collectionreq.getCollectionid())){
				request.setAttribute("resultjson",StringUtil.Error("0001", "删除收藏品失败"));
				return;
			}
			request.setAttribute("resultjson",StringUtil.Success(""));
		}catch (Exception e) {
			logger.error("DeleteMyCollection Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 上传藏品
	 */
	@RequestMapping("/UploadCollection")
	public void UploadCollection(HttpServletRequest request,HttpServletResponse response){
		UploadCollectionReqBean collectionreq = (new Gson()).fromJson(request.getAttribute("data").toString(), UploadCollectionReqBean.class);
		try{
			if(collectionreq.getId() == null || collectionreq.getId().equals("")){
				if(!collectiondao.addCollection(collectionreq.getType(), 
						collectionreq.getName(), StringUtil.getCollectionnum(), collectionreq.getUserid(), 
						collectionreq.getOwner(), collectionreq.getSource(), collectionreq.getImgurl(), 
						collectionreq.getMemo())){
					request.setAttribute("resultjson",StringUtil.Error("0001", "上传收藏品失败"));
					return;
				}
			}else{
				if(!collectiondao.updateCollection(Long.valueOf(collectionreq.getId()),collectionreq.getType(), 
						                         collectionreq.getName(), 
						collectionreq.getOwner(), collectionreq.getSource(), collectionreq.getImgurl(), 
						collectionreq.getMemo())){
					request.setAttribute("resultjson",StringUtil.Error("0001", "修改收藏品失败"));
					return;
				}
			}
			request.setAttribute("resultjson",StringUtil.Success(""));
		}catch (Exception e) {
			logger.error("UploadCollection Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 删除上传藏品
	 */
	@RequestMapping("/DeleteUpload")
	public void DeleteUpload(HttpServletRequest request,HttpServletResponse response){
		DeleteUploadReqBean collectionreq = (new Gson()).fromJson(request.getAttribute("data").toString(), DeleteUploadReqBean.class);
		try{
			if(!collectiondao.deleteCollection(collectionreq.getId())){
				request.setAttribute("resultjson",StringUtil.Error("0001", "删除上传收藏品失败"));
				return;
			}
			request.setAttribute("resultjson",StringUtil.Success(""));
		}catch (Exception e) {
			logger.error("UploadCollection Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 上传图片，用户安卓客户端
	 */
	@RequestMapping("/UploadImg")
	public void UploadImg(HttpServletRequest request,HttpServletResponse response){
		UploadImgReqBean uploadimgreq = (new Gson()).fromJson(request.getAttribute("data").toString(), UploadImgReqBean.class);
		UploadImgRespBean uploadimgresp = new UploadImgRespBean();
		try{
			UUID uuid;
			uuid = UUID.randomUUID();
			StringUtil.SetImageStr(uploadimgreq.getImg(), uuid.toString());
			uploadimgresp.setImgname(uuid.toString());
			request.setAttribute("resultjson",StringUtil.Success(""));
		}catch (Exception e) {
			logger.error("UploadCollection Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 新增预约观摩信息
	 */
	@RequestMapping("/CollectionOrder")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public void CollectionOrder(HttpServletRequest request,HttpServletResponse response){
		CollectionOrderReqBean collectionOrdereq = (new Gson()).fromJson(request.getAttribute("data").toString(), CollectionOrderReqBean.class);
		try{
			int count = collectiondao.addCollectionOrder(collectionOrdereq);
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(count)));
		}catch (Exception e) {
			logger.error("Enroll Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 新增预约观摩信息
	 */
	@RequestMapping("/CollectionOrderQuery")
	public void getCollectionOrder(HttpServletRequest request,HttpServletResponse response){
		CollectionOrderListReqBean collectionreq = (new Gson()).fromJson(request.getAttribute("data").toString(), CollectionOrderListReqBean.class);
		CollectionOrderListRespBean collectionresp = new CollectionOrderListRespBean();
		
		try{
			collectionresp.setList(collectiondao.queryCollectionOrder(collectionreq.getUserid(),collectionreq.getCollectionid()));	
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(collectionresp)));
		}catch (Exception e) {
			logger.error("CollectionInfo Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
}
