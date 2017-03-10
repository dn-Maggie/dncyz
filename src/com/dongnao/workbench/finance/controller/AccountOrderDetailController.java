package com.dongnao.workbench.finance.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
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
import com.dongnao.workbench.finance.service.AccountOrderDetailService;
import com.dongnao.workbench.staticAnalysis.model.DemandAnalysis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：订单明细模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-03-02
 */
 
@Controller
@RequestMapping("accountOrderDetail")
public class AccountOrderDetailController{
         @Resource
	private AccountOrderDetailService accountOrderDetailService;
	 
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddAccountOrderDetail")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/accountOrderDetail/addAccountOrderDetail");
		return mv;
	}
	
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowAccountOrderDetail")
	public ModelAndView toShow(String key){
		AccountOrderDetail entity = accountOrderDetailService.getByPrimaryKey(key);
		Map<String,String> accountOrderDetail = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/finance/accountOrderDetail/showAccountOrderDetail","accountOrderDetail",accountOrderDetail );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param accountOrderDetail AccountOrderDetail:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addAccountOrderDetail")
	public void add(AccountOrderDetail accountOrderDetail,HttpServletRequest request,HttpServletResponse response){
	accountOrderDetail.setId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(
				response,accountOrderDetailService.add(accountOrderDetail));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteAccountOrderDetail")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			accountOrderDetailService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入订单详细列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListAccountOrderDetail")
	public ModelAndView toList(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/accountOrderDetail/listAccountOrderDetail");
		 return mv;
	}
	
	/**
	 * 进入运营数据
	 * @return ModelAndView
	 */
	@RequestMapping("/toListOperaData")
	public ModelAndView toListOperaData(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/operaData/listOperaData");
		 return mv;
	}
	
	/**
	 * 进入运营统计数据
	 * @return ModelAndView
	 */
	@RequestMapping("/toListAllFromOrderDetail")
	public ModelAndView toListAllFromOrderDetail(){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/finance/operaData/listTotalOperaData");
		 return mv;
	}
	
	
	/**
	 * 根据条件查找订单详细
	 * @param accountOrderDetail AccountOrderDetail：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listAccountOrderDetail")
	public void listByCondition(AccountOrderDetail accountOrderDetail,HttpServletRequest request,
			HttpServletResponse response, Page page){
		accountOrderDetail.setPage(page);	
		List<AccountOrderDetail> list = accountOrderDetailService.listByCondition(accountOrderDetail);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditAccountOrderDetail")
	public ModelAndView toEdit(String key){
		AccountOrderDetail entity = accountOrderDetailService.getByPrimaryKey(key);
		Map<String,String> accountOrderDetail = FormatEntity.getObjectValue(entity);
		
		return new ModelAndView("WEB-INF/jsp/finance/accountOrderDetail/editAccountOrderDetail","accountOrderDetail",accountOrderDetail );
	}
	
	/**
	 * 修改方法
	 * @param accountOrderDetail AccountOrderDetail：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateAccountOrderDetail")
	public void update(AccountOrderDetail accountOrderDetail,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,accountOrderDetailService.update(accountOrderDetail));	
	}
	
	
	 /**
     * 读取Excel的内容，第一维数组存储的是一行中格列的值，二维数组存储的是多少个行
     * @param file 读取数据的源Excel
     * @param ignoreRows 读取数据忽略的行数，比喻行头不需要读入 忽略的行数为1
     * @return 读出的Excel中数据的内容
     * @throws FileNotFoundException
     * @throws IOException
     */
 	@RequestMapping("/emlorderDetailImport")
	public void emlorderDetailImport(HttpServletRequest request,HttpServletResponse response
		)throws Exception {  	
 		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
 		InputStream in =null;  
        List<List<Object>> listob = null;  
        ArrayList<AccountOrderDetail> orderDetailList = new ArrayList<AccountOrderDetail>();
        MultipartFile file = multipartRequest.getFile("file");  
        if(file.isEmpty()){  
            throw new Exception("文件不存在！");  
        }  
        in = file.getInputStream();  
        listob = new ImportExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
        for (int i = 0; i < listob.size(); i++) {  
            List<Object> lo = listob.get(i);  
            AccountOrderDetail orderDetail = new AccountOrderDetail();  
            try{
            	orderDetail.setId(Utils.generateUniqueID());
				orderDetail.setCreateDate(DateUtil.parseStringToyyyyMMdd(StringUtil.valueOf(lo.get(0))));
				orderDetail.setStoreELMId(StringUtil.valueOf(lo.get(1)));
				orderDetail.setStoreName(StringUtil.valueOf(lo.get(2)));
				orderDetail.setCheckNo(StringUtil.valueOf(lo.get(3)));
				orderDetail.setOrderType(StringUtil.valueOf(lo.get(4)));//饿了么数据订单类型（普通单 /预订单）
				orderDetail.setOrderTime(new Timestamp(DateUtil.parseStringToyyyyMMddHHmmss(StringUtil.valueOf(lo.get(5))).getTime()));
				orderDetail.setOverTime(new Timestamp(DateUtil.parseStringToyyyyMMddHHmmss(StringUtil.valueOf(lo.get(6))).getTime()));
				orderDetail.setOrderIndex(StringUtil.valueOf(lo.get(7)));
				orderDetail.setOrderNo(StringUtil.valueOf(lo.get(8)));
				orderDetail.setPrices(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(9))));
				orderDetail.setMealFee(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(10))));
				orderDetail.setGiftAllowance(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(11))));
				orderDetail.setMerchantActivitiesSubsidies(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(12))));//商户承担活动补贴(总额)
				orderDetail.setActivitiesSubsidyBymerchant(lo.get(23).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(23))));//商户承担活动补贴(菜品折扣部分)
				orderDetail.setFoodDiscount(lo.get(25).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(25))));//折扣后菜价
				orderDetail.setSpecialOffer(lo.get(26).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(26))));//特价结算
				orderDetail.setActivitiesSubsidyBycompany(lo.get(24).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(24))));//商户承担活动补贴(公司承担线上活动费)
				orderDetail.setMerchantSubsidyVouchers(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(13))));
				orderDetail.setMerchantDistCharge(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(14))));
				orderDetail.setServiceRate(StringUtil.valueOf(lo.get(15)));
				orderDetail.setServiceCharge(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(16))));
				orderDetail.setRefundAmount(StringUtil.valueOf(lo.get(17)));
				orderDetail.setSettlementAmount(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(18))));
				orderDetail.setDistributionMode(StringUtil.valueOf(lo.get(19)));
				orderDetail.setRemark(StringUtil.valueOf(lo.get(20)));
				orderDetail.setPlatformActivitiesSubsidies(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(21))));
				orderDetail.setPlatformSubsidyVouchers(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(22))));
				orderDetail.setPlatformType("elm");
				orderDetail.setIsInvalid("0"); //是否为无效单
            	orderDetailList.add(orderDetail);
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
		map.put("dataSize", accountOrderDetailService.addOrderDetail(orderDetailList)+"");//批量插入，传入orderDetail实体集合
		AjaxUtils.sendAjaxForMap(response, map);
	}
 	
 	@RequestMapping("/meituanorderDetailImport")
	public void meituanorderDetailImport(HttpServletRequest request,HttpServletResponse response
		)throws Exception {  	
 		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
 		InputStream in =null;  
        List<List<Object>> listob = null;  
        ArrayList<AccountOrderDetail> orderDetailList = new ArrayList<AccountOrderDetail>();
        MultipartFile file = multipartRequest.getFile("file");  
        if(file.isEmpty()){  
            throw new Exception("文件不存在！");  
        }  
        in = file.getInputStream();  
        listob = new ImportExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
        for (int i = 0; i < listob.size(); i++) {  
            List<Object> lo = listob.get(i);  
            AccountOrderDetail orderDetail = new AccountOrderDetail();  
            try{
            	orderDetail.setId(Utils.generateUniqueID());
				orderDetail.setCreateDate(DateUtil.parseStringToyyyyMMdd(StringUtil.valueOf(lo.get(1))));
				orderDetail.setStoreMTId(StringUtil.valueOf(lo.get(4)));
				orderDetail.setStoreName(StringUtil.valueOf(lo.get(3)));
				orderDetail.setCheckNo(""); //美团数据无账单编号
				orderDetail.setIsInvalid(StringUtil.valueOf(lo.get(7)).equals("订单取消")?"1":"0"); //是否为无效单
				orderDetail.setOrderType(StringUtil.valueOf(lo.get(9)).equals("是")?"预定单":"普通单"); //美团订单状态 （预定单 /普通单）
				orderDetail.setOrderTime(lo.get(1).toString().length()==0?new Timestamp(0):new Timestamp(DateUtil.parseStringToyyyyMMddHHmmss(StringUtil.valueOf(lo.get(1))).getTime()));//美团下单时间
				orderDetail.setOverTime(lo.get(29).toString().length()==0?new Timestamp(0):new Timestamp(DateUtil.parseStringToyyyyMMddHHmmss(StringUtil.valueOf(lo.get(29))).getTime())); //订单完成时间
				orderDetail.setOrderIndex("");//美团数据无接单序号
				orderDetail.setOrderNo(StringUtil.valueOf(lo.get(0)));
				orderDetail.setPrices(
						StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(10))).subtract(
								StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(15))).add(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(27))))
								)); //菜品原价= 订单总金额-(配送费+餐盒费）
				orderDetail.setMealFee(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(27))));//餐盒费
				orderDetail.setGiftAllowance(new BigDecimal(0)); //赠品补贴
				
				orderDetail.setMerchantActivitiesSubsidies(StringUtil.stringToDecimal(StringUtil.valueOf("-"+lo.get(13))));//商户承担活动补贴(总额)
				orderDetail.setActivitiesSubsidyBymerchant(lo.get(33).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(33))));//商户承担活动补贴(菜品折扣部分)
				orderDetail.setFoodDiscount(lo.get(35).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(35))));//折扣后菜价
				orderDetail.setSpecialOffer(lo.get(36).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(36))));//特价结算
				orderDetail.setActivitiesSubsidyBycompany(lo.get(34).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(34))));//商户承担活动补贴(公司承担线上活动费)
				
				orderDetail.setPlatformActivitiesSubsidies(StringUtil.stringToDecimal(lo.get(12)));//订单美团承担活动金额*/	
				orderDetail.setMerchantSubsidyVouchers(new BigDecimal(0)); //商户代金券补贴
				orderDetail.setServiceRate("");//服务费费率*/
				orderDetail.setServiceCharge(lo.get(31).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(31)))); //服务费
				orderDetail.setRefundAmount("");
				
				orderDetail.setDistributionMode(StringUtil.valueOf(lo.get(32))); //配送方式
				orderDetail.setMerchantDistCharge(
						StringUtil.valueOf(lo.get(32)).equals("平台配送")?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(15))));//商户承担配送费
				orderDetail.setPlatformDistCharge(
						StringUtil.valueOf(lo.get(32)).equals("平台配送")?
								StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(15))):new BigDecimal(0));//平台承担配送费
				orderDetail.setRemark("");//备注
				//结算金额 = 订单总金额-平台配送费 -菜品折扣（订单商家承担活动金额）-服务费+商户配送费（自配送）
				orderDetail.setSettlementAmount(
						StringUtil.stringToDecimal(lo.get(10)).subtract(
								(orderDetail.getPlatformDistCharge().add(StringUtil.stringToDecimal(lo.get(13))))
						).add(lo.get(31).toString().length()==0?new BigDecimal(0):StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(31)))).add(orderDetail.getMerchantDistCharge())); 
				orderDetail.setPlatformType("meituan");
            	orderDetailList.add(orderDetail);
            }catch(ParseException e){
            	e.printStackTrace();
            	Map<String, String> map = new HashMap<String, String>();
        		map.put("msg", "失败");
        		AjaxUtils.sendAjaxForMap(response, map);
            }
        }  
        response.setCharacterEncoding("utf-8");  //防止ajax接受到的中文信息乱码  
        Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		map.put("dataSize", accountOrderDetailService.addOrderDetail(orderDetailList)+"");//批量插入，传入orderDetail实体集合
		AjaxUtils.sendAjaxForMap(response, map);
	}
 	
 	@RequestMapping("/baiduorderDetailImport")
	public void baiduorderDetailImport(HttpServletRequest request,HttpServletResponse response
		)throws Exception {  	
 		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
 		InputStream in =null;  
        List<List<Object>> listob = null;  
        ArrayList<AccountOrderDetail> orderDetailList = new ArrayList<AccountOrderDetail>();
        MultipartFile file = multipartRequest.getFile("file");  
        if(file.isEmpty()){  
            throw new Exception("文件不存在！");  
        }  
        in = file.getInputStream();  
        listob = new ImportExcelUtil().getBankListByExcel(in,file.getOriginalFilename());
        for (int i = 0; i < listob.size(); i++) {  
            List<Object> lo = listob.get(i);  
            AccountOrderDetail orderDetail = new AccountOrderDetail();  
            try{
            	orderDetail.setId(Utils.generateUniqueID());
				orderDetail.setCreateDate(DateUtil.parseStringToyyyyMMdd(StringUtil.valueOf(lo.get(0))));
				orderDetail.setStoreId(StringUtil.valueOf(lo.get(1)));
				orderDetail.setStoreName(StringUtil.valueOf(lo.get(2)));
				orderDetail.setCheckNo(StringUtil.valueOf(lo.get(3)));
				orderDetail.setOrderType(StringUtil.valueOf(lo.get(4)));
				orderDetail.setOrderTime(lo.get(1).toString().length()==0?new Timestamp(0):new Timestamp(DateUtil.parseStringToyyyyMMddHHmmss(StringUtil.valueOf(lo.get(1))).getTime()));//美团下单时间
				orderDetail.setOverTime(lo.get(29).toString().length()==0?new Timestamp(0):new Timestamp(DateUtil.parseStringToyyyyMMddHHmmss(StringUtil.valueOf(lo.get(29))).getTime())); //订单完成时间
				orderDetail.setOrderIndex(StringUtil.valueOf(lo.get(7)));
				orderDetail.setOrderNo(StringUtil.valueOf(lo.get(8)));
				orderDetail.setPrices(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(9))));
				orderDetail.setMealFee(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(10))));
				orderDetail.setGiftAllowance(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(11))));
				/*orderDetail.setActivitiesSubsidies(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(12))));
				orderDetail.setSubsidyVouchers(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(13))));
				orderDetail.setMerchantCharge(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(14))));
				orderDetail.setServiceRate(StringUtil.valueOf(lo.get(15)));*/
				orderDetail.setServiceCharge(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(16))));
				orderDetail.setRefundAmount(StringUtil.valueOf(lo.get(17)));
				orderDetail.setSettlementAmount(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(18))));
				orderDetail.setDistributionMode(StringUtil.valueOf(lo.get(19)));
				orderDetail.setRemark(StringUtil.valueOf(lo.get(20)));
				/*orderDetail.setElmActivitiesSubsidies(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(21))));
				orderDetail.setElmSubsidyVouchers(StringUtil.stringToDecimal(StringUtil.valueOf(lo.get(22))));*/
            	orderDetailList.add(orderDetail);
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
		map.put("dataSize", accountOrderDetailService.addOrderDetail(orderDetailList)+"");//批量插入，传入orderDetail实体集合
		AjaxUtils.sendAjaxForMap(response, map);
	}
 	//导出数据方法
	@RequestMapping("/exportExcel")
	public void exportExcel(AccountOrderDetail accountOrderDetail, ExpParamBean epb,
			HttpServletRequest request, HttpServletResponse response, Page page)
			throws Exception {		
		int expType = Integer.parseInt(request.getParameter("expType"));
		if (expType == 1) {
			accountOrderDetail.setPage(page);
		}
		List<AccountOrderDetail> list = accountOrderDetailService.listByCondition(accountOrderDetail);
		ExcelExpUtils.exportListToExcel(list, response, epb.getFieldlist(),
				epb.getFieldlist().get(0)+"订单明细列表", "订单明细列表");
	}
}