package com.hyzm.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.imageio.ImageIO;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.filter.OncePerRequestFilter;


/**
 * 对访问的图片进行压缩处理  减少图片大小
 * @author xjt
 *
 */
public class ImgSysZib extends OncePerRequestFilter{
	private static final long serialVersionUID = 1L;
	private static String zipfileimg[]=new String[]{"/wswhly/zengjipaipin","/wswhly/Baibaourl"};
	@Override
	protected void doFilterInternal(HttpServletRequest request,HttpServletResponse response, FilterChain chain)throws ServletException, IOException {
		//判断是否为手机访问
		if (!isMobileDevice(request)){
			System.out.println("电脑访问！");
			chain.doFilter(request, response);
		}else{
			System.out.println("IP:"+IpUtil.getIp(request));
			System.out.println("手机访问！");
			
			//访问资源路径
			String uri = request.getRequestURI(); 
			
			//判断该资源是否在需要压缩的文件夹下
			int tagn=0;
			for(int i=0;i<zipfileimg.length;i++){
				if(uri.indexOf(zipfileimg[i])>=0){
					tagn+=1;
				}
			}
			if(tagn==0){
				System.out.println("访问的图片不在 需要压缩的文件夹下"+uri);
				chain.doFilter(request, response);
				return;
			}
			
			//如果参数hd==y  表示访问原图
			if(request.getParameter("hd")!=null&&(request.getParameter("hd").trim().equals("y")||request.getParameter("hd").trim()=="y")){
				System.out.println("访问原图 hd=y："+uri);
				chain.doFilter(request, response);;
				return;
			}
			//获取文件绝对路径
			String saveFilePath = request.getSession().getServletContext().getRealPath("/");
			//获取图片名  
			String fiilename=uri.substring(uri.lastIndexOf("/")+1,uri.length());
			//获取图片名上一级文件夹名
			String tmpfilename=uri.replace("/"+fiilename, "");
			String lastfiilepath=tmpfilename.substring(tmpfilename.lastIndexOf("/")+1,tmpfilename.length());
			//获取图片名上一级文件夹  所有文件路径
			String conpath = request.getContextPath();
			String indexfilepath=uri.substring(0,uri.indexOf("/"+lastfiilepath)).replace(conpath, "");
			//压缩之前文件路径
			String yfilepath=saveFilePath+"/"+indexfilepath+"/"+lastfiilepath+"/"+fiilename;
			CompressPicDemo cpic=new CompressPicDemo();
			//如果图片小于1024字节 不进行才压缩
			if(cpic.getPicSize(yfilepath)<=1024){
				System.out.println("图片小于1024字节！访问原图！");
				chain.doFilter(request, response);
				return;
			}else{
				//定义压缩图片的宽度和高度
				int w=0;
				int h=0;
				if(request.getParameter("w")!=null&&!request.getParameter("w").equals("")&&request.getParameter("w")!=""){
					 w=Integer.valueOf(request.getParameter("w").toString());
			         h=Integer.valueOf(request.getParameter("h").toString());
				}else{
					//获取原图片宽度和高度
					 File yfile=new File(yfilepath); 
					 BufferedImage sourceImg =ImageIO.read(new FileInputStream(yfile));  
					 w=sourceImg.getWidth();
					 h=sourceImg.getHeight();
					 //如果为手机访问 如果宽高大于500  按照500进行压缩
					 if (isMobileDevice(request)){
						if(w>500){
							w=500;
						}
						if(h>500){
							h=500;
						}
					 }
				}
				//压缩之后文件名称
				String zibfilename=w+"_"+h+"_"+fiilename;
				//压缩之后文件路径
				String zipfilepath=saveFilePath+"/"+indexfilepath+"/"+lastfiilepath+"_zip/"+zibfilename;
				File zipfile = new File(zipfilepath);
				do{
					if(zipfile.exists()){
							System.out.println("访问缓存："+indexfilepath+"/"+lastfiilepath+"_zip/"+zibfilename);
							request.getRequestDispatcher(indexfilepath+"/"+lastfiilepath+"_zip/"+zibfilename).forward(request, response);
							return;
					}else{
							System.out.println("对源文件进行压缩 源文件路径："+uri);
							//将图片压缩并放到  _zip文件夹中
							try {
								System.out.println(yfilepath);
								System.out.println(zipfilepath);
				                System.out.println("输入的图片大小：" + cpic.getPicSize(yfilepath)/1024 + "KB");
				                //true:按照宽 高比例压缩    false：按照宽高 绝对压缩
				                cpic.compressPic(saveFilePath+"/"+indexfilepath+"/"+lastfiilepath+"/", saveFilePath+"/"+indexfilepath+"/"+lastfiilepath+"_zip/", fiilename,zibfilename, w, h, true); 
				                System.out.println("输出的图片大小：" + cpic.getPicSize(zipfilepath)/1024 + "KB"); 
				                request.getRequestDispatcher(indexfilepath+"/"+lastfiilepath+"_zip/"+zibfilename).forward(request, response);
				                return;
							} catch (Exception e) {
								e.printStackTrace();
							}
					}
				
				}while(false);
			}
		}
	}

	
	
	
	
	private static String[] mobileUserAgents=new String[]{
	    "Nokia",//诺基亚，有山寨机也写这个的，总还算是手机，Mozilla/5.0 (Nokia5800 XpressMusic)UC AppleWebkit(like Gecko) Safari/530
	    "SAMSUNG",//三星手机 SAMSUNG-GT-B7722/1.0+SHP/VPP/R5+Dolfin/1.5+Nextreaming+SMM-MMS/1.2.0+profile/MIDP-2.1+configuration/CLDC-1.1
	    "MIDP-2",//j2me2.0，Mozilla/5.0 (SymbianOS/9.3; U; Series60/3.2 NokiaE75-1 /110.48.125 Profile/MIDP-2.1 Configuration/CLDC-1.1 ) AppleWebKit/413 (KHTML like Gecko) Safari/413
	    "CLDC1.1",//M600/MIDP2.0/CLDC1.1/Screen-240X320
	    "SymbianOS",//塞班系统的，
	    "MAUI",//MTK山寨机默认ua
	    "UNTRUSTED/1.0",//疑似山寨机的ua，基本可以确定还是手机
	    "Windows CE",//Windows CE，Mozilla/4.0 (compatible; MSIE 6.0; Windows CE; IEMobile 7.11)
	    "iPhone",//iPhone是否也转wap？不管它，先区分出来再说。Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_1 like Mac OS X; zh-cn) AppleWebKit/532.9 (KHTML like Gecko) Mobile/8B117
	    "iPad",//iPad的ua，Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; zh-cn) AppleWebKit/531.21.10 (KHTML like Gecko) Version/4.0.4 Mobile/7B367 Safari/531.21.10
	    "Android",//Android是否也转wap？Mozilla/5.0 (Linux; U; Android 2.1-update1; zh-cn; XT800 Build/TITA_M2_16.22.7) AppleWebKit/530.17 (KHTML like Gecko) Version/4.0 Mobile Safari/530.17
	    "BlackBerry",//BlackBerry8310/2.7.0.106-4.5.0.182
	    "UCWEB",//ucweb是否只给wap页面？ Nokia5800 XpressMusic/UCWEB7.5.0.66/50/999
	    "ucweb",//小写的ucweb貌似是uc的代理服务器Mozilla/6.0 (compatible; MSIE 6.0;) Opera ucweb-squid
	    "BREW",//很奇怪的ua，例如：REW-Applet/0x20068888 (BREW/3.1.5.20; DeviceId: 40105; Lang: zhcn) ucweb-squid
	    "J2ME",//很奇怪的ua，只有J2ME四个字母
	    "YULONG",//宇龙手机，YULONG-CoolpadN68/10.14 IPANEL/2.0 CTC/1.0
	    "YuLong",//还是宇龙
	    "COOLPAD",//宇龙酷派YL-COOLPADS100/08.10.S100 POLARIS/2.9 CTC/1.0
	    "TIANYU",//天语手机TIANYU-KTOUCH/V209/MIDP2.0/CLDC1.1/Screen-240X320
	    "TY-",//天语，TY-F6229/701116_6215_V0230 JUPITOR/2.2 CTC/1.0
	    "K-Touch",//还是天语K-Touch_N2200_CMCC/TBG110022_1223_V0801 MTK/6223 Release/30.07.2008 Browser/WAP2.0
	    "Haier",//海尔手机，Haier-HG-M217_CMCC/3.0 Release/12.1.2007 Browser/WAP2.0
	    "DOPOD",//多普达手机
	    "Lenovo",// 联想手机，Lenovo-P650WG/S100 LMP/LML Release/2010.02.22 Profile/MIDP2.0 Configuration/CLDC1.1
	    "LENOVO",// 联想手机，比如：LENOVO-P780/176A
	    "HUAQIN",//华勤手机
	    "AIGO-",//爱国者居然也出过手机，AIGO-800C/2.04 TMSS-BROWSER/1.0.0 CTC/1.0
	    "CTC/1.0",//含义不明
	    "CTC/2.0",//含义不明
	    "CMCC",//移动定制手机，K-Touch_N2200_CMCC/TBG110022_1223_V0801 MTK/6223 Release/30.07.2008 Browser/WAP2.0
	    "DAXIAN",//大显手机DAXIAN X180 UP.Browser/6.2.3.2(GUI) MMP/2.0
	    "MOT-",//摩托罗拉，MOT-MOTOROKRE6/1.0 LinuxOS/2.4.20 Release/8.4.2006 Browser/Opera8.00 Profile/MIDP2.0 Configuration/CLDC1.1 Software/R533_G_11.10.54R
	    "SonyEricsson",// 索爱手机，SonyEricssonP990i/R100 Mozilla/4.0 (compatible; MSIE 6.0; Symbian OS; 405) Opera 8.65 [zh-CN]
	    "GIONEE",//金立手机
	    "HTC",//HTC手机
	    "ZTE",//中兴手机，ZTE-A211/P109A2V1.0.0/WAP2.0 Profile
	    "HUAWEI",//华为手机，
	    "webOS",//palm手机，Mozilla/5.0 (webOS/1.4.5; U; zh-CN) AppleWebKit/532.2 (KHTML like Gecko) Version/1.0 Safari/532.2 Pre/1.0
	    "GoBrowser",//3g GoBrowser.User-Agent=Nokia5230/GoBrowser/2.0.290 Safari
	    "IEMobile",//Windows CE手机自带浏览器，
	    "WAP2.0"//支持wap 2.0的
	    };
	
	   /**Wap网关Via头信息中特有的描述信息*/
	    private static String mobileGateWayHeaders[]=new String[]{
	    "ZXWAP",//中兴提供的wap网关的via信息，例如：Via=ZXWAP GateWayZTE Technologies，
	    "chinamobile.com",//中国移动的诺基亚wap网关，例如：Via=WTP/1.1 GDSZ-PB-GW003-WAP07.gd.chinamobile.com (Nokia WAP Gateway 4.1 CD1/ECD13_D/4.1.04)
	    "monternet.com",//移动梦网的网关，例如：Via=WTP/1.1 BJBJ-PS-WAP1-GW08.bj1.monternet.com. (Nokia WAP Gateway 4.1 CD1/ECD13_E/4.1.05)
	    "infoX",//华为提供的wap网关，例如：Via=HTTP/1.1 GDGZ-PS-GW011-WAP2 (infoX-WISG Huawei Technologies)，或Via=infoX WAP Gateway V300R001 Huawei Technologies
	    "XMS 724Solutions HTG",//国外电信运营商的wap网关，不知道是哪一家
	    "wap.lizongbo.com",//自己测试时模拟的头信息
	    "Bytemobile",//貌似是一个给移动互联网提供解决方案提高网络运行效率的，例如：Via=1.1 Bytemobile OSN WebProxy/5.1
	    };
	    /**电脑上的IE或Firefox浏览器等的User-Agent关键词*/
	    private static String[] pcHeaders=new String[]{
	    "Windows 98",
	    "Windows ME",
	    "Windows 2000",
	    "Windows XP",
	    "Windows NT",
	    "Ubuntu"
	};

	public static boolean isMobileDevice(HttpServletRequest request){
        boolean b = false;
        boolean pcFlag = false;
        boolean mobileFlag = false;
        String via = request.getHeader("Via");
        String userAgent = request.getHeader("user-agent");
        for (int i = 0; via!=null && !via.trim().equals("") && i < mobileGateWayHeaders.length; i++) {
            if(via.contains(mobileGateWayHeaders[i])){
                mobileFlag = true;
                break;
            }
        }
        for (int i = 0;!mobileFlag && userAgent!=null && !userAgent.trim().equals("") && i < mobileUserAgents.length; i++) {
            if(userAgent.contains(mobileUserAgents[i])){
                mobileFlag = true;
                break;
            }
        }
        for (int i = 0; userAgent!=null && !userAgent.trim().equals("") && i < pcHeaders.length; i++) {
            if(userAgent.contains(pcHeaders[i])){
                pcFlag = true;
                break;
            }
        }
        if(mobileFlag==true && pcFlag==false){
            b=true;
        }
        return b;//false pc  true shouji
    
    }
	
}
