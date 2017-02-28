package com.dongnao.workbench.store.service;
import javax.annotation.Resource;
import java.util.List;
import com.dongnao.workbench.store.dao.StoreMapper;
import com.dongnao.workbench.store.model.Store;
import com.dongnao.workbench.store.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
 
/**
 * 描述：店铺模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
@Service("storeService")
public class StoreServiceImpl implements StoreService{
        @Resource
	private StoreMapper storeMapper;
	
 
	/**
	 * 新增店铺方法
	 * @param store:实体类
	 */	
	public ResultMessage add(Store store){
		storeMapper.add(store);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 根据主键查找店铺实体方法
	 * @param key String 实体主键
	 * @return Store 实体对象
	 */
	public Store getByPrimaryKey(String key){
		return storeMapper.getByPrimaryKey(key);
	}
	
	/**
	 * 删除店铺方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key){
		storeMapper.deleteByKey(key);
	}
	
	/**
	 * 根据条件查找店铺列表方法
	 * @param store Store 实体对象（查询条件）
	 * @return List<Store> 实体对象的list
	 */
	public List<Store> listByCondition(Store store){
		return storeMapper.listByCondition(store);
	}
	
	/**
	 * 修改店铺方法
	 * @param store Store 实体对象
	 */	
	public ResultMessage update(Store store){
		storeMapper.update(store);
		return AjaxUtils.getSuccessMessage();
	}

	@Override
	public ResultMessage updateImg(Store store) {
		storeMapper.updateImg(store);
		return AjaxUtils.getSuccessMessage();
	}
}