package com.stone.company.domain;

public class ValidateMail {
	/** id */
	private long id;
	/** 注册邮箱 */
	private String mail;
	/** 注册密码 */
	private String password;
	/** 验证码 */
	private String valicode;
	/** 验证时间 */
	private String createtime;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getValicode() {
		return valicode;
	}

	public void setValicode(String valicode) {
		this.valicode = valicode;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

}
