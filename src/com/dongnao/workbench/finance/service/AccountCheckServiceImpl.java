package com.dongnao.workbench.finance.service;
import javax.annotation.Resource;
import java.util.List;
import com.dongnao.workbench.finance.dao.AccountCheckMapper;
import com.dongnao.workbench.finance.model.AccountCheck;
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
	 * 新增财务对账方法
	 * @param accountCheck:实体类
	 */	
	public ResultMessage add(AccountCheck accountCheck){
		accountCheckMapper.add(accountCheck);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 根据主键查找财务对账实体方法
	 * @param key String 实体主键
	 * @return AccountCheck 实体对象
	 */
	public AccountCheck getByPrimaryKey(String key){
		return accountCheckMapper.getByPrimaryKey(key);
	}
	
	/**
	 * 删除财务对账方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key){
		accountCheckMapper.deleteByKey(key);
	}
	
	/**
	 * 根据条件查找财务对账列表方法
	 * @param accountCheck AccountCheck 实体对象（查询条件）
	 * @return List<AccountCheck> 实体对象的list
	 */
	public List<AccountCheck> listByCondition(AccountCheck accountCheck){
		return accountCheckMapper.listByCondition(accountCheck);
	}
	
	/**
	 * 修改财务对账方法
	 * @param accountCheck AccountCheck 实体对象
	 */	
	public ResultMessage update(AccountCheck accountCheck){
		accountCheckMapper.update(accountCheck);
		return AjaxUtils.getSuccessMessage();
	}
}