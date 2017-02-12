package com.dongnao.workbench.order.service;
import javax.annotation.Resource;
import java.util.List;
import com.dongnao.workbench.order.dao.OrderMapper;
import com.dongnao.workbench.order.model.Order;
import com.dongnao.workbench.order.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
 
/**
 * 描述：订单模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
@Service("orderService")
public class OrderServiceImpl implements OrderService{
        @Resource
	private OrderMapper orderMapper;
	
 
	/**
	 * 新增订单方法
	 * @param order:实体类
	 */	
	public ResultMessage add(Order order){
		orderMapper.add(order);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 根据主键查找订单实体方法
	 * @param key String 实体主键
	 * @return Order 实体对象
	 */
	public Order getByPrimaryKey(String key){
		return orderMapper.getByPrimaryKey(key);
	}
	
	/**
	 * 删除订单方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key){
		orderMapper.deleteByKey(key);
	}
	
	/**
	 * 根据条件查找订单列表方法
	 * @param order Order 实体对象（查询条件）
	 * @return List<Order> 实体对象的list
	 */
	public List<Order> listByCondition(Order order){
		return orderMapper.listByCondition(order);
	}
	
	/**
	 * 修改订单方法
	 * @param order Order 实体对象
	 */	
	public ResultMessage update(Order order){
		orderMapper.update(order);
		return AjaxUtils.getSuccessMessage();
	}
}