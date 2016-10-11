package kr.co.mysquare.dto;

public class MLDistrict 
{
	int MLLocCode; //중급지역코드
	String MLLocName; //중급지역명
	int HLLocCode; //상급지역코드
	
	public int getMLLocCode() {
		return MLLocCode;
	}
	public void setMLLocCode(int mLLocCode) {
		MLLocCode = mLLocCode;
	}
	public String getMLLocName() {
		return MLLocName;
	}
	public void setMLLocName(String mLLocName) {
		MLLocName = mLLocName;
	}
	public int getHLLocCode() {
		return HLLocCode;
	}
	public void setHLLocCode(int hLLocCode) {
		HLLocCode = hLLocCode;
	}
	
}//end of MLDistrict class

/*
 시/군/구 
CREATE TABLE MySquare.MLDistrict (
	MLLocCode NUMBER NOT NULL,  중급지역코드 
	MLLocName VARCHAR2(30) NOT NULL,  중급지역명 
	HLLocCode NUMBER NOT NULL  상급지역코드 
);
*/