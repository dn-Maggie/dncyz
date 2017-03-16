package com.dongnao.workbench.common.bean;

import java.io.Serializable;

import com.dongnao.workbench.common.enums.ResultStatus;


/**
 * 描述：用于业务层返回结果给控制层
 * 
 * @author yao.su
 * @version 1.0 2016-11-06
 */
public class respMess implements Serializable {
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




	public String getJsessionid() {
		return jsessionid;
	}

	public void setJsessionid(String jsessionid) {
		this.jsessionid = jsessionid;
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
}
