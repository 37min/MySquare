package kr.co.mysquare.dto;

import java.util.Date;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Review 
{
	int revCode; //후기번호
	String locName; //명소이름
	String id; //아이디
	int revGroupCode; //후기분류코드 
	String revName; //후기제목
	private String revImage;
	private CommonsMultipartFile file;
	String revContents; //후기내용
	Date revDate; //후기작성일시
	
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
	
	public String getRevImage() {
		return revImage;
	}
	public void setRevImage(String revImage) {
		this.revImage = revImage;
	}
	public int getRevCode() {
		return revCode;
	}
	public void setRevCode(int revCode) {
		this.revCode = revCode;
	}
	public String getLocName() {
		return locName;
	}
	public void setLocName(String locName) {
		this.locName = locName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRevGroupCode() {
		return revGroupCode;
	}
	public void setRevGroupCode(int revGroupCode) {
		this.revGroupCode = revGroupCode;
	}
	public String getRevName() {
		return revName;
	}
	public void setRevName(String revName) {
		this.revName = revName;
	}
	public String getRevContents() {
		return revContents;
	}
	public void setRevContents(String revContents) {
		this.revContents = revContents;
	}
	public Date getRevDate() {
		return revDate;
	}
	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}
	
}//end of review class

/*
CREATE TABLE MySquare.Review (
		RevCode NUMBER NOT NULL,  후기번호 
		LocName VARCHAR2(40) NOT NULL,  명소이름 
		Id VARCHAR2(20) NOT NULL,  아이디 
		RevGroupCode NUMBER NOT NULL,  후기분류코드 
		RevName VARCHAR2(20) NOT NULL,  후기제목 
		RevImage VARCHAR2(20),  후기이미지 
		RevContents VARCHAR2(400) NOT NULL,  후기내용 
		RevDate DATE NOT NULL  후기작성일시 
	);*/