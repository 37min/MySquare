package kr.co.mysquare.dto;

public class LLDistrict 
{
	int LLLocCode; //하급지역코드
	String LLLocName; //하급지역명
	int MLLocCode; //중급지역코드
	
	public int getLLLocCode() {
		return LLLocCode;
	}
	public void setLLLocCode(int lLLocCode) {
		LLLocCode = lLLocCode;
	}
	public String getLLLocName() {
		return LLLocName;
	}
	public void setLLLocName(String lLLocName) {
		LLLocName = lLLocName;
	}
	public int getMLLocCode() {
		return MLLocCode;
	}
	public void setMLLocCode(int mLLocCode) {
		MLLocCode = mLLocCode;
	}

}//end of LLDistrict class

/*
 구/읍/면/동 
CREATE TABLE MySquare.LLDistrict (
	LLLocCode NUMBER NOT NULL,  하급지역코드 
	LLLocName VARCHAR2(30) NOT NULL,  하급지역명 
	MLLocCode NUMBER NOT NULL  중급지역코드 
);*/