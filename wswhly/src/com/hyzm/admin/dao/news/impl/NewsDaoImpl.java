package com.hyzm.admin.dao.news.impl;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.news.NewsDao;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

@Repository
public class NewsDaoImpl implements NewsDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private Object HttpClient;
	
   

	public List<Map<String, Object>> getNewsList(int type, String id,String title, Date begindate,
			Date enddate, String recommend, String style, String state,String flagshopbaseinfoid, int currentPage,
			int pageSize) throws Exception {
		String getNewsList = "select n.*,f.name as flagshopbaseinfoname, t.style as stylename from t_news n left join t_newstype t on n.style = t.id left join t_flagshopbaseinfo f on n.flagshopbaseinfoid=f.id  where n.type = ? and n.id like ? and n.title like ? and n.createdate >= ? and n.createdate <= ? and n.recommend like ? and t.style like ? and n.state like ? ";
		if(flagshopbaseinfoid!=null&&flagshopbaseinfoid!=""){
			getNewsList+=" and n.flagshopbaseinfoid="+flagshopbaseinfoid;
		}
		getNewsList+=" order by n.id desc limit ?, ?";
		try {
			return jdbcTemplate.queryForList(getNewsList, new Object[]{type, "%"+id+"%", "%"+title+"%", begindate, enddate, "%"+recommend+"%", "%"+style+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取新闻列表异常："+e.getMessage());
		}
	}
	
	private final static String getShoolInfo = "select n.* from t_news n where n.type = 2 and n.title like ? and n.createdate >= ? and n.createdate <= ? and n.recommend like ? and n.state like ? order by n.id desc limit ?, ?";
	
	public List<Map<String, Object>> getNewsList(String title, Date begindate, Date enddate, String recommend, String state, int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getShoolInfo, new Object[]{"%"+title+"%", begindate, enddate, "%"+recommend+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取收藏学院列表异常："+e.getMessage());
		}
	}
	
	private final static String getBulletinList = "select n.* from t_news n where n.type = 3 and n.title like ? and n.createdate >= ? and n.createdate <= ? and n.state like ? order by n.id desc limit ?, ?";

	public List<Map<String, Object>> getBulletinList(String title, Date begindate, Date enddate, String state, int currentPage,
			int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getBulletinList, new Object[]{"%"+title+"%", begindate, enddate, "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取公告列表异常："+e.getMessage());
		}
	}
	

	public long getNewsListNum(int type,String id, String title, Date begindate, Date enddate,
			String recommend, String style, String state,String flagshopbaseinfoid) throws Exception {
		String getNewsListNum = "select count(n.id) from t_news n left join t_newstype t on n.style = t.id where n.type = ? and n.id like ?  and n.title like ? and n.createdate >= ? and n.createdate <= ? and n.recommend like ? and t.style like ? and n.state like ?";
		if(flagshopbaseinfoid!=null&&flagshopbaseinfoid!=""){
			getNewsListNum+=" and n.flagshopbaseinfoid="+flagshopbaseinfoid;
		}
		try {
			return jdbcTemplate.queryForLong(getNewsListNum, new Object[]{type, "%"+id+"%","%"+title+"%", begindate, enddate, "%"+recommend+"%", "%"+style+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取新闻数量异常："+e.getMessage());
		}
	}
	
	private final static String getShoolInfoNum = "select count(n.id) from t_news n where n.type = 2 and n.title like ? and n.createdate >= ? and n.createdate <= ? and n.recommend like ? and n.state like ?";
	
	public long getNewsListNum(String title, Date begindate, Date enddate, String recommend, String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getShoolInfoNum, new Object[]{"%"+title+"%", begindate, enddate, "%"+recommend+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取收藏学院数量异常："+e.getMessage());
		}
	}
	
	private final static String getBulletinListNum = "select count(n.id) from t_news n where n.type = 3 and n.title like ? and n.createdate >= ? and n.createdate <= ? and n.state like ?";

	public long getBulletinListNum(String title, Date begindate, Date enddate, String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getBulletinListNum, new Object[]{"%"+title+"%", begindate, enddate, "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取公告数量异常："+e.getMessage());
		}
	}
	
	private final static String addNews = "insert into t_news (type, title, label, content, createdate, style,flagshopbaseinfoid,imgurltitle) values (?,?,?,?,now(),?,?,?)";

	public boolean addNews(final int type, final String title, final String label,final  String content,final  int style,final String flagshopbaseinfoid,final String imgurltitle)
			throws Exception {
		try {
			int i =0;
			
			
			KeyHolder keyHolder = new GeneratedKeyHolder();
	        
			jdbcTemplate.update(
	                new PreparedStatementCreator(){
						public PreparedStatement createPreparedStatement(
								java.sql.Connection conn) throws SQLException {
							  int i = 0;
		                        java.sql.PreparedStatement ps = conn.prepareStatement(addNews); 
		                         
		                        ps = conn.prepareStatement(addNews, Statement.RETURN_GENERATED_KEYS);
		                        ps.setInt(++i,type);
		                        ps.setString(++i, title);
		                        ps.setString(++i, label);
		                        ps.setString(++i,content);
		                        ps.setInt(++i,style);
		                        ps.setString(++i,flagshopbaseinfoid);
		                        ps.setString(++i, imgurltitle);
		                        return ps;
						}
	                },
	                keyHolder);
	        i=keyHolder.getKey().intValue();
	    
			if (i > 0){
				//添加成功之后生成伪静态换成
				HttpClient httpc = new DefaultHttpClient();  
		        // 创建Get方法实例     
		        HttpGet httpgets = new HttpGet("http://www.wswhly.com/news/getOneNews?id=" +i); 
		        httpc.execute(httpgets);
				return true;
			}
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加新闻异常："+e.getMessage());
		}
	}
	
	private final static String delNews = "update t_news set state = 2 where id = ?";

	public boolean delNews(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(delNews, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除新闻异常："+e.getMessage());
		}
	}
	
	private final static String updNews = "update t_news set title = ?, state=?, label = ?, content = ?, style = ?,flagshopbaseinfoid=? ,imgurltitle=? ,createdate=? where id = ?";

	public boolean updNews(long id, String title,int state , String label, String content, int style,String flagshopbaseinfoid,String imgurltitle,String createdate)
			throws Exception {
		try {
			int i = jdbcTemplate.update(updNews, new Object[]{title,state, label, content, style,flagshopbaseinfoid,imgurltitle,createdate, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改新闻异常："+e.getMessage());
		}
	}
	
	private final static String getNewsById = "select * from t_news where id = ?";

	public Map<String, Object> getNewsById(long id) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getNewsById, new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException("获取新闻异常："+e.getMessage());
		}
	}
	
	private final static String setRecommend = "update t_news set recommend = ? where id = ?";

	public boolean setRecommend(long id, int style) throws Exception {
		try {
			int i = jdbcTemplate.update(setRecommend, new Object[]{style, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("设置推荐新闻异常："+e.getMessage());
		}
	}
	
	private final static String autoTitle = "select title, createdate from t_news where type like ? and recommend like ?";

	public List<Map<String, Object>> autoTitle(String type, String recommend) throws Exception {
		try {
			return jdbcTemplate.queryForList(autoTitle, new Object[]{"%"+type+"%","%"+recommend+"%"});
		} catch (Exception e) {
			throw new RuntimeException("自动补全新闻标题异常："+e.getMessage());
		}
	}
	
	private final static String getNewsListTd = "select n.* from t_news n where n.title like ? and n.createdate >= ? and n.createdate <= ? and n.recommend = 1 and n.state = 1 limit ?, ?";

	public List<Map<String, Object>> getNewsListTd(String title,
			Date begindate, Date enddate,
			int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getNewsListTd, new Object[]{"%"+title+"%", begindate, enddate, (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取最新/推荐/热点新闻列表异常："+e.getMessage());
		}
	}
	
	private final static String getNewsListTdNum = "select count(id) from t_news where title like ? and createdate >= ? and createdate <= ? and recommend = 1 and state = 1";

	public long getNewsListTdNum(String title, Date begindate, Date enddate) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getNewsListTdNum, new Object[]{"%"+title+"%", begindate, enddate});
		} catch (Exception e) {
			throw new RuntimeException("获取最新/推荐/热点新闻数量异常："+e.getMessage());
		}
	}
	
	private final static String getNewsTypeList = "select * from t_newstype where state = 1 and parentid = ? order by id limit ?, ?";

	public List<Map<String, Object>> getNewsTypeList(int style,
			int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getNewsTypeList, new Object[]{style, (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取新闻子类列表异常："+e.getMessage());
		}
	}
	
	private final static String getNewsTypeListNum = "select count(id) from t_newstype where state = 1 and parentid = ?";

	public long getNewsTypeListNum(int style) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getNewsTypeListNum, new Object[]{style});
		} catch (Exception e) {
			throw new RuntimeException("获取新闻子类数量异常："+e.getMessage());
		}
	}
	
	private final static String addType = "insert into t_newstype (style, parentid, state) values (?,?,1)";

	public boolean addType(String style, int parentid) throws Exception {
		try {
			int i = jdbcTemplate.update(addType, new Object[]{style, parentid});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加新闻子类型异常："+e.getMessage());
		}
	}
	
	private final static String delType = "update t_newstype set state = 2 where id = ?";

	public boolean delType(int id) throws Exception {
		try {
			int i = jdbcTemplate.update(delType, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除新闻子类型异常："+e.getMessage());
		}
	}
	
	private final static String updType = "update t_newstype set style = ? where id = ?";

	public boolean updType(int id, String style) throws Exception {
		try {
			int i = jdbcTemplate.update(updType, new Object[]{style, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改新闻子类型异常："+e.getMessage());
		}
	}
	
	private final static String autoType = "select id, style from t_newstype where state = 1 and parentid = ?";

	public List<Map<String, Object>> autoType(int style) throws Exception {
		try {
			return jdbcTemplate.queryForList(autoType, new Object[]{style});
		} catch (Exception e) {
			throw new RuntimeException("获取新闻子类型下拉列表异常："+e.getMessage());
		}
	}


	private final static String delNewlist = "DELETE from t_news where id= ?";

	public boolean delNewlist(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(delNewlist, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除新闻异常："+e.getMessage());
		}
	}
	private final static String getNewsinfo= "INSERT INTO t_news (title,state,content,label,createdate,style)VALUES(?,3,?,?,now(),105)";
	private final static String selecttNewsinfo = "select count(title) from t_news where title= ?";
	public boolean getNewsinfo(String title,String content,String label) throws Exception {
		try {
			int  k=jdbcTemplate.queryForInt(selecttNewsinfo, new Object[]{title});
			if(k>0){  
				return true;	
			}else{
				int i = jdbcTemplate.update(getNewsinfo, new Object[]{title,content,label});
				if (i > 0)
					return true;	
			}
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("抓取信息异常："+e.getMessage());
		}
	}
}
