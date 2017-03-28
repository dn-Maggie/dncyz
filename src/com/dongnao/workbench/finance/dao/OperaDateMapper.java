package com.dongnao.workbench.finance.dao;

import java.util.List;
import com.dongnao.workbench.finance.model.OperaDate;
/**
 * 描述：运营日明细模块dao接口，提供数据库操作方法
 *
 * @author maggie
 * @version 1.0 2017-03-28
 */
public interface OperaDateMapper  {

	/**
	 * 新增运营日明细方法
	 * @param operaDate OperaDate:实体类
	 */
	void add(OperaDate operaDate);
	
	/**
	 * 删除运营日明细方法
	 * @param key String:多个由“，”分割开的id字符串
	 */
	void deleteByKey(String key);
	
	/**
	 * 根据主键查找运营日明细实体方法
	 * @param key String：实体主键（查询条件）
	 * @return OperaDate: 实体
	 */
	public OperaDate getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找运营日明细列表方法
	 * @param OperaDate operaDate：实体对象（查询条件）
	 * @return List<OperaDate>: 实体对象的list
	 */
	public List<OperaDate>  listByCondition(OperaDate operaDate);
	
	/**
	 * 修改运营日明细方法
	 * @param operaDate OperaDate：实体对象
	 */	
	public void update(OperaDate operaDate);
}