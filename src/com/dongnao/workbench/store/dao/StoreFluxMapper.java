package com.dongnao.workbench.store.dao;

import java.util.List;
import com.dongnao.workbench.store.model.StoreFlux;
/**
 * 描述：店铺流量模块dao接口，提供数据库操作方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface StoreFluxMapper  {

	/**
	 * 新增店铺流量方法
	 * @param storeFlux StoreFlux:实体类
	 */
	void add(StoreFlux storeFlux);
	
	/**
	 * 删除店铺流量方法
	 * @param key String:多个由“，”分割开的id字符串
	 */
	void deleteByKey(String key);
	
	/**
	 * 根据主键查找店铺流量实体方法
	 * @param key String：实体主键（查询条件）
	 * @return StoreFlux: 实体
	 */
	public StoreFlux getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找店铺流量列表方法
	 * @param StoreFlux storeFlux：实体对象（查询条件）
	 * @return List<StoreFlux>: 实体对象的list
	 */
	public List<StoreFlux>  listByCondition(StoreFlux storeFlux);
	
	/**
	 * 修改店铺流量方法
	 * @param storeFlux StoreFlux：实体对象
	 */	
	public void update(StoreFlux storeFlux);
}