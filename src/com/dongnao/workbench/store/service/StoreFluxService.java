package com.dongnao.workbench.store.service;

import java.util.List;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.store.model.StoreFlux;

/**
 * 描述：店铺流量模块service接口，提供controller操作所需方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface StoreFluxService  {

	/**
	 * 新增店铺流量方法
	 * @param storeFlux StoreFlux:实体类
	 */
	public ResultMessage add(StoreFlux storeFlux);
	
	/**
	 * 删除店铺流量方法
	 * @param key:多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key);
	
	/**
	 * 根据主键查找店铺流量实体方法
	 * @param key String：实体主键
	 * @return storeFlux StoreFlux 实体对象
	 */
	public StoreFlux getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找店铺流量列表方法
	 * @param storeFlux StoreFlux 实体对象（查询条件）
	 * @return: 实体对象的list
	 */
	public List<StoreFlux> listByCondition(StoreFlux storeFlux);
	
	/**
	 * 修改店铺流量方法
	 * @param storeFlux StoreFlux 实体对象
	 */	
	public ResultMessage update(StoreFlux storeFlux);
}