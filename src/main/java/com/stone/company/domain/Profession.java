package com.stone.company.domain;

public class Profession {
	/**
	 * 编号
	 */
	private long id;
	/**
	 * 用户姓名
	 */
	private long uid;
	/**
	 * 公司名称
	 */
	private String company;
	/**
	 * 公司地址
	 */
	private String address;
	/**
	 * 职位
	 */
	private String position;
	/**
	 * 主要业务
	 */
	private String service;
	/**
	 * 技术领域
	 */
	private String technology;
	/**
	 * 1年以下工作经验薪资
	 */
	private String salary_0;
	/**
	 * 1年工作经验薪资
	 */
	private String salary_1;
	/**
	 * 2年工作经验薪资
	 */
	private String salary_2;
	/**
	 * 3年工作经验薪资
	 */
	private String salary_3;
	/**
	 * 3年以上工作经验薪资
	 */
	private String salary_4;
	/**
	 * 福利（1年几薪和节假日福利）
	 */
	private String welfare;
	/**
	 * 入职技巧
	 */
	private String entrySkills;
	/**
	 * 在职感悟
	 */
	private String impression;

	/**
	 * 职位空缺
	 */
	private String vacancy;

	/**
	 * 新增日期
	 */
	private String addTime;

	/**
	 * 浏览量
	 */
	private int pv;

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getTechnology() {
		return technology;
	}

	public void setTechnology(String technology) {
		this.technology = technology;
	}

	public String getSalary_0() {
		return salary_0;
	}

	public void setSalary_0(String salary_0) {
		this.salary_0 = salary_0;
	}

	public String getSalary_1() {
		return salary_1;
	}

	public void setSalary_1(String salary_1) {
		this.salary_1 = salary_1;
	}

	public String getSalary_2() {
		return salary_2;
	}

	public void setSalary_2(String salary_2) {
		this.salary_2 = salary_2;
	}

	public String getSalary_3() {
		return salary_3;
	}

	public void setSalary_3(String salary_3) {
		this.salary_3 = salary_3;
	}

	public String getSalary_4() {
		return salary_4;
	}

	public void setSalary_4(String salary_4) {
		this.salary_4 = salary_4;
	}

	public String getWelfare() {
		return welfare;
	}

	public void setWelfare(String welfare) {
		this.welfare = welfare;
	}

	public String getEntrySkills() {
		return entrySkills;
	}

	public void setEntrySkills(String entrySkills) {
		this.entrySkills = entrySkills;
	}

	public String getImpression() {
		return impression;
	}

	public void setImpression(String impression) {
		this.impression = impression;
	}

	public String getAddTime() {
		return addTime;
	}

	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}

	public long getUid() {
		return uid;
	}

	public void setUid(long uid) {
		this.uid = uid;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getVacancy() {
		return vacancy;
	}

	public void setVacancy(String vacancy) {
		this.vacancy = vacancy;
	}

	public int getPv() {
		return pv;
	}

	public void setPv(int pv) {
		this.pv = pv;
	}

}
