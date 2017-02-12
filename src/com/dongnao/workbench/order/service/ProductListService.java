package com.dongnao.workbench.order.service;

import java.util.List;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.order.model.ProductList;

/**
 * 描述：订单产品详细模块service接口，提供controller操作所需方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface ProductListService  {

	/**
	 * 新增订单产品详细方法
	 * @param productList ProductList:实体类
	 */
	public ResultMessage add(ProductList productList);
	
	/**
	 * 删除订单产品详细方法
	 * @param key:多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key);
	
	/**
	 * 根据主键查找订单产品详细实体方法
	 * @param key String：实体主键
	 * @return productList ProductList 实体对象
	 */
	public ProductList getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找订单产品详细列表方法
	 * @param productList ProductList 实体对象（查询条件）
	 * @return: 实体对象的list
	 */
	public List<ProductList> listByCondition(ProductList productList);
	
	/**
	 * 修改订单产品详细方法
	 * @param productList ProductList 实体对象
	 */	
	public ResultMessage update(ProductList productList);
}