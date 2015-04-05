package com.hyzm.forward.control;

import java.io.PrintWriter;
import java.util.Date;

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


@Controller
@RequestMapping("/survey")
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
	public void SurveyInfo(HttpServletRequest request, HttpServletResponse response) {
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
		    info.setBirth(request.getParameter("birth"));
		    info.setRealname(request.getParameter("realname"));
		    info.setCollectage(request.getParameter("collectage"));
		    info.setChannel(request.getParameter("channel"));
		    info.setLikeoption(request.getParameter("likeoption"));
		    info.setHopeorganization(request.getParameter("hopeorganization"));
		    info.setOrganization(request.getParameter("organization"));
		    info.setCollection1(request.getParameter("collection1"));
		    info.setCollection2(request.getParameter("collection2"));
		    info.setService(request.getParameter("service"));
		    info.setTarget(request.getParameter("target"));
		    info.setBrowse(request.getParameter("browse"));
		    info.setIsjoin(request.getParameter("isjoin"));
		    info.setIsload(request.getParameter("isload"));
		    info.setPrice(request.getParameter("price"));
		    info.setIspush(request.getParameter("ispush"));
		    info.setSuggest(request.getParameter("suggest"));
		 //   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   // info.setTime(new Date());
			respBean=surveyService.SurveyInfo(info);	
			out.print(new Gson().toJson(respBean.getErrorcode()));
		} catch (Exception e) {
			
			out.print("程序异常！");
			e.printStackTrace();
			out.print(new Gson().toJson(respBean.getErrorcode()));
		}
		
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
