package com.dongnao.workbench.order.service;

import java.util.List;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.order.model.Order;

/**
 * 描述：订单模块service接口，提供controller操作所需方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface OrderService  {

	/**
	 * 新增订单方法
	 * @param order Order:实体类
	 */
	public ResultMessage add(Order order);
	
	/**
	 * 删除订单方法
	 * @param key:多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key);
	
	/**
	 * 根据主键查找订单实体方法
	 * @param key String：实体主键
	 * @return order Order 实体对象
	 */
	public Order getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找订单列表方法
	 * @param order Order 实体对象（查询条件）
	 * @return: 实体对象的list
	 */
	public List<Order> listByCondition(Order order);
	
	/**
	 * 修改订单方法
	 * @param order Order 实体对象
	 */	
	public ResultMessage update(Order order);
}