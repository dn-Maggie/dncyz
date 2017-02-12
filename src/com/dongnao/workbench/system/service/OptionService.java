package com.dongnao.workbench.system.service;

import java.util.List;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.system.model.Option;

/**
 * 描述：功能操作模块service接口，提供controller操作所需方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface OptionService  {

	/**
	 * 新增功能操作方法
	 * @param option Option:实体类
	 */
	public ResultMessage add(Option option);
	
	/**
	 * 删除功能操作方法
	 * @param key:多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key);
	
	/**
	 * 根据主键查找功能操作实体方法
	 * @param key String：实体主键
	 * @return option Option 实体对象
	 */
	public Option getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找功能操作列表方法
	 * @param option Option 实体对象（查询条件）
	 * @return: 实体对象的list
	 */
	public List<Option> listByCondition(Option option);
	
	/**
	 * 修改功能操作方法
	 * @param option Option 实体对象
	 */	
	public ResultMessage update(Option option);
}