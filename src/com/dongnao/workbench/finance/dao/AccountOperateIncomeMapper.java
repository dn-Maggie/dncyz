package com.dongnao.workbench.finance.dao;

import java.util.List;
import com.dongnao.workbench.finance.model.AccountOperateIncome;
/**
 * 描述：运营数据模块dao接口，提供数据库操作方法
 *
 * @author maggie
 * @version 1.0 2017-03-05
 */
public interface AccountOperateIncomeMapper  {

	/**
	 * 新增运营数据方法
	 * @param accountOperateIncome AccountOperateIncome:实体类
	 */
	void add(AccountOperateIncome accountOperateIncome);
	
	/**
	 * 删除运营数据方法
	 * @param key String:多个由“，”分割开的id字符串
	 */
	void deleteByKey(String key);
	
	/**
	 * 根据主键查找运营数据实体方法
	 * @param key String：实体主键（查询条件）
	 * @return AccountOperateIncome: 实体
	 */
	public AccountOperateIncome getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找运营数据列表方法
	 * @param AccountOperateIncome accountOperateIncome：实体对象（查询条件）
	 * @return List<AccountOperateIncome>: 实体对象的list
	 */
	public List<AccountOperateIncome>  listByCondition(AccountOperateIncome accountOperateIncome);
	
	/**
	 * 修改运营数据方法
	 * @param accountOperateIncome AccountOperateIncome：实体对象
	 */	
	public void update(AccountOperateIncome accountOperateIncome);
}