package com.hyzm.forward.control;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.hyzm.bean.CurrentSession;
import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.survey.SurveyInfoReqBean;
import com.hyzm.forward.service.survey.SurveyService;
import com.hyzm.util.StringUtil;


@Controller
public class SurveyControl {
	private static final Logger logger = Logger.getLogger(SurveyControl.class);

    @Autowired
	private SurveyService surveyService;
     /**
	 *会员信息调查表提交
	 *autor:haojk
	 * @param request
	 * @param response
	 */
	@RequestMapping("/surveyInfo")
	public String SurveyInfo(HttpServletRequest request, HttpServletResponse response) {
		try {
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
			SurveyInfoReqBean info = new SurveyInfoReqBean();
		    info.setUserid(currentSession.getId());
            info.setUsername(currentSession.getUsername());
		    info.setBirth(request.getParameter("YY"));
		    info.setCollectage(request.getParameter("1"));
		    info.setChannel(StringUtil.getStrings(request.getParameterValues("3")));
		    info.setLikeoption(StringUtil.getStrings(request.getParameterValues("2")));
		    info.setHopeorganization(StringUtil.getStrings(request.getParameterValues("4")));
		    info.setService(StringUtil.getStrings(request.getParameterValues("5")));
		    info.setTarget(StringUtil.getStrings(request.getParameterValues("6")));
		    info.setIsjoin(request.getParameter("7"));
		    info.setIsload(request.getParameter("8"));
		    info.setPrice(request.getParameter("9"));
		    info.setIspush(request.getParameter("10"));
		    info.setSuggest(request.getParameter("memo"));
		    MessageRespBean respBean = surveyService.SurveyInfo(info);
		    if(respBean.getErrorcode().equals("0000"))
		    	return "redirect:mine/gotovip";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
    /**
	 *判断会员是否提交过信息调查表
	 *autor:haojk
	 * @param request
	 * @param response
	 */
	@RequestMapping("/surveyInfoNum")
	public void SurveyInfoNum(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");	
		PrintWriter out = null;
		MessageRespBean respBean=null;
		try {
			out = response.getWriter();
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
			SurveyInfoReqBean info = new SurveyInfoReqBean();
		    info.setUserid(currentSession.getId());
            info.setUsername(currentSession.getUsername());
			respBean=surveyService.SurveyInfoNum(info);	
			out.print(new Gson().toJson(respBean.getContent()));
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
			out.print(new Gson().toJson(respBean.getErrorcode()));
		}
		
	}
}
