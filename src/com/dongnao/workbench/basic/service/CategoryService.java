package com.dongnao.workbench.basic.service;

import java.util.List;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.basic.model.Category;

/**
 * 描述：品类模块service接口，提供controller操作所需方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface CategoryService  {

	/**
	 * 新增品类方法
	 * @param category Category:实体类
	 */
	public ResultMessage add(Category category);
	
	/**
	 * 删除品类方法
	 * @param key:多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key);
	
	/**
	 * 根据主键查找品类实体方法
	 * @param key String：实体主键
	 * @return category Category 实体对象
	 */
	public Category getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找品类列表方法
	 * @param category Category 实体对象（查询条件）
	 * @return: 实体对象的list
	 */
	public List<Category> listByCondition(Category category);
	
	/**
	 * 修改品类方法
	 * @param category Category 实体对象
	 */	
	public ResultMessage update(Category category);
}