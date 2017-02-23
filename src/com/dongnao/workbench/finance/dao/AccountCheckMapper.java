package com.dongnao.workbench.finance.dao;

import java.util.List;
import com.dongnao.workbench.finance.model.AccountCheck;
/**
 * 描述：财务对账模块dao接口，提供数据库操作方法
 *
 * @author maggie
 * @version 1.0 2017-02-23
 */
public interface AccountCheckMapper  {

	/**
	 * 新增财务对账方法
	 * @param accountCheck AccountCheck:实体类
	 */
	void add(AccountCheck accountCheck);
	
	/**
	 * 删除财务对账方法
	 * @param key String:多个由“，”分割开的id字符串
	 */
	void deleteByKey(String key);
	
	/**
	 * 根据主键查找财务对账实体方法
	 * @param key String：实体主键（查询条件）
	 * @return AccountCheck: 实体
	 */
	public AccountCheck getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找财务对账列表方法
	 * @param AccountCheck accountCheck：实体对象（查询条件）
	 * @return List<AccountCheck>: 实体对象的list
	 */
	public List<AccountCheck>  listByCondition(AccountCheck accountCheck);
	
	/**
	 * 修改财务对账方法
	 * @param accountCheck AccountCheck：实体对象
	 */	
	public void update(AccountCheck accountCheck);
}