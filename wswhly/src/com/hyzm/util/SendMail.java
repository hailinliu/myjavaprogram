package com.hyzm.util;



import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.font.FontRenderContext;
import java.awt.geom.AffineTransform;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
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

public class SendMail {
    private static MimeMessage message;
    private static Session session;
    private static Transport transport;

    private static String mailHost = "smtp.wswhly.com";
    private static String sender_username = "service1@wswhly.com";
    private static String sender_password = "abc.1234";
   

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
            InternetAddress from = new InternetAddress(MimeUtility.encodeWord("卫视文化乐园԰")+" <"+sender_username+">");
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
   public static void createImage(String str,Font font,File outFile) throws Exception{
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
     ImageIO.write(image, "png", outFile);
   }
   
    public static void main(String[] args) {
        List<String> usermail=new ArrayList<String>();
        usermail.add("xjt_job@yeah.net");
        usermail.add("529887775@qq.com");
        List<File> filelist=new ArrayList<File>();
        File affix = new File("E:\\a.png");
        filelist.add(affix);
        String str="";
        str+="www.wswhly.com <img src='http://116.255.149.172:7080/wswhly/zengjipaipin/a82618b5-6289-43b1-917f-7f7a6b57c7f2.png'/>";
        for(int i=0;i<usermail.size();i++){
        	boolean tag= SendMail.doSendHtmlEmail("2014期", str, usermail.get(i), filelist);//
        	if(tag){
        		System.out.println(usermail.get(i)+":成功！");
        	}else{
        		System.out.println(usermail.get(i)+":失败！");
        	}
        }
    }
  

}
