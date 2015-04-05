package com.hyzm.admin.control;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.admin.service.job.JobService;

@Controller
@RequestMapping("/job")
public class JobControl {
	
	@Autowired
	private JobService jobService;
	
	@RequestMapping("/getjoblist")
	public void getJobList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = jobService.getJobList();
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}

}
