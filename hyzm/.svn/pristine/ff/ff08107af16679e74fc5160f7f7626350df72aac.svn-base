package com.hyzm.forward.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alipay.config.*;
import com.alipay.util.*;
import com.hyzm.bean.CurrentSession;
import com.hyzm.forward.service.trade.TradeService;

import java.util.*;

import java.io.PrintWriter;

@Controller
public class PayControl {

	private static final Logger logger = Logger.getLogger(PayControl.class);
	
	@Autowired
	private TradeService tradeService;
	
	@RequestMapping("/pay")
	public void pay(HttpServletRequest request,HttpServletResponse response){
		try{
			//支付类型
			String payment_type = "1";
			//必填，不能修改
			//服务器异步通知页面路径
			String notify_url = "http://www.wswhly.com/pay/notify";
			//需http://格式的完整路径，不能加?id=123这类自定义参数

			//页面跳转同步通知页面路径
			String return_url = "http://www.wswhly.com/pay/callback";
			//需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/

			//卖家支付宝帐户
			String seller_email = "2539829391@qq.com";
			//必填

			double money = Double.valueOf(new String(request.getParameter("money").getBytes("ISO-8859-1"),"UTF-8"));
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
			
			Map<String,Object> map = tradeService.Recharge(currentSession.getId(), money);
			String ordernum = "";
			if(map.get("errorcode").equals("0000")){
				ordernum = (String)map.get("ordernum");
			}else{
				response.getOutputStream().println(map.get("errorinfo").toString());
				return ;
			}
			
			//商户订单号
			String out_trade_no = ordernum;
			//商户网站订单系统中唯一订单号，必填

			//订单名称
			String subject = "卫视文化乐园账户："+currentSession.getUsername()+"充值" + money + "元";
			//必填

			//付款金额
			String total_fee = String.valueOf(money);
			//必填

			//订单描述
			String body = "卫视文化乐园账户："+currentSession.getUsername()+"充值" + money + "元,订单号："+ordernum;
			//商品展示地址
			String show_url = "http://www.wswhly.com/";
			//需以http://开头的完整路径，例如：http://www.xxx.com/myorder.html

			//防钓鱼时间戳
			String anti_phishing_key = "";
			//若要使用请调用类文件submit中的query_timestamp函数

			//客户端的IP地址
			String exter_invoke_ip = "";
			//非局域网的外网IP地址，如：221.0.0.1
			
			
			//////////////////////////////////////////////////////////////////////////////////
			
			//把请求参数打包成数组
			Map<String, String> sParaTemp = new HashMap<String, String>();
			sParaTemp.put("service", "create_direct_pay_by_user");
	        sParaTemp.put("partner", AlipayConfig.partner);
	        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
			sParaTemp.put("payment_type", payment_type);
			sParaTemp.put("notify_url", notify_url);
			sParaTemp.put("return_url", return_url);
			sParaTemp.put("seller_email", seller_email);
			sParaTemp.put("out_trade_no", out_trade_no);
			sParaTemp.put("subject", subject);
			sParaTemp.put("total_fee", total_fee);
			sParaTemp.put("body", body);
			sParaTemp.put("show_url", show_url);
			sParaTemp.put("anti_phishing_key", anti_phishing_key);
			sParaTemp.put("exter_invoke_ip", exter_invoke_ip);
			
			//建立请求
			String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"get","ok");
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();//获得输出对象
			out.println(sHtmlText);
		}catch (Exception e) {
			logger.error("Pay Exception"+e.getMessage());
		}
	}
	
	@RequestMapping("/pay/callback")
	public void callBack(HttpServletRequest request,HttpServletResponse response){
		try{
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();//获得输出对象
			//获取支付宝GET过来反馈信息
			Map<String,String> params = new HashMap<String,String>();
			Map requestParams = request.getParameterMap();
			for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i]
							: valueStr + values[i] + ",";
				}
				//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
				params.put(name, valueStr);
			}
			
			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
			//商户订单号

			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

			//支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

			//交易状态
			String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");

			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
			
			//计算得出通知验证结果
			boolean verify_result = AlipayNotify.verify(params);
			
			if(verify_result){//验证成功
				//////////////////////////////////////////////////////////////////////////////////////////
				//请在这里加上商户的业务逻辑程序代码

				//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
				if(trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")){
					//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
						//如果有做过处理，不执行商户的业务程序
					Map<String,Object> map = tradeService.PaySuccess(out_trade_no, "1", "1", trade_no, trade_status);
					if(map.get("errorcode").equals("0000")){
						logger.info(out_trade_no+"支付成功");
					}else{
						logger.error(out_trade_no+map.get("errorinfo"));
					}
				}
				out.println("<script language='javascript' type='text/javascript'>window.location.href='/mine/getPayOver';</script>");
				//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

				//////////////////////////////////////////////////////////////////////////////////////////
			}else{
				//该页面可做页面美工编辑
				out.println("验证失败");
			}
		}catch (Exception e) {
			logger.error("Pay Exception"+e.getMessage());
		}
	}
	
	@RequestMapping("/pay/notify")
	public void notify(HttpServletRequest request,HttpServletResponse response){
		try{
			//获取支付宝POST过来反馈信息
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();//获得输出对象
			Map<String,String> params = new HashMap<String,String>();
			Map requestParams = request.getParameterMap();
			for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i]
							: valueStr + values[i] + ",";
				}
				//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
				//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
				params.put(name, valueStr);
			}
			
			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
			//商户订单号

			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

			//支付宝交易号

			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

			//交易状态
			String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");

			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//

			if(AlipayNotify.verify(params)){//验证成功
				//////////////////////////////////////////////////////////////////////////////////////////
				//请在这里加上商户的业务逻辑程序代码

				//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
				
				if(trade_status.equals("TRADE_FINISHED")){
					//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
						//如果有做过处理，不执行商户的业务程序
					Map<String,Object> map = tradeService.PaySuccess(out_trade_no, "1", "1", trade_no, trade_status);
					if(map.get("errorcode").equals("0000")){
						logger.info(out_trade_no+"支付成功");
					}else{
						logger.error(out_trade_no+map.get("errorinfo"));
					}
					//注意：
					//该种交易状态只在两种情况下出现
					//1、开通了普通即时到账，买家付款成功后。
					//2、开通了高级即时到账，从该笔交易成功时间算起，过了签约时的可退款时限（如：三个月以内可退款、一年以内可退款等）后。
				} else if (trade_status.equals("TRADE_SUCCESS")){
					//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
						//如果有做过处理，不执行商户的业务程序
					Map<String,Object> map = tradeService.PaySuccess(out_trade_no, "1", "1", trade_no, trade_status);
					if(map.get("errorcode").equals("0000")){
						logger.info(out_trade_no+"支付成功");
					}else{
						logger.error(out_trade_no+map.get("errorinfo"));
					}
					//注意：
					//该种交易状态只在一种情况下出现——开通了高级即时到账，买家付款成功后。
				}

				//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
					
				out.println("success");	//请不要修改或删除

				//////////////////////////////////////////////////////////////////////////////////////////
			}else{//验证失败
				out.println("fail");
			}
		}catch (Exception e) {
			logger.error("Pay Exception"+e.getMessage());
		}
	}
	
	@RequestMapping("/bankpay")
	public void bankpay(HttpServletRequest request,HttpServletResponse response){
		try{
			//支付类型
			String payment_type = "1";
			//必填，不能修改
			//服务器异步通知页面路径
			String notify_url = "http://www.wswhly.com/pay/notify";
			//需http://格式的完整路径，不能加?id=123这类自定义参数

			//页面跳转同步通知页面路径
			String return_url = "http://www.wswhly.com/pay/callback";
			//需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/

			//卖家支付宝帐户
			String seller_email = "2539829391@qq.com";
			//必填

			double money = Double.valueOf(new String(request.getParameter("money").getBytes("ISO-8859-1"),"UTF-8"));
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
			//默认网银
			//String defaultbank = "BOC-DEBIT";//TODO修改默认网站  前台传入
			String defaultbank =request.getParameter("radiobutton");
			Map<String,Object> map = tradeService.Recharge(currentSession.getId(), money);
			String ordernum = "";
			if(map.get("errorcode").equals("0000")){
				ordernum = (String)map.get("ordernum");
			}else{
				response.getOutputStream().println(map.get("errorinfo").toString());
				return ;
			}
			
			//商户订单号
			String out_trade_no = ordernum;
			//商户网站订单系统中唯一订单号，必填

			//订单名称
			String subject = "卫视文化乐园账户："+currentSession.getUsername()+"充值" + money + "元";
			//必填

			//付款金额
			String total_fee = String.valueOf(money);
			//必填

			//订单描述
			String body = "卫视文化乐园账户："+currentSession.getUsername()+"充值" + money + "元,订单号："+ordernum;
			
			//默认支付方式
			String paymethod = "bankPay";
			//必填
			
			//商品展示地址
			String show_url = "http://www.wswhly.com/";
			//需以http://开头的完整路径，例如：http://www.xxx.com/myorder.html

			//防钓鱼时间戳
			String anti_phishing_key = "";
			//若要使用请调用类文件submit中的query_timestamp函数

			//客户端的IP地址
			String exter_invoke_ip = "";
			//非局域网的外网IP地址，如：221.0.0.1
			
			
			//////////////////////////////////////////////////////////////////////////////////
			
			//把请求参数打包成数组
			Map<String, String> sParaTemp = new HashMap<String, String>();
			sParaTemp.put("service", "create_direct_pay_by_user");
	        sParaTemp.put("partner", AlipayConfig.partner);
	        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
			sParaTemp.put("payment_type", payment_type);
			sParaTemp.put("notify_url", notify_url);
			sParaTemp.put("return_url", return_url);
			sParaTemp.put("seller_email", seller_email);
			sParaTemp.put("out_trade_no", out_trade_no);
			sParaTemp.put("subject", subject);
			sParaTemp.put("total_fee", total_fee);
			sParaTemp.put("body", body);
			if(!defaultbank.equals("zfb")){
				sParaTemp.put("paymethod", paymethod);
				sParaTemp.put("defaultbank", defaultbank);
			}
			
			sParaTemp.put("show_url", show_url);
			sParaTemp.put("anti_phishing_key", anti_phishing_key);
			sParaTemp.put("exter_invoke_ip", exter_invoke_ip);
			
			//建立请求
			String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"get","ok");
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();//获得输出对象
			out.println(sHtmlText);
		}catch (Exception e) {
			logger.error("Pay Exception"+e.getMessage());
		}
	}
	
	@RequestMapping("/pay/merchant")
	public String merchant(HttpServletRequest request,HttpServletResponse response){
		return "error";
	}
}
