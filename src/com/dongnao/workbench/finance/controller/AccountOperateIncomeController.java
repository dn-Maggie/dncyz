package com.dongnao.workbench.finance.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dongnao.workbench.common.excel.ExcelExpUtils;
import com.dongnao.workbench.common.excel.ExpParamBean;
import com.dongnao.workbench.common.excel.ImportExcelUtil;
import com.dongnao.workbench.common.page.Page;
import com.dongnao.workbench.common.util.AjaxUtils;
import com.dongnao.workbench.common.util.DateUtil;
import com.dongnao.workbench.common.util.Utils;
import com.dongnao.workbench.common.util.FormatEntity;
import com.dongnao.workbench.common.util.StringUtil;
import com.dongnao.workbench.finance.model.AccountOperateIncome;
import com.dongnao.workbench.finance.model.AccountOrderDetail;
import com.dongnao.workbench.finance.model.TotalOperateIncome;
import com.dongnao.workbench.finance.service.AccountOperateIncomeService;
import com.dongnao.workbench.finance.service.AccountOrderDetailService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：运营数据模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-03-05
 */
 
@Controller
@RequestMapping("accountOperateIncome")
public class AccountOperateIncomeController{
         @Resource
	private AccountOperateIncomeService accountOperateIncomeService;
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddAccountOperateIncome")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/accountOperateIncome/addAccountOperateIncome");
		return mv;
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowAccountOperateIncome")
	public ModelAndView toShow(String key){
		AccountOperateIncome entity = accountOperateIncomeService.getByPrimaryKey(key);
		Map<String,String> accountOperateIncome = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/finance/accountOperateIncome/showAccountOperateIncome","accountOperateIncome",accountOperateIncome );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param accountOperateIncome AccountOperateIncome:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addAccountOperateIncome")
	public void add(AccountOperateIncome accountOperateIncome,HttpServletRequest request,HttpServletResponse response){
	accountOperateIncome.setId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,accountOperateIncomeService.add(accountOperateIncome));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteAccountOperateIncome")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			accountOperateIncomeService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListAccountOperateIncome")
	public ModelAndView toList(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/accountOperateIncome/listAccountOperateIncome");
		 return mv;
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param accountOperateIncome AccountOperateIncome：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listAccountOperateIncome")
	public void listByCondition(AccountOperateIncome accountOperateIncome,HttpServletRequest request,
			HttpServletResponse response, Page page){
		accountOperateIncome.setPage(page);	
		List<AccountOperateIncome> list = accountOperateIncomeService.listByCondition(accountOperateIncome);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 运营统计数据
	 * @return ModelAndView
	 */
	@RequestMapping("/listAllFromOrderDetail")
	public void listAllFromOrderDetail(AccountOrderDetail accountOrderDetail,HttpServletRequest request,
			HttpServletResponse response, Page page){
		accountOrderDetail.setPage(page);	
		List<TotalOperateIncome> list = accountOperateIncomeService.listAllFromOrderDetail(accountOrderDetail);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 根据条件查找运营数据
	 * @param accountOrderDetail AccountOrderDetail：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listOperaData")
	public void listOperaData(AccountOrderDetail accountOrderDetail,HttpServletRequest request,
			HttpServletResponse response, Page page){
		accountOrderDetail.setPage(page);	
		List<AccountOperateIncome> list = accountOperateIncomeService.listByConditionFromOrderDetail(accountOrderDetail);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditAccountOperateIncome")
	public ModelAndView toEdit(String key){
		AccountOperateIncome entity = accountOperateIncomeService.getByPrimaryKey(key);
		Map<String,String> accountOperateIncome = FormatEntity.getObjectValue(entity);
		
		return new ModelAndView("WEB-INF/jsp/finance/accountOperateIncome/editAccountOperateIncome","accountOperateIncome",accountOperateIncome );
	}
	
	/**
	 * 修改方法
	 * @param accountOperateIncome AccountOperateIncome：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateAccountOperateIncome")
	public void update(AccountOperateIncome accountOperateIncome,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,accountOperateIncomeService.update(accountOperateIncome));	
	}
	
	 /**
     * 读取Excel的内容，第一维数组存储的是一行中格列的值，二维数组存储的是多少个行
     * @param file 读取数据的源Excel
     * @param ignoreRows 读取数据忽略的行数，比喻行头不需要读入 忽略的行数为1
     * @return 读出的Excel中数据的内容
     * @throws FileNotFoundException
     * @throws IOException
     */
 	@RequestMapping("/emlOperateIncomeImport")
	public void emlorderDetailImport(HttpServletRequest request,HttpServletResponse response
		)throws Exception {  	
 		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
 		InputStream in =null;  
        List<List<Object>> listob = null;  
        ArrayList<AccountOperateIncome> operateIncomeList = new ArrayList<AccountOperateIncome>();
        MultipartFile file = multipartRequest.getFile("file");  
        if(file.isEmpty()){  
            throw new Exception("文件不存在！");  
        }  
        in = file.getInputStream();  
        listob = new ImportExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
        for (int i = 0; i < listob.size(); i++) {  
            List<Object> lo = listob.get(i);  
            AccountOperateIncome operateIncome = new AccountOperateIncome();  
            try{
            	operateIncome.setId(Utils.generateUniqueID());
            	operateIncome.setStoreName(StringUtil.valueOf(lo.get(0)));
            	operateIncome.setCreateDate(DateUtil.parseStringToyyyyMMdd(StringUtil.valueOf(lo.get(1))));
            	operateIncome.setCreateTime(new Timestamp(DateUtil.parseStringToyyyyMMddHHmmss(StringUtil.valueOf(lo.get(2))).getTime()));
            	operateIncome.setOrderNo(StringUtil.valueOf(lo.get(3)));
            	operateIncome.setOrginPrice(lo.get(4).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(4))));
            	operateIncome.setDiscountPrice(lo.get(5).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(5))));
            	operateIncome.setAfterDiscountPrice(lo.get(6).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(6))));
            	operateIncome.setActualPrice(lo.get(7).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(7))));
            	operateIncome.setOrderDistributionCharge(lo.get(8).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(8))));
            	operateIncome.setPlatformDistributionCharge(lo.get(9).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(9))));
            	operateIncome.setCyzDistributionCharge(lo.get(10).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(10))));
            	operateIncome.setCyzActivitiesCharge(lo.get(11).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(11))));
            	operateIncome.setPlatformActivitiesCharge(lo.get(12).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(12))));
            	operateIncome.setPlatformServiceCharge(lo.get(13).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(13))));
            	operateIncome.setProductSaleAmount(lo.get(14).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(14))));
            	operateIncome.setAmountReceivable(lo.get(15).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(15))));
            	operateIncome.setSeventypProductSaleAmount(lo.get(16).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(16))));
            	operateIncome.setAmountPayable(lo.get(17).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(17))));
            	operateIncome.setCyzServiceCharge(lo.get(18).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(18))));
            	operateIncome.setDistributionActualPayment(StringUtil.valueOf(lo.get(19)));
            	operateIncome.setSaleGrossProfit(lo.get(20).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(20))));
            	operateIncome.setSaleGrossProfitRate(StringUtil.valueOf(lo.get(21)));
            	operateIncome.setRemark(StringUtil.valueOf(lo.get(22)));
            	operateIncome.setPlatformType("elm");
            	
            	operateIncomeList.add(operateIncome);
            }catch(Exception e){
            	e.printStackTrace();
            	Map<String, String> map = new HashMap<String, String>();
        		map.put("msg", "失败");
        		AjaxUtils.sendAjaxForMap(response, map);
            }
        }  
        response.setCharacterEncoding("utf-8");  //防止ajax接受到的中文信息乱码  
        Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		map.put("dataSize", accountOperateIncomeService.addOperaDetail(operateIncomeList)+"");//批量插入，传入orderDetail实体集合
		AjaxUtils.sendAjaxForMap(response, map);
	}
 	
 	@RequestMapping("/meituanOperateIncomeImport")
	public void meituanorderDetailImport(HttpServletRequest request,HttpServletResponse response
		)throws Exception {  	

 	}
 	
 	@RequestMapping("/baiduOperateIncomeImport")
	public void baiduorderDetailImport(HttpServletRequest request,HttpServletResponse response
		)throws Exception {  	

 	}
	
	//导出运营明细数据方法
	@RequestMapping("/exportDetailExcel")
	public void exportDetailExcel(AccountOrderDetail accountOrderDetail, ExpParamBean epb,
			HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {		
		int expType = Integer.parseInt(request.getParameter("expType"));
		if (expType == 1) {
			accountOrderDetail.setPage(page);
		}
		List<AccountOperateIncome> list = accountOperateIncomeService.listByConditionFromOrderDetail(accountOrderDetail);
		ExcelExpUtils.exportListToExcel(list, response, epb.getFieldlist(),
				"运营明细列表", "运营明细列表");
	}
	//导出运营汇总数据方法
	@RequestMapping("/exportTotalExcel")
	public void exportTotalExcel(AccountOrderDetail accountOrderDetail, ExpParamBean epb,
			HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {		
		int expType = Integer.parseInt(request.getParameter("expType"));
		if (expType == 1) {
			accountOrderDetail.setPage(page);
		}
		List<TotalOperateIncome> list = accountOperateIncomeService.listAllFromOrderDetail(accountOrderDetail);
		ExcelExpUtils.exportListToExcel(list, response, epb.getFieldlist(),
				"运营统计列表", "运营统计列表");
	}
	
	
	/**
	 * 配置表头
	 */
	@RequestMapping("/toConfigGridTitle")
	public ModelAndView toConfigGridTitle(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/operaData/configGridTitle");
		return mv;
	}
	
}