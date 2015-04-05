package com.wswhly.dao.impl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wswhly.bean.survey.SurveyInfoReqBean;
import com.wswhly.dao.SurveysDao;

@Repository
public class SurveysDaoImpl implements SurveysDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final String addSurveyinfo = "insert into t_survey_info(userid,username,birth,collectage,channel,organization,service,target,browse,isjoin,isload,price,ispush,suggest,time,hopeorganization,collection1,collection2,likeoption,realname)"
			+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?,?,?,?)";
	@Override
	public boolean addInfo(final SurveyInfoReqBean info) throws Exception {
		int i = jdbcTemplate.update(addSurveyinfo,new Object[]{info.getUserid(), info.getUsername(), info.getBirth(), info.getCollectage(), info.getChannel(), info.getOrganization(), info.getService(), info.getTarget(), info.getBrowse(), info.getIsjoin(), info.getIsload(), info.getPrice(), info.getIspush(), info.getSuggest(), info.getHopeorganization(), info.getCollection1(), info.getCollection2(), info.getLikeoption(),info.getRealname()});
		if(i>0)return true;else return false;
	}
	private final String querySurveyCount = "select count(*) from t_survey_info where userid = ?";
	public int querySurveyByUseridCount(final SurveyInfoReqBean info) throws SQLException{
		System.out.println("userid:"+info.getUserid());
		return jdbcTemplate.queryForInt(querySurveyCount,new Object[]{info.getUserid()});
	}
}
