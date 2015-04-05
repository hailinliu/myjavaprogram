package com.hyzm.admin.control;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.admin.service.character.CharacterService;

@Controller
@RequestMapping("/character")
public class CharacterControl {
	
	@Autowired
	private CharacterService characterService;
	
	@RequestMapping("/getcharacterlist")
	public void getCharacterList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String chinese = request.getParameter("chinese");
			String pinyin = request.getParameter("pinyin");
			String english = request.getParameter("english");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = characterService.getCharacterList(chinese, pinyin, english, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/addcharacter")
	public void addCharacter(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String chinese = request.getParameter("chinese");
			String pinyin = request.getParameter("pinyin");
			String english = request.getParameter("english");
			if (characterService.addCharacter(chinese, pinyin, english))
				out.print("0000");
			else
				out.print("添加字符失败！！！");
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/delcharacter")
	public void delCharacter(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String id = request.getParameter("id");
			if (characterService.delCharacter(Long.parseLong(id)))
				out.print("0000");
			else
				out.print("删除字符失败！！！");
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/updcharacter")
	public void updCharacter(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String id = request.getParameter("id");
			String chinese = request.getParameter("chinese");
			String pinyin = request.getParameter("pinyin");
			String english = request.getParameter("english");
			if (characterService.updCharacter(Long.parseLong(id), chinese, pinyin, english))
				out.print("0000");
			else
				out.print("修改字符失败！！！");
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}

}
