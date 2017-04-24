package com.dongnao.workbench.store.dao;

import java.util.ArrayList;
import java.util.List;
import com.dongnao.workbench.store.model.Store;
/**
 * 描述：店铺模块dao接口，提供数据库操作方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface StoreMapper  {

	/**
	 * 新增店铺方法
	 * @param store Store:实体类
	 */
	void add(Store store);
	
	/**
	 * 删除店铺方法
	 * @param key String:多个由“，”分割开的id字符串
	 */
	void deleteByKey(String key);
	
	/**
	 * 根据主键查找店铺实体方法
	 * @param key String：实体主键（查询条件）
	 * @return Store: 实体
	 */
	public Store getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找店铺列表方法
	 * @param Store store：实体对象（查询条件）
	 * @return List<Store>: 实体对象的list
	 */
	public List<Store>  listByCondition(Store store);
	
	/**
	 * 修改店铺方法
	 * @param store Store：实体对象
	 */	
	public void update(Store store);

	public void updateImg(Store store);
	/**
	 * 批量新增店铺
	 * @param storeList
	 * @return
	 */
	public int addStores(ArrayList<Store> storeList);
}