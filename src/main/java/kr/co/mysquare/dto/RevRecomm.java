package kr.co.mysquare.dto;

public class RevRecomm 
{
	String id; //아이디
	int revCode; //후기번호
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRevCode() {
		return revCode;
	}
	public void setRevCode(int revCode) {
		this.revCode = revCode;
	}

}//end of revRecomm class(후기추천)

/*
CREATE TABLE MySquare.RevRecomm (
		Id VARCHAR2(20) NOT NULL,  아이디 
		RevCode NUMBER NOT NULL  후기번호 
	);
*/