package com.hyzm.forward.service.flagshop;

import java.util.List;

import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.flagshop.FlagshopInfoReqBean;
import com.hyzm.bean.flagshop.FlagshopListRespBean.Flagshop;

public interface FlagshopService {
	/**
	 * 旗舰商家信息
	 * @param bmid
	 * @param userid
	 * @param mobile
	 * @param collectonid
	 * @param money
	 * @param invoice
	 * @return
	 * @throws Exception
	 */
	public MessageRespBean FlagshopInfo(FlagshopInfoReqBean info) throws Exception;
	/**
	 * 根据userid判断
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public List<Flagshop> getFlagshopList(long userid) throws Exception;
	/**
	 * 获取旗舰商家列表
	 * @return
	 * @throws Exception
	 */
	public List<Flagshop> getFalgshopInfoList() throws Exception;
	
}
