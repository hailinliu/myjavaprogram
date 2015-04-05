
package com.hyzm.forward.service.survey.imp;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.survey.SurveyInfoReqBean;
import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.survey.SurveyService;

@Service
public class SurveyServiceImpl  extends MessageResponse implements SurveyService {

	private final Logger log = Logger.getLogger(this.getClass());

	public MessageRespBean SurveyInfo(SurveyInfoReqBean info) throws Exception {
     log.info("信息调查表信息");
		MessageRespBean respBean = new MessageRespBean();
		try {
			respBean = getMessageResponse(info, "SurveyInfo");
		} catch (Exception e) {
			log.error("信息调查表异常："+e.getMessage());
			e.printStackTrace();
		}
		return respBean;
	}

	public MessageRespBean SurveyInfoNum(SurveyInfoReqBean info) throws Exception {
	     log.info("用户是否填写过信息调查表信息");
			MessageRespBean respBean = new MessageRespBean();
			try {
				respBean = getMessageResponse(info, "SurveyInfoNum");
			} catch (Exception e) {
				log.error("信息调查表异常："+e.getMessage());
				e.printStackTrace();
			}
			return respBean;
		}
	
}
