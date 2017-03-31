package com.dongnao.workbench.finance.service;

import java.util.List;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.finance.model.AccountOrderDetail;
import com.dongnao.workbench.finance.model.OperaDate;

/**
 * 描述：运营日明细模块service接口，提供controller操作所需方法
 *
 * @author maggie
 * @version 1.0 2017-03-28
 */
public interface OperaDateService  {

	/**
	 * 根据订单明细新增运营日明细方法
	 * @param operaDate OperaDate:实体类
	 */
	public ResultMessage add(OperaDate operaDate);
	public void addBasePriceByOrderDetail(AccountOrderDetail accountOrderDetail);
	public void addDeepOperaByOrderDetail(AccountOrderDetail accountOrderDetail);
	public void addSaleRateByOrderDetail(AccountOrderDetail accountOrderDetail);
	public void addPlatformAccountByOrderDetail(AccountOrderDetail accountOrderDetail);
	/**
	 * 删除运营日明细方法
	 * @param key:多个由“，”分割开的id字符串
	 */
	public void deleteBasePriceByOrderDetail(AccountOrderDetail accountOrderDetail);
	public void deleteDeepOperaByOrderDetail(AccountOrderDetail accountOrderDetail);
	public void deleteSaleRateByOrderDetail(AccountOrderDetail accountOrderDetail);
	public void deletePlatformAccountByOrderDetail(AccountOrderDetail accountOrderDetail);

	/**
	 * 根据主键查找运营日明细实体方法
	 * @param key String：实体主键
	 * @return operaDate OperaDate 实体对象
	 */
	public OperaDate getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找运营日明细列表方法
	 * @param operaDate OperaDate 实体对象（查询条件）
	 * @return: 实体对象的list
	 */
	public List<OperaDate> listBasePriceByCondition(OperaDate operaDate);
	public List<OperaDate> listDeepOperaByCondition(OperaDate operaDate);
	public List<OperaDate> listSaleRateByCondition(OperaDate operaDate);
	public List<OperaDate> listPlatformAccountByCondition(OperaDate operaDate);
	/**
	 * 修改运营日明细方法
	 * @param operaDate OperaDate 实体对象
	 */	
	public ResultMessage updateBasePrice(OperaDate operaDate);
	public ResultMessage updateDeepOpera(OperaDate operaDate);
	public ResultMessage updateSaleRate(OperaDate operaDate);
	public ResultMessage updatePlatformAccount(OperaDate operaDate);

	

}