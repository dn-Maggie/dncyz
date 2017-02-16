package com.dongnao.workbench.staticAnalysis.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dongnao.workbench.staticAnalysis.model.DemandAnalysis;
import com.dongnao.workbench.product.dao.ProductMapper;
import com.dongnao.workbench.staticAnalysis.dao.AnalysisMapper;
import com.dongnao.workbench.staticAnalysis.model.BidStaticAnalysis;
import com.dongnao.workbench.staticAnalysis.model.StoreActiveAnalysis;
/**
 * 描述：数据统计分析模块service接口实现类，实现service接口方法
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */

@Service("analysisService")
public class AnalysisServiceImpl implements AnalysisService{
	@Resource
	private AnalysisMapper AnalysisMapper;
	/**
	 * 精准客户需求分析方法
	 * */
	public List<DemandAnalysis> demandAnalysis(DemandAnalysis demandAnalysis){
		return null;
		
	};
	/**
	 * 	竞价分析方法
	 * */
	public List<BidStaticAnalysis> bidStaticAnalysis(BidStaticAnalysis bidStaticAnalysis){
		return null;
		
	};
	/**
	 * 活动数据分析方法
	 * */
	public List<StoreActiveAnalysis> storeActiveAnalysis(StoreActiveAnalysis storeActiveAnalysis){
		return null;
		
	}
	/**
	 * 获取数据总览信息
	 * */
	public List<BidStaticAnalysis> allStatic(Object object) {
		return null;
	};
	
}
