package com.exam.vo;

import java.sql.Timestamp;

public class BoardVO {

	private int num;
	private String username;
	private String passwd;
	private String subject;
	private String content;
	private int readcount;
	private String ip;
	private Timestamp regDate;
	private int re_Ref;
	private int re_Lev;
	private int re_Seq;
	
	
	
	
	public int getNum() {
		return num;
	}
	
	
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public int getReadcount() {
		return readcount;
	}
	
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
	
	public Timestamp getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	public int getRe_Ref() {
		return re_Ref;
	}
	
	public void setRe_Ref(int re_Ref) {
		this.re_Ref = re_Ref;
	}
	
	public int getRe_Lev() {
		return re_Lev;
	}
	
	public void setRe_Lev(int re_Lev) {
		this.re_Lev = re_Lev;
	}
	
	public int getRe_Seq() {
		return re_Seq;
	}
	
	public void setRe_seq(int re_Seq) {
		this.re_Seq = re_Seq;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BoardVO [num=").append(num).append(", username=").append(username).append(", passwd=")
				.append(passwd).append(", subject=").append(subject).append(", content=").append(content)
				.append(", readcount=").append(readcount).append(", ip=").append(ip).append(", regDate=")
				.append(regDate).append(", re_Ref=").append(re_Ref).append(", re_Lev=").append(re_Lev)
				.append(", re_Seq=").append(re_Seq).append("]");
		return builder.toString();
	}
	
	
	
	
	
}
