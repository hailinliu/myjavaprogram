package com.hyzm.util;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
public class CompressPicDemo {
     private File file = null; // 文件对象 
	 private String inputDir; // 输入图路径
	 private String outputDir; // 输出图路径 
	 private String inputFileName; // 输入图文件名
	 private String outputFileName; // 输出图文件名
	 private int outputWidth = 100; // 默认输出图片宽
	 private int outputHeight = 100; // 默认输出图片高
	 private boolean proportion = true; // 是否等比缩放标记(默认为等比缩放)
	 public CompressPicDemo() { // 初始化变量
		 inputDir = ""; 
		 outputDir = ""; 
		 inputFileName = ""; 
		 outputFileName = ""; 
		 outputWidth = 100; 
		 outputHeight = 100; 
	 } 
	 public void setInputDir(String inputDir) { 
		 this.inputDir = inputDir; 
	 } 
	 public void setOutputDir(String outputDir) { 
		 this.outputDir = outputDir; 
	 } 
	 public void setInputFileName(String inputFileName) { 
		 this.inputFileName = inputFileName;
	 } 
	 public void setOutputFileName(String outputFileName) { 
		 this.outputFileName = outputFileName; 
	 } 
	 public void setOutputWidth(int outputWidth) {
		 this.outputWidth = outputWidth; 
	 } 
	 public void setOutputHeight(int outputHeight) { 
		 this.outputHeight = outputHeight; 
	 } 
	 public void setWidthAndHeight(int width, int height) { 
		 this.outputWidth = width;
		 this.outputHeight = height; 
	 } 

	 /* 
	  * 获得图片大小 
	  * 传入参数 String path ：图片路径 
	  */ 
	 public long getPicSize(String path) { 
		 file = new File(path); 
		 return file.length(); 
	 }
	 // 图片处理 
	 public String compressPic() { 
		 try { 
			 //获得源文件 
			 file = new File(inputDir + inputFileName); 
			 if (!file.exists()) { 
				 return ""; 
			 } 
			 Image img = ImageIO.read(file); 
			 // 判断图片格式是否正确 
			 if (img.getWidth(null) == -1) {
				 System.out.println(" can't read,retry!" + "<BR>"); 
				 return "no"; 
			 } else { 
				 int newWidth; int newHeight; 
				 // 判断是否是等比缩放 
				 if (this.proportion == true) { 
					 // 为等比缩放计算输出的图片宽度及高度 
					 double rate1 = ((double) img.getWidth(null)) / (double) outputWidth + 0.1; 
					 double rate2 = ((double) img.getHeight(null)) / (double) outputHeight + 0.1; 
					 // 根据缩放比率大的进行缩放控制 
					 double rate = rate1 > rate2 ? rate1 : rate2; 
					 newWidth = (int) (((double) img.getWidth(null)) / rate); 
					 newHeight = (int) (((double) img.getHeight(null)) / rate); 
//					 newWidth=outputWidth;
//					 newHeight=outputHeight;
				 } else { 
					 newWidth=outputWidth;
					 newHeight=outputHeight;
				 } 
			 	BufferedImage tag = new BufferedImage((int) newWidth, (int) newHeight, BufferedImage.TYPE_INT_RGB); 

			 	/*
				 * Image.SCALE_SMOOTH 的缩略算法 生成缩略图片的平滑度的image.SCALE_SMOOTH //平滑优先
					image.SCALE_FAST//速度优先
					image.SCALE_AREA_AVERAGING //区域均值
					image.SCALE_REPLICATE //像素复制型缩放
					image.SCALE_DEFAULT //默认缩放模式
				 * 优先级比速度高 生成的图片质量比较好 但速度慢
				 */ 
			 	tag.getGraphics().drawImage(img.getScaledInstance(newWidth, newHeight, Image.SCALE_FAST), 0, 0, null);
			 	File outdir=new File(outputDir);
			 	if(!outdir.exists()){
			 		outdir.mkdirs();
			 	}
			 	FileOutputStream out = new FileOutputStream(outputDir + outputFileName);
			 	// JPEGImageEncoder可适用于其他图片类型的转换 
			 	JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out); 
			 	encoder.encode(tag); 
			 	out.close(); 
			 } 
		 } catch (IOException ex) { 
			 ex.printStackTrace(); 
		 } 
		 return "ok"; 
	} 
 	public String compressPic (String inputDir, String outputDir, String inputFileName, String outputFileName) { 
 		// 输入图路径 
 		this.inputDir = inputDir; 
 		// 输出图路径 
 		this.outputDir = outputDir; 
 		// 输入图文件名 
 		this.inputFileName = inputFileName; 
 		// 输出图文件名
 		this.outputFileName = outputFileName; 
 		return compressPic(); 
 	} 
 	public String compressPic(String inputDir, String outputDir, String inputFileName, String outputFileName, int width, int height, boolean gp) { 
 		// 输入图路径 
 		this.inputDir = inputDir; 
 		// 输出图路径 
 		this.outputDir = outputDir; 
 		// 输入图文件名 
 		this.inputFileName = inputFileName; 
 		// 输出图文件名 
 		this.outputFileName = outputFileName; 
 		// 设置图片长宽
 		setWidthAndHeight(width, height); 
 		// 是否是等比缩放 标记 
 		this.proportion = gp; 
 		return compressPic(); 
 	} 
 	public String compressPic(String inputDir, String outputDir, String inputFileName, String outputFileName, boolean gp) { 
 		// 输入图路径 
 		this.inputDir = inputDir; 
 		// 输出图路径 
 		this.outputDir = outputDir; 
 		// 输入图文件名 
 		this.inputFileName = inputFileName; 
 		// 输出图文件名 
 		this.outputFileName = outputFileName; 
 		// 是否是等比缩放 标记 
 		this.proportion = gp; 
 		return compressPic(); 
 	} 

 	// main测试 
 	// compressPic(大图片路径,生成小图片路径,大图片文件名,生成小图片文名,生成小图片宽度,生成小图片高度,是否等比缩放(默认为true))
 	public static void main(String[] arg) { 
 		CompressPicDemo mypic = new CompressPicDemo(); 
 		System.out.println("输入的图片大小：" + mypic.getPicSize("e:\\1.jpg")/1024 + "KB"); 
                mypic.compressPic("e:\\", "e:\\test\\", "1.jpg", "r1.jpg", 120, 120, false); 

 	} 
 	 /**
     * 添加文字水印
     * @param targetImg 目标图片路径，如：C://myPictrue//1.jpg
     * @param pressText 水印文字， 如：中国证券网
     * @param fontName 字体名称，    如：宋体
     * @param fontStyle 字体样式，如：粗体和斜体(Font.BOLD|Font.ITALIC)
     * @param fontSize 字体大小，单位为像素
     * @param color 字体颜色
     * @param x 水印文字距离目标图片左侧的偏移量，如果x<0, 则在正中间
     * @param y 水印文字距离目标图片上侧的偏移量，如果y<0, 则在正中间
     * @param alpha 透明度(0.0 -- 1.0, 0.0为完全透明，1.0为完全不透明)
*/
    public static void pressText(String targetImg, String pressText, String fontName, int fontStyle, int fontSize, Color color, int x, int y, float alpha) {
        try {
            File file = new File(targetImg);
            
            Image image = ImageIO.read(file);
            int width = image.getWidth(null);
            int height = image.getHeight(null);
            BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            Graphics2D g = bufferedImage.createGraphics();
            g.drawImage(image, 0, 0, width, height, null);
            g.setFont(new Font(fontName, fontStyle, fontSize));
            g.setColor(color);
            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha));
            
            int width_1 = fontSize * getLength(pressText);
            int height_1 = fontSize;
            int widthDiff = width - width_1;
            int heightDiff = height - height_1;
            if(x < 0){
                x = widthDiff / 2;
            }else if(x > widthDiff){
                x = widthDiff;
            }
            if(y < 0){
                y = heightDiff / 2;
            }else if(y > heightDiff){
                y = heightDiff;
            }
            
            g.drawString(pressText, x, heightDiff + height_1);
            g.dispose();
            ImageIO.write(bufferedImage, "jpg", file);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 给图片添加水印、可设置水印的旋转角度
     * @param logoText
     * @param srcImgPath
     * @param degree
     */ 
    public static void markByText(String logoText, String srcImgPath, 
            Integer degree) { 
        // 主图片的路径 
        InputStream is = null; 
        OutputStream os = null; 
        try { 
            Image srcImg = ImageIO.read(new File(srcImgPath)); 
 
            BufferedImage buffImg = new BufferedImage(srcImg.getWidth(null), 
                    srcImg.getHeight(null), BufferedImage.TYPE_INT_RGB); 
 
            // 得到画笔对象 
            // Graphics g= buffImg.getGraphics(); 
            Graphics2D g = buffImg.createGraphics(); 
 
            // 设置对线段的锯齿状边缘处理 
            g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, 
                    RenderingHints.VALUE_INTERPOLATION_BILINEAR); 
 
            g.drawImage(srcImg.getScaledInstance(srcImg.getWidth(null), srcImg 
                    .getHeight(null), Image.SCALE_SMOOTH), 0, 0, null); 
            if (null != degree) { 
                // 设置水印旋转 
                g.rotate(Math.toRadians(degree), 
                        (double) buffImg.getWidth() / 2, (double) buffImg 
                                .getHeight() / 2); 
            } 
            // 设置颜色 
            g.setColor(Color.red); 
 
            // 设置 Font 
            g.setFont(new Font("宋体", Font.BOLD, 15)); 
 
            float alpha = 0.5f; 
            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, 
                    alpha)); 
 
            // 第一参数->设置的内容，后面两个参数->文字在图片上的坐标位置(x,y) . 
            g.drawString(logoText, 30, 30); 
 
            g.dispose(); 
 
            os = new FileOutputStream(srcImgPath); 
 
            // 生成图片 
            ImageIO.write(buffImg, "JPG", os); 
 
        } catch (Exception e) { 
            e.printStackTrace(); 
        } finally { 
            try { 
                if (null != is) 
                    is.close(); 
            } catch (Exception e) { 
                e.printStackTrace(); 
            } 
            try { 
                if (null != os) 
                    os.close(); 
            } catch (Exception e) { 
                e.printStackTrace(); 
            } 
        } 
    } 
    /**
     * 添加图片水印
     * @param targetImg 目标图片路径，如：C://myPictrue//1.jpg
     * @param waterImg  水印图片路径，如：C://myPictrue//logo.png
     * @param x 水印图片距离目标图片左侧的偏移量，如果x<0, 则在正中间
     * @param y 水印图片距离目标图片上侧的偏移量，如果y<0, 则在正中间
     * @param alpha 透明度(0.0 -- 1.0, 0.0为完全透明，1.0为完全不透明)
*/
    public final static void pressImage(String targetImg, String waterImg, int x, int y, float alpha) {
            try {
                File file = new File(targetImg);
                Image image = ImageIO.read(file);
                int width = image.getWidth(null);
                int height = image.getHeight(null);
                BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
                Graphics2D g = bufferedImage.createGraphics();
                g.drawImage(image, 0, 0, width, height, null);
            
                Image waterImage = ImageIO.read(new File(waterImg));    // 水印文件
                int width_1 = waterImage.getWidth(null);
                int height_1 = waterImage.getHeight(null);
                g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha));
                
                int widthDiff = width - width_1;
                int heightDiff = height - height_1;
//                if(x < 0){
//                    x = widthDiff / 2;
//                }else if(x > widthDiff){
//                    x = widthDiff;
//                }
//                if(y < 0){
//                    y = heightDiff / 2;
//                }else if(y > heightDiff){
//                    y = heightDiff;
//                }
                g.drawImage(waterImage, widthDiff, heightDiff, width_1, height_1, null); // 水印文件结束
                g.dispose();
                ImageIO.write(bufferedImage, "jpg", file);
            } catch (IOException e) {
                e.printStackTrace();
            }
    }
    /**
     * 获取字符长度，一个汉字作为 1 个字符, 一个英文字母作为 0.5 个字符
     * @param text
     * @return 字符长度，如：text="中国",返回 2；text="test",返回 2；text="中国ABC",返回 4.
*/
    public static int getLength(String text) {
        int textLength = text.length();
        int length = textLength;
        for (int i = 0; i < textLength; i++) {
            if (String.valueOf(text.charAt(i)).getBytes().length > 1) {
                length++;
            }
        }
        return (length % 2 == 0) ? length / 2 : length / 2 + 1;
    }
}