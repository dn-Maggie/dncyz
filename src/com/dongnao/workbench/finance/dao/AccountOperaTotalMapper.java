package com.dongnao.workbench.finance.dao;

import java.util.List;
import com.dongnao.workbench.finance.model.AccountOperaTotal;
import com.dongnao.workbench.finance.model.OperaDate;
/**
 * 描述：运营合计模块dao接口，提供数据库操作方法
 *
 * @author maggie
 * @version 1.0 2017-03-26
 */
public interface AccountOperaTotalMapper  {

	/**
	 * 新增运营合计方法
	 * @param accountOperaTotal AccountOperaTotal:实体类
	 */
	void add(AccountOperaTotal accountOperaTotal);
	void addSimpleTotalByOperaDate(OperaDate operaDate);
	void addDeepTotalByOperaDate(OperaDate operaDate);
	/**
	 * 删除运营合计方法
	 * @param accountOperaTotal String:多个由“，”分割开的id字符串
	 */
	void deleteByKey(AccountOperaTotal accountOperaTotal);
	void deleteSimpleTotalByOperaDate(OperaDate operaDate);
	void deleteDeepTotalByOperaDate(OperaDate operaDate);
	/**
	 * 根据主键查找运营合计实体方法
	 * @param key String：实体主键（查询条件）
	 * @return AccountOperaTotal: 实体
	 */
	public AccountOperaTotal getByPrimaryKey(String key);
	/**
	 * 根据条件查找运营汇总列表方法
	 * @param operaDate OperaDate 实体对象（查询条件）
	 * @return: 实体对象的list
	 */
	public List<AccountOperaTotal> listSimpleTotalByCondition(OperaDate operaDate);
	public List<AccountOperaTotal> listDeepTotalByCondition(OperaDate operaDate);
	
	/**
	 * 修改运营合计方法
	 * @param accountOperaTotal AccountOperaTotal：实体对象
	 */	
	/**
	 * 批量新增运营合计方法
	 * @return 
	 */	
	int addByOperaDetail(AccountOperaTotal accountOperaTotal);

	List<AccountOperaTotal> listDeepTotalByCondition(AccountOperaTotal accountOperaTotal);
	List<AccountOperaTotal> listSimpleTotalByCondition(AccountOperaTotal accountOperaTotal);
	void updateSimpleTotal(AccountOperaTotal accountOperaTotal);
	void updateDeepTotal(AccountOperaTotal accountOperaTotal);
	



}