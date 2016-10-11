package kr.co.mysquare.dto;

import java.util.Date;

public class Location 
{
	String locName; //명소이름
	int locGroupCode; //명소분류코드
	int LLLocCode; //하급지역코드
	String locImage; //명소상세 이미지
	String locContents; //명소상세설명
	String locAdd; //명소주소
	String latitude; //위도
	String longitude; //경도
	Date locDate; //명소등록일시
	
	public String getLocName() {
		return locName;
	}
	public void setLocName(String locName) {
		this.locName = locName;
	}
	public int getLocGroupCode() {
		return locGroupCode;
	}
	public void setLocGroupCode(int locGroupCode) {
		this.locGroupCode = locGroupCode;
	}
	public int getLLLocCode() {
		return LLLocCode;
	}
	public void setLLLocCode(int lLLocCode) {
		LLLocCode = lLLocCode;
	}
	public String getLocImage() {
		return locImage;
	}
	public void setLocImage(String locImage) {
		this.locImage = locImage;
	}
	public String getLocContents() {
		return locContents;
	}
	public void setLocContents(String locContents) {
		this.locContents = locContents;
	}
	public String getLocAdd() {
		return locAdd;
	}
	public void setLocAdd(String locAdd) {
		this.locAdd = locAdd;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public Date getLocDate() {
		return locDate;
	}
	public void setLocDate(Date locDate) {
		this.locDate = locDate;
	}

}//end of location class

/*
CREATE TABLE MySquare.Location (
		LocName VARCHAR2(40) NOT NULL,  명소이름 
		LocGroupCode NUMBER NOT NULL,  명소분류코드 
		LLLocCode NUMBER NOT NULL,  하급지역코드 
		LocImage VARCHAR2(50),  명소상세이미지 
		LocContents VARCHAR2(400) NOT NULL,  명소상세설명 
		LocAdd VARCHAR2(200) NOT NULL,  명소주소 
		latitude VARCHAR2(128) NOT NULL,  위도 
		longitude VARCHAR2(128) NOT NULL,  경도 
		LocDate DATE NOT NULL  명소등록일시 
	);*/