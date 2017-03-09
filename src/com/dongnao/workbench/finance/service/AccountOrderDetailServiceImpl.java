package com.dongnao.workbench.finance.service;
import javax.annotation.Resource;
import java.util.List;

import com.dongnao.workbench.finance.dao.AccountCheckMapper;
import com.dongnao.workbench.finance.dao.AccountOperateIncomeMapper;
import com.dongnao.workbench.finance.dao.AccountOrderDetailMapper;
import com.dongnao.workbench.finance.model.AccountOperateIncome;
import com.dongnao.workbench.finance.model.AccountOrderDetail;
import com.dongnao.workbench.finance.model.TotalOperateIncome;
import com.dongnao.workbench.finance.service.AccountOrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
 
/**
 * 描述：订单明细模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2017-03-02
 */
@Service("accountOrderDetailService")
public class AccountOrderDetailServiceImpl implements AccountOrderDetailService{
        @Resource
        private AccountOrderDetailMapper accountOrderDetailMapper;
        @Resource
    	private AccountOperateIncomeMapper accountOperateIncomeMapper;
        @Resource
    	private AccountCheckMapper accountCheckMapper;
	/**
	 * 新增订单明细方法
	 * @param accountOrderDetail:实体类
	 */	
	public ResultMessage add(AccountOrderDetail accountOrderDetail){
		accountOrderDetailMapper.add(accountOrderDetail);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 根据主键查找订单明细实体方法
	 * @param key String 实体主键
	 * @return AccountOrderDetail 实体对象
	 */
	public AccountOrderDetail getByPrimaryKey(String key){
		return accountOrderDetailMapper.getByPrimaryKey(key);
	}
	
	/**
	 * 删除订单明细方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key){
		accountOrderDetailMapper.deleteByKey(key);
	}
	
	/**
	 * 根据条件查找订单明细列表方法
	 * @param accountOrderDetail AccountOrderDetail 实体对象（查询条件）
	 * @return List<AccountOrderDetail> 实体对象的list
	 */
	public List<AccountOrderDetail> listByCondition(AccountOrderDetail accountOrderDetail){
		return accountOrderDetailMapper.listByCondition(accountOrderDetail);
	}
	
	/**
	 * 修改订单明细方法
	 * @param accountOrderDetail AccountOrderDetail 实体对象
	 */	
	public ResultMessage update(AccountOrderDetail accountOrderDetail){
		accountOrderDetailMapper.update(accountOrderDetail);
		return AjaxUtils.getSuccessMessage();
	}
	/**
	 * 批量插入订单详细方法
	 */
	@Override
	public int addOrderDetail(List<AccountOrderDetail> orderDetailList) {
		return accountOrderDetailMapper.addOrderDetail(orderDetailList);
	}
	/**
	 * 根据订单详细表得到运营数据方法
	 */
	@Override
	public List<AccountOperateIncome> listByConditionFromOrderDetail(AccountOrderDetail accountOrderDetail) {
		return accountOperateIncomeMapper.listByConditionFromOrderDetail(accountOrderDetail);
	}
	/**
	 * 根据订单计算出运营数据合计
	 */
	@Override
	public List<TotalOperateIncome> listAllFromOrderDetail(AccountOrderDetail accountOrderDetail) {
		return accountOperateIncomeMapper.listAllFromOrderDetail(accountOrderDetail);
	}
	/**
	 * 根据订单计算出财务数据详细
	 */
	@Override
	public List<AccountOperateIncome> listDetailAccountCheck(AccountOrderDetail accountOrderDetail) {
		return accountCheckMapper.listDetailAccountCheck(accountOrderDetail);
	}
	/**
	 * 根据订单计算出财务数据合计
	 */
	@Override
	public List<AccountOperateIncome> listTotalAccountCheck(AccountOrderDetail accountOrderDetail) {
		return accountCheckMapper.listTotalAccountCheck(accountOrderDetail);
	}
}