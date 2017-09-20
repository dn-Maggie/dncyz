package com.dongnao.workbench.common.bean;

import java.io.Serializable;

import com.dongnao.workbench.common.enums.ResultStatus;


/**
 * 描述：用于业务层返回结果给控制层
 * 
 * @author yao.su
 * @version 1.0 2016-11-06
 */
public class RespMess implements Serializable {
	private static final long serialVersionUID = 2060919719016478351L;
	/**
	 * 配合app输出
	 */
	private String jsessionid;
	/**
	 * 结果状态1是成功，0是失败
	 */
	private String respCode;
	/**
	 * 结果消息，返回业务执行结果
	 */
	private String respMsg;
	/**
	 * 结果数据
	 */
	private Object result;
	/**
	 * 今日商家数量
	 * */
	private Object storeNumList;
	/**
	 * 今日商家排名
	 * */
	private Object storeOrderList;
	
	/**
	 * 订单统计查询出参 - 参与者账号ID*/
	private String username;
	/**
	 * 订单统计查询出参 -营业总额"*/
	private double successOrderPrice;
	/**
	 * 订单统计查询出参 -营业总单数"*/
	private Integer successOrderNum;
	
	private Integer elmsuccessOrderNum;
	private Integer mtsuccessOrderNum;
	private Integer bdwmsuccessOrderNum;
	
	
	public String getJsessionid() {
		return jsessionid;
	}

	public void setJsessionid(String jsessionid) {
		this.jsessionid = jsessionid;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public double getSuccessOrderPrice() {
		return successOrderPrice;
	}

	public void setSuccessOrderPrice(double successOrderPrice) {
		this.successOrderPrice = successOrderPrice;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getRespMsg() {
		return respMsg;
	}

	public void setRespMsg(String respMsg) {
		this.respMsg = respMsg;
	}

	public Object getResult() {
		return result;
	}

	public void setResult(Object result) {
		this.result = result;
	}

	public String getRespCode() {
		return respCode;
	}

	public void setRespCode(String respCode) {
		this.respCode = respCode;
	}

	public Integer getSuccessOrderNum() {
		return successOrderNum;
	}

	public void setSuccessOrderNum(Integer successOrderNum) {
		this.successOrderNum = successOrderNum;
	}

	public Integer getElmsuccessOrderNum() {
		return elmsuccessOrderNum;
	}

	public void setElmsuccessOrderNum(Integer elmsuccessOrderNum) {
		this.elmsuccessOrderNum = elmsuccessOrderNum;
	}

	public Integer getMtsuccessOrderNum() {
		return mtsuccessOrderNum;
	}

	public void setMtsuccessOrderNum(Integer mtsuccessOrderNum) {
		this.mtsuccessOrderNum = mtsuccessOrderNum;
	}

	public Integer getBdwmsuccessOrderNum() {
		return bdwmsuccessOrderNum;
	}

	public void setBdwmsuccessOrderNum(Integer bdwmsuccessOrderNum) {
		this.bdwmsuccessOrderNum = bdwmsuccessOrderNum;
	}

	public Object getStoreNumList() {
		return storeNumList;
	}

	public void setStoreNumList(Object storeNumList) {
		this.storeNumList = storeNumList;
	}

	public Object getStoreOrderList() {
		return storeOrderList;
	}

	public void setStoreOrderList(Object storeOrderList) {
		this.storeOrderList = storeOrderList;
	}

}
