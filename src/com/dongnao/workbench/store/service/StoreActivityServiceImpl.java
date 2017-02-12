package com.dongnao.workbench.store.service;
import javax.annotation.Resource;
import java.util.List;
import com.dongnao.workbench.store.dao.StoreActivityMapper;
import com.dongnao.workbench.store.model.StoreActivity;
import com.dongnao.workbench.store.service.StoreActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
 
/**
 * 描述：店铺活动模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
@Service("storeActivityService")
public class StoreActivityServiceImpl implements StoreActivityService{
        @Resource
	private StoreActivityMapper storeActivityMapper;
	
 
	/**
	 * 新增店铺活动方法
	 * @param storeActivity:实体类
	 */	
	public ResultMessage add(StoreActivity storeActivity){
		storeActivityMapper.add(storeActivity);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 根据主键查找店铺活动实体方法
	 * @param key String 实体主键
	 * @return StoreActivity 实体对象
	 */
	public StoreActivity getByPrimaryKey(String key){
		return storeActivityMapper.getByPrimaryKey(key);
	}
	
	/**
	 * 删除店铺活动方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key){
		storeActivityMapper.deleteByKey(key);
	}
	
	/**
	 * 根据条件查找店铺活动列表方法
	 * @param storeActivity StoreActivity 实体对象（查询条件）
	 * @return List<StoreActivity> 实体对象的list
	 */
	public List<StoreActivity> listByCondition(StoreActivity storeActivity){
		return storeActivityMapper.listByCondition(storeActivity);
	}
	
	/**
	 * 修改店铺活动方法
	 * @param storeActivity StoreActivity 实体对象
	 */	
	public ResultMessage update(StoreActivity storeActivity){
		storeActivityMapper.update(storeActivity);
		return AjaxUtils.getSuccessMessage();
	}
}