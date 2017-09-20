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
	 * 修改财务对账汇总方法
	 * @param accountCheck AccountCheck 实体对象
	 */	
	public ResultMessage updateTotal(AccountCheck accountCheck);
	/**
	 * 根据运营数据计算出财务数据
	 */
	public List<AccountOperateIncome> listDetailAccountCheckByBoundMerchant(AccountOrderDetail accountOrderDetail) ;
	public List<AccountOperateIncome> listDetailAccountCheckByBoundCompany(AccountOrderDetail accountOrderDetail) ;
	public List<AccountOperateIncome> listTotalAccountCheck(AccountOrderDetail accountOrderDetail);
}