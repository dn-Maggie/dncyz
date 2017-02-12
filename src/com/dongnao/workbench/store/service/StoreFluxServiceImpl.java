package com.dongnao.workbench.store.service;
import javax.annotation.Resource;
import java.util.List;
import com.dongnao.workbench.store.dao.StoreFluxMapper;
import com.dongnao.workbench.store.model.StoreFlux;
import com.dongnao.workbench.store.service.StoreFluxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
 
/**
 * 描述：店铺流量模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
@Service("storeFluxService")
public class StoreFluxServiceImpl implements StoreFluxService{
        @Resource
	private StoreFluxMapper storeFluxMapper;
	
 
	/**
	 * 新增店铺流量方法
	 * @param storeFlux:实体类
	 */	
	public ResultMessage add(StoreFlux storeFlux){
		storeFluxMapper.add(storeFlux);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 根据主键查找店铺流量实体方法
	 * @param key String 实体主键
	 * @return StoreFlux 实体对象
	 */
	public StoreFlux getByPrimaryKey(String key){
		return storeFluxMapper.getByPrimaryKey(key);
	}
	
	/**
	 * 删除店铺流量方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key){
		storeFluxMapper.deleteByKey(key);
	}
	
	/**
	 * 根据条件查找店铺流量列表方法
	 * @param storeFlux StoreFlux 实体对象（查询条件）
	 * @return List<StoreFlux> 实体对象的list
	 */
	public List<StoreFlux> listByCondition(StoreFlux storeFlux){
		return storeFluxMapper.listByCondition(storeFlux);
	}
	
	/**
	 * 修改店铺流量方法
	 * @param storeFlux StoreFlux 实体对象
	 */	
	public ResultMessage update(StoreFlux storeFlux){
		storeFluxMapper.update(storeFlux);
		return AjaxUtils.getSuccessMessage();
	}
}