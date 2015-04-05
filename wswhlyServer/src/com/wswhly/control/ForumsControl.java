package com.wswhly.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.wswhly.bean.forums.ForumsInfoReqBean;
import com.wswhly.bean.forums.ForumsListReqBean;
import com.wswhly.bean.forums.ForumsListRespBean;
import com.wswhly.dao.ForumsDao;
import com.wswhly.util.StringUtil;

@Controller
@Transactional
public class ForumsControl {

	private static final Logger logger = Logger.getLogger(ForumsControl.class);

	@Autowired
	private ForumsDao forumsDao;

	/**
	 * 评论
	 */
	@RequestMapping("/ForumsInfo")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public void ForumsInfo(HttpServletRequest request,
			HttpServletResponse response) {
		ForumsInfoReqBean forumsInfoReqBean = (new Gson()).fromJson(request
				.getAttribute("data").toString(), ForumsInfoReqBean.class);
		try {
			int count = forumsDao.addForumsInfo(forumsInfoReqBean);
			request.setAttribute("resultjson", StringUtil.Success((new Gson()).toJson(count)));
		} catch (Exception e) {
			logger.error("ForumsInfo Exception" + e.getMessage());
			request
					.setAttribute("resultjson", StringUtil
							.Error("9999", "未知错误"));
		}
	}

	/**
	 * 获取评论列表
	 */
	@RequestMapping("/ForumsList")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public void FlagshopList(HttpServletRequest request,
			HttpServletResponse response) {
		ForumsListReqBean forumsreq = (new Gson()).fromJson(request
				.getAttribute("data").toString(), ForumsListReqBean.class);
		ForumsListRespBean forumsListRespBean = new ForumsListRespBean();
		try {
			if(forumsreq.getType() == null || forumsreq.getType().equals(""))
				forumsreq.setType("1");
			List<ForumsListRespBean.Forums> list = forumsDao
					.queryForums(forumsreq.getCollectionid(),Integer.valueOf(forumsreq.getType()));
			if (list.size() > 0) {
				forumsListRespBean.setList(list);
			}
			request.setAttribute("resultjson", StringUtil.Success((new Gson())
					.toJson(forumsListRespBean)));
		} catch (Exception e) {
			logger.error("FlagshopList Exception" + e.getMessage());
			request.setAttribute("resultjson", StringUtil
							.Error("9999", "未知错误"));
		}
	}

	/**
	 * 点赞
	 */
	@RequestMapping("/updateForumsList")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public void updateForumsList(HttpServletRequest request,
			HttpServletResponse response) {
		ForumsInfoReqBean forumsInfoReqBean = (new Gson()).fromJson(request
				.getAttribute("data").toString(), ForumsInfoReqBean.class);
		try {
			if (forumsInfoReqBean.getLikenum() != null
					&& !forumsInfoReqBean.getLikenum().equals("")) {
				if (forumsDao.updateForumLikeNum(forumsInfoReqBean.getId(),
						forumsInfoReqBean.getLikenum())) {
					request.setAttribute("resultjson", StringUtil.Success(""));
					return;
				}
			}
		} catch (Exception e) {
			logger.error("updateForumsList Exception" + e.getMessage());
			request.setAttribute("resultjson", StringUtil.Error("9999", "未知错误"));
		}
	}

}
