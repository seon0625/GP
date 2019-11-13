package com.exam.vo;

public class PBoardVO {

	private int num;
	private  String username;
	private  String passwd;
	private  String subject;
	private  String content;
	private  int re_Ref;
	private  int re_Lev;
	private  int re_Seq;
	private  String sf;
	private  String summer;
	private  String winter;
	private  String free;
	private  String uploadpath;
	private  String filename;
	private  String filetype;
	private int readcount;
	private  String type;
	

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
	public void setRe_Seq(int re_Seq) {
		this.re_Seq = re_Seq;
	}
	public String getSf() {
		return sf;
	}
	public void setSf(String sf) {
		this.sf = sf;
	}
	public String getSummer() {
		return summer;
	}
	public void setSummer(String summer) {
		this.summer = summer;
	}
	public String getWinter() {
		return winter;
	}
	public void setWinter(String winter) {
		this.winter = winter;
	}
	public String getFree() {
		return free;
	}
	public void setFree(String free) {
		this.free = free;
	}
	public String getUploadpath() {
		return uploadpath;
	}
	public void setUploadpath(String uploadpath) {
		this.uploadpath = uploadpath;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PBoardVO [num=").append(num);
		builder.append(", username=").append(username);
		builder.append(", passwd=").append(passwd);
		builder.append(", subject=").append(subject);
		builder.append(", content=").append(content);
		builder.append(", re_Ref=").append(re_Ref);
		builder.append(", re_Lev=").append(re_Lev);
		builder.append(", re_Seq=").append(re_Seq);
		builder.append(", sf=").append(sf);
		builder.append(", summer=").append(summer);
		builder.append(", winter=").append(winter);
		builder.append(", free=").append(free);
		builder.append(", uploadpath=").append(uploadpath);
		builder.append(", filename=").append(filename);
		builder.append(", filetype=").append(filetype);
		builder.append(", readcount=").append(readcount);
		builder.append(", type=").append(type);
		builder.append("]");
		return builder.toString();
	}

	
	
}
