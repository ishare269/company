package com.stone.company.domain;

/**
 * 资料
 * 
 * @author Stone
 * 
 */
public class Material {
	/** 编号 */
	private String id;
	/** 地址 */
	private String url;
	/** 职位编号 */
	private String professionId;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getProfessionId() {
		return professionId;
	}

	public void setProfessionId(String professionId) {
		this.professionId = professionId;
	}

}
