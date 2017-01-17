package com.dongnao.workbench.nation.dao;

import java.util.List;
import com.dongnao.workbench.nation.model.Nation;
/**
 * 描述：民族模块dao接口，提供数据库操作方法
 *
 * @author maggie
 * @version 1.0 2016-07-17
 */
public interface NationMapper  {

	/**
	 * 新增民族方法
	 * @param nation Nation:实体类
	 */
	void add(Nation nation);
	
	/**
	 * 删除民族方法
	 * @param key String:多个由“，”分割开的id字符串
	 */
	void deleteByKey(String key);
	
	/**
	 * 根据主键查找民族实体方法
	 * @param key String：实体主键（查询条件）
	 * @return Nation: 实体
	 */
	public Nation getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找民族列表方法
	 * @param Nation nation：实体对象（查询条件）
	 * @return List<Nation>: 实体对象的list
	 */
	public List<Nation>  listByCondition(Nation nation);
	
	/**
	 * 修改民族方法
	 * @param nation Nation：实体对象
	 */	
	public void update(Nation nation);
	
	/**
	 * 获取所有民族
	 */
	public List<Nation> getAllNation();
}