package com.dongnao.workbench.system.model;

import java.util.Date;
import java.math.BigDecimal;
import org.springframework.format.annotation.DateTimeFormat;
import com.dongnao.workbench.common.bean.Model;
/**
 * 描述：调用流程模块实体类，负责页面与后台数据传输功能
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public class InvokeFlow extends Model{
	
	
		            /**
	                 * 流程ID（主键）
	                 **/
				   			private String flowId;
		   		
		            /**
	                 * 平台ID（主键）
	                 **/
				   			private String platformId;
		   		
		            /**
	                 * 功能ID（主键）
	                 **/
				   			private String opId;
		   		
		            /**
	                 * 调用外卖平台接口url
	                 **/
				   			private String url;
		   		
		            /**
	                 * 接口调用顺序
	                 **/
				   			private Integer invokeIndex;
		   		
		            /**
	                 * 平台描述
	                 **/
				   			private String remark;
		   		
	
				
		  			/**
			 * 获取 流程ID（主键）
			 * @return String this.flowId
			 */
			public String getFlowId(){
				return this.flowId;
			}
			
			/**
			 * 设置 流程ID（主键）
			 * @param String flowId 
			 */
			public void setFlowId(String flowId){
				this.flowId = flowId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 平台ID（主键）
			 * @return String this.platformId
			 */
			public String getPlatformId(){
				return this.platformId;
			}
			
			/**
			 * 设置 平台ID（主键）
			 * @param String platformId 
			 */
			public void setPlatformId(String platformId){
				this.platformId = platformId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 功能ID（主键）
			 * @return String this.opId
			 */
			public String getOpId(){
				return this.opId;
			}
			
			/**
			 * 设置 功能ID（主键）
			 * @param String opId 
			 */
			public void setOpId(String opId){
				this.opId = opId;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 调用外卖平台接口url
			 * @return String this.url
			 */
			public String getUrl(){
				return this.url;
			}
			
			/**
			 * 设置 调用外卖平台接口url
			 * @param String url 
			 */
			public void setUrl(String url){
				this.url = url;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 接口调用顺序
			 * @return Integer this.invokeIndex
			 */
			public Integer getInvokeIndex(){
				return this.invokeIndex;
			}
			
			/**
			 * 设置 接口调用顺序
			 * @param BigDecimal invokeIndex 
			 */
			public void setInvokeIndex(Integer invokeIndex){
				this.invokeIndex = invokeIndex;
			}
		  		
		
		
			
						
		  			/**
			 * 获取 平台描述
			 * @return String this.remark
			 */
			public String getRemark(){
				return this.remark;
			}
			
			/**
			 * 设置 平台描述
			 * @param String remark 
			 */
			public void setRemark(String remark){
				this.remark = remark;
			}
		   		
		
		
			
			}