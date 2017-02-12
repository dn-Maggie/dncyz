package com.dongnao.workbench.store.dao;

import java.util.List;
import com.dongnao.workbench.store.model.StoreHealth;
/**
 * 描述：店铺健康率模块dao接口，提供数据库操作方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface StoreHealthMapper  {

	/**
	 * 新增店铺健康率方法
	 * @param storeHealth StoreHealth:实体类
	 */
	void add(StoreHealth storeHealth);
	
	/**
	 * 删除店铺健康率方法
	 * @param key String:多个由“，”分割开的id字符串
	 */
	void deleteByKey(String key);
	
	/**
	 * 根据主键查找店铺健康率实体方法
	 * @param key String：实体主键（查询条件）
	 * @return StoreHealth: 实体
	 */
	public StoreHealth getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找店铺健康率列表方法
	 * @param StoreHealth storeHealth：实体对象（查询条件）
	 * @return List<StoreHealth>: 实体对象的list
	 */
	public List<StoreHealth>  listByCondition(StoreHealth storeHealth);
	
	/**
	 * 修改店铺健康率方法
	 * @param storeHealth StoreHealth：实体对象
	 */	
	public void update(StoreHealth storeHealth);
}