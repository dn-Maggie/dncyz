package com.dongnao.workbench.finance.service;
import javax.annotation.Resource;
import java.util.List;
import com.dongnao.workbench.finance.dao.AccountOperaTotalMapper;
import com.dongnao.workbench.finance.model.AccountOperaTotal;
import com.dongnao.workbench.finance.service.AccountOperaTotalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
 
/**
 * 描述：运营合计模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2017-03-26
 */
@Service("accountOperaTotalService")
public class AccountOperaTotalServiceImpl implements AccountOperaTotalService{
        @Resource
	private AccountOperaTotalMapper accountOperaTotalMapper;
	
 
	/**
	 * 新增运营合计方法
	 * @param accountOperaTotal:实体类
	 */	
	public ResultMessage add(AccountOperaTotal accountOperaTotal){
		accountOperaTotalMapper.add(accountOperaTotal);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 根据主键查找运营合计实体方法
	 * @param key String 实体主键
	 * @return AccountOperaTotal 实体对象
	 */
	public AccountOperaTotal getByPrimaryKey(String key){
		return accountOperaTotalMapper.getByPrimaryKey(key);
	}
	
	/**
	 * 删除运营合计方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteByKey(AccountOperaTotal accountOperaTotal){
		accountOperaTotalMapper.deleteByKey(accountOperaTotal);
	}
	/**
	 * 删除运营合计方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteTotalByKey(AccountOperaTotal accountOperaTotal){
		accountOperaTotalMapper.deleteTotalByKey(accountOperaTotal);
	}
	/**
	 * 根据条件查找运营合计列表方法
	 * @param accountOperaTotal AccountOperaTotal 实体对象（查询条件）
	 * @return List<AccountOperaTotal> 实体对象的list
	 */
	public List<AccountOperaTotal> listByTotal(AccountOperaTotal accountOperaTotal){
		return accountOperaTotalMapper.listByTotal(accountOperaTotal);
	}
	/**
	 * 根据条件查找运营合计列表方法
	 * @param accountOperaTotal AccountOperaTotal 实体对象（查询条件）
	 * @return List<AccountOperaTotal> 实体对象的list
	 */
	public List<AccountOperaTotal> listByDate(AccountOperaTotal accountOperaTotal){
		return accountOperaTotalMapper.listByDate(accountOperaTotal);
	}
	/**
	 * 修改运营合计方法
	 * @param accountOperaTotal AccountOperaTotal 实体对象
	 */	
	public ResultMessage update(AccountOperaTotal accountOperaTotal){
		accountOperaTotalMapper.update(accountOperaTotal);
		return AjaxUtils.getSuccessMessage();
	}
	/**
	 * 修改运营合计方法
	 * @param accountOperaTotal AccountOperaTotal 实体对象
	 */	
	public ResultMessage updateTotal(AccountOperaTotal accountOperaTotal){
		accountOperaTotalMapper.updateTotal(accountOperaTotal);
		return AjaxUtils.getSuccessMessage();
	}
	/**
	 * 批量新增运营合计方法
	 */	
	public int addByOperaDetail(AccountOperaTotal accountOperaTotal){
		return accountOperaTotalMapper.addByOperaDetail(accountOperaTotal);
	};
	/**
	 * 批量新增运营合计方法
	 * @return 
	 */	
	public int addTotalByOperaDetail(AccountOperaTotal accountOperaTotal){
		return accountOperaTotalMapper.addTotalByOperaDetail(accountOperaTotal);
	}

	public int addTotalByOperaDate(AccountOperaTotal accountOperaTotal) {
		return accountOperaTotalMapper.addTotalByOperaDate(accountOperaTotal);
	};
}