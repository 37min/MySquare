package kr.co.mysquare.dto;

public class Following 
{
	int followCode; //팔로잉 번호
	String followerId; //팔로워 아이디 (나!!!)
	String followingId; //팔로잉 아이디 (상대방)

}//end of following class

/*
CREATE TABLE MySquare.Following (
		FollowCode NUMBER NOT NULL,  팔로잉번호 
		FollowerId VARCHAR2(20) NOT NULL,  팔로잉아이디 
		FollowingId VARCHAR2(20) NOT NULL  팔로워아이디 
	);
*/