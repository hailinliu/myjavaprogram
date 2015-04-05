package com.hyzm.forward.service.forums;

import java.util.List;

import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.flagshop.FlagshopListRespBean.Flagshop;
import com.hyzm.bean.forums.ForumsInfoReqBean;
import com.hyzm.bean.forums.ForumsListRespBean.Forums;

public interface ForumsService {
	/**
	 * 评论新增信息
	 * @param bmid
	 * @param userid
	 * @param mobile
	 * @param collectonid
	 * @param money
	 * @param invoice
	 * @return
	 * @throws Exception
	 */
	public MessageRespBean forumsInfo(ForumsInfoReqBean info) throws Exception;
	/**
	 * 根据userid判断
	 * @param collectionid
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public List<Forums> getFlagshopList( long collectionid, String type) throws Exception;
	/**
	 * 获取列表
	 * @return
	 * @throws Exception
	 */
	public List<Forums> getFalgshopInfoList() throws Exception;
	/**
	 * 修改信息
	 * @param bmid
	 * @param userid
	 * @param mobile
	 * @param collectonid
	 * @param money
	 * @param invoice
	 * @return
	 * @throws Exception
	 */
	public MessageRespBean updateForumsInfo(ForumsInfoReqBean info) throws Exception;
}
