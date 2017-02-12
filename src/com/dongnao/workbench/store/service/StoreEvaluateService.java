package com.dongnao.workbench.store.service;

import java.util.List;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.store.model.StoreEvaluate;

/**
 * 描述：店铺评价模块service接口，提供controller操作所需方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface StoreEvaluateService  {

	/**
	 * 新增店铺评价方法
	 * @param storeEvaluate StoreEvaluate:实体类
	 */
	public ResultMessage add(StoreEvaluate storeEvaluate);
	
	/**
	 * 删除店铺评价方法
	 * @param key:多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key);
	
	/**
	 * 根据主键查找店铺评价实体方法
	 * @param key String：实体主键
	 * @return storeEvaluate StoreEvaluate 实体对象
	 */
	public StoreEvaluate getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找店铺评价列表方法
	 * @param storeEvaluate StoreEvaluate 实体对象（查询条件）
	 * @return: 实体对象的list
	 */
	public List<StoreEvaluate> listByCondition(StoreEvaluate storeEvaluate);
	
	/**
	 * 修改店铺评价方法
	 * @param storeEvaluate StoreEvaluate 实体对象
	 */	
	public ResultMessage update(StoreEvaluate storeEvaluate);
}