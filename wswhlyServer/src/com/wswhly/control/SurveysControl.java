package com.wswhly.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.wswhly.bean.survey.SurveyInfoReqBean;
import com.wswhly.dao.SurveysDao;
import com.wswhly.util.StringUtil;

@Controller
public class SurveysControl {


	private static final Logger logger = Logger.getLogger(SurveysControl.class);
	
	@Autowired
	private SurveysDao surveyDao;
	
	/**
	 * 插入调查信息表
	 * autor:haojk
	 */
	@RequestMapping("/SurveyInfo")
	public void SurveyInfo(HttpServletRequest request,HttpServletResponse response){
		SurveyInfoReqBean surveyreq = (new Gson()).fromJson(request.getAttribute("data").toString(), SurveyInfoReqBean.class);
		try{
			surveyDao.addInfo(surveyreq);
			request.setAttribute("resultjson",StringUtil.Success(""));
		}catch (Exception e) {
			logger.error("SurveyInfo Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 *判断用户是否填写用户信息表
	 * autor:haojk
	 */
	@RequestMapping("/SurveyInfoNum")
	public void SurveyInfoNum(HttpServletRequest request,HttpServletResponse response){
		SurveyInfoReqBean surveyreq = (new Gson()).fromJson(request.getAttribute("data").toString(), SurveyInfoReqBean.class);
		try{
			int cntNum =  surveyDao.querySurveyByUseridCount(surveyreq);
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(cntNum)));
		}catch (Exception e) {
			logger.error("SurveyInfoNum Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
}
