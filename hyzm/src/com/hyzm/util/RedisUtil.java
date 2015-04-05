package com.hyzm.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.swing.text.StyledEditorKit.BoldAction;


import redis.clients.jedis.Jedis;
/**
 * 2014年11月26日12:51:28
 * @author xjt
 *
 */
public  class RedisUtil {
	public static void main(String[] args)  {
		
//		Jedis redis=getRedis();
////		String aa="aaasfsadfasdfasdfjkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkaa";
		for(int i=1000;i<=2000000000;i++){
			try {
				set(i+"",i+"",60);
				System.out.println(get(i+""));;
			} catch (Exception e) {
				
			}
			
		}
////		redis.del("maxplist");
//		System.out.println(redis.get("a"));
//			test();
//		set("11","aa",60);
//		System.out.println(get("11"));;
	}
	public static void test() {
		try {
			for(int i=0;i<1000000;i++){
					Jedis redis=getRedis();
					SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
					redis.set("a"+i,""+i);
					System.out.println(sf.format(new Date())+"  :      "+redis.get("a"+i));
			}
		} catch (Exception e) {
			test();
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取redis连接
	 * @return
	 */
	private static Jedis getRedis(){
		String redisurl=PropertiesUtil.getPropertiesValue("redisurl");
		int redispost=Integer.valueOf(PropertiesUtil.getPropertiesValue("redispost"));
		Jedis jedis = new Jedis(redisurl,redispost);
		jedis.auth(PropertiesUtil.getPropertiesValue("redispass")); 
		return jedis;
	}
	
	/**
	 * 验证链接是否正常
	 * @return
	 */
	public static boolean checkConn(){
		try {
			set("test","test",1);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	/**
	 * 验证值是否存在
	 * @param key
	 * @return
	 */
	public static boolean checkVal(String key){
		try {
				String val=get(key);
				if(val!=null&&val!="null"&&val!=""){
					return true;
				}
			return false;
		} catch (Exception e) {
			return false;
		}
	}
	
	/**
	 * 关闭redis连接
	 */
	private static void closeRedis(Jedis jedis){
		if(jedis!=null){
			jedis.close();
		}
	}
	
	/**
	 * 缓存数据 设置超时 并持久化
	 * @param key
	 * @param value
	 * @param time_s 超时时间单位 秒
	 */
	public static boolean set(String key,Object val, int time_s){
		try {
			Jedis jedis=getRedis();//获取连接
			if(val instanceof  String||val instanceof  Integer||val instanceof  Double||val instanceof  Long ){
				jedis.set(key, String.valueOf(val));//保存值
			}else if(val instanceof  Map<?, ?>){
				jedis.hmset(key, (Map<String, String>) val);
			}else{
				jedis.set(key, String.valueOf(val));//保存值
			}
			if(time_s>0){//判断是否设置超时
				jedis.expire(key, time_s);
				jedis.save();
			}
			jedis.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	/**
	 * 缓存数据并进行持久化
	 * @param key
	 * @param value
	 * @param issave
	 */
	public static boolean set(String key,Object val,boolean issave){
		try {
			Jedis jedis=getRedis();//获取连接
			if(val instanceof  String){
				jedis.set(key, String.valueOf(val));//保存值
			}else if(val instanceof  Map<?, ?>){
				jedis.hmset(key, (Map<String, String>) val);
			}else{
				jedis.set(key, String.valueOf(val));//保存值
			}
			if(issave){//判断是否持久化
				jedis.save();
			}
			jedis.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	/**
	 * 获取字符串值
	 * @param key
	 * @return
	 */
	public static String get(String key){
		String val="";
		Jedis jedis=getRedis();//获取连接
		val=jedis.get(key);
		jedis.close();
		return val;
	}
	
	/**
	 * 获取map
	 * @param map_key  缓存中该map的标识
	 * @return
	 */
	public static Map<String, String> getMap(String map_key){
		Map<String, String> map=new HashMap<String,String>();
		Jedis jedis=getRedis();//获取连接
		  Iterator<String> iter=jedis.hkeys(map_key).iterator();  
	        while (iter.hasNext()){  
	            String key = iter.next();  
	            map.put(key, jedis.hget(map_key,key));
	        }  
		jedis.close();
		return map;
	}
	/**
	 * 删除缓存中的数据
	 * @param key
	 */
	public static void del(String[] key){
		Jedis jedis=getRedis();//获取连接
		jedis.del(key);
		jedis.close();
	}
	
	/**
	 * 判断是否存在
	 * @param key
	 * @return
	 */
	public static  boolean exists(String key){
		Jedis jedis=getRedis();//获取连接
		boolean tag= jedis.exists(key);
		jedis.close();
		return tag;
	}
}
