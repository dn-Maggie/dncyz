package com.dongnao.workbench.store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dongnao.workbench.basic.model.Brand;
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
import com.dongnao.workbench.system.model.Personrole;
import com.dongnao.workbench.system.service.DictInfoService;
import com.dongnao.workbench.system.service.PersonroleService;

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
	private PersonroleService personroleService;
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
		mv.addObject("brand", brandService.listByCondition(new Brand()));
		UserInfo userInfo = new UserInfo();
		if(!Utils.isSuperAdmin(request)){userInfo.setId(Utils.getLoginUserInfoId(request));}
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
	public ModelAndView toShow(String key,HttpServletRequest request){
		Store entity = storeService.getByPrimaryKey(key);
		Map<String,String> store = FormatEntity.getObjectValue(entity);
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/store/store/showStore","store",store);
		mv.addObject("settlementMethod", dictInfoService.getDictInfoListByType("settlementMethod"));
		UserInfo userInfo = new UserInfo();
		if(!Utils.isSuperAdmin(request))
 		{userInfo.setId(Utils.getLoginUserInfoId(request));}
		mv.addObject("user", userInfoService.listByCondition(userInfo));
		mv.addObject("brand", brandService.listByCondition(new Brand()));
		return mv;
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
	storeService.add(store);
	AjaxUtils.sendAjaxForObjectStr(response,storeService.getByPrimaryKey(store.getStoreId()));
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
		 	Store store = new Store();
		 	boolean isAdmin = true;
	 		if(!Utils.isSuperAdmin(request)){
	 			store.setOwnerUserId(Utils.getLoginUserInfoId(request));
	 			isAdmin = false;
			}
			mv.addObject("store",storeService.listByCondition(store));
			mv.addObject("isAdmin",isAdmin);
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
		Personrole personrole = getPersonrole(Utils.getLoginUserInfoId(request));
		if(!Utils.isSuperAdmin(request)&&personrole.getRoleId().equals("38703abe-b9ab-4dd1-aa8d-1327c9b35dee"))
 		{
			store.setUserGroup(Utils.getLoginUserInfo(request).getUserGroup());
		}else if(!Utils.isSuperAdmin(request)&&!personrole.getRoleId().equals("38703abe-b9ab-4dd1-aa8d-1327c9b35dee")){
			store.setOwnerUserId(Utils.getLoginUserInfoId(request));
		}
		List<Store> list = storeService.listByCondition(store);
		AjaxUtils.sendAjaxForPage(request, response, page, list);
	}
	/**
	 * 根据用户ID获取角色用户关联实体
	 * 
	 * @param userInfoId
	 *            用户ID
	 * @return 角色用户关联实体
	 */
	private Personrole getPersonrole(String userInfoId) {
		Personrole personrole = new Personrole();
		personrole.setUserId(userInfoId);
		List<Personrole> personroles = personroleService
				.listByCondition(personrole);
		if (personroles != null && personroles.size() > 0) {
			return personroles.get(0);
		} else {
			return null;
		}
	}

	/**
	 * 进入修改页面方法
	 * @param key String：实体id
	 * @return ModelAndView: 查询实体
	 */	
	@RequestMapping("/toEditStore")
	public ModelAndView toEdit(String key,HttpServletRequest request){
		Store entity = storeService.getByPrimaryKey(key);
		Map<String,String> store = FormatEntity.getObjectValue(entity);
		ModelAndView mv = new ModelAndView("WEB-INF/jsp/store/store/editStore","store",store );
		mv.addObject("settlementMethod", dictInfoService.getDictInfoListByType("settlementMethod"));
		UserInfo userInfo = new UserInfo();
		if(!Utils.isSuperAdmin(request))
 		{userInfo.setId(Utils.getLoginUserInfoId(request));}
		mv.addObject("user", userInfoService.listByCondition(userInfo));
		mv.addObject("brand", brandService.listByCondition(new Brand()));
		return mv;
	}
	
	/**
	 * 修改图片方法
	 * @param store Store：实体对象
	 * @param response HttpServletResponse
	 * @return: ajax输入json字符串
	 */	
	@RequestMapping("/updateImg")
	public void updateImg(Store store,HttpServletRequest request,HttpServletResponse response){
		AjaxUtils.sendAjaxForObjectStr(
				response,storeService.updateImg(store));	
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