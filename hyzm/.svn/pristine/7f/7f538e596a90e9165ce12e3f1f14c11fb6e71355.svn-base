package com.hyzm.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hyzm.bean.CurrentSession;
import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.user.LoginReqBean;
import com.hyzm.bean.user.LoginRespBean;
import com.hyzm.bean.user.LoginRespBean.User;

public class MyFilter extends HttpServlet implements Filter {

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException{

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;

		CurrentSession currentSession = (CurrentSession) request.getSession()
				.getAttribute("CurrentSession");
		String url = request.getContextPath() + request.getServletPath();
		if (currentSession == null) {
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				String username = "", password = "";
				for (int i = 0; i < cookies.length; i++) {
					if (cookies[i].getName().equals("username")) {
						username = cookies[i].getValue();
					}
					if (cookies[i].getName().equals("password")) {
						password = cookies[i].getValue();
					}
				}
				if (!username.equals("") && !password.equals("")) {
					try{
						LoginReqBean login = new LoginReqBean();
						login.setUsername(username);
						login.setPassword(password);
							MessageRespBean respBean = HttpClient.getMessageResponse(
									login, "Login");
						
						if ("0000".equals(respBean.getErrorcode())) {
							LoginRespBean loginresp = new Gson().fromJson(
									respBean.getContent(), LoginRespBean.class);
							User user = loginresp.getUser();
							currentSession = new CurrentSession();
							currentSession.setId(user.getId());
							currentSession.setUsername(user.getUsername());
							currentSession.setRealname(user.getRealname());
							currentSession.setIdcard(user.getIdcard());
							currentSession.setAddress(user.getAddress());
							currentSession.setEmail(user.getEmail());
							currentSession.setJob(Integer.valueOf(user.getJob()));
							currentSession.setJobname(user.getJobname());
							currentSession.setMobile(user.getMobile());
							currentSession.setMoney(user.getMoney());
							currentSession.setPoint(user.getPoint());
							currentSession.setCreatedate(user.getCreatedate());
							request.getSession().setAttribute("CurrentSession",
									currentSession);
						}
					}catch (Exception e) {
					}
				}
			}
		}
		boolean flag = false;
		if (currentSession == null
				&& (url.indexOf("/user") >= 0 || url.indexOf("/mine") >= 0))
			flag = true;
		if (url.indexOf("/verify") >= 0 || url.indexOf("/Register") >= 0
				|| url.indexOf("/Login") >= 0 || url.indexOf("/SendSms") >= 0)
			flag = false;
		if (flag) {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			StringBuffer sb = new StringBuffer();
			sb.append("<script type=\"text/javascript\" charset=\"UTF-8\">");
			sb.append("alert(\"您尚未登录或页面已过期，请重新登录\");");
			sb.append("window.top.location.href=\"");
			sb.append(request.getContextPath() + "/index\";</script>");
			out.print(sb.toString());
			out.close();
		} else {
			chain.doFilter(request, response);
		}

	}

	public void init(FilterConfig arg0) throws ServletException {
	}
}