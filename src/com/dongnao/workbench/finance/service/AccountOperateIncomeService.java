package com.dongnao.workbench.finance.service;

import java.util.ArrayList;
import java.util.List;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.finance.model.AccountOperateIncome;

/**
 * 描述：运营数据模块service接口，提供controller操作所需方法
 *
 * @author maggie
 * @version 1.0 2017-03-05
 */
public interface AccountOperateIncomeService  {

	/**
	 * 新增运营数据方法
	 * @param accountOperateIncome AccountOperateIncome:实体类
	 */
	public ResultMessage add(AccountOperateIncome accountOperateIncome);
	
	/**
	 * 删除运营数据方法
	 * @param key:多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key);
	
	/**
	 * 根据主键查找运营数据实体方法
	 * @param key String：实体主键
	 * @return accountOperateIncome AccountOperateIncome 实体对象
	 */
	public AccountOperateIncome getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找运营数据列表方法
	 * @param accountOperateIncome AccountOperateIncome 实体对象（查询条件）
	 * @return: 实体对象的list
	 */
	public List<AccountOperateIncome> listByCondition(AccountOperateIncome accountOperateIncome);
	
	/**
	 * 修改运营数据方法
	 * @param accountOperateIncome AccountOperateIncome 实体对象
	 */	
	public ResultMessage update(AccountOperateIncome accountOperateIncome);
	/**
	 * 批量插入运营详细方法
	 */
	public int addOperaDetail(ArrayList<AccountOperateIncome> operateIncomeList);
}