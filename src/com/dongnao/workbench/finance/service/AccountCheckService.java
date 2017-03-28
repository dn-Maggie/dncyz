package com.dongnao.workbench.finance.service;

import java.util.List;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.finance.model.AccountCheck;
import com.dongnao.workbench.finance.model.AccountOperateIncome;
import com.dongnao.workbench.finance.model.AccountOrderDetail;

/**
 * 描述：财务对账模块service接口，提供controller操作所需方法
 *
 * @author maggie
 * @version 1.0 2017-02-23
 */
public interface AccountCheckService  {

	/**
	 * 新增财务对账方法
	 * @param accountCheck AccountCheck:实体类
	 */
	public ResultMessage add(AccountCheck accountCheck);
	
	/**
	 * 删除财务对账方法
	 * @param key:多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key);
	
	/**
	 * 根据主键查找财务对账实体方法
	 * @param key String：实体主键
	 * @return accountCheck AccountCheck 实体对象
	 */
	public AccountCheck getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找财务对账列表方法
	 * @param accountCheck AccountCheck 实体对象（查询条件）
	 * @return: 实体对象的list
	 */
	public List<AccountCheck> listByCondition(AccountCheck accountCheck);
	
	/**
	 * 修改财务对账方法
	 * @param accountCheck AccountCheck 实体对象
	 */	
	public ResultMessage update(AccountCheck accountCheck);

	/**
	 * 根据订单计算出财务数据详细
	 */
	public List<AccountOperateIncome> listDetailAccountCheck(AccountOrderDetail accountOrderDetail) ;
	/**
	 * 根据订单计算出财务数据合计
	 */
	public List<AccountOperateIncome> listTotalAccountCheck(AccountOrderDetail accountOrderDetail) ;

	
	public void deleteDateByKey(AccountCheck accountCheck);

	public void addByCheckDetail(AccountCheck accountCheck);

	public void deleteTotalByKey(AccountCheck accountCheck);

	public void addTotalByCheckDetail(AccountCheck accountCheck);
}