package kr.co.mysquare.dto;

public class HLDistrict 
{
	int HLLocCode; //상급지역코드 
	String HLLocName; //상급지역명
	
	public int getHLLocCode() {
		return HLLocCode;
	}
	public void setHLLocCode(int hLLocCode) {
		HLLocCode = hLLocCode;
	}
	public String getHLLocName() {
		return HLLocName;
	}
	public void setHLLocName(String hLLocName) {
		HLLocName = hLLocName;
	}

}//end of HLDistrict class
/*
CREATE TABLE MySquare.HLDistrict (
		HLLocCode NUMBER NOT NULL,  상급지역코드 
		HLLocName VARCHAR2(30) NOT NULL  상급지역명 
	);
*/