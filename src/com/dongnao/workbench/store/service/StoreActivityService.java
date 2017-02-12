package com.dongnao.workbench.store.service;

import java.util.List;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.store.model.StoreActivity;

/**
 * 描述：店铺活动模块service接口，提供controller操作所需方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface StoreActivityService  {

	/**
	 * 新增店铺活动方法
	 * @param storeActivity StoreActivity:实体类
	 */
	public ResultMessage add(StoreActivity storeActivity);
	
	/**
	 * 删除店铺活动方法
	 * @param key:多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key);
	
	/**
	 * 根据主键查找店铺活动实体方法
	 * @param key String：实体主键
	 * @return storeActivity StoreActivity 实体对象
	 */
	public StoreActivity getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找店铺活动列表方法
	 * @param storeActivity StoreActivity 实体对象（查询条件）
	 * @return: 实体对象的list
	 */
	public List<StoreActivity> listByCondition(StoreActivity storeActivity);
	
	/**
	 * 修改店铺活动方法
	 * @param storeActivity StoreActivity 实体对象
	 */	
	public ResultMessage update(StoreActivity storeActivity);
}