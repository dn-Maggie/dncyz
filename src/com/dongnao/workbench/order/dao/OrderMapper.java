package com.dongnao.workbench.order.dao;

import java.util.List;
import com.dongnao.workbench.order.model.Order;
/**
 * 描述：订单模块dao接口，提供数据库操作方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface OrderMapper  {

	/**
	 * 新增订单方法
	 * @param order Order:实体类
	 */
	void add(Order order);
	
	/**
	 * 删除订单方法
	 * @param key String:多个由“，”分割开的id字符串
	 */
	void deleteByKey(String key);
	
	/**
	 * 根据主键查找订单实体方法
	 * @param key String：实体主键（查询条件）
	 * @return Order: 实体
	 */
	public Order getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找订单列表方法
	 * @param Order order：实体对象（查询条件）
	 * @return List<Order>: 实体对象的list
	 */
	public List<Order>  listByCondition(Order order);
	
	/**
	 * 修改订单方法
	 * @param order Order：实体对象
	 */	
	public void update(Order order);
}