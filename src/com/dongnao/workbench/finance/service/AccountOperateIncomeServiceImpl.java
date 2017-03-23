package com.dongnao.workbench.finance.service;
import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.List;
import com.dongnao.workbench.finance.dao.AccountOperateIncomeMapper;
import com.dongnao.workbench.finance.model.AccountOperateIncome;
import com.dongnao.workbench.finance.model.AccountOrderDetail;
import com.dongnao.workbench.finance.model.TotalOperateIncome;
import com.dongnao.workbench.finance.service.AccountOperateIncomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
 
/**
 * 描述：运营数据模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2017-03-05
 */
@Service("accountOperateIncomeService")
public class AccountOperateIncomeServiceImpl implements AccountOperateIncomeService{
        @Resource
	private AccountOperateIncomeMapper accountOperateIncomeMapper;
	
 
	/**
	 * 新增运营数据方法
	 * @param accountOperateIncome:实体类
	 */	
	public ResultMessage add(AccountOperateIncome accountOperateIncome){
		accountOperateIncomeMapper.add(accountOperateIncome);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 根据主键查找运营数据实体方法
	 * @param key String 实体主键
	 * @return AccountOperateIncome 实体对象
	 */
	public AccountOperateIncome getByPrimaryKey(String key){
		return accountOperateIncomeMapper.getByPrimaryKey(key);
	}
	
	/**
	 * 删除运营数据方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key){
		accountOperateIncomeMapper.deleteByKey(key);
	}
	
	/**
	 * 根据条件查找运营数据列表方法
	 * @param accountOperateIncome AccountOperateIncome 实体对象（查询条件）
	 * @return List<AccountOperateIncome> 实体对象的list
	 */
	public List<AccountOperateIncome> listByCondition(AccountOperateIncome accountOperateIncome){
		return accountOperateIncomeMapper.listByCondition(accountOperateIncome);
	}
	
	/**
	 * 修改运营数据方法
	 * @param accountOperateIncome AccountOperateIncome 实体对象
	 */	
	public ResultMessage update(AccountOperateIncome accountOperateIncome){
		accountOperateIncomeMapper.update(accountOperateIncome);
		return AjaxUtils.getSuccessMessage();
	}
	/**
	 * 批量插入运营详细方法
	 */
	public int addOperaDetail(ArrayList<AccountOperateIncome> operateIncomeList) {
		return accountOperateIncomeMapper.addOperaDetail(operateIncomeList);
	}
	
	/**
	 * 根据订单详细表得到运营数据方法
	 */
	public List<AccountOperateIncome> listByConditionFromOrderDetail(AccountOrderDetail accountOrderDetail) {
		return accountOperateIncomeMapper.listByConditionFromOrderDetail(accountOrderDetail);
	}
	/**
	 * 根据订单计算出运营数据合计
	 */
	public List<TotalOperateIncome> listAllFromOrderDetailByDate(AccountOrderDetail accountOrderDetail) {
		return accountOperateIncomeMapper.listAllFromOrderDetailByDate(accountOrderDetail);
	}
	/**
	 * 根据订单计算出运营数据合计(店铺合计)
	 */
	public List<TotalOperateIncome> listAllFromOrderDetailByTotal(AccountOrderDetail accountOrderDetail) {
		return accountOperateIncomeMapper.listAllFromOrderDetailByTotal(accountOrderDetail);
	}
	
}