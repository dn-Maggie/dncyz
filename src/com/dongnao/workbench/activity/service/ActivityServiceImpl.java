package com.dongnao.workbench.activity.service;
import javax.annotation.Resource;
import java.util.List;
import com.dongnao.workbench.activity.dao.ActivityMapper;
import com.dongnao.workbench.activity.model.Activity;
import com.dongnao.workbench.activity.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dongnao.workbench.common.bean.ResultMessage;
import com.dongnao.workbench.common.util.AjaxUtils;
 
/**
 * 描述：活动模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
@Service("activityService")
public class ActivityServiceImpl implements ActivityService{
        @Resource
	private ActivityMapper activityMapper;
	
 
	/**
	 * 新增活动方法
	 * @param activity:实体类
	 */	
	public ResultMessage add(Activity activity){
		activityMapper.add(activity);
		return AjaxUtils.getSuccessMessage();
	}
	
	/**
	 * 根据主键查找活动实体方法
	 * @param key String 实体主键
	 * @return Activity 实体对象
	 */
	public Activity getByPrimaryKey(String key){
		return activityMapper.getByPrimaryKey(key);
	}
	
	/**
	 * 删除活动方法
	 * @param key String 多个由“，”分割开的id字符串
	 */
	public void deleteByKey(String key){
		activityMapper.deleteByKey(key);
	}
	
	/**
	 * 根据条件查找活动列表方法
	 * @param activity Activity 实体对象（查询条件）
	 * @return List<Activity> 实体对象的list
	 */
	public List<Activity> listByCondition(Activity activity){
		return activityMapper.listByCondition(activity);
	}
	
	/**
	 * 修改活动方法
	 * @param activity Activity 实体对象
	 */	
	public ResultMessage update(Activity activity){
		activityMapper.update(activity);
		return AjaxUtils.getSuccessMessage();
	}
}