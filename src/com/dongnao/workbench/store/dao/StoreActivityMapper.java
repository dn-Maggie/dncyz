package com.dongnao.workbench.store.dao;

import java.util.List;
import com.dongnao.workbench.store.model.StoreActivity;
/**
 * 描述：店铺活动模块dao接口，提供数据库操作方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface StoreActivityMapper  {

	/**
	 * 新增店铺活动方法
	 * @param storeActivity StoreActivity:实体类
	 */
	void add(StoreActivity storeActivity);
	
	/**
	 * 删除店铺活动方法
	 * @param key String:多个由“，”分割开的id字符串
	 */
	void deleteByKey(String key);
	
	/**
	 * 根据主键查找店铺活动实体方法
	 * @param key String：实体主键（查询条件）
	 * @return StoreActivity: 实体
	 */
	public StoreActivity getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找店铺活动列表方法
	 * @param StoreActivity storeActivity：实体对象（查询条件）
	 * @return List<StoreActivity>: 实体对象的list
	 */
	public List<StoreActivity>  listByCondition(StoreActivity storeActivity);
	
	/**
	 * 修改店铺活动方法
	 * @param storeActivity StoreActivity：实体对象
	 */	
	public void update(StoreActivity storeActivity);
}