package com.dongnao.workbench.area.service;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dongnao.workbench.area.dao.ChinaAreaMapper;
import com.dongnao.workbench.area.model.ChinaArea;
 
/**
 * 描述：省市区地域模块service接口实现类，实现service接口方法
 *
 * @author fan.yang
 * @version 1.0 2016-05-10
 */
@Service("chinaAreaService")
public class ChinaAreaServiceImpl implements ChinaAreaService{
        @Resource
        private ChinaAreaMapper chinaAreaMapper;

		@Override
		public List<ChinaArea> loadAreaByParent(Integer pid) {
			return chinaAreaMapper.selectByPid(pid);
		}
	
        
}