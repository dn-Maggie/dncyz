package com.dongnao.workbench.store.service;
import javax.annotation.Resource;
import java.util.List;
import com.dongnao.workbench.store.dao.StorePlatformRelMapper;
import com.dongnao.workbench.store.model.StorePlatformRel;
import com.dongnao.workbench.store.service.StorePlatformRelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
 
/**
 * 描述：商铺外卖平台关系模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
@Service("storePlatformRelService")
public class StorePlatformRelServiceImpl implements StorePlatformRelService{
        @Resource
	private StorePlatformRelMapper storePlatformRelMapper;
	
 
	/**
	 * 新增商铺外卖平台关系方法
	 * @param storePlatformRel:实体类
	 */	
	public ResultMessage add(StorePlatformRel storePlatformRel){
		storePlatformRelMapper.add(storePlatformRel);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 根据主键查找商铺外卖平台关系实体方法
	 * @param key String 实体主键
	 * @return StorePlatformRel 实体对象
	 */
	public StorePlatformRel getByPrimaryKey(String key){
		return storePlatformRelMapper.getByPrimaryKey(key);
	}
	
	/**
	 * 删除商铺外卖平台关系方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key){
		storePlatformRelMapper.deleteByKey(key);
	}
	
	/**
	 * 根据条件查找商铺外卖平台关系列表方法
	 * @param storePlatformRel StorePlatformRel 实体对象（查询条件）
	 * @return List<StorePlatformRel> 实体对象的list
	 */
	public List<StorePlatformRel> listByCondition(StorePlatformRel storePlatformRel){
		return storePlatformRelMapper.listByCondition(storePlatformRel);
	}
	
	/**
	 * 修改商铺外卖平台关系方法
	 * @param storePlatformRel StorePlatformRel 实体对象
	 */	
	public ResultMessage update(StorePlatformRel storePlatformRel){
		storePlatformRelMapper.update(storePlatformRel);
		return AjaxUtils.getSuccessMessage();
	}
}