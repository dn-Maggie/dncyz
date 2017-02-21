package com.dongnao.workbench.store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dongnao.workbench.basic.model.UserInfo;
import com.dongnao.workbench.basic.service.BrandService;
import com.dongnao.workbench.basic.service.UserInfoService;
import com.dongnao.workbench.common.page.Page;
import com.dongnao.workbench.common.util.AjaxUtils;
import com.dongnao.workbench.common.util.Utils;
import com.dongnao.workbench.common.util.FormatEntity;
import com.dongnao.workbench.store.model.Store;
import com.dongnao.workbench.store.service.StoreService;
import com.dongnao.workbench.system.model.DictInfo;
import com.dongnao.workbench.system.service.DictInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * 描述：店铺模块controller类，负责页面分发与跳转
 * 
 * @author maggie
 * @version 1.0 2017-02-10
 */
 
@Controller
@RequestMapping("store")
public class StoreController{
    @Resource
    private StoreService storeService;
    @Resource
    private BrandService brandService;
    @Resource
    private DictInfoService dictInfoService;
    @Resource
    private UserInfoService userInfoService;
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toAddStore")
	public ModelAndView toAdd(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/store/store/addStore");
		mv.addObject("brand", brandService.listByCondition(null));
		UserInfo userInfo = new UserInfo();
		if(!Utils.isSuperAdmin(request))
 		{userInfo.setId(Utils.getLoginUserInfoId(request));}
		mv.addObject("user", userInfoService.listByCondition(userInfo));
		return mv;
	}
	
 	/**
 	* 进入新增页面
 	* @return ModelAndView 返回到新增页面
 	*/
 	@RequestMapping("/toSelectStore")
	public ModelAndView toSelectStore(){
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/store/store/selectStore");
		return mv;
	}
	/**
	 * 进入查看页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toShowStore")
	public ModelAndView toShow(String key){
		Store entity = storeService.getByPrimaryKey(key);
		Map<String,String> store = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/store/store/showStore","store",store );
	}
	
	/**
	 * 新增方法
	 * @param response HttpServletResponse
	 * @param store Store:实体类
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/addStore")
	public void add(Store store,HttpServletRequest request,HttpServletResponse response){
	store.setStoreId(Utils.generateUniqueID());
	AjaxUtils.sendAjaxForObjectStr(response,storeService.add(store));		
	}
	
	/**
	 * 删除方法
	 * @param response HttpServletResponse
	 * @param key String:多个由“，”分割开的id字符串
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/deleteStore")
	public void deleteByKey(String key,HttpServletResponse response){
		String[] str = key.split(",");
		for(int i=0;i<str.length;i++){
			storeService.deleteByKey(str[i]);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "成功");
		AjaxUtils.sendAjaxForMap(response, map);
	}
	
	/**
	 * 进入列表页面
	 * @return ModelAndView
	 */
	@RequestMapping("/toListStore")
	public ModelAndView toList(HttpServletRequest request){
		 ModelAndView mv = new ModelAndView("WEB-INF/jsp/store/store/listStore");
		 return mv;
	}
	
	/**
	 * 根据条件查找列表方法
	 * @param store Store：实体对象（查询条件）
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page Page:分页对象
	 * @return: ajax输入json字符串
	 */
	@RequestMapping("/listStore")
	public void listByCondition(Store store,HttpServletRequest request,
			HttpServletResponse response, Page page){
		store.setPage(page);	
		if(!Utils.isSuperAdmin(request))
 		{store.setOwnerUserId(Utils.getLoginUserInfoId(request));}
		List<Store> list = storeService.listByCondition(store);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	
	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditStore")
	public ModelAndView toEdit(String key){
		Store entity = storeService.getByPrimaryKey(key);
		Map<String,String> store = FormatEntity.getObjectValue(entity);
		return new ModelAndView("WEB-INF/jsp/store/store/editStore","store",store );
	}
	
	/**
	 * 修改方法
	 * @param store Store：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateStore")
	public void update(Store store,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,storeService.update(store));	
	}
	/**
	 * 进入产品资源界面
	 * @param key String：店铺ID
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toListStoreProduct")
	public ModelAndView toListStoreProduct(String key){
		return new ModelAndView("WEB-INF/jsp/store/store/listStoreProduct","storeId",key );
	}
	/**
	 * 进入店铺产品分类界面
	 * @param key String：店铺ID
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toListStoreProductClass")
	public ModelAndView toListStoreProductClass(String key){
		return new ModelAndView("WEB-INF/jsp/store/store/listStoreProduct","storeId",key );
	}
}