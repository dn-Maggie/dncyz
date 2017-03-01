package com.dongnao.workbench.basic.service;

import java.util.List;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.basic.model.UserGroup;
import com.dongnao.workbench.basic.model.UserInfo;

/**
 * 描述：用户组别模块service接口，提供controller操作所需方法
 *
 * @author maggie
 * @version 1.0 2017-03-01
 */
public interface UserGroupService  {

	/**
	 * 新增用户组别方法
	 * @param userGroup UserGroup:实体类
	 */
	public ResultMessage add(UserGroup userGroup);
	
	/**
	 * 删除用户组别方法
	 * @param key:多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key);
	
	/**
	 * 根据主键查找用户组别实体方法
	 * @param key String：实体主键
	 * @return userGroup UserGroup 实体对象
	 */
	public UserGroup getByPrimaryKey(String key);
	
	/**
	 * 根据条件查找用户组别列表方法
	 * @param userGroup UserGroup 实体对象（查询条件）
	 * @return: 实体对象的list
	 */
	public List<UserGroup> listByCondition(UserGroup userGroup);
	
	/**
	 * 修改用户组别方法
	 * @param userGroup UserGroup 实体对象
	 */	
	public ResultMessage update(UserGroup userGroup);

	public String initGroupTree(String groupName, UserInfo UserInfo);
}