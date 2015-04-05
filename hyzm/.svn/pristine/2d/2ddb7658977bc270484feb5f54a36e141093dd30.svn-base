package com.hyzm.util;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.google.gson.Gson;
import com.hyzm.bean.CurrentSession;
import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.user.LoginReqBean;
import com.hyzm.bean.user.LoginRespBean;
import com.hyzm.bean.user.LoginRespBean.User;

public class SignonInterceptor extends HandlerInterceptorAdapter {
	//特殊字符
	private static String inj_str = "select@@from@@and@@drop@@exec@@insert@@select@@delete@@update@@count@@union@@%@@chr@@mid@@master@@truncate@@char@@declare@@" +
									"'@@\"@@input@@script@@javascript@@location@@html@@java@@alert@@history@@iframe@@html@@style@@</title>@@</textarea>@@</a>href</a>";
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		//验证是否存在特殊字符  防止sql注入
		Iterator values = request.getParameterMap().values().iterator();//获取所有的表单参数 
		if (sql_inj(values)) {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			StringBuffer sb = new StringBuffer();
			sb.append("<script type=\"text/javascript\" charset=\"UTF-8\">");
			sb.append("alert(\"您输入的信息存在特殊字符！\");history.back();");
			sb.append("</script>");
			out.print(sb.toString());
			out.close();
			return false;
		}
		
		
		//验证登陆
		
		CurrentSession currentSession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		String url = request.getContextPath() + request.getServletPath();
		String p = request.getParameter("p");
		url = url +"?p="+ p;
		if(currentSession == null){
			Cookie[] cookies = request.getCookies();
			if(cookies != null){
				String username = "",password = "";
				for (int i = 0; i < cookies.length; i++) {
					if (cookies[i].getName().equals("username")) {
						username = URLDecoder.decode(cookies[i].getValue(),
								"utf-8");
					}
					if (cookies[i].getName().equals("password")) {
						password = URLDecoder.decode(cookies[i].getValue(),
								"utf-8");
					}
				}
				if(!username.equals("") && !password.equals("")){
					LoginReqBean login = new LoginReqBean();
					login.setUsername(username);
					login.setPassword(password);
					MessageRespBean respBean = HttpClient.getMessageResponse(login, "Login");
					if ("0000".equals(respBean.getErrorcode())) {
						LoginRespBean loginresp = new Gson().fromJson(respBean.getContent(), LoginRespBean.class);
						User user = loginresp.getUser();
						currentSession = new CurrentSession();
						currentSession.setId(user.getId());
						currentSession.setUsername(user.getUsername());
						currentSession.setRealname(user.getRealname());
						currentSession.setIdcard(user.getIdcard());
						currentSession.setAddress(user.getAddress());
						currentSession.setEmail(user.getEmail());
						if(user.getJob() != null)
							currentSession.setJob(Integer.valueOf(user.getJob()));
						currentSession.setJobname(user.getJobname());
						currentSession.setMobile(user.getMobile());
						currentSession.setMoney(user.getMoney());
						currentSession.setPoint(user.getPoint());
						currentSession.setCreatedate(user.getCreatedate());
						currentSession.setLevel(user.getLevel());
						currentSession.setLeveltime(user.getLeveltime());
						currentSession.setIdcardimg(user.getIdcardimg());
						currentSession.setOpenId(user.getOpenId());
						currentSession.setWeixin(user.getWeixin());
						currentSession.setBaibaoshopstate(user.getBaibaoshopstate());
						request.getSession().setAttribute("CurrentSession", currentSession);
					}
				}
			}
		}
		boolean flag = false;
		if(currentSession == null && (url.indexOf("user") >= 0 || url.indexOf("mine") >= 0||url.indexOf("Mine") >= 0 || url.indexOf("pay") >= 0))
			flag = true;
		if(url.indexOf("verify") >= 0 || url.indexOf("Register") >= 0 || url.indexOf("Login") >= 0 || url.indexOf("SendSms") >= 0 || url.indexOf("pay/callback") >= 0 || url.indexOf("pay/notify") >= 0|| url.indexOf("pay/cftcallback") >= 0 || url.indexOf("pay/cftnotify") >= 0|| url.indexOf("BaiBao_get") >= 0)
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
			return false;
		}
		return true;
	}
	
	
	
	
	
	
	
	/************************************************************帮助方法*****************************************************************************************/
	public static boolean sql_inj(Iterator values){  
		while(values.hasNext()){ 
			String[] value = (String[])values.next(); 
			for(int j = 0;j < value.length;j++){ 
				String str=value[j].toString().replace(" ", "");
				//如果为大写 转换为小写
				str=str.toLowerCase();
				if (str!=null&&str!=""&&!str.equals(""))  
				{  
					String tem[]=inj_str.split("@@");
					for(int i=0;i<tem.length;i++){
						if(str.indexOf(tem[i])>=0){
							System.out.println("存在特殊字符value:"+str);
							return true;
						}
					}
				} 
			}
		}
		return false;  
	}
	public static List<String> getMapKey(Map<String, String> map){
		List<String> listkey=new ArrayList<String>();
		Iterator i=map.entrySet().iterator();
		while(i.hasNext()){
		Map.Entry e=(Map.Entry)i.next();
		listkey.add(e.getKey().toString());
		}
		return listkey;
	}
}
