package com.dongnao.workbench.nation.service;

import java.util.List;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.nation.model.Nation;

/**
 * 描述：民族模块service接口，提供controller操作所需方法
 *
 * @author maggie
 * @version 1.0 2016-07-17
 */
public interface NationService  {

	/**
	 * 新增民族方法
	 * @param nation Nation:实体类
	 */
	public ResultMessage add(Nation nation);
	
	/**
	 * 删除民族方法
	 * @param key:多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key);
	
	/**
	 * 根据主键查找民族实体方法
	 * @param key String：实体主键
	 * @return nation Nation 实体对象
	 */
	public Nation getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找民族列表方法
	 * @param nation Nation 实体对象（查询条件）
	 * @return: 实体对象的list
	 */
	public List<Nation> listByCondition(Nation nation);
	
	/**
	 * 修改民族方法
	 * @param nation Nation 实体对象
	 */	
	public ResultMessage update(Nation nation);
	
	/**
	 * 获取所有民族方法
	 */
	public List<Nation> getAllNation();
}