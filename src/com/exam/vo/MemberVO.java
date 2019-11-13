package com.exam.vo;

import java.sql.Timestamp;

// Value Object(VO) = 자바빈(Java Bean) 클래스 = DTO(Data Transfer Object)
public class MemberVO {
	
	private String id;
	private String passwd;
	private String name;
	private Integer age;
	private String gender;
	private String email;
	private String address;
	private String mtel;
	private Timestamp regDate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MemberVO [id=").append(id).append(", passwd=").append(passwd).append(", name=").append(name)
				.append(", age=").append(age).append(", gender=").append(gender).append(", email=").append(email)
				.append(", address=").append(address).append(", mtel=").append(mtel).append(", regDate=")
				.append(regDate).append("]");
		return builder.toString();
	}
	
	
}
