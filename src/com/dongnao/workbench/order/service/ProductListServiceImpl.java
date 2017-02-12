package com.dongnao.workbench.order.service;
import javax.annotation.Resource;
import java.util.List;
import com.dongnao.workbench.order.dao.ProductListMapper;
import com.dongnao.workbench.order.model.ProductList;
import com.dongnao.workbench.order.service.ProductListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
 
/**
 * 描述：订单产品详细模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
@Service("productListService")
public class ProductListServiceImpl implements ProductListService{
        @Resource
	private ProductListMapper productListMapper;
	
 
	/**
	 * 新增订单产品详细方法
	 * @param productList:实体类
	 */	
	public ResultMessage add(ProductList productList){
		productListMapper.add(productList);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 根据主键查找订单产品详细实体方法
	 * @param key String 实体主键
	 * @return ProductList 实体对象
	 */
	public ProductList getByPrimaryKey(String key){
		return productListMapper.getByPrimaryKey(key);
	}
	
	/**
	 * 删除订单产品详细方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key){
		productListMapper.deleteByKey(key);
	}
	
	/**
	 * 根据条件查找订单产品详细列表方法
	 * @param productList ProductList 实体对象（查询条件）
	 * @return List<ProductList> 实体对象的list
	 */
	public List<ProductList> listByCondition(ProductList productList){
		return productListMapper.listByCondition(productList);
	}
	
	/**
	 * 修改订单产品详细方法
	 * @param productList ProductList 实体对象
	 */	
	public ResultMessage update(ProductList productList){
		productListMapper.update(productList);
		return AjaxUtils.getSuccessMessage();
	}
}