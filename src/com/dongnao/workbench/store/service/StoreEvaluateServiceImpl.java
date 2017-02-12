package com.dongnao.workbench.store.service;
import javax.annotation.Resource;
import java.util.List;
import com.dongnao.workbench.store.dao.StoreEvaluateMapper;
import com.dongnao.workbench.store.model.StoreEvaluate;
import com.dongnao.workbench.store.service.StoreEvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
 
/**
 * 描述：店铺评价模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
@Service("storeEvaluateService")
public class StoreEvaluateServiceImpl implements StoreEvaluateService{
        @Resource
	private StoreEvaluateMapper storeEvaluateMapper;
	
 
	/**
	 * 新增店铺评价方法
	 * @param storeEvaluate:实体类
	 */	
	public ResultMessage add(StoreEvaluate storeEvaluate){
		storeEvaluateMapper.add(storeEvaluate);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 根据主键查找店铺评价实体方法
	 * @param key String 实体主键
	 * @return StoreEvaluate 实体对象
	 */
	public StoreEvaluate getByPrimaryKey(String key){
		return storeEvaluateMapper.getByPrimaryKey(key);
	}
	
	/**
	 * 删除店铺评价方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key){
		storeEvaluateMapper.deleteByKey(key);
	}
	
	/**
	 * 根据条件查找店铺评价列表方法
	 * @param storeEvaluate StoreEvaluate 实体对象（查询条件）
	 * @return List<StoreEvaluate> 实体对象的list
	 */
	public List<StoreEvaluate> listByCondition(StoreEvaluate storeEvaluate){
		return storeEvaluateMapper.listByCondition(storeEvaluate);
	}
	
	/**
	 * 修改店铺评价方法
	 * @param storeEvaluate StoreEvaluate 实体对象
	 */	
	public ResultMessage update(StoreEvaluate storeEvaluate){
		storeEvaluateMapper.update(storeEvaluate);
		return AjaxUtils.getSuccessMessage();
	}
}