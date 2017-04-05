package com.dongnao.workbench.finance.service;
import javax.annotation.Resource;
import java.util.List;
import com.dongnao.workbench.finance.dao.AccountCheckMapper;
import com.dongnao.workbench.finance.model.AccountCheck;
import com.dongnao.workbench.finance.model.AccountOperateIncome;
import com.dongnao.workbench.finance.model.AccountOrderDetail;
import com.dongnao.workbench.finance.service.AccountCheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
 
/**
 * 描述：财务对账模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2017-02-23
 */
@Service("accountCheckService")
public class AccountCheckServiceImpl implements AccountCheckService{
    @Resource
	private AccountCheckMapper accountCheckMapper;
	/**
	 * 修改财务对账方法
	 * @param accountCheck AccountCheck 实体对象
	 */	
	public ResultMessage updateTotal(AccountCheck accountCheck){
		accountCheckMapper.updateTotal(accountCheck);
		return AjaxUtils.getSuccessMessage();
	}
	/**
	 * 根据订单计算出财务数据合计
	 */
	public List<AccountOperateIncome> listTotalAccountCheck(AccountOrderDetail accountOrderDetail) {
		return accountCheckMapper.listTotalAccountCheck(accountOrderDetail);
	}
	public List<AccountOperateIncome> listDetailAccountCheckByBoundMerchant(AccountOrderDetail accountOrderDetail) {
		return accountCheckMapper.listDetailAccountCheckByBoundMerchant(accountOrderDetail);
	}
	public List<AccountOperateIncome> listDetailAccountCheckByBoundCompany(AccountOrderDetail accountOrderDetail) {
		return accountCheckMapper.listDetailAccountCheckByBoundCompany(accountOrderDetail);
	}

}