package com.stone.company.domain;


/**
 * 邮件模板
 * 
 * @author Stone+
 * 
 */
public class MailTemplate {
	/** id */
	private String id;
	/** uid */
	private long uid;
	/** subject */
	private String subject;
	/** to */
	private String to;
	/** content */
	private String content;
	/** createtime */
	private String createtime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public long getUid() {
		return uid;
	}

	public void setUid(long uid) {
		this.uid = uid;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

}
