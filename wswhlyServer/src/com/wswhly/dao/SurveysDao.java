package com.wswhly.dao;

import com.wswhly.bean.survey.SurveyInfoReqBean;



public interface SurveysDao {
	public boolean addInfo(SurveyInfoReqBean info) throws Exception;
	public int querySurveyByUseridCount(SurveyInfoReqBean info) throws Exception;
}
