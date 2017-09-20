package com.dongnao.workbench.system.service;
import javax.annotation.Resource;
import java.util.List;
import com.dongnao.workbench.system.dao.OptionMapper;
import com.dongnao.workbench.system.model.Option;
import com.dongnao.workbench.system.service.OptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
 
/**
 * 描述：功能操作模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
@Service("optionService")
public class OptionServiceImpl implements OptionService{
        @Resource
	private OptionMapper optionMapper;
	
 
	/**
	 * 新增功能操作方法
	 * @param option:实体类
	 */	
	public ResultMessage add(Option option){
		optionMapper.add(option);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 根据主键查找功能操作实体方法
	 * @param key String 实体主键
	 * @return Option 实体对象
	 */
	public Option getByPrimaryKey(String key){
		return optionMapper.getByPrimaryKey(key);
	}
	
	/**
	 * 删除功能操作方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key){
		optionMapper.deleteByKey(key);
	}
	
	/**
	 * 根据条件查找功能操作列表方法
	 * @param option Option 实体对象（查询条件）
	 * @return List<Option> 实体对象的list
	 */
	public List<Option> listByCondition(Option option){
		return optionMapper.listByCondition(option);
	}
	
	/**
	 * 修改功能操作方法
	 * @param option Option 实体对象
	 */	
	public ResultMessage update(Option option){
		optionMapper.update(option);
		return AjaxUtils.getSuccessMessage();
	}
}