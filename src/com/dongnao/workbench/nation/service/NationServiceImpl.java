package com.dongnao.workbench.nation.service;
import javax.annotation.Resource;
import java.util.List;
import com.dongnao.workbench.nation.dao.NationMapper;
import com.dongnao.workbench.nation.model.Nation;
import com.dongnao.workbench.nation.service.NationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
 
/**
 * 描述：民族模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2016-07-17
 */
@Service("nationService")
public class NationServiceImpl implements NationService{
        @Resource
	private NationMapper nationMapper;
	
 
	/**
	 * 新增民族方法
	 * @param nation:实体类
	 */	
	public ResultMessage add(Nation nation){
		nationMapper.add(nation);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 根据主键查找民族实体方法
	 * @param key String 实体主键
	 * @return Nation 实体对象
	 */
	public Nation getByPrimaryKey(String key){
		return nationMapper.getByPrimaryKey(key);
	}
	
	/**
	 * 删除民族方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key){
		nationMapper.deleteByKey(key);
	}
	
	/**
	 * 根据条件查找民族列表方法
	 * @param nation Nation 实体对象（查询条件）
	 * @return List<Nation> 实体对象的list
	 */
	public List<Nation> listByCondition(Nation nation){
		return nationMapper.listByCondition(nation);
	}
	
	/**
	 * 修改民族方法
	 * @param nation Nation 实体对象
	 */	
	public ResultMessage update(Nation nation){
		nationMapper.update(nation);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 获取所有民族列表
	 */
	public List<Nation> getAllNation(){
		return nationMapper.getAllNation();
	}
}