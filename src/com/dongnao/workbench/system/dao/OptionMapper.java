package com.dongnao.workbench.system.dao;

import java.util.List;
import com.dongnao.workbench.system.model.Option;
/**
 * 描述：功能操作模块dao接口，提供数据库操作方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface OptionMapper  {

	/**
	 * 新增功能操作方法
	 * @param option Option:实体类
	 */
	void add(Option option);
	
	/**
	 * 删除功能操作方法
	 * @param key String:多个由“，”分割开的id字符串
	 */
	void deleteByKey(String key);
	
	/**
	 * 根据主键查找功能操作实体方法
	 * @param key String：实体主键（查询条件）
	 * @return Option: 实体
	 */
	public Option getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找功能操作列表方法
	 * @param Option option：实体对象（查询条件）
	 * @return List<Option>: 实体对象的list
	 */
	public List<Option>  listByCondition(Option option);
	
	/**
	 * 修改功能操作方法
	 * @param option Option：实体对象
	 */	
	public void update(Option option);
}