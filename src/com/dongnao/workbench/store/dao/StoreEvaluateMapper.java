package com.dongnao.workbench.store.dao;

import java.util.List;
import com.dongnao.workbench.store.model.StoreEvaluate;
/**
 * 描述：店铺评价模块dao接口，提供数据库操作方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface StoreEvaluateMapper  {

	/**
	 * 新增店铺评价方法
	 * @param storeEvaluate StoreEvaluate:实体类
	 */
	void add(StoreEvaluate storeEvaluate);
	
	/**
	 * 删除店铺评价方法
	 * @param key String:多个由“，”分割开的id字符串
	 */
	void deleteByKey(String key);
	
	/**
	 * 根据主键查找店铺评价实体方法
	 * @param key String：实体主键（查询条件）
	 * @return StoreEvaluate: 实体
	 */
	public StoreEvaluate getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找店铺评价列表方法
	 * @param StoreEvaluate storeEvaluate：实体对象（查询条件）
	 * @return List<StoreEvaluate>: 实体对象的list
	 */
	public List<StoreEvaluate>  listByCondition(StoreEvaluate storeEvaluate);
	
	/**
	 * 修改店铺评价方法
	 * @param storeEvaluate StoreEvaluate：实体对象
	 */	
	public void update(StoreEvaluate storeEvaluate);
}