package com.dongnao.workbench.store.service;

import java.util.List;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.store.model.StoreHealth;

/**
 * 描述：店铺健康率模块service接口，提供controller操作所需方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface StoreHealthService  {

	/**
	 * 新增店铺健康率方法
	 * @param storeHealth StoreHealth:实体类
	 */
	public ResultMessage add(StoreHealth storeHealth);
	
	/**
	 * 删除店铺健康率方法
	 * @param key:多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key);
	
	/**
	 * 根据主键查找店铺健康率实体方法
	 * @param key String：实体主键
	 * @return storeHealth StoreHealth 实体对象
	 */
	public StoreHealth getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找店铺健康率列表方法
	 * @param storeHealth StoreHealth 实体对象（查询条件）
	 * @return: 实体对象的list
	 */
	public List<StoreHealth> listByCondition(StoreHealth storeHealth);
	
	/**
	 * 修改店铺健康率方法
	 * @param storeHealth StoreHealth 实体对象
	 */	
	public ResultMessage update(StoreHealth storeHealth);
}