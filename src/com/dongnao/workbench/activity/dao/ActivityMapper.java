package com.dongnao.workbench.activity.dao;

import java.util.List;
import com.dongnao.workbench.activity.model.Activity;
/**
 * 描述：近期活动模块dao接口，提供数据库操作方法
 *
 * @author maggie
 * @version 1.0 2017-02-14
 */
public interface ActivityMapper  {

	/**
	 * 新增近期活动方法
	 * @param activity Activity:实体类
	 */
	void add(Activity activity);
	
	/**
	 * 删除近期活动方法
	 * @param key String:多个由“，”分割开的id字符串
	 */
	void deleteByKey(String key);
	
	/**
	 * 根据主键查找近期活动实体方法
	 * @param key String：实体主键（查询条件）
	 * @return Activity: 实体
	 */
	public Activity getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找近期活动列表方法
	 * @param Activity activity：实体对象（查询条件）
	 * @return List<Activity>: 实体对象的list
	 */
	public List<Activity>  listByCondition(Activity activity);
	
	/**
	 * 修改近期活动方法
	 * @param activity Activity：实体对象
	 */	
	public void update(Activity activity);
}