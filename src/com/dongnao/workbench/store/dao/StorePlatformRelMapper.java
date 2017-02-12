package com.dongnao.workbench.store.dao;

import java.util.List;
import com.dongnao.workbench.store.model.StorePlatformRel;
/**
 * 描述：商铺外卖平台关系模块dao接口，提供数据库操作方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface StorePlatformRelMapper  {

	/**
	 * 新增商铺外卖平台关系方法
	 * @param storePlatformRel StorePlatformRel:实体类
	 */
	void add(StorePlatformRel storePlatformRel);
	
	/**
	 * 删除商铺外卖平台关系方法
	 * @param key String:多个由“，”分割开的id字符串
	 */
	void deleteByKey(String key);
	
	/**
	 * 根据主键查找商铺外卖平台关系实体方法
	 * @param key String：实体主键（查询条件）
	 * @return StorePlatformRel: 实体
	 */
	public StorePlatformRel getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找商铺外卖平台关系列表方法
	 * @param StorePlatformRel storePlatformRel：实体对象（查询条件）
	 * @return List<StorePlatformRel>: 实体对象的list
	 */
	public List<StorePlatformRel>  listByCondition(StorePlatformRel storePlatformRel);
	
	/**
	 * 修改商铺外卖平台关系方法
	 * @param storePlatformRel StorePlatformRel：实体对象
	 */	
	public void update(StorePlatformRel storePlatformRel);
}