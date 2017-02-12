package com.dongnao.workbench.store.service;

import java.util.List;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.store.model.Store;

/**
 * 描述：店铺模块service接口，提供controller操作所需方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface StoreService  {

	/**
	 * 新增店铺方法
	 * @param store Store:实体类
	 */
	public ResultMessage add(Store store);
	
	/**
	 * 删除店铺方法
	 * @param key:多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key);
	
	/**
	 * 根据主键查找店铺实体方法
	 * @param key String：实体主键
	 * @return store Store 实体对象
	 */
	public Store getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找店铺列表方法
	 * @param store Store 实体对象（查询条件）
	 * @return: 实体对象的list
	 */
	public List<Store> listByCondition(Store store);
	
	/**
	 * 修改店铺方法
	 * @param store Store 实体对象
	 */	
	public ResultMessage update(Store store);
}