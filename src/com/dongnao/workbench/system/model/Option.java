package com.dongnao.workbench.system.model;

import java.util.Date;
import java.math.BigDecimal;
import org.springframework.format.annotation.DateTimeFormat;
import com.dongnao.workbench.common.bean.Model;
/**
 * 描述：功能操作模块实体类，负责页面与后台数据传输功能
 *
 * @author maggie
 * @version 1.0 2017-02-10
 */
public class Option extends Model{
	
	
		            /**
	                 * 功能ID（主键）
	                 **/
				   			private String opId;
		   		
		            /**
	                 * 功能编码（GET_ORDER：获取订单，CONFIRM_ORDER:确认订单，CANCEL_ORDER：取消订单）
	                 **/
				   			private String opCode;
		   		
		            /**
	                 * 操作名称
	                 **/
				   			private String opName;
		   		
		            /**
	                 * 平台描述
	                 **/
				   			private String remark;
		   		
	
				
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
			 * 获取 功能编码（GET_ORDER：获取订单，CONFIRM_ORDER:确认订单，CANCEL_ORDER：取消订单）
			 * @return String this.opCode
			 */
			public String getOpCode(){
				return this.opCode;
			}
			
			/**
			 * 设置 功能编码（GET_ORDER：获取订单，CONFIRM_ORDER:确认订单，CANCEL_ORDER：取消订单）
			 * @param String opCode 
			 */
			public void setOpCode(String opCode){
				this.opCode = opCode;
			}
		   		
		
		
			
						
		  			/**
			 * 获取 操作名称
			 * @return String this.opName
			 */
			public String getOpName(){
				return this.opName;
			}
			
			/**
			 * 设置 操作名称
			 * @param String opName 
			 */
			public void setOpName(String opName){
				this.opName = opName;
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