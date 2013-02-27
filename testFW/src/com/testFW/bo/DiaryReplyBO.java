package com.testFW.bo;

import java.util.Date;

/**
 * 日志回复实体类
 * @author kalor
 * @time 2013-2-27 at 下午02:48:24
 */
public class DiaryReplyBO {
	private Long id;
	private Long diary_id;
	private Long user_id;
	private String user_name;
	private String reply;
	private String email;
	private String website;
	private Date reply_time;
	private Long parent_id;
	private int type;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getDiary_id() {
		return diary_id;
	}
	public void setDiary_id(Long diary_id) {
		this.diary_id = diary_id;
	}
	public Long getUser_id() {
		return user_id;
	}
	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public Date getReply_time() {
		return reply_time;
	}
	public void setReply_time(Date reply_time) {
		this.reply_time = reply_time;
	}
	public Long getParent_id() {
		return parent_id;
	}
	public void setParent_id(Long parent_id) {
		this.parent_id = parent_id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
}
