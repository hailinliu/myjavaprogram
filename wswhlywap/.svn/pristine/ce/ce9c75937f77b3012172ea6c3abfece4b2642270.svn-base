package com.hyzm.util;



import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.font.FontRenderContext;
import java.awt.geom.AffineTransform;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.imageio.ImageIO;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.multipart.FilePart;
import org.apache.commons.httpclient.methods.multipart.MultipartRequestEntity;
import org.apache.commons.httpclient.methods.multipart.Part;

public class SendMail {
    private static MimeMessage message;
    private static Session session;
    private static Transport transport;

    private static String mailHost = "smtp.aicheyongpin.com";
    private static String sender_username = "service@aicheyongpin.com";
    private static String sender_password = "1qaz!QAZ";
   

    /**
     * �����ʼ�
     * 
     * @param subject
     *            �ʼ�����
     * @param sendHtml
     *            �ʼ�����
     * @param receiveUser
     *            �ռ��˵�ַ
     * @param attachment
     *            ����
     */
    public static boolean doSendHtmlEmail(String subject, String sendHtml, String receiveUser , List<File> files ) {
        try {
        	 Properties props = System.getProperties();
        	 props.put("mail.smtp.host", mailHost);
      	   	 props.put("mail.smtp.auth", "true");
             session = Session.getDefaultInstance(props, null);
             message = new MimeMessage(session);
             InternetAddress from = new InternetAddress(MimeUtility.encodeWord("卫视文化乐园")+" <"+sender_username+">");
            message.setFrom(from);

            	 InternetAddress to = new InternetAddress(receiveUser);
                 message.setRecipient(Message.RecipientType.TO, to);
            

           
            message.setSubject(subject);

            Multipart multipart = new MimeMultipart();
            
            BodyPart contentPart = new MimeBodyPart();
            contentPart.setContent(sendHtml, "text/html;charset=UTF-8");
            multipart.addBodyPart(contentPart);
            if (files != null && files.size() > 0) {
                for (File file : files) {
                	 BodyPart attachmentBodyPart = new MimeBodyPart();
                    FileDataSource fds = new FileDataSource(file); 
                    attachmentBodyPart.setDataHandler(new DataHandler(fds)); 
                    sun.misc.BASE64Encoder enc = new sun.misc.BASE64Encoder();
                    attachmentBodyPart.setFileName("=?GBK?B?" + enc.encode(file.getName().getBytes()) + "?=");
                    //attachmentBodyPart.setFileName(fds.getName()); // �õ��ļ���ͬ������BodyPart
                    multipart.addBodyPart(attachmentBodyPart);
                }
            }
           
            
            message.setContent(multipart);
            message.saveChanges();

            transport = session.getTransport("smtp");
            transport.connect(mailHost, sender_username, sender_password);
            transport.sendMessage(message, message.getAllRecipients());

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (transport != null) {
                try {
                    transport.close();
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    /**
     * �����ʼ�
     */
   public static int send(String mailaddress,String subject,String content){
	   boolean tag= SendMail.doSendHtmlEmail(subject, content, mailaddress, null);//
	   if(tag){
		   return 0;
	   }
	   return 1;
   }
	/**
	 * �������ͼƬ
	 * @param str
	 * @param font
	 * @param outFile
	 * @throws Exception
	 */
   public static void createImage(String str,Font font,File outFile){
     Rectangle2D r=font.getStringBounds(str, new FontRenderContext(AffineTransform.getScaleInstance(1, 1),false,false));
     int unitHeight=(int)Math.floor(r.getHeight())*10;
     int width=(int)Math.round(r.getWidth())+1;
     int height=unitHeight+3;
     BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR);
     Graphics g=image.getGraphics();
     g.setColor(Color.WHITE);
     g.fillRect(0, 0, width, height);
     g.setColor(Color.black);
     g.setFont(font);
     String [] text=str.split("<br>");
     for(int i=0;i<text.length;i++){
    	 g.drawString(text[i], 0, font.getSize()+i*25);
     }
     g.dispose();
     try {
		ImageIO.write(image, "png", outFile);
	} catch (IOException e) {
		e.printStackTrace();
	}
   }
   public static void uploadImage(File file){
	   String targetURL = null;// TODO 指定URL
	   File targetFile = null;// TODO 指定上传文件
	   
	   targetFile = file;
	   targetURL = "http://localhost:8090/wswhly/collect/uploademailimage"; //servleturl
	   PostMethod filePost = new PostMethod(targetURL);
	   
	   try
	   {
//		   MultipartPostMethod filePost = new MultipartPostMethod(targetURL); 
//		   filePost.addParameter( "uploadFile" , targetFile.getName()); 
//		   HttpClient client = new HttpClient();
//		   client.getHttpConnectionManager(). getParams().setConnectionTimeout(5000); 
//		   int status = client.executeMethod(filePost);
	    //通过以下方法可以模拟页面参数提交
	    //filePost.setParameter("name", "中文");
	    //filePost.setParameter("pass", "1234");
	 
	   Part[] parts = { new FilePart("uploadFile", targetFile) };
	    filePost.setRequestEntity(new MultipartRequestEntity(parts,filePost.getParams()));
	    HttpClient client = new HttpClient();
	    client.getHttpConnectionManager().getParams().setConnectionTimeout(5000);
	    int status = client.executeMethod(filePost);
	    if (status == HttpStatus.SC_OK)
	    {
	     System.out.println("上传成功");
	     // 上传成功
	    }
	    else
	    {
	     System.out.println("上传失败");
	     // 上传失败
	    }
	   }
	   catch (Exception ex)
	   {
	    ex.printStackTrace();
	   }
	   finally
	   {
	    filePost.releaseConnection();
	   }
   }
    public static void main(String[] args) {
//    	String filepath="E:\\a.png";
//    	uploadImage(new File(filepath));
////    	createImage("卫视文化乐园",new Font("宋体",Font.BOLD,18),new File(filepath));
//    	
    	String dg_kfemail[]=new String[]{"529887775@qq.com"};
    	String mobile="1111";
		String con="手机号:"+mobile+"于"+DateUtil.getDateTime(new Date(), "MM-dd HH:mm:ss");
		 for(int i=0;i<dg_kfemail.length;i++){
			 SendMail.doSendHtmlEmail(con, con,"529887775@qq.com", null);
		 }
        	
    }
  

}
