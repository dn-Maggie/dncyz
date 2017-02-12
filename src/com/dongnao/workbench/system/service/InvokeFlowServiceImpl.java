package com.dongnao.workbench.system.service;
import javax.annotation.Resource;
import java.util.List;
import com.dongnao.workbench.system.dao.InvokeFlowMapper;
import com.dongnao.workbench.system.model.InvokeFlow;
import com.dongnao.workbench.system.service.InvokeFlowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
 
/**
 * 描述：调用流程模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
@Service("invokeFlowService")
public class InvokeFlowServiceImpl implements InvokeFlowService{
        @Resource
	private InvokeFlowMapper invokeFlowMapper;
	
 
	/**
	 * 新增调用流程方法
	 * @param invokeFlow:实体类
	 */	
	public ResultMessage add(InvokeFlow invokeFlow){
		invokeFlowMapper.add(invokeFlow);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 根据主键查找调用流程实体方法
	 * @param key String 实体主键
	 * @return InvokeFlow 实体对象
	 */
	public InvokeFlow getByPrimaryKey(String key){
		return invokeFlowMapper.getByPrimaryKey(key);
	}
	
	/**
	 * 删除调用流程方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key){
		invokeFlowMapper.deleteByKey(key);
	}
	
	/**
	 * 根据条件查找调用流程列表方法
	 * @param invokeFlow InvokeFlow 实体对象（查询条件）
	 * @return List<InvokeFlow> 实体对象的list
	 */
	public List<InvokeFlow> listByCondition(InvokeFlow invokeFlow){
		return invokeFlowMapper.listByCondition(invokeFlow);
	}
	
	/**
	 * 修改调用流程方法
	 * @param invokeFlow InvokeFlow 实体对象
	 */	
	public ResultMessage update(InvokeFlow invokeFlow){
		invokeFlowMapper.update(invokeFlow);
		return AjaxUtils.getSuccessMessage();
	}
}