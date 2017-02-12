package com.dongnao.workbench.store.service;
import javax.annotation.Resource;
import java.util.List;
import com.dongnao.workbench.store.dao.StoreHealthMapper;
import com.dongnao.workbench.store.model.StoreHealth;
import com.dongnao.workbench.store.service.StoreHealthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
 
/**
 * 描述：店铺健康率模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
@Service("storeHealthService")
public class StoreHealthServiceImpl implements StoreHealthService{
        @Resource
	private StoreHealthMapper storeHealthMapper;
	
 
	/**
	 * 新增店铺健康率方法
	 * @param storeHealth:实体类
	 */	
	public ResultMessage add(StoreHealth storeHealth){
		storeHealthMapper.add(storeHealth);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 根据主键查找店铺健康率实体方法
	 * @param key String 实体主键
	 * @return StoreHealth 实体对象
	 */
	public StoreHealth getByPrimaryKey(String key){
		return storeHealthMapper.getByPrimaryKey(key);
	}
	
	/**
	 * 删除店铺健康率方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key){
		storeHealthMapper.deleteByKey(key);
	}
	
	/**
	 * 根据条件查找店铺健康率列表方法
	 * @param storeHealth StoreHealth 实体对象（查询条件）
	 * @return List<StoreHealth> 实体对象的list
	 */
	public List<StoreHealth> listByCondition(StoreHealth storeHealth){
		return storeHealthMapper.listByCondition(storeHealth);
	}
	
	/**
	 * 修改店铺健康率方法
	 * @param storeHealth StoreHealth 实体对象
	 */	
	public ResultMessage update(StoreHealth storeHealth){
		storeHealthMapper.update(storeHealth);
		return AjaxUtils.getSuccessMessage();
	}
}