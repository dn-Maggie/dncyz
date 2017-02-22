package com.dongnao.workbench.staticAnalysis.controller;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dongnao.workbench.common.excel.ImportExcelUtil;
import com.dongnao.workbench.common.page.Page;
import com.dongnao.workbench.common.util.AjaxUtils;
import com.dongnao.workbench.common.util.StringUtil;
import com.dongnao.workbench.staticAnalysis.model.BidStaticAnalysis;
import com.dongnao.workbench.staticAnalysis.model.DemandAnalysis;
import com.dongnao.workbench.staticAnalysis.model.StoreActiveAnalysis;
import com.dongnao.workbench.staticAnalysis.service.AnalysisService;



/**
 * 描述：数据分析模块controller类，负责数据分析页面分发与方法跳转
 * 
 * @author maggie
 * @version 1.0 2017-02-10
 */
 
@Controller
@RequestMapping("staticAnalysis")
public class StaticAnalysisController{
	@Resource
	private AnalysisService analysisService;
 	/**
 	* 进入总览页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAllStatic")
	public ModelAndView toAllStatic(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/staticAnalysis/allStatic");
		return mv;
	}
 	/**
	 * 总览数据分析
	 * @return ModelAndView
	 */
	@RequestMapping("/allStatic")
	public void allStatic(BidStaticAnalysis bidStaticAnalysis,HttpServletRequest request,HttpServletResponse response, Page page){
		bidStaticAnalysis.setPage(page);	
		List<BidStaticAnalysis> list = analysisService.allStatic(null);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
 	/**
 	* 进入竞价分析页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toBidAnalysis")
	public ModelAndView toBidAnalysis(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/staticAnalysis/bidAnalysis");
		return mv;
	}
 	/**
	 * 竞价分析
	 * @return ModelAndView
	 */
	@RequestMapping("/bidAnalysis")
	public void bidAnalysis(BidStaticAnalysis bidStaticAnalysis,HttpServletRequest request,HttpServletResponse response, Page page){
		bidStaticAnalysis.setPage(page);	
		List<BidStaticAnalysis> list = analysisService.bidStaticAnalysis(bidStaticAnalysis);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	/**
	 * 进入活动数据分析页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toStoreActivity")
	public ModelAndView toStoreActivity(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/staticAnalysis/storeActivity");
		 return mv;
	}
	/**
	 * 活动数据分析
	 * @return ModelAndView
	 */
	@RequestMapping("/listStoreActivity")
	public void listStoreActivity(StoreActiveAnalysis storeActiveAnalysis,HttpServletRequest request,HttpServletResponse response, Page page){
		storeActiveAnalysis.setPage(page);	
		List<StoreActiveAnalysis> list = analysisService.storeActiveAnalysis(storeActiveAnalysis);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
 	* 进入精准客户需求分析页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toDemandAnalysis")
	public ModelAndView toDemandAnalysis(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/staticAnalysis/demandAnalysis");
		return mv;
	}
 	/**
	 * 精准客户需求分析
	 * @return ModelAndView
	 */
	@RequestMapping("/demandAnalysis")
	public void demandAnalysis(DemandAnalysis demandAnalysis,HttpServletRequest request,HttpServletResponse response, Page page){
		demandAnalysis.setPage(page);	
		List<DemandAnalysis> list = analysisService.demandAnalysis(demandAnalysis);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	/**
 	* 进入商户产品销售统计页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toProductSale")
	public ModelAndView toProductSale(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/staticAnalysis/productSale");
		return mv;
	}
 	/**
	 * 商户产品销售统计页面
	 * @return ModelAndView
	 */
	@RequestMapping("/productSale")
	public void productSale(DemandAnalysis demandAnalysis,HttpServletRequest request,HttpServletResponse response, Page page){
		demandAnalysis.setPage(page);	
		List<DemandAnalysis> list = analysisService.demandAnalysis(demandAnalysis);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	 /**
     * 读取Excel的内容，第一维数组存储的是一行中格列的值，二维数组存储的是多少个行
     * @param file 读取数据的源Excel
     * @param ignoreRows 读取数据忽略的行数，比喻行头不需要读入 忽略的行数为1
     * @return 读出的Excel中数据的内容
     * @throws FileNotFoundException
     * @throws IOException
     */
 	@RequestMapping("/bidimport")
	public void bidimport(HttpServletRequest request,HttpServletResponse response
		)throws Exception {  	
 		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
 		InputStream in =null;  
        List<List<Object>> listob = null;  
        MultipartFile file = multipartRequest.getFile("file");  
        if(file.isEmpty()){  
            throw new Exception("文件不存在！");  
        }  
        in = file.getInputStream();  
        listob = new ImportExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
        for (int i = 1; i < listob.size(); i++) {  
            List<Object> lo = listob.get(i);  
            BidStaticAnalysis bidAnalysis = new BidStaticAnalysis();  
            Calendar c = Calendar.getInstance();
     		c.add(Calendar.MONTH, -1);
            try{
            	bidAnalysis.setStoreName(StringUtil.valueOf(lo.get(0)));
            	bidAnalysis.setStoreArea(StringUtil.valueOf(lo.get(1)));
            	bidAnalysis.setBidTime(StringUtil.valueOf(lo.get(2)));
            	bidAnalysis.setBidCycle(StringUtil.valueOf(lo.get(3)));
            	bidAnalysis.setBidTotalAmountInWeek(StringUtil.valueOf(lo.get(4)));
            	bidAnalysis.setAverageClickCost(StringUtil.valueOf(lo.get(5)));
            	bidAnalysis.setBidActivityIntensity(StringUtil.valueOf(lo.get(6)));
            	bidAnalysis.setExposureIncrementPercent(StringUtil.valueOf(lo.get(7)));
            	bidAnalysis.setEnterRateIncrementPercent(StringUtil.valueOf(lo.get(8)));
            	bidAnalysis.setTradeAmountIncrementPercent(StringUtil.valueOf(lo.get(10)));
            	bidAnalysis.setRankBeforeBid(StringUtil.valueOf(lo.get(11)));
            	bidAnalysis.setRankAfterBid(StringUtil.valueOf(lo.get(12)));
            	bidAnalysis.setContributionInBid(StringUtil.valueOf(lo.get(13)));
            	analysisService.addbidAnalysis(bidAnalysis);
            }catch(Exception e){
            	continue;
            }
        }  
        PrintWriter out = null;  
        response.setCharacterEncoding("utf-8");  //防止ajax接受到的中文信息乱码  
        out = response.getWriter();  
        out.print("文件导入成功！");  
        out.flush();  
        out.close();  
	}
}