package com.dongnao.workbench.finance.service;
import javax.annotation.Resource;
import java.util.List;
import com.dongnao.workbench.finance.dao.OperaDateMapper;
import com.dongnao.workbench.finance.model.AccountOrderDetail;
import com.dongnao.workbench.finance.model.OperaDate;
import com.dongnao.workbench.finance.service.OperaDateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
 
/**
 * 描述：运营日明细模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2017-03-28
 */
@Service("operaDateService")
public class OperaDateServiceImpl implements OperaDateService{
        @Resource
	private OperaDateMapper operaDateMapper;
	
 
	/**
	 * 新增运营日明细方法
	 * @param operaDate:实体类
	 */	
	public ResultMessage add(OperaDate operaDate){
		operaDateMapper.add(operaDate);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 根据主键查找运营日明细实体方法
	 * @param key String 实体主键
	 * @return OperaDate 实体对象
	 */
	public OperaDate getByPrimaryKey(String key){
		return operaDateMapper.getByPrimaryKey(key);
	}
	
	/**
	 * 删除运营日明细方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key){
		operaDateMapper.deleteByKey(key);
	}
	
	/**
	 * 根据条件查找运营日明细列表方法
	 * @param operaDate OperaDate 实体对象（查询条件）
	 * @return List<OperaDate> 实体对象的list
	 */
	public List<OperaDate> listByCondition(OperaDate operaDate){
		return operaDateMapper.listByCondition(operaDate);
	}
	
	/**
	 * 修改运营日明细方法
	 * @param operaDate OperaDate 实体对象
	 */	
	public ResultMessage update(OperaDate operaDate){
		operaDateMapper.update(operaDate);
		return AjaxUtils.getSuccessMessage();
	}


	public void deleteBasePriceByOrderDetail(AccountOrderDetail accountOrderDetail) {
		operaDateMapper.deleteBasePriceByOrderDetail(accountOrderDetail);
		
	}
	public void addBasePriceByOrderDetail(AccountOrderDetail accountOrderDetail) {
		operaDateMapper.addBasePriceByOrderDetail(accountOrderDetail);
	}

	public void deleteDeepOperaByOrderDetail(AccountOrderDetail accountOrderDetail) {
		operaDateMapper.deleteDeepOperaByOrderDetail(accountOrderDetail);
	}
	public void addDeepOperaByOrderDetail(AccountOrderDetail accountOrderDetail) {
		operaDateMapper.addDeepOperaByOrderDetail(accountOrderDetail);		
	}

	public void deleteSaleRateByOrderDetail(AccountOrderDetail accountOrderDetail) {
		operaDateMapper.deleteSaleRateByOrderDetail(accountOrderDetail);		
	}
	public void addSaleRateByOrderDetail(AccountOrderDetail accountOrderDetail) {
		operaDateMapper.addSaleRateByOrderDetail(accountOrderDetail);
		
	}

	public void deletePlatformAccountByOrderDetail(AccountOrderDetail accountOrderDetail) {
		operaDateMapper.deletePlatformAccountByOrderDetail(accountOrderDetail);
		
	}
	public void addPlatformAccountByOrderDetail(AccountOrderDetail accountOrderDetail) {
		operaDateMapper.addPlatformAccountByOrderDetail(accountOrderDetail);
		
	}
}