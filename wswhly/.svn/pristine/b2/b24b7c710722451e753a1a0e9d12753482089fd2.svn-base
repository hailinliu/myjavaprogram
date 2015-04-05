package com.hyzm.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hyzm.bean.CurrentSession;

public class SignonInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		CurrentSession currentSession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		String url = request.getContextPath() + request.getServletPath();
		if (currentSession == null && url.indexOf("/login") < 0
				&& url.indexOf("/gologin") < 0
				&& url.indexOf("/checklogin") < 0
				&& url.indexOf("/ifexistsadmin") < 0
				&& url.indexOf("/validatecode") < 0
				&& url.indexOf("/foreward") < 0
				&& url.indexOf("/company") < 0
				&& url.indexOf("/uploadCollection") < 0
				&& url.indexOf("/uploadBaibaourl") < 0
				&& url.indexOf("/uploadVote") < 0
				&& url.indexOf("/uploadFlagshop") < 0
				&& url.indexOf("/uploadMobile") < 0
				&& url.indexOf("/uploadOffLine") < 0
				&& url.indexOf("/uploademailimage") < 0) {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			StringBuffer sb = new StringBuffer();
			sb.append("<script type=\"text/javascript\" charset=\"UTF-8\">");
			sb.append("alert(\"页面过期，请重新登录\");");
			sb.append("window.top.location.href=\"");
			sb.append(request.getContextPath() + "/sys/gologin\";</script>");
			out.print(sb.toString());
			out.close();
			return false;
		}
		return true;
	}

}
