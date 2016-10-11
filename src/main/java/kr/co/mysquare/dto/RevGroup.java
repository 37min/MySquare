package kr.co.mysquare.dto;

public class RevGroup 
{
	int revGroupCode; //후기분류코드
	String revGroupName; //후기분류명
	
	public int getRevGroupCode() {
		return revGroupCode;
	}
	public void setRevGroupCode(int revGroupCode) {
		this.revGroupCode = revGroupCode;
	}
	public String getRevGroupName() {
		return revGroupName;
	}
	public void setRevGroupName(String revGroupName) {
		this.revGroupName = revGroupName;
	}

}//end of RevGroup class

/*
 후기분류 
CREATE TABLE MySquare.RevGroup (
	RevGroupCode NUMBER NOT NULL,  후기분류코드 
	RevGroupName VARCHAR2(20) NOT NULL  후기분류명 
);
*/