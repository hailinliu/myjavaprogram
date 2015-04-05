package com.hyzm.forward.service.survey;

import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.survey.SurveyInfoReqBean;

public interface SurveyService {
	/**
	 * 调查信息提交
	 * @param bmid
	 * @param userid
	 * @param mobile
	 * @param collectonid
	 * @param money
	 * @param invoice
	 * @return
	 * @throws Exception
	 */
	public MessageRespBean SurveyInfo(SurveyInfoReqBean info) throws Exception;
	
	/**
	 * 判断会员是否提交过调查信息
	 * @param bmid
	 * @param userid
	 * @param mobile
	 * @param collectonid
	 * @param money
	 * @param invoice
	 * @return
	 * @throws Exception
	 */
	public MessageRespBean SurveyInfoNum(SurveyInfoReqBean info) throws Exception;
}
