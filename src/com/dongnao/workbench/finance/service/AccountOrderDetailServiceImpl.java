package com.dongnao.workbench.finance.service;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
import com.dongnao.workbench.finance.dao.AccountCheckMapper;
import com.dongnao.workbench.finance.dao.AccountOrderDetailMapper;
import com.dongnao.workbench.finance.model.AccountOrderDetail;
import com.dongnao.workbench.finance.model.AccountSaleGoods;
 
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
	 * 修改自配送实际支付金额方法
	 * @param accountOrderDetail AccountOrderDetail 实体对象
	 */	
	public ResultMessage updateActualDistCharge(AccountOrderDetail accountOrderDetail){
		accountOrderDetailMapper.updateActualDistCharge(accountOrderDetail);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 批量插入订单详细方法
	 */
	public int addOrderDetail(List<AccountOrderDetail> orderDetailList) {
		return accountOrderDetailMapper.addOrderDetail(orderDetailList);
	}
	/**
	 * 根据订单计算出菜品数量表
	 */
	public List<AccountSaleGoods> listGoods(AccountOrderDetail accountOrderDetail) {
		return accountOrderDetailMapper.listGoods(accountOrderDetail);
	}
}