package com.dongnao.workbench.system.dao;

import java.util.List;
import com.dongnao.workbench.system.model.InvokeFlow;
/**
 * 描述：调用流程模块dao接口，提供数据库操作方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public interface InvokeFlowMapper  {

	/**
	 * 新增调用流程方法
	 * @param invokeFlow InvokeFlow:实体类
	 */
	void add(InvokeFlow invokeFlow);
	
	/**
	 * 删除调用流程方法
	 * @param key String:多个由“，”分割开的id字符串
	 */
	void deleteByKey(String key);
	
	/**
	 * 根据主键查找调用流程实体方法
	 * @param key String：实体主键（查询条件）
	 * @return InvokeFlow: 实体
	 */
	public InvokeFlow getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找调用流程列表方法
	 * @param StaticAnalysisFlow invokeFlow：实体对象（查询条件）
	 * @return List<InvokeFlow>: 实体对象的list
	 */
	public List<InvokeFlow>  listByCondition(InvokeFlow invokeFlow);
	
	/**
	 * 修改调用流程方法
	 * @param invokeFlow InvokeFlow：实体对象
	 */	
	public void update(InvokeFlow invokeFlow);
}