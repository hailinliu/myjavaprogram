package com.wswhly.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.wswhly.bean.collectionus.CollectionusInfoReqBean;
import com.wswhly.bean.collectionus.CollectionusInfoRespBean;
import com.wswhly.bean.collectionus.CollectionusListReqBean;
import com.wswhly.bean.collectionus.CollectionusListRespBean;
import com.wswhly.bean.collectionus.CollectionusStyleReqBean;
import com.wswhly.bean.collectionus.CollectionusStyleRespBean;
import com.wswhly.bean.collectionus.CollectionusTypeRespBean;
import com.wswhly.dao.CollectionusDao;
import com.wswhly.util.StringUtil;

@Controller
public class CollenctionusControl {

	private static final Logger logger = Logger.getLogger(CollenctionusControl.class);

	@Autowired
	private CollectionusDao collectiondao;//ע���ƷDAO
	
	/**
	 * ��ȡ��ƷList
	 */
	@RequestMapping("/CollectionusList")
	public void CollectionList(HttpServletRequest request,HttpServletResponse response){
		CollectionusListReqBean collectionreq = (new Gson()).fromJson(request.getAttribute("data").toString(), CollectionusListReqBean.class);
		CollectionusListRespBean collectionresp = new CollectionusListRespBean();
		try{
			collectionresp.setCount(collectiondao.queryCollectionusCount(collectionreq.getTypeid(), collectionreq.getStyleid(),collectionreq.getPricearea()));
			collectionresp.setList(collectiondao.queryCollectionus(collectionreq.getPageno(), collectionreq.getPagesize(), collectionreq.getTypeid(), collectionreq.getStyleid(),collectionreq.getPricearea()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(collectionresp)));
		}catch (Exception e) {
			logger.error("CollectionusList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/**
	 * ��ȡ��ƷList
	 * @param reqtype 1.����Ʒ�����ѯ2.ȫ��  3.�ҷ����� 4.���ղص� 
	 */
	@RequestMapping("/CollectionusListIndex")
	public void CollectionusListIndex(HttpServletRequest request,HttpServletResponse response){
		CollectionusListReqBean collectionreq = (new Gson()).fromJson(request.getAttribute("data").toString(), CollectionusListReqBean.class);
		CollectionusListRespBean collectionresp = new CollectionusListRespBean();
	try{	
			collectionresp.setCount(collectiondao.queryCollectionusCount(collectionreq.getTypeid()));
		
			collectionresp.setList(collectiondao.queryCollectionusIndex(collectionreq.getPageno(), collectionreq.getPagesize(),collectionreq.getTypeid()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(collectionresp)));
		}catch (Exception e) {
			logger.error("CollectionListIndex Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/**
	 * ��ȡ��Ʒ������Ϣ
	 * @param id ��Ʒid
	 * @param userid �û�id
	 */
	@RequestMapping("/CollectionusInfo")
	public void CollectionInfo(HttpServletRequest request,HttpServletResponse response){
		CollectionusInfoReqBean collectionreq = (new Gson()).fromJson(request.getAttribute("data").toString(), CollectionusInfoReqBean.class);
		CollectionusInfoRespBean collectionresp = new CollectionusInfoRespBean();
		try{
			collectiondao.updateClicknum(collectionreq.getId());
			collectionresp.setCollection(collectiondao.queryCollectionusInfo(collectionreq.getId()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(collectionresp)));
		}catch (Exception e) {
			logger.error("CollectionusInfo Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/**
	 * ��ȡ��Ʒ����
	 */
	@RequestMapping("/CollectionusType")
	public void CollectionType(HttpServletRequest request,HttpServletResponse response){
		CollectionusTypeRespBean collectionresp = new CollectionusTypeRespBean();
		try{
			collectionresp.setList(collectiondao.queryCollectionusType());
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(collectionresp)));
		}catch (Exception e) {
			logger.error("CollectionusType Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/**
	 * ��ȡ��Ʒ����
	 */
	@RequestMapping("/CollectionusStyle")
	public void CollectionusStyle(HttpServletRequest request,HttpServletResponse response){
		CollectionusStyleReqBean collectionreq = (new Gson()).fromJson(request.getAttribute("data").toString(), CollectionusStyleReqBean.class);
		CollectionusStyleRespBean collectionresp = new CollectionusStyleRespBean();
		try{
			collectionresp.setList(collectiondao.queryCollectionusStyle(collectionreq.getTypeid()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(collectionresp)));
		}catch (Exception e) {
			logger.error("CollectionusStyle Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
}
